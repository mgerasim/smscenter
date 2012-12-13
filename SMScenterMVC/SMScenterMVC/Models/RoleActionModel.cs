/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-12-11   R0068       Толшин              Изменение выборки доступных action'ов по переменной actns_user_id
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
    public class RoleModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Введите название роли")]
        [Display(Name = "Название")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Введите описание роли")]
        [Display(Name = "Описание")]
        public string Description { get; set; }

        /*[Display(Name = "Пользователь")]
        public UserModel User { get; set; }*/

        [Display(Name = "Пользователь")]
        public int UserId { get; set; }
        public string UserName { get; set; }

        [Display(Name = "Время изменения")]
        public string Update_at { get; set; }

        public RoleModel()
        {
            this.UserId = UserModel.CurrentUserId;
        }

        public List<ActionModel> ActionsRole
        {
            get
            {
                ActionRepository _repo = new ActionRepository();
                return _repo.Actions(this.ID);
            }
        }

        /*public RoleModel()
        {
            this.User = new UserModel();
            this.User.FindByID(UserModel.CurrentUserId);
        }*/

        public List<ActionModel> Actions()
        {
            ActionRepository _repo = new ActionRepository();
            return _repo.Actions(Convert.ToInt32(this.ID));
        }

        public List<ActionModel> ActionsAll()
        {
            ActionRepository _repo = new ActionRepository();
            return _repo.Actions();
        }

        public List<RoleModel> FindAll()
        {
            RoleRepository _repo = new RoleRepository();
            return _repo.Roles();
        }

        public RoleModel FindByID(int ID)
        {
            RoleRepository _repo = new RoleRepository();
            List<RoleModel> theRoles = _repo.Roles(ID);
            this.ID = theRoles[0].ID;
            this.Name = theRoles[0].Name;
            this.Description = theRoles[0].Description;
            this.Update_at = theRoles[0].Update_at;
            this.UserId = theRoles[0].UserId;
            this.UserName = theRoles[0].UserName;
            return this;
        }

        public void Create()
        {
            RoleRepository _repo = new RoleRepository();
            _repo.Create(this);
        }

        public void Update(string actions_add, string actions_del)
        {
            RoleRepository _repo = new RoleRepository();
            _repo.Update(this, actions_add, actions_del);
        }

        public void Delete()
        {
            RoleRepository _repo = new RoleRepository();
            _repo.Delete(this);
        }
    }

    public class RoleRepository
    {
        public List<RoleModel> Roles(Nullable<int> id_ = null, string name_ = null, string description_ = null, Nullable<int> id_usr_ = null, string ordr_by_ = null) 
        {
            List<RoleModel> Role = new List<RoleModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLES_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_ == null)
                {
                    cmd.Parameters.AddWithValue("id_role_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_role = new OracleParameter("id_role_", OracleType.Int32);
                    id_role.Direction = ParameterDirection.Input;
                    id_role.Value = id_;
                    cmd.Parameters.Add(id_role);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_role_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_role = new OracleParameter("name_role_", OracleType.VarChar);
                    name_role.Direction = ParameterDirection.Input;
                    name_role.Value = name_;
                    cmd.Parameters.Add(name_role);
                }
                if (description_ == null)
                {
                    cmd.Parameters.AddWithValue("description_role_", OracleString.Null);
                }
                else
                {
                    OracleParameter description_role = new OracleParameter("description_role_", OracleType.VarChar);
                    description_role.Direction = ParameterDirection.Input;
                    description_role.Value = description_;
                    cmd.Parameters.Add(description_role);
                }
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
                        RoleModel theRoleModel = new RoleModel();
                        theRoleModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theRoleModel.Name = Table.Rows[i]["NAME"].ToString();
                        theRoleModel.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                        theRoleModel.Update_at = Table.Rows[i]["UPDATE_AT"].ToString();
                        theRoleModel.UserId = Convert.ToInt32(Table.Rows[i]["USER_ID"].ToString());
                        theRoleModel.UserName = Table.Rows[i]["USER_NAME"].ToString();
                        Role.Insert(i, theRoleModel);
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

            return Role;
        }

        public void Create(RoleModel theRole)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLE_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter name_role = new OracleParameter("name_role_", OracleType.VarChar);
                OracleParameter description_role = new OracleParameter("description_role_", OracleType.VarChar);
                OracleParameter id_creater = new OracleParameter("id_creater_", OracleType.Int32);

                name_role.Direction = ParameterDirection.Input;
                description_role.Direction = ParameterDirection.Input;
                id_creater.Direction = ParameterDirection.Input;

                name_role.Value = theRole.Name;
                description_role.Value = theRole.Description;
                id_creater.Value = theRole.UserId;

                cmd.Parameters.Add(name_role);
                cmd.Parameters.Add(description_role);
                cmd.Parameters.Add(id_creater);
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

        public void Update(RoleModel theRole, string str_actions_id_add_, string str_actions_id_del_)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                try
                {
                    OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLE_UPDATE", Connection.Connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    OracleParameter id_role = new OracleParameter("id_role_", OracleType.Int32);
                    OracleParameter name_role = new OracleParameter("name_role_", OracleType.VarChar);
                    OracleParameter description_role = new OracleParameter("description_role_", OracleType.VarChar);
                    OracleParameter id_updater = new OracleParameter("id_updater_", OracleType.Int32);

                    id_role.Direction = ParameterDirection.Input;
                    name_role.Direction = ParameterDirection.Input;
                    description_role.Direction = ParameterDirection.Input;
                    id_updater.Direction = ParameterDirection.Input;

                    id_role.Value = theRole.ID;
                    name_role.Value = theRole.Name;
                    description_role.Value = theRole.Description;
                    id_updater.Value = theRole.UserId;

                    cmd.Parameters.Add(id_role);
                    cmd.Parameters.Add(name_role);
                    cmd.Parameters.Add(description_role);
                    cmd.Parameters.Add(id_updater);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                string[] split;
                if (str_actions_id_add_.Length > 0 && str_actions_id_del_.Length > 0)
                {
                    split = (str_actions_id_add_.Trim(new Char[] { ',' })).Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        if(str_actions_id_del_.Replace(","+s,"") != str_actions_id_del_)
                        {
                            str_actions_id_del_ = str_actions_id_del_.Replace("," + s, "");
                            str_actions_id_add_ = str_actions_id_add_.Replace("," + s, "");
                        }
                    }
                    split = null;
                }

                if (str_actions_id_add_.Length > 0)
                {
                    str_actions_id_add_ = str_actions_id_add_.Trim(new Char[] { ',' });
                    split = str_actions_id_add_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLE_ACTION_ADD", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter role_id_ = new OracleParameter("role_id_", OracleType.Int32);
                        OracleParameter action_id = new OracleParameter("action_id_", OracleType.Int32);
                        role_id_.Direction = ParameterDirection.Input;
                        action_id.Direction = ParameterDirection.Input;
                        role_id_.Value = theRole.ID;
                        action_id.Value = s;
                        cmd.Parameters.Add(role_id_);
                        cmd.Parameters.Add(action_id);
                        cmd.ExecuteNonQuery();
                    }
                    split = null;
                }

                if (str_actions_id_del_.Length > 0)
                {
                    str_actions_id_del_ = str_actions_id_del_.Trim(new Char[] { ',' });
                    split = str_actions_id_del_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLE_ACTION_DEL", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter role_id_ = new OracleParameter("role_id_", OracleType.Int32);
                        OracleParameter action_id = new OracleParameter("action_id_", OracleType.Int32);
                        role_id_.Direction = ParameterDirection.Input;
                        action_id.Direction = ParameterDirection.Input;
                        role_id_.Value = theRole.ID;
                        action_id.Value = s;
                        cmd.Parameters.Add(role_id_);
                        cmd.Parameters.Add(action_id);
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

        public void Delete(RoleModel theRole)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ROLE_DELETE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_role = new OracleParameter("id_role_", OracleType.Int32);
                id_role.Direction = ParameterDirection.Input;
                id_role.Value = theRole.ID;
                cmd.Parameters.Add(id_role);
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

    public class ActionModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Введите имя права")]
        [Display(Name = "Имя")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Введите описание права")]
        [Display(Name = "Описание")]
        public string Description { get; set; }

        public List<ActionModel> FindAll()
        {
            ActionRepository _repo = new ActionRepository();
            return _repo.Actions();
        }

        public List<ActionModel> UserActions(int UserId)
        {
            ActionRepository _repo = new ActionRepository();
            return _repo.ActionsUser(UserId);
        }

        public ActionModel FindByID(int ID)
        {
            ActionRepository _repo = new ActionRepository();
            List<ActionModel> theActions = _repo.Actions(null,ID);
            this.ID = theActions[0].ID;
            this.Name = theActions[0].Name;
            this.Description = theActions[0].Description;
            return this;
        }

        public void Create()
        {
            ActionRepository _repo = new ActionRepository();
            _repo.Create(this);
        }

        public void Delete()
        {
            ActionRepository _repo = new ActionRepository();
            _repo.Delete(this);
        }
    }

    public class ActionRepository
    {
        public List<ActionModel> Actions(Nullable<int> id_rl_ = null, Nullable<int> id_ = null, string name_ = null, string description_ = null, string ordr_by_ = null)
        {
            List<ActionModel> Action = new List<ActionModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ACTIONS_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_rl_ == null)
                {
                    cmd.Parameters.AddWithValue("id_role_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_role = new OracleParameter("id_role_", OracleType.Int32);
                    id_role.Direction = ParameterDirection.Input;
                    id_role.Value = id_rl_;
                    cmd.Parameters.Add(id_role);
                }
                if (id_ == null)
                {
                    cmd.Parameters.AddWithValue("id_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_action = new OracleParameter("id_action_", OracleType.Int32);
                    id_action.Direction = ParameterDirection.Input;
                    id_action.Value = id_;
                    cmd.Parameters.Add(id_action);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_action = new OracleParameter("name_action_", OracleType.VarChar);
                    name_action.Direction = ParameterDirection.Input;
                    name_action.Value = name_;
                    cmd.Parameters.Add(name_action);
                }
                if (description_ == null)
                {
                    cmd.Parameters.AddWithValue("description_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter description_action = new OracleParameter("description_action_", OracleType.VarChar);
                    description_action.Direction = ParameterDirection.Input;
                    description_action.Value = description_;
                    cmd.Parameters.Add(description_action);
                }
                Nullable<int> actns_user_id = UserModel.CurrentUserId;
                if (AccessActions.IsAccess("SuperUser"))
                    actns_user_id = null;

                if (actns_user_id == null)
                {
                    cmd.Parameters.AddWithValue("actions_user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter actions_user_id = new OracleParameter("actions_user_id_", OracleType.Int32);
                    actions_user_id.Direction = ParameterDirection.Input;
                    actions_user_id.Value = actns_user_id;
                    cmd.Parameters.Add(actions_user_id);
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
                        ActionModel theActionModel = new ActionModel();
                        theActionModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theActionModel.Name = Table.Rows[i]["NAME"].ToString();
                        theActionModel.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                        Action.Insert(i, theActionModel);
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
            return Action;
        }


        public List<ActionModel> ActionsUser(Nullable<int> id_usr_ = null, Nullable<int> id_ = null, string name_ = null, string description_ = null, string ordr_by_ = null)
        {
            List<ActionModel> Action = new List<ActionModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_ACTIONS_GET", conn.Connection);
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
                    cmd.Parameters.AddWithValue("id_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_action = new OracleParameter("id_action_", OracleType.Int32);
                    id_action.Direction = ParameterDirection.Input;
                    id_action.Value = id_;
                    cmd.Parameters.Add(id_action);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_action = new OracleParameter("name_action_", OracleType.VarChar);
                    name_action.Direction = ParameterDirection.Input;
                    name_action.Value = name_;
                    cmd.Parameters.Add(name_action);
                }
                if (description_ == null)
                {
                    cmd.Parameters.AddWithValue("description_action_", OracleString.Null);
                }
                else
                {
                    OracleParameter description_action = new OracleParameter("description_action_", OracleType.VarChar);
                    description_action.Direction = ParameterDirection.Input;
                    description_action.Value = description_;
                    cmd.Parameters.Add(description_action);
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
                        ActionModel theActionModel = new ActionModel();
                        theActionModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theActionModel.Name = Table.Rows[i]["NAME"].ToString();
                        theActionModel.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                        Action.Insert(i, theActionModel);
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
            return Action;
        }


        public void Create(ActionModel theAction)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ACTION_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter name_role = new OracleParameter("name_action_", OracleType.VarChar);
                OracleParameter description_role = new OracleParameter("description_action_", OracleType.VarChar);

                name_role.Direction = ParameterDirection.Input;
                description_role.Direction = ParameterDirection.Input;

                name_role.Value = theAction.Name;
                description_role.Value = theAction.Description;

                cmd.Parameters.Add(name_role);
                cmd.Parameters.Add(description_role);
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

        public void Delete(ActionModel theAction)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ACTION_DELETE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_role = new OracleParameter("id_action_", OracleType.Int32);
                id_role.Direction = ParameterDirection.Input;
                id_role.Value = theAction.ID;
                cmd.Parameters.Add(id_role);
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