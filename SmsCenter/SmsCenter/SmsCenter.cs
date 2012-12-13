/*
 * Дата         Задание     Автор       Комментарий
 * 2012-04-23   R0017       Герасимов   Модификация алгоритма обработки сообщений       
 * */


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using EasySMPP;
using System.Data.OracleClient;
using NLog;
using System.Threading;


namespace SmsCenter
{
    public partial class SmsCenter : ServiceBase
    {
        public static Logger logger = LogManager.GetCurrentClassLogger();
        public static Logger logger_smsc = LogManager.GetLogger("smsc_log");

#if DEBUG
        public static string _SourceName = "SmsCenterDebug";
        public static string _ConnectionString = SmsCenterSetting.Default.ConnectionStringDebug;
        public static string _ServiceInstallerDescription = "Служба СМС раcсылки ОАО Ростелеком  (Отладочная версия)";
#else
        public static string _SourceName = "SmsCenterRelease";
        public static string _ConnectionString = SmsCenterSetting.Default.ConnectionStringRelease;
        public static string _ServiceInstallerDescription = "Служба СМС расcылки ОАО Ростелеком (Релиз версия)";
#endif

        private SmsClient m_theSmsClient;
        private OracleConnection Connection;

        public SmsCenter()
        {
            InitializeComponent();
#if DEBUG
            if (!System.Diagnostics.EventLog.SourceExists("SmsCenterDebug"))
            {
                System.Diagnostics.EventLog.CreateEventSource("SmsCenterDebug", "SmsCenterDebug");
            }
#else
            if (!System.Diagnostics.EventLog.SourceExists("SmsCenterRelease"))
            {
                System.Diagnostics.EventLog.CreateEventSource("SmsCenterRelease", "SmsCenterRelease");
            }
#endif
            eventLog1.Source = SmsCenter._SourceName;
            this.timer1 = new System.Timers.Timer();
            m_theSmsClient = new SmsClient();
            m_theSmsClient.OnLog += new LogEventHandler(OnLog);

            Connection = new OracleConnection(SmsCenter._ConnectionString);

        }

        protected override void OnStart(string[] args)
        {          

            eventLog1.WriteEntry("Start " + _SourceName);
            logger.Debug("Start " + _SourceName);

            timer1.Start();
            timer1.Enabled = true;
            eventLog1.WriteEntry("Установление соединения с сервером SMSC");
            logger.Debug("Установление соединения с сервером SMSC");
            try
            {
                m_theSmsClient.Connect();
                eventLog1.WriteEntry("Установление соединения с сервером БД");
                logger.Debug("Установление соединения с сервером БД");
                Connection.Open();
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
            }
        }

        protected override void OnStop()
        {
            eventLog1.WriteEntry("Stop");
            logger.Debug("Stop " + _SourceName);
            timer1.Stop();
            timer1.Enabled = false;
            try
            {
                eventLog1.WriteEntry("Разъединение соединения с сервером SMSC");
                logger.Debug("Разъединение соединения с сервером SMSC");
                m_theSmsClient.Disconnect();
                eventLog1.WriteEntry("Разъединение соединения с сервером БД");
                logger.Debug("Разъединение соединения с сервером БД");
                Connection.Close();
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            eventLog1.WriteEntry("Tick1");
            logger.Debug("Начало опроса");
            // Таймер опроса останавливаем
            timer1.Stop();
            timer1.Enabled = false;

            DataTable Table = new DataTable();

            try
            {            
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand Command = new OracleCommand();
                Command.Connection = Connection;
                Command.CommandText = "PKG_GATE.get_messages";
                Command.CommandType = System.Data.CommandType.StoredProcedure;

                OracleParameter p_limit = new OracleParameter("p_limit", OracleType.Int32, 4);
                p_limit.Direction = ParameterDirection.Input;
                p_limit.Value = SmsCenterSetting.Default.LimitTask;
                Command.Parameters.Add(p_limit);

                Command.Parameters.Add("p_msgs", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = Command;

                DataAdapter.Fill(Table);
                if (Table.Rows.Count == 0)
                {
                    eventLog1.WriteEntry("Сообщения на отправку отсутствуют!");
                    logger.Debug("Сообщения на отправку отсутствуют!");
                }
                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    Message theMsg = new Message(Table.Rows[i]);
                    theMsg.update_status(eventLog1, Connection, 2, m_theSmsClient.StatusCode); // Выполняется
                    eventLog1.WriteEntry(theMsg.ID.ToString() + " " + theMsg.Phone + " " + theMsg.Msgtxt);

                    if (m_theSmsClient.SendSms("ROSTELECOM", theMsg.Phone, theMsg.Msgtxt))
                    {
                        eventLog1.WriteEntry("Успешно!");
                        logger.Debug(theMsg.ID.ToString() + " " + theMsg.Phone + " Успешно!");
                        theMsg.update_status(eventLog1, Connection, 3, m_theSmsClient.StatusCode); // Завершена
                    }
                    else
                    {
                        eventLog1.WriteEntry("Ошибка отправки сообщения! Код ошибки: " + m_theSmsClient.StatusCode.ToString());
                        logger.Warn(theMsg.ID.ToString() + " " + theMsg.Phone + " Ошибка отправки сообщения! Код ошибки: " + m_theSmsClient.StatusCode.ToString());
                        theMsg.update_status(eventLog1, Connection, 4, m_theSmsClient.StatusCode); // Ошибка
                    }
                    Thread.Sleep(100); // 0.1 sec
                }

                if (Table.Rows.Count == SmsCenterSetting.Default.LimitTask)
                {
                    timer1.Interval = 10000; 
                    logger.Debug("Следующий опрос через 10 сек");
                }
                else
                {   
                    timer1.Interval = 60000; 
                    logger.Debug("Следующий опрос через 60 сек");
                }

            }

            catch (Exception ex)
            {
                eventLog1.WriteEntry("Exception: " + ex.ToString());
                logger.Error("Exception: " + ex.ToString());
            }
                        
           
            // Таймер опроса запускаем
            timer1.Enabled = true;
            timer1.Start();
            logger.Debug("Завершение опроса");
        }
        
        private void OnLog(LogEventArgs args)
        {
            eventLog1.WriteEntry(args.Message);
            logger_smsc.Debug(args.Message);
        }
     
    }
}
