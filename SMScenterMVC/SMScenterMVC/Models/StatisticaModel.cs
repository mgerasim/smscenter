using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMScenterMVC.Utils;
using System.Data.OracleClient;
using System.Data;

/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-09-14   R0059       Герасимов           Создание модели
 */

namespace SMScenterMVC.Models
{
    public class StatisticaModel
    {

        // Отправлно за день/неделю/месяц
        public int SendedDay;
        public int SendedWeek;
        public int SendedMonth;
        // Ошибачно за день/неделю/месяц
        public int FailedDay;
        public int FailedWeek;
        public int FailedMonth;
        // Очередь
        public int QueueCount;

        public void Load()
        {
            try
            {
                SendedDay = SendedMonth = SendedWeek = FailedDay = FailedMonth = FailedWeek = 0;
                LoadMonth();
                LoadWeek();
                LoadDay();
                LoadQueue();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }

        private int LoadMonth()
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_STAT.sc_month", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("p_stat", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                
                DataTable Table = new DataTable();
                DataAdapter.Fill(Table);
                
                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    int status = Convert.ToInt32(Table.Rows[i]["STATUS"].ToString());
                    if (status == 3 || status == 5)
                    {
                        SendedMonth = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                    if (status == 4)
                    {
                        FailedMonth = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                }
                
               
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }
            return 0;
        }

        public int LoadWeek()
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_STAT.sc_week", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("p_stat", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;


                DataTable Table = new DataTable();
                DataAdapter.Fill(Table);

                
                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    int status = Convert.ToInt32(Table.Rows[i]["STATUS"].ToString());
                    if (status == 3 || status == 5)
                    {
                        SendedWeek = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                    if (status == 4)
                    {
                        FailedWeek = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                }


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }
            return 0;
        }


        public int LoadDay()
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_STAT.sc_day", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("p_stat", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;


                DataTable Table = new DataTable();
                DataAdapter.Fill(Table);


                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    int status = Convert.ToInt32(Table.Rows[i]["STATUS"].ToString());
                    if (status == 3 || status == 5)
                    {
                        SendedDay = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                    if (status == 4)
                    {
                        FailedDay = Convert.ToInt32(Table.Rows[i]["MSGCNT"].ToString());
                    }
                }


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }
            return 0;
        }

        public int LoadQueue()
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_STAT.sc_queue", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("p_stat", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;


                DataTable Table = new DataTable();
                DataAdapter.Fill(Table);


                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    QueueCount = Convert.ToInt32(Table.Rows[i]["QUEUE"].ToString());                    
                }


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }
            return 0;
        }


    }
}