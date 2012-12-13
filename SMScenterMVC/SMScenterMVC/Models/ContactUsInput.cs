/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 */

using System.ComponentModel.DataAnnotations;
using System.Data.OracleClient;
using System;
using System.Data;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Models
{
    public class ContactUsInput
    {
        /*[Required(ErrorMessage = "Введите название группы")]
        [Display(Name = "Имя")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Укажите адрес электронной почты")]
        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        */
        [Required(ErrorMessage = "Введите сообщение!")]
        [Display(Name = "Текст:")]
        [UIHint("Multiline")]
        public string Message { get; set; }

        public void Create(int userid, string msg)
        {
            ContactUsInputRepository _repo = new ContactUsInputRepository();
            _repo.Create(userid, msg);
        }
    }

    public class ContactUsInputRepository
    {
        public void Create(int userid, string msg)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ADD_WISH", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter user_name = new OracleParameter("user_id_", OracleType.Number);
                user_name.Direction = ParameterDirection.Input;
                //OracleParameter group_name = new OracleParameter("group_name_", OracleType.VarChar);
                //group_name.Direction = ParameterDirection.Input;
                OracleParameter user_msg = new OracleParameter("user_msg_", OracleType.VarChar);
                user_msg.Direction = ParameterDirection.Input;
                user_name.Value = userid;                
                user_msg.Value = msg;
                cmd.Parameters.Add(user_name);
                cmd.Parameters.Add(user_msg);
                cmd.ExecuteNonQuery();
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