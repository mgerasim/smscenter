/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-12   R0003       Герасимов           Создание модели
 * 2012-05-03   R0022       Герасимов           Удаление группы из справочника
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 * 2012-05-15   R0027       Герасимов           Поддержка DBConnection
 * 2012-11-28   R0066       Герасимов           Возможность редактировать филиал для группы
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
    public class GroupModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Введите название группы")]
        [Display(Name = "Название группы")]
        public string Name { get; set; }
        [Display(Name = "Пользователь")]
        public UserModel User { get; set; }
        [Display(Name = "Филиал")]
        public Int32 BranchID { get; set; }

        public GroupModel()
        {
            this.User = new UserModel();
            this.User.FindByID(UserModel.CurrentUserId);
        }

        public List<GroupModel> FindAll()
        {
            GroupRepository _repo = new GroupRepository();
            return _repo.Groups();
        }

        public List<AbonentModel> Abonents()
        {
            AbonentRepository _repo = new AbonentRepository();
            return _repo.Abonents(null,null,null,this.ID);
        }

        public List<AbonentModel> AbonentsAll()
        {
            AbonentRepository _repo = new AbonentRepository();
            return _repo.Abonents();
        }

        public GroupModel FindOne(int GroupID)
        {
            GroupRepository _repo = new GroupRepository();
            List<GroupModel> Group = _repo.Groups(GroupID);
            this.ID = Group[0].ID;
            this.Name = Group[0].Name;
            return Group[0];
        }

        public void Update(string abonents_add, string abonents_del)
        {
            GroupRepository _repo = new GroupRepository();
            _repo.Update(this, abonents_add, abonents_del);
        }

        public void Create()
        {
            GroupRepository _repo = new GroupRepository();
            _repo.Create(this);
        }

        public void Delete()
        {
            GroupRepository _repo = new GroupRepository();
            _repo.Delete(this);
        }

    }

    public class GroupRepository
    {
        public List<GroupModel> Groups(Nullable<int> id_gr = null, string nm_gr = null, Nullable<int> brnch_id_gr = null, Nullable<int> usr_id_gr = null, string ord_by = null)
        {
            List<GroupModel> Group = new List<GroupModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_gr == null)
                {
                    cmd.Parameters.AddWithValue("id_group_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_group = new OracleParameter("id_group_", OracleType.Int32);
                    id_group.Direction = ParameterDirection.Input;
                    id_group.Value = id_gr;
                    cmd.Parameters.Add(id_group);
                }
                if (nm_gr == null)
                {
                    cmd.Parameters.AddWithValue("name_group_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_group = new OracleParameter("name_group_", OracleType.VarChar);
                    name_group.Direction = ParameterDirection.Input;
                    name_group.Value = nm_gr;
                    cmd.Parameters.Add(name_group);
                }
                if (brnch_id_gr == null)
                {
                    cmd.Parameters.AddWithValue("branche_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                    branche_id.Direction = ParameterDirection.Input;
                    branche_id.Value = brnch_id_gr;
                    cmd.Parameters.Add(branche_id);
                }
                if (usr_id_gr == null)
                {
                    cmd.Parameters.AddWithValue("user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                    user_id.Direction = ParameterDirection.Input;
                    user_id.Value = usr_id_gr;
                    cmd.Parameters.Add(user_id);
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
                Nullable<int> brnchs_user_id = UserModel.CurrentUserId;
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

                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;
                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        GroupModel theGroupModel = new GroupModel();
                        theGroupModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theGroupModel.Name = Table.Rows[i]["Name"].ToString();
                        theGroupModel.BranchID = Convert.ToInt32(Table.Rows[i]["BRANCHE_ID"].ToString());
                        Group.Insert(i, theGroupModel);
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
            return Group;
        }

        public void Create(GroupModel theGroup)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter group_name = new OracleParameter("group_name_", OracleType.VarChar);
                group_name.Direction = ParameterDirection.Input;
                OracleParameter creater_id = new OracleParameter("creater_id_", OracleType.Number);
                creater_id.Direction = ParameterDirection.Input;
                group_name.Value = theGroup.Name;
                creater_id.Value = theGroup.User.Id;
                cmd.Parameters.Add(group_name);
                cmd.Parameters.Add(creater_id);
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

        public void Update(GroupModel theGroup, string str_abonents_id_add_, string str_abonents_id_del_)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                try
                {
                    OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_UPDATE", Connection.Connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    OracleParameter id_group = new OracleParameter("id_group_", OracleType.Int32);
                    OracleParameter name_group = new OracleParameter("name_group_", OracleType.VarChar);
                    OracleParameter id_updater = new OracleParameter("id_updater_", OracleType.Int32);
                    OracleParameter id_branch = new OracleParameter("id_branch_", OracleType.Int32);

                    id_group.Direction = ParameterDirection.Input;
                    name_group.Direction = ParameterDirection.Input;
                    id_updater.Direction = ParameterDirection.Input;
                    id_branch.Direction = ParameterDirection.Input;

                    id_group.Value = theGroup.ID;
                    name_group.Value = theGroup.Name;
                    id_updater.Value = theGroup.User.Id;
                    id_branch.Value = theGroup.BranchID;

                    cmd.Parameters.Add(id_group);
                    cmd.Parameters.Add(name_group);
                    cmd.Parameters.Add(id_updater);
                    cmd.Parameters.Add(id_branch);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                string[] split;
                if (str_abonents_id_add_.Length > 0 && str_abonents_id_del_.Length > 0)
                {
                    split = (str_abonents_id_add_.Trim(new Char[] { ',' })).Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        if (str_abonents_id_del_.Replace("," + s, "") != str_abonents_id_del_)
                        {
                            str_abonents_id_del_ = str_abonents_id_del_.Replace("," + s, "");
                            str_abonents_id_add_ = str_abonents_id_add_.Replace("," + s, "");
                        }
                    }
                    split = null;
                }

                str_abonents_id_add_ = str_abonents_id_add_.Replace("|", "");
                str_abonents_id_del_ = str_abonents_id_del_.Replace("|", "");

                if (str_abonents_id_add_.Length > 0)
                {
                    str_abonents_id_add_ = str_abonents_id_add_.Trim(new Char[] { ',' });
                    split = str_abonents_id_add_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_ABONENT_ADD", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter group_id = new OracleParameter("group_id_", OracleType.Int32);
                        OracleParameter abonent_id = new OracleParameter("abonent_id_", OracleType.Int32);
                        group_id.Direction = ParameterDirection.Input;
                        abonent_id.Direction = ParameterDirection.Input;
                        group_id.Value = theGroup.ID;
                        abonent_id.Value = s;
                        cmd.Parameters.Add(group_id);
                        cmd.Parameters.Add(abonent_id);
                        cmd.ExecuteNonQuery();
                    }
                    split = null;
                }

                if (str_abonents_id_del_.Length > 0)
                {
                    str_abonents_id_del_ = str_abonents_id_del_.Trim(new Char[] { ',' });
                    split = str_abonents_id_del_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_ABONENT_DEL", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter group_id = new OracleParameter("group_id_", OracleType.Int32);
                        OracleParameter abonent_id = new OracleParameter("abonent_id_", OracleType.Int32);
                        group_id.Direction = ParameterDirection.Input;
                        abonent_id.Direction = ParameterDirection.Input;
                        group_id.Value = theGroup.ID;
                        abonent_id.Value = s;
                        cmd.Parameters.Add(group_id);
                        cmd.Parameters.Add(abonent_id);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Connection.Dispose();
                Connection.Connection.Close();
            }
        }

        public void Delete(GroupModel theGroup)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GROUP_DELETE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_group = new OracleParameter("id_group_", OracleType.Int32);
                id_group.Direction = ParameterDirection.Input;
                id_group.Value = theGroup.ID;
                cmd.Parameters.Add(id_group);
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