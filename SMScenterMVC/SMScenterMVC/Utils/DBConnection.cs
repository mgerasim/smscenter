/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-27   R0019       Книжник             Создание класса по работе с базой
 * 2012-04-28   R0020       Книжник
 * 2012-05-04   R0011       Книжник             Добавил функцию для вставки записей в базу по запросу
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 * 2012-09-04   R0056       Книжник             Получение параметров соединения с базой из ini файла
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OracleClient;
using System.Web.Configuration;
using System.Data;
using System.IO;

namespace SMScenterMVC.Utils
{
    public class DBConnection
    {
        public OracleConnection Connection;
        public DBConnection()
        {
            Connection = new OracleConnection();
            Configuration();
        }
        //получение строки соединения с базой данных из web.config
        public string GetConnectionString(string NameConnectionString)
        {
            return WebConfigurationManager.ConnectionStrings[NameConnectionString].ConnectionString;
        }
        //получение строки соединения с базой данных из ini файла
        public static string GetConnectionString()
        {
            string DATABASE_INI = HttpContext.Current.Server.MapPath("~/CR/CR/database.ini");
            string INIT_INI = HttpContext.Current.Server.MapPath("~/CR/CR/init.ini");

            AMS.Profile.Ini Init = new AMS.Profile.Ini(INIT_INI);
            string db = Init.GetValue("DATABASE", "db", "");

            AMS.Profile.Ini database = new AMS.Profile.Ini(DATABASE_INI);
            string SID = database.GetValue(db, "SID", "");
            string USER = database.GetValue(db, "USERNAME", "");
            string PASSWORD = database.GetValue(db, "PASSWORD", "");

            string path = "Data Source=" + SID + "; User ID=" + USER + "; Password=" + PASSWORD + ";Unicode=true";

            return path;
        }
        //Определение Коннеста к базе 
        public void Configuration()
        {

/*#if DEBUG 
            Connection.ConnectionString = GetConnectionString("ApplicationServicesDebug");
#else
            Connection.ConnectionString = GetConnectionString("ApplicationServicesRelease");
#endif*/
            Connection.ConnectionString = GetConnectionString();
        }
        //Открытие соединения
        public void Open()
        {
            Connection.Open();
        }
        //Закрытие соединения
        public void Close()
        {
            Connection.Close();
        }
        //Выполнение команды выборки и помещение в таблицу данных
        public void ExecQuerySelect(string Query, ref DataTable Table)
        {
            OracleCommand cmdSelect = new OracleCommand(Query, Connection);
            OracleDataAdapter DataAdapter = new OracleDataAdapter(cmdSelect);
            DataAdapter.Fill(Table);
        }
        //Выполнение команды вставки 
        public void ExecQueryInsert(string Query)
        {
            OracleCommand cmdInsert = new OracleCommand(Query, Connection);
            cmdInsert.CommandType = CommandType.Text;
            cmdInsert.ExecuteNonQuery();
        }
        //Выполнение команды обновление
        public void ExecQueryUpdate(string Query)
        {
            ExecQueryInsert(Query);
        }
        //Выполнение команды удаление
        public void ExecQueryDelete(string Query)
        {
            ExecQueryInsert(Query);
        }


    }
}