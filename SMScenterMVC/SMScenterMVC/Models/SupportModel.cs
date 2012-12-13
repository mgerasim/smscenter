/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-06-07   R0040       Герасимов           Создание модели
 * 2012-06-14   R0044       Герасимов           Процедура выборки тех поддержки
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
    public class SupportModel
    {
        public int ID { get; set; }
        [Display(Name = "Имя:")]
        [Required(ErrorMessage = "* введите Имя")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "* длина Имени должна быть не менее чем 3 и не более чем 20 символов")]        
        public string Name { get; set; }
        [Required(ErrorMessage = "* введите Телефон")]
        [Display(Name = "Телефон:")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "* введите Email")]
        [Display(Name = "Email:")]
        public string email { get; set; }
        [Required(ErrorMessage = "* введите Сотовый номер")]
        [Display(Name = "Сотовый номер:")]
        public string Smsmail { get; set; }

        public List<SupportModel> Supports()
        {
            return SupportRepository.Supports();
        }
    }

    public class SupportRepository
    {
        public static List<SupportModel> Supports()
        {
            List<SupportModel> Support = new List<SupportModel>();

            DBConnection Connection = new DBConnection();
            Connection.Open();
            OracleDataAdapter DataAdapter = new OracleDataAdapter();
            OracleCommand cmd = new OracleCommand("PKG_WEB.PR_SUPPORT_GET", Connection.Connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            

            cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
            DataAdapter.SelectCommand = cmd;
            try
            {
                DataTable Table = new DataTable();
                DataAdapter.Fill(Table);
                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    SupportModel theSupportModel = new SupportModel();
                    theSupportModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                    theSupportModel.Name = Table.Rows[i]["Name"].ToString();
                    theSupportModel.Smsmail = Table.Rows[i]["Smsmail"].ToString();
                    theSupportModel.email = Table.Rows[i]["Email"].ToString();
                    theSupportModel.Phone = Table.Rows[i]["Phone"].ToString();
                    Support.Insert(i, theSupportModel);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
           
            return Support;
        }
    }
}