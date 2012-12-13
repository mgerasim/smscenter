/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-06-22   R0050       Герасимов           Создание файла
 * 2012-08-23   R0054       Герасимов           АРМ SMS: удаление информации и разделов
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using SMScenterMVC.Utils;
using System.Data;
using System.Data.OracleClient;

namespace SMScenterMVC.Models
{
    public class SmsinfomsgModel
    {
        public Int32 ID { get; set; }
        [Display(Name = "Наименование:")]
        [Required(ErrorMessage = "* укажите наименование")]
        public string Name { get; set; }
        [Display(Name = "Текст:")]
        [Required(ErrorMessage = "* укажите текст")]
        public string Text { get; set; }
        [Display(Name = "В справочнике:")]
        public Int32 SmsinfosprID { get; set; }
        public SmsinfosprModel theSmsinfospr;
        [Display(Name = "В новом справочнике:")]
        public string NewSprName { get; set; }
    
    public List<SmsinfomsgModel> FindAll(string condition = "", string order = "")
        {
            SmsinfomsgRepository _repo = new SmsinfomsgRepository();
            return _repo.FindAll(condition, order);
        }



        public SmsinfomsgModel FindOne(int ID)
        {
            SmsinfomsgRepository _repo = new SmsinfomsgRepository();
            SmsinfomsgModel theMsg = _repo.FindAll("ID="+ID.ToString())[0];

            this.ID = theMsg.ID;
            this.Name = theMsg.Name;
            this.Text = theMsg.Text;
            this.SmsinfosprID = theMsg.SmsinfosprID;

            return this;
        }

        public void Create()
        {
            SmsinfomsgRepository _repo = new SmsinfomsgRepository();
            _repo.Create(this);
        }

        public void Update()
        {
            SmsinfomsgRepository _repo = new SmsinfomsgRepository();
            _repo.Update(this);
        }

        public void Delete()
        {
            SmsinfomsgRepository _repo = new SmsinfomsgRepository();
            _repo.Delete(this);
        }

        public int StatMonthPrev()
        {
            StatSingleMailingRepository _repo = new StatSingleMailingRepository();

            int yr = DateTime.Today.Year;
            int mth = DateTime.Today.Month;
            DateTime firstDay = new DateTime(yr, mth, 1).AddMonths(-1);
            DateTime lastDay = new DateTime(yr, mth, 1).AddDays(-1);

            return _repo.StatMailings(this.Text, null, null, firstDay.ToString("dd.MM.yyyy"), lastDay.ToString("dd.MM.yyyy"), null, null, null).Count;
        }

        public int StatMonthCurr()
        {
            StatSingleMailingRepository _repo = new StatSingleMailingRepository();

            int yr = DateTime.Today.Year;
            int mth = DateTime.Today.Month;
            DateTime firstDay = new DateTime(yr, mth, 1);

            return _repo.StatMailings(this.Text, null, null, firstDay.ToString("dd.MM.yyyy"), DateTime.Now.ToString("dd.MM.yyyy"), null, null, null).Count;
        }
    }

    public class SmsinfomsgRepository
    {
        public List<SmsinfomsgModel> FindAll(string condition = "", string order = "")
        {
            List<SmsinfomsgModel> MsgList = new List<SmsinfomsgModel>();
            DBConnection conn = null;
            try
            {
                conn = new DBConnection();                
                conn.Open();
                string strSQL = "SELECT * FROM Smsinfomsg";

                if (condition.Length > 0)
                {
                    strSQL = strSQL + " where " + condition;
                }
                if (order.Length > 0)
                {
                    strSQL = strSQL + " order by " + order;
                }

                DataTable Table = new DataTable();

                conn.ExecQuerySelect(strSQL, ref Table);

                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    SmsinfomsgModel theSmsinfomsgModel = new SmsinfomsgModel();
                    theSmsinfomsgModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                    theSmsinfomsgModel.Name = Table.Rows[i]["Name"].ToString();
                    theSmsinfomsgModel.Text = Table.Rows[i]["Text"].ToString();
                    theSmsinfomsgModel.SmsinfosprID = Convert.ToInt32(Table.Rows[i]["SMSINFOSPR_ID"].ToString());
                    MsgList.Insert(i, theSmsinfomsgModel);
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
            return MsgList;
        }




        public void Create(SmsinfomsgModel theMsg)
        {
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();

                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_SMSINFOMSG_CREATE", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                OracleParameter p_name = new OracleParameter("p_name", OracleType.VarChar);
                p_name.Direction = ParameterDirection.Input;
                p_name.Value = theMsg.Name;
                cmd.Parameters.Add(p_name);

                OracleParameter p_text = new OracleParameter("p_text", OracleType.VarChar);
                p_text.Direction = ParameterDirection.Input;
                p_text.Value = theMsg.Text;
                cmd.Parameters.Add(p_text);

                OracleParameter p_spr_id = new OracleParameter("p_spr_id", OracleType.Int32);
                p_spr_id.Direction = ParameterDirection.Input;
                p_spr_id.Value = theMsg.SmsinfosprID;
                cmd.Parameters.Add(p_spr_id);

                if (theMsg.NewSprName == null || theMsg.NewSprName == "")
                {
                    cmd.Parameters.AddWithValue("p_new_spr", OracleString.Null);
                }
                else
                {
                    OracleParameter p_new_spr = new OracleParameter("p_new_spr", OracleType.VarChar);
                    p_new_spr.Direction = ParameterDirection.Input;
                    p_new_spr.Value = theMsg.NewSprName;
                    cmd.Parameters.Add(p_new_spr);
                }
                cmd.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        public void Update(SmsinfomsgModel theMsg)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                string strSQL = string.Format("UPDATE Smsinfomsg SET NAME='{0}', TEXT='{1}', SMSINFOSPR_ID='{2}' WHERE ID = {3}",
                    theMsg.Name,
                    theMsg.Text,
                    theMsg.SmsinfosprID,
                    theMsg.ID);

                Connection.ExecQueryInsert(strSQL);                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }
        }


        public void Delete(SmsinfomsgModel theMsg)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                string strSQL = string.Format("DELETE FROM Smsinfomsg WHERE ID = {0}", theMsg.ID);

                Connection.ExecQueryInsert(strSQL);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}