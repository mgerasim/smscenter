/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-09   R0003       Герасимов           Создание модели для создания задания
 * 2012-04-10   R0003       Герасимов           Создание функции StatMailingRepository::AddMailingWithSmsList
 * 2012-04-11   R0003       Герасимов           Создание
 * 2012-04-12   R0001       Толшин              Класс StatMailingRepository - добавление возможности передачи в исполняемую процедуру Oracle параметров со значением <Null>
 * 2012-04-13   R0007       Герасимов           Поддержка справочника при создании рассылки
 * 2012-04-16   R0009       Герасимов           Корректная обработка номеров после выбора в группе
 * 2012-04-16   R0010       Герасимов           Добавление user_id при создании рассылки
 * 2012-04-20   R0012       Герасимов           Валидация задания
 * 2012-05-03   R0021       Герасимов           Изменение функции UserModel.CurrentUserId на static
 * 2012-05-14   R0027       Герасимов           Использование класса DBConnection. Поддержка тестовой схемы
 * 2012-06-18   R0047       Герасимов           Отложенная отправка
 * 2012-06-21   R0048       Герасимов           Выбор времени отправки из раскрывающего списка
 * 2012-09-07   R0057       Книжник             Добавление статуса для задания
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.OracleClient;
using System.Data;
using System.Threading;
using System.Globalization;
using SMScenterMVC.Utils;
using System.Net.Mail;
using System.Net;

namespace SMScenterMVC.Models
{

    public class StatMailing
    {
        public string Id_task { get; set; }
        [Display(Name="Название:")]
        [Required(ErrorMessage = "* введине название задания")]
        public string Name_task { get; set; }
        public string Create_at { get; set; }
        public string Update_at { get; set; }
        [Required(ErrorMessage = "* укажите тип задания")]        
        [Display(Name = "Тип задания:")]
        public int  TypeID { get; set; }
        public string TypeName { get; set; }
        [Display(Name = "Текст сообщения:")]
        [Required(ErrorMessage = "* введите текст сообщения")]
        [StringLength(1024, ErrorMessage = "* текст сообщения не может превышать 1024 символов")]
        public string Msg { get; set; }
        [Display(Name = "Список телефонов (71112223344;78889994455):")]
        [Required(ErrorMessage = "* добавьте номер в список телефонов")]     
        public string SmsList { get; set; }
        public List<int> ListGroupID { get; set; }
        [Display(Name = "Кем создан:")]
        public int UserID { get; set; }
        [Display(Name = "Время отправки:")]
        [DataType(DataType.DateTime)]
        public DateTime Started { get; set; }
        public UserModel User
        {
            get
            {
                UserModel theUser = new UserModel();
                theUser.FindByID(this.UserID);
                return theUser;
            }
        }
        [Display(Name = "Филиал:")]
        public int BrancheID { get; set; }
        public BrancheModel Branche
        {
            get
            {
                BrancheModel theBranche = new BrancheModel();
                theBranche.FindOne(this.BrancheID);
                return theBranche;
            }
        }
        
        public StatMailing()
        {
            Started = DateTime.Now;
        }

        public uint Save()
        {
            StatMailingRepository _repository = new StatMailingRepository();
            return _repository.AddWithSmsList(this);
        }
        public string Status { get; set; }
    }

    public class StatParam
    {
        public string tsk_type { get; set; }
        public string tsk_user_id { get; set; }
        public string tsk_date_from  { get; set; }
        public string tsk_date_to { get; set; }
    }

    public class DetailMailing
    {
        public string Phone { get; set; }
        public string Create_at { get; set; }
        public string Update_at { get; set; }
        public string Status { get; set; }
        public string Message { get; set; }
        public string Name_abonent { get; set; }
    }

