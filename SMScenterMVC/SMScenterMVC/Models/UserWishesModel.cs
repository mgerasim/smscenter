/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-28   R0039       Книжник             Модель для просмотра пожеланий 
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using SMScenterMVC.Utils;
using System.Data.OracleClient;
using System.Data;

namespace SMScenterMVC.Models
{
    public class UserWishesModel
    {
        public int      Id         { get; set; }
        [Display(Name="Сообщение")]
        public string   Text       { get; set; }
        public int      User_id    { get; set; }
        [Display(Name = "Пользователь")]
        public string User_Name    { get; set; } 
        [Display(Name = "Дата")]
        public string   Create_at  { get; set; }
        public int Branche_id      { get; set; }
        [Display(Name = "Филиал")]
        public string Branche_Name { get; set; }

        public List<UserWishesModel> ListUserWishes()
        {
            UserWishesRepository R = new UserWishesRepository();
            return R.UserWishes(null,null,70);
        }
        public UserWishesModel DetailWish(int id)
        {
            UserWishesRepository R = new UserWishesRepository();
            return R.UserWishes(id)[0];
        }
    }

    public class UserWishesRepository
    {
        public List<UserWishesModel> UserWishes(Nullable<int> id = null, string txt = null, Nullable<int> txt_len=null, Nullable<int> usr_id = null, Nullable<int> brnch_id = null, string crt_at = null, string ord_by = null)
        {
            List<UserWishesModel> Wish = new List<UserWishesModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_WISHES_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                if (id == null)
                {
                    cmd.Parameters.AddWithValue("id_wishes_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_wishes = new OracleParameter("id_wishes_", OracleType.Int32);
                    id_wishes.Direction = ParameterDirection.Input;
                    id_wishes.Value = id;
                    cmd.Parameters.Add(id_wishes);
                }
                if (txt == null)
                {
                    cmd.Parameters.AddWithValue("text_wishes_", OracleString.Null);
                }
                else
                {
                    OracleParameter text_wishes = new OracleParameter("text_wishes_", OracleType.VarChar);
                    text_wishes.Direction = ParameterDirection.Input;
                    text_wishes.Value = txt;
                    cmd.Parameters.Add(text_wishes);
                }
                if (txt_len == null)
                {
                    cmd.Parameters.AddWithValue("text_len_", OracleString.Null);
                }
                else
                {
                    OracleParameter text_len = new OracleParameter("text_len_", OracleType.Int32);
                    text_len.Direction = ParameterDirection.Input;
                    text_len.Value = txt_len;
                    cmd.Parameters.Add(text_len);
                }
                if (usr_id == null)
                {
                    cmd.Parameters.AddWithValue("user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                    user_id.Direction = ParameterDirection.Input;
                    user_id.Value = usr_id;
                    cmd.Parameters.Add(user_id);
                }
                if (crt_at == null)
                {
                    cmd.Parameters.AddWithValue("create_at_", OracleString.Null);
                }
                else
                {
                    OracleParameter create_at = new OracleParameter("create_at_", OracleType.Int32);
                    create_at.Direction = ParameterDirection.Input;
                    create_at.Value = crt_at;
                    cmd.Parameters.Add(create_at);
                }
                if (brnch_id == null)
                {
                    cmd.Parameters.AddWithValue("branche_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                    branche_id.Direction = ParameterDirection.Input;
                    branche_id.Value = brnch_id;
                    cmd.Parameters.Add(branche_id);
                }
                Nullable<int> brnchs_user_id = UserModel.CurrentUserId;
                if (brnchs_user_id == null || brnchs_user_id == 0)
                {
                    cmd.Parameters.AddWithValue("branches_user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branches_user_id = new OracleParameter("branches_user_id_", OracleType.Int32);
                    branches_user_id.Direction = ParameterDirection.Input;
                    branches_user_id.Value = brnchs_user_id;
                    cmd.Parameters.Add(branches_user_id);
                }
                if (ord_by == null)
                {
                    cmd.Parameters.AddWithValue("order_by_", OracleString.Null);
                }
                else
                {
                    OracleParameter order_by = new OracleParameter("order_by_", OracleType.Int32);
                    order_by.Direction = ParameterDirection.Input;
                    order_by.Value = ord_by;
                    cmd.Parameters.Add(order_by);
                }
                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        UserWishesModel theWishe = new UserWishesModel();
                        theWishe.Id = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theWishe.Text = Table.Rows[i]["Text"].ToString();
                        theWishe.User_id = Convert.ToInt32(Table.Rows[i]["User_id"].ToString());
                        theWishe.User_Name = Table.Rows[i]["User_Name"].ToString();
                        theWishe.Branche_id = Convert.ToInt32(Table.Rows[i]["BRANCHE_ID"].ToString());
                        theWishe.Branche_Name = Table.Rows[i]["Branche_Name"].ToString();
                        theWishe.Create_at = Table.Rows[i]["Create_at"].ToString();
                        Wish.Insert(i, theWishe);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
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
            return Wish;
        }
    }
}