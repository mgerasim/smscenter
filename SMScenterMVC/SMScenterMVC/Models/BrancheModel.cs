/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-05-02   R0021       Герасимов           Справочник филиалов
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 * 2012-06-26   R0051       Герасимов           Изменение\Функция загрузки филиалов для формы редактирования пользователя
 * 2012-12-11   R0068       Толшин              Изменение выборки доступных филиалов по переменной brnchs_user_id
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.OracleClient;
using System.Data;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Models
{
    public class BrancheModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Введите сокращенное наименование:")]
        [Display(Name = "Сокращенное наименование")]
        public string name_short { get; set; }

        [Required(ErrorMessage = "Введите полное наименование:")]
        [Display(Name = "Полное наименование")]
        public string name_full { get; set; }

        public List<BrancheModel> FindAll()
        {
            BrancheRepository _repo = new BrancheRepository();
            return _repo.FindAll();
        }

        public List<BrancheModel> UserBranches(int UserId)
        {
            BrancheRepository _repo = new BrancheRepository();
            return _repo.BranchesUser(UserId);
        }

        public BrancheModel FindOne(int ID)
        {
            BrancheRepository _repo = new BrancheRepository();
            BrancheModel theBranche = _repo.FindAll(ID)[0];

            this.ID = theBranche.ID;
            this.name_full = theBranche.name_full;
            this.name_short = theBranche.name_short;

            return this;
        }

        public void Create()
        {
            BrancheRepository _repo = new BrancheRepository();
            _repo.Create(this);
        }

        public void Update()
        {
            BrancheRepository _repo = new BrancheRepository();
            _repo.Update(this);
        }

        /*public void Delete()
        {
            BrancheRepository _repo = new BrancheRepository();
            _repo.Delete(this);
        }*/
    }

    public class BrancheRepository
    {
        public List<BrancheModel> FindAll(Nullable<int> id_brnch = null, string nm_brnch = null, string s_nm_brnch = null, string ord_by = null)
        {
            List<BrancheModel> Branche = new List<BrancheModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_BRANCHE_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_brnch == null)
                {
                    cmd.Parameters.AddWithValue("id_branche_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_branche = new OracleParameter("id_branche_", OracleType.Int32);
                    id_branche.Direction = ParameterDirection.Input;
                    id_branche.Value = id_brnch;
                    cmd.Parameters.Add(id_branche);
                }
                if (nm_brnch == null)
                {
                    cmd.Parameters.AddWithValue("name_branche_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_branche = new OracleParameter("name_branche_", OracleType.VarChar);
                    name_branche.Direction = ParameterDirection.Input;
                    name_branche.Value = nm_brnch;
                    cmd.Parameters.Add(name_branche);
                }
                if (s_nm_brnch == null)
                {
                    cmd.Parameters.AddWithValue("s_name_branche_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_name_branche = new OracleParameter("s_name_branche_", OracleType.VarChar);
                    s_name_branche.Direction = ParameterDirection.Input;
                    s_name_branche.Value = nm_brnch;
                    cmd.Parameters.Add(s_name_branche);
                }
                Nullable<int> brnchs_user_id = UserModel.CurrentUserId;
                if (AccessActions.IsAccess("SuperUser"))
                    brnchs_user_id = null;

                if (brnchs_user_id == null)
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
                    OracleParameter order_by = new OracleParameter("order_by_", OracleType.VarChar);
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
                        BrancheModel theBranche = new BrancheModel();
                        theBranche.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theBranche.name_full = Table.Rows[i]["NAME"].ToString();
                        theBranche.name_short = Table.Rows[i]["S_NAME"].ToString();
                        Branche.Insert(i, theBranche);
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
            return Branche;
        }


        public List<BrancheModel> BranchesUser(Nullable<int> id_usr_ = null, Nullable<int> id_ = null, string name_ = null, string s_name_ = null, string ordr_by_ = null)
        {
            List<BrancheModel> Branche = new List<BrancheModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_BRANCHES_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_usr_ == null)
                {
                    cmd.Parameters.AddWithValue("id_user_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_user = new OracleParameter("id_user_", OracleType.Int32);
                    id_user.Direction = ParameterDirection.Input;
                    id_user.Value = id_usr_;
                    cmd.Parameters.Add(id_user);
                }
                if (id_ == null)
                {
                    cmd.Parameters.AddWithValue("id_branche_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_branche = new OracleParameter("id_branche_", OracleType.Int32);
                    id_branche.Direction = ParameterDirection.Input;
                    id_branche.Value = id_;
                    cmd.Parameters.Add(id_branche);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_brahcne_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_brahcne = new OracleParameter("name_brahcne_", OracleType.VarChar);
                    name_brahcne.Direction = ParameterDirection.Input;
                    name_brahcne.Value = name_;
                    cmd.Parameters.Add(name_brahcne);
                }
                if (s_name_ == null)
                {
                    cmd.Parameters.AddWithValue("s_name_brahcne_", OracleString.Null);
                }
                else
                {
                    OracleParameter s_name_brahcne = new OracleParameter("s_name_brahcne_", OracleType.VarChar);
                    s_name_brahcne.Direction = ParameterDirection.Input;
                    s_name_brahcne.Value = s_name_;
                    cmd.Parameters.Add(s_name_brahcne);
                }
                if (ordr_by_ == null)
                {
                    cmd.Parameters.AddWithValue("order_by_", OracleString.Null);
                }
                else
                {
                    OracleParameter order_by_ = new OracleParameter("order_by_", OracleType.VarChar);
                    order_by_.Direction = ParameterDirection.Input;
                    order_by_.Value = ordr_by_;
                    cmd.Parameters.Add(order_by_);
                }

                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        BrancheModel theBranche = new BrancheModel();
                        theBranche.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theBranche.name_full = Table.Rows[i]["NAME"].ToString();
                        theBranche.name_short = Table.Rows[i]["S_NAME"].ToString();
                        Branche.Insert(i, theBranche);
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
            return Branche;
        }


        public void Create(BrancheModel theBranche)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_BRANCHE_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter name_branche = new OracleParameter("name_branche_", OracleType.VarChar);
                OracleParameter s_name_branche = new OracleParameter("s_name_branche_", OracleType.VarChar);

                name_branche.Direction = ParameterDirection.Input;
                s_name_branche.Direction = ParameterDirection.Input;

                name_branche.Value = theBranche.name_full;
                s_name_branche.Value = theBranche.name_short;

                cmd.Parameters.Add(name_branche);
                cmd.Parameters.Add(s_name_branche);
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

        public void Update(BrancheModel theBranche)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_BRANCHE_UPDATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_branche = new OracleParameter("id_branche_", OracleType.Int32);
                OracleParameter name_branche = new OracleParameter("name_branche_", OracleType.VarChar);
                OracleParameter s_name_branche = new OracleParameter("s_name_branche_", OracleType.VarChar);

                id_branche.Direction = ParameterDirection.Input;
                name_branche.Direction = ParameterDirection.Input;
                s_name_branche.Direction = ParameterDirection.Input;

                id_branche.Value = theBranche.ID;
                name_branche.Value = theBranche.name_full;
                s_name_branche.Value = theBranche.name_short;

                cmd.Parameters.Add(id_branche);
                cmd.Parameters.Add(name_branche);
                cmd.Parameters.Add(s_name_branche);

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

        /*public void Delete(BrancheModel theBranche)
        {

            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();

                string strSQL = string.Format("DELETE FROM BRANCHES WHERE ID={0}",                    
                    theBranche.ID);

                OracleCommand cmd = new OracleCommand(strSQL, Connection.Connection);
                cmd.CommandType = System.Data.CommandType.Text;

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
        }*/

    }

}