    public class StatMailingRepository
    {        
        public List<StatMailing> StatMailings(Nullable<int> tsk_type, Nullable<int> tsk_user_id,
                                                string tsk_date_from, string tsk_date_to, Nullable<int> tsk_branches_user_id)
        {
            List<StatMailing> _mailings = new List<StatMailing>();
            DBConnection conn = new DBConnection();
            try
            {             
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GET_TASKS", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter date_from = new OracleParameter("date_from_", OracleType.DateTime);
                date_from.Direction = ParameterDirection.Input;
                OracleParameter date_to = new OracleParameter("date_to_", OracleType.DateTime);
                date_to.Direction = ParameterDirection.Input;
                //date_to.Value = DateTime.Parse(tsk_date_to);
                date_from.Value = DateTime.ParseExact(tsk_date_from,"dd.MM.yyyy",null);
                date_to.Value = DateTime.ParseExact(tsk_date_to, "dd.MM.yyyy", null);

                if (tsk_type == null)
                {
                    cmd.Parameters.AddWithValue("task_type_", OracleString.Null);
                }
                else
                {                
                    OracleParameter task_type = new OracleParameter("task_type_", OracleType.Number);
                    task_type.Direction = ParameterDirection.Input;
                    task_type.Value = tsk_type;
                    cmd.Parameters.Add(task_type);
                }

                cmd.Parameters.Add(date_from);
                cmd.Parameters.Add(date_to);

                if (tsk_user_id == null)
                {
                    cmd.Parameters.AddWithValue("user_id_", OracleString.Null);
                }
                else
                {                
                    OracleParameter user_id = new OracleParameter("user_id_", OracleType.Number);
                    user_id.Direction = ParameterDirection.Input;
                    user_id.Value = tsk_user_id;
                    cmd.Parameters.Add(user_id);
                }
                if (tsk_branches_user_id == null)
                {
                    cmd.Parameters.AddWithValue("branches_user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branches_user_id = new OracleParameter("branches_user_id_", OracleType.Number);
                    branches_user_id.Direction = ParameterDirection.Input;
                    branches_user_id.Value = tsk_branches_user_id;
                    cmd.Parameters.Add(branches_user_id);
                }

                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    //DateTime pre_Create_at, pre_Update_at=DateTime.Now;
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        //pre_Create_at = DateTime.Parse(Table.Rows[i]["created_at"].ToString());
                        //pre_Update_at = DateTime.Parse(Table.Rows[i]["updated_at"].ToString());
                        _mailings.Add(new StatMailing
                        {
                            Id_task = Table.Rows[i]["id"].ToString(),
                            Name_task = Table.Rows[i]["name"].ToString(),                            
                            Create_at = Table.Rows[i]["created_at_format"].ToString(),
                            TypeName = Table.Rows[i]["type_task_name"].ToString(),
                            Msg = Table.Rows[i]["msg"].ToString(),
                            UserID = Convert.ToInt32(Table.Rows[i]["user_id"].ToString()),
                            BrancheID = Convert.ToInt32(Table.Rows[i]["branche_id"].ToString()),
                            Status = Table.Rows[i]["status"].ToString()
                        }
                        );
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
                }

                //                conn.Close();
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
            return _mailings;
        }

        public List<DetailMailing> Details(int id)
        {
            List<DetailMailing> _mailing_detail = new List<DetailMailing>();
            DBConnection conn = new DBConnection();
            try
            {                
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GET_MESSAGES", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                OracleParameter id_task = new OracleParameter("id_task_", OracleType.Float);
                id_task.Direction = ParameterDirection.Input;

                id_task.Value = id;

                cmd.Parameters.Add(id_task);
                cmd.Parameters.Add("s_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;

                DataAdapter.SelectCommand = cmd;

                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        _mailing_detail.Add(new DetailMailing
                        {
                            Phone = Table.Rows[i]["phone"].ToString(),
                            Create_at = Table.Rows[i]["created_at"].ToString(),
                            Update_at = Table.Rows[i]["updated_at"].ToString(),
                            Status = Table.Rows[i]["status"].ToString(),
                            Name_abonent = Table.Rows[i]["name_abonent"].ToString()
                        }
                        );
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
                }

                conn.Close();
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
            return _mailing_detail;
        }

        protected void SendEmailToAbonent(string text, string phone)
        {
            try
            {
                AbonentModel theAbonent = new AbonentModel();             
                List<AbonentModel> theAbonentList = theAbonent.FindByPhone(phone);
                if (theAbonentList.Count == 0)
                {
                    return;
                }                
                theAbonent = theAbonentList[0];
                if (theAbonent.Email.Length == 0)
                {
                    return;
                }

                SmtpClient Smtp = new SmtpClient("10.198.1.200", 25);
                Smtp.EnableSsl = false;

                MailMessage message = new MailMessage();
                message.From = new MailAddress("smscenter@khv.dv.rt.ru");
                message.To.Add(new MailAddress("GerasimovMN@khv.dv.rt.ru"));
                message.Subject = "SMSCENTER \\ Monit";
                message.Body = text;

                Smtp.Send(message);//отправка
            }
            catch
            {
            }
        }

        // Создает рассылку для списка телефонов, разделенных запятой
        public uint AddWithSmsList(StatMailing theMailing)
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand Command = new OracleCommand();
                Command.Connection = conn.Connection;
                Command.CommandText = "PKG_WEB.add_task";
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                
                OracleTransaction Transaction;
                Transaction = conn.Connection.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
                Command.Transaction = Transaction;
                
                OracleParameter p_name = new OracleParameter("name_", OracleType.VarChar, theMailing.Name_task.Length);                
                p_name.Direction = ParameterDirection.Input;
                p_name.Value = theMailing.Name_task;
                Command.Parameters.Add(p_name);
                
                OracleParameter p_type = new OracleParameter("type_", OracleType.Int32, 4);
                p_type.Direction = ParameterDirection.Input;
                p_type.Value = theMailing.TypeID;
                Command.Parameters.Add(p_type);

                OracleParameter p_user = new OracleParameter("user_id_", OracleType.Int32, 4);
                p_user.Direction = ParameterDirection.Input;
                p_user.Value = UserModel.CurrentUserId;
                Command.Parameters.Add(p_user);

                OracleParameter p_out = new OracleParameter("RETURN_VALUE", OracleType.Int32);
                p_out.Direction = ParameterDirection.ReturnValue;
                Command.Parameters.Add(p_out);

                try
                {
                    Command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Transaction.Rollback();
                    throw new Exception(ex.Message.ToString());
                }

                OracleCommand CommandAddSms = new OracleCommand();
                CommandAddSms.Transaction = Transaction;

                CommandAddSms.Connection = conn.Connection;
                CommandAddSms.CommandText = "PKG_WEB.add_to_task";
                CommandAddSms.CommandType = System.Data.CommandType.StoredProcedure;

                OracleParameter p_phone2 = new OracleParameter("phone_", OracleType.VarChar, 20);
                p_phone2.Direction = ParameterDirection.Input;                
                CommandAddSms.Parameters.Add(p_phone2);

                OracleParameter p_text2 = new OracleParameter("text_", OracleType.VarChar, theMailing.Msg.Length);
                p_text2.Direction = ParameterDirection.Input;
                p_text2.Value = theMailing.Msg;
                CommandAddSms.Parameters.Add(p_text2);

                OracleParameter p_task2 = new OracleParameter("task_id", OracleType.Int32, 4);
                p_task2.Direction = ParameterDirection.Input;
                p_task2.Value = p_out.Value;
                CommandAddSms.Parameters.Add(p_task2);

                OracleParameter p_user2 = new OracleParameter("user_id_", OracleType.Int32, 4);
                p_user2.Direction = ParameterDirection.Input;
                p_user2.Value = UserModel.CurrentUserId;
                CommandAddSms.Parameters.Add(p_user2);
                
                OracleParameter p_started = new OracleParameter("started_", OracleType.DateTime, 4);
                p_started.Direction = ParameterDirection.Input;
                p_started.Value = theMailing.Started;
                CommandAddSms.Parameters.Add(p_started);
                
                OracleParameter p_out2 = new OracleParameter("RETURN_VALUE", OracleType.Int32);
                p_out2.Direction = ParameterDirection.ReturnValue;
                CommandAddSms.Parameters.Add(p_out2);

                try
                {
                    theMailing.SmsList = theMailing.SmsList.Replace(',', ';');
                    string[] words = theMailing.SmsList.Split(';');
                    foreach (string word in words)
                    {
                        if (word.Length == 0)
                            continue;

                        SendEmailToAbonent(theMailing.Name_task + "\n\n" + theMailing.Msg, word);

                        p_phone2.Value = word.PadRight(10);
                        CommandAddSms.ExecuteNonQuery();
                    }

                    
                    Transaction.Commit();
                }
                    
                catch (Exception ex)
                {
                    Transaction.Rollback();
                    throw new Exception(ex.Message.ToString());
                }
                 
            }
            catch(Exception ex)
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

    public class StatSingleMailing
    {//ID, PHONE, CREATED_AT, UPDATED_AT, STATUS, MESSAGE, USER_NAME, ERROR_ID, BRANCHE_S_NAME, TYPE_TASK
        public int ID { get; set; }
        public int RNUM { get; set; }
        public string Phone { get; set; }
        public string Msg { get; set; }
        public string Create_at { get; set; }
        public string Update_at { get; set; }
        public string Type { get; set; }
        public string Branche { get; set; }
        public string Status { get; set; }
        public string Creater { get; set; }
        public int Err_id { get; set; }
    }

    public class StatSingleMailingRepository
    {
        public List<StatSingleMailing> StatMailings(string sms_text, string sms_phone, Nullable<int> sms_type, string sms_date_from, string sms_date_to, Nullable<int> sms_user_id, Nullable<int> sms_rownum_from, Nullable<int> sms_rownum_to)
        {
            List<StatSingleMailing> _mailings = new List<StatSingleMailing>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.pr_get_messages_search", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                if (sms_text == null)
                {
                    cmd.Parameters.AddWithValue("text_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_text = new OracleParameter("text_", OracleType.VarChar);
                    s_text.Direction = ParameterDirection.Input;
                    s_text.Value = sms_text;
                    cmd.Parameters.Add(s_text);
                }
                if (sms_phone == null)
                {
                    cmd.Parameters.AddWithValue("phone_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_phone = new OracleParameter("phone_", OracleType.VarChar);
                    s_phone.Direction = ParameterDirection.Input;
                    s_phone.Value = sms_phone;
                    cmd.Parameters.Add(s_phone);
                }
                if (sms_type == null)
                {
                    cmd.Parameters.AddWithValue("task_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_task_type = new OracleParameter("task_type_", OracleType.Number);
                    s_task_type.Direction = ParameterDirection.Input;
                    s_task_type.Value = sms_type;
                    cmd.Parameters.Add(s_task_type);
                }

                OracleParameter s_date_from = new OracleParameter("date_from_", OracleType.DateTime);
                OracleParameter s_date_to = new OracleParameter("date_to_", OracleType.DateTime);

                s_date_from.Direction = ParameterDirection.Input;                
                s_date_to.Direction = ParameterDirection.Input;

                s_date_from.Value = DateTime.ParseExact(sms_date_from, "dd.MM.yyyy", null);
                s_date_to.Value = DateTime.ParseExact(sms_date_to, "dd.MM.yyyy", null);

                cmd.Parameters.Add(s_date_from);
                cmd.Parameters.Add(s_date_to);

                if (sms_user_id == null)
                {
                    cmd.Parameters.AddWithValue("user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_user_id = new OracleParameter("user_id_", OracleType.Number);
                    s_user_id.Direction = ParameterDirection.Input;
                    s_user_id.Value = sms_user_id;
                    cmd.Parameters.Add(s_user_id);
                }
                Nullable<int> sms_branches_user_id = UserModel.CurrentUserId;
                if (sms_branches_user_id == null)
                {
                    cmd.Parameters.AddWithValue("branches_user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branches_user_id = new OracleParameter("branches_user_id_", OracleType.Number);
                    branches_user_id.Direction = ParameterDirection.Input;
                    branches_user_id.Value = sms_branches_user_id;
                    cmd.Parameters.Add(branches_user_id);
                }
                if (sms_rownum_from == null)
                {
                    cmd.Parameters.AddWithValue("rownum_from_", OracleString.Null);
                }
                else
                {
                    OracleParameter rownum_from = new OracleParameter("rownum_from_", OracleType.Number);
                    rownum_from.Direction = ParameterDirection.Input;
                    rownum_from.Value = sms_rownum_from;
                    cmd.Parameters.Add(rownum_from);
                }
                if (sms_rownum_to == null)
                {
                    cmd.Parameters.AddWithValue("rownum_to_", OracleString.Null);
                }
                else
                {
                    OracleParameter rownum_to = new OracleParameter("rownum_to_", OracleType.Number);
                    rownum_to.Direction = ParameterDirection.Input;
                    rownum_to.Value = sms_rownum_to;
                    cmd.Parameters.Add(rownum_to);
                }

                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        _mailings.Add(new StatSingleMailing
                        {
                            ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString()),
                            RNUM = Convert.ToInt32(Table.Rows[i]["RN"].ToString()),
                            Phone = Table.Rows[i]["PHONE"].ToString(),
                            Create_at = Table.Rows[i]["CREATED_AT"].ToString(),
                            Update_at = Table.Rows[i]["UPDATED_AT"].ToString(),
                            Msg = Table.Rows[i]["MESSAGE"].ToString(),
                            Status = Table.Rows[i]["STATUS"].ToString(),
                            Creater = Table.Rows[i]["USER_NAME"].ToString(),
                            Branche = Table.Rows[i]["BRANCHE_S_NAME"].ToString(),
                            Type = Table.Rows[i]["TYPE_TASK"].ToString()
                        }
                        );
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
                }

                //                conn.Close();
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
            return _mailings;
        }
    }
}