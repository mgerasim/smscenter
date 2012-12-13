/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-10   R0003       Герасимов           Создание конструктора для TypeModel
 * 2012-04-15   R0027       Герасимов           Поддержка тестовой схемы и DBConnection
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Collections.Generic;
using SMScenterMVC.Utils;
using System.Data.OracleClient;

namespace SMScenterMVC.Models
{
    public class TypeModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Priority { get; set; }
        public string Description { get; set; }
        //public TypeModel() {ID = 1; }

        public List<TypeModel> FindAll()
        {
            TypeRepository _repo = new TypeRepository();
            return _repo.Types();
        }

        public List<TypeModel> UserTypes(int UserId)
        {
            TypeRepository _repo = new TypeRepository();
            return _repo.TypesUser(UserId);
        }
    }


    public class TypeRepository
    {


        public List<TypeModel> Types(Nullable<int> id_ = null, string name_ = null, Nullable<int> priority_ = null, string description_ = null, string ordr_by_ = null)
        {
            List<TypeModel> Type = new List<TypeModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_TYPES_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                                
                if (id_ == null)
                {
                    cmd.Parameters.AddWithValue("id_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_type = new OracleParameter("id_type_", OracleType.Int32);
                    id_type.Direction = ParameterDirection.Input;
                    id_type.Value = id_;
                    cmd.Parameters.Add(id_type);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_type = new OracleParameter("name_type_", OracleType.VarChar);
                    name_type.Direction = ParameterDirection.Input;
                    name_type.Value = name_;
                    cmd.Parameters.Add(name_type);
                }
                if (priority_ == null)
                {
                    cmd.Parameters.AddWithValue("priority_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter priority_type = new OracleParameter("priority_type_", OracleType.Int32);
                    priority_type.Direction = ParameterDirection.Input;
                    priority_type.Value = priority_;
                    cmd.Parameters.Add(priority_type);
                }
                if (description_ == null)
                {
                    cmd.Parameters.AddWithValue("description_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter description_type = new OracleParameter("description_type_", OracleType.VarChar);
                    description_type.Direction = ParameterDirection.Input;
                    description_type.Value = description_;
                    cmd.Parameters.Add(description_type);
                }
                Nullable<int> tps_user_id = UserModel.CurrentUserId;
                if (AccessActions.IsAccess("SuperUser"))
                    tps_user_id = null;

                if (tps_user_id == null)
                {
                    cmd.Parameters.AddWithValue("types_user_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter types_user_id = new OracleParameter("types_user_id_", OracleType.Int32);
                    types_user_id.Direction = ParameterDirection.Input;
                    types_user_id.Value = tps_user_id;
                    cmd.Parameters.Add(types_user_id);
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
                        TypeModel theType = new TypeModel();
                        theType.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theType.Name = Table.Rows[i]["NAME"].ToString();
                        theType.Priority = Convert.ToInt32(Table.Rows[i]["PRIORITY"].ToString());
                        theType.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                        Type.Insert(i, theType);
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
            return Type;
        }


        public List<TypeModel> TypesUser(Nullable<int> id_usr_ = null, Nullable<int> id_ = null, string name_ = null, Nullable<int> priority_ = null, string description_ = null, string ordr_by_ = null)
        {
            List<TypeModel> Type = new List<TypeModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_TYPES_GET", conn.Connection);
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
                    cmd.Parameters.AddWithValue("id_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_action = new OracleParameter("id_type_", OracleType.Int32);
                    id_action.Direction = ParameterDirection.Input;
                    id_action.Value = id_;
                    cmd.Parameters.Add(id_action);
                }
                if (name_ == null)
                {
                    cmd.Parameters.AddWithValue("name_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_action = new OracleParameter("name_type_", OracleType.VarChar);
                    name_action.Direction = ParameterDirection.Input;
                    name_action.Value = name_;
                    cmd.Parameters.Add(name_action);
                }
                if (priority_ == null)
                {
                    cmd.Parameters.AddWithValue("priority_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter priority_type = new OracleParameter("priority_type_", OracleType.Int32);
                    priority_type.Direction = ParameterDirection.Input;
                    priority_type.Value = priority_;
                    cmd.Parameters.Add(priority_type);
                }
                if (description_ == null)
                {
                    cmd.Parameters.AddWithValue("description_type_", OracleString.Null);
                }
                else
                {
                    OracleParameter description_action = new OracleParameter("description_type_", OracleType.VarChar);
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
                        TypeModel theType = new TypeModel();
                        theType.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theType.Name = Table.Rows[i]["NAME"].ToString();
                        theType.Priority = Convert.ToInt32(Table.Rows[i]["PRIORITY"].ToString());
                        theType.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                        Type.Insert(i, theType);
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
            return Type;
        }
/*        public IList<TypeModel> Types()
        {
//            procedure pr_type_get(id_type_ in number, name_type_ in varchar2, order_by_ in varchar2, t_list out ref_cursor)
            List<TypeModel> Type = new List<TypeModel>();

            DBConnection Connection = new DBConnection();
            Connection.Open();
            string strSQL = "select id, name, id as priority from type_task";
                       
            DataTable Table = new DataTable();

            Connection.ExecQuerySelect(strSQL, ref Table);

            for(int i=0;i<Table.Rows.Count;i++)
            {
                TypeModel theTypeModel  = new TypeModel();
                theTypeModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                theTypeModel.Name = Table.Rows[i]["Name"].ToString();
                theTypeModel.Priority = Convert.ToInt32(Table.Rows[i]["Priority"].ToString());
                Type.Insert(i, theTypeModel);
            }
            return Type;
        }*/
        
        public List<SelectListItem> AsSelectList(int SelectedID)
        {
            return CreateSelectList(Types(), "Выберите тип", 0, SelectedID);
        }
        protected List<SelectListItem> CreateSelectList<T>(IEnumerable<T> data, string zeroField, int zeroValue, int selectedId)
    where T : TypeModel
        {
            return CreateSelectListInner(data, zeroField, zeroValue, selectedId).ToList();
        }

        //Создает данные для выпадающего списка в соответствии Id-Name
        //если задано zeroField, то оно добавляется первым со значением 0
        private IEnumerable<SelectListItem> CreateSelectListInner<T>(IEnumerable<T> data, string zeroField, int zeroValue, int selectedId)
                where T : TypeModel
        {
            if (zeroField != null)
            {
                yield return new SelectListItem { Value = zeroValue.ToString(), Text = zeroField, Selected = Equals(selectedId, zeroValue) };
            }

            foreach (var item in data)
            {
                yield return new SelectListItem { Value = item.ID.ToString(), Text = item.Name.ToString(), Selected = Equals(selectedId, item.ID) };
            }
        }
        public static string LastTaskId()
        {
            DBConnection Connection = new DBConnection();
            
            Connection.Open();
            DataTable Table = new DataTable();
            Connection.ExecQuerySelect("select max(id)+1 as ID from tasks", ref Table);            
            string LastID = Table.Rows[0]["ID"].ToString();
            return LastID;
        }
    }

    public class SelectTypeModel
    {
        public string ID { get; set; }
        public IEnumerable<SelectListItem> List { get; set; }
    }
}