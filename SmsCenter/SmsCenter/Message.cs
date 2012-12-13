using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OracleClient;
using System.Data;
using System.Xml;
using System.Diagnostics;
//
namespace SmsCenter
{
    class Message
    {
        public string Phone { get; set; }
        public string Msgtxt { get; set; }
        public ulong ID { get; set; }
        /*
         * 1 - Создана  
         * 2 - Выполняется
         * 3 - Завершена
         * 4 - Ошибка
         */
        public uint Status { get; set; }

        public Message(DataRow Row)
        {
            ID = Convert.ToUInt32(Row["ID"].ToString());
            Msgtxt = Row["Message"].ToString();
            Phone = Row["Phone"].ToString();
            Status = Convert.ToUInt32(Row["Status_id"].ToString());
        }

        public void update_status(EventLog eventLog, OracleConnection Connection, uint nStatus, int nStatusCode)
        {
            
            {            
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand Command = new OracleCommand();
                Command.Connection = Connection;
                Command.CommandText = "PKG_GATE.update_status";
                Command.CommandType = System.Data.CommandType.StoredProcedure;

                OracleTransaction Transaction;
                Transaction = Connection.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
                Command.Transaction = Transaction;
                
                OracleParameter p_message_id = new OracleParameter("p_message_id", OracleType.Int32, 4);
                
                p_message_id.Direction = ParameterDirection.Input;
                p_message_id.Value = this.ID;
                Command.Parameters.Add(p_message_id);

                OracleParameter p_status_new = new OracleParameter("p_status_new", OracleType.Int32, 4);
                p_status_new.Direction = ParameterDirection.Input;
                p_status_new.Value = nStatus;
                Command.Parameters.Add(p_status_new);

                OracleParameter p_statuscode = new OracleParameter("p_statuscode", OracleType.Int32, 4);
                p_statuscode.Direction = ParameterDirection.Input;
                p_statuscode.Value = nStatusCode;
                Command.Parameters.Add(p_statuscode);
                
                try
                {
                    Command.ExecuteScalar();
                    Transaction.Commit();
                }
                    
                catch (Exception ex)
                {
                    Transaction.Rollback();
                    eventLog.WriteEntry(ex.Message);
                }
            }
        }
    }
}
