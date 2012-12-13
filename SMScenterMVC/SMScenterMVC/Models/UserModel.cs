/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-11   R0005       Книжник             Создание модели для работы с пользователями
 * 2012-04-13   R0006       Герасимов           Возвращение идентификатора пользователя после успешной аутентификации
 * 2012-04-16   R0008       Книжник             Добавил модель LogOnModel
 * 2012-04-16   R0010       Герасимов           Добавление user_id при создании рассылки
 * 2012-04-19   R0014       Книжник             Приведение к нижнему регистру Login в запросе 
 * 2012-04-20   R0019       Книжник             Создание класса по работе с базой
 * 2012-04-20   R0016       Герасимов           Ошибка "Потеря куки Роль пользователя"
 * 2012-04-28   R0020       Книжник
 * 2012-05-02   R0011       Книжник
 * 2012-05-03   R0021       Герасимов           Поиск пользователя по ID
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 * 2012-05-16   R0028       Герасимов           Валидация пользователя. Уникальность логина
 * 2012-05-21   R0031       Герасимов           Ошибка валидации при редактировании модели Пользователь
 * 2012-05-23   R0032       Толшин              Исправление всех запросов на хранимые процедуры
 * 2012-06-14   R0045       Герасимов           FindByLogon возвращает идентификатор
 * 2012-06-15   R0045       Герасимов           Windows авторизация. Правка CurrentUserId
 * 2012-09-10   R0057       Книжник             Добавление статуса для задания
 * 2012-12-12   R0071       Герасимов           Убрать привязку к названию домена CORP. Имя пользователя ДОМЕН\Логин
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;
using System.DirectoryServices;
using System.Text;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;
using SMScenterMVC.Utils;
using System.Web.Mvc;


namespace SMScenterMVC.Models
{

    //модель для авторизации пользователя
    public class LogOnModel
    {
        [Required(ErrorMessage = "Введите имя пользователя")]
        [Display(Name = "Имя пользователя")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Введите пароль")]
        [DataType(DataType.Password)]
        [Display(Name = "Пароль")]
        public string Password { get; set; }

        [Display(Name = "Запомнить меня?")]
        public bool RememberMe { get; set; }
    }

    public class UserModel
    {
        public int    Id            { get; set; }
        [Required(ErrorMessage = "Введите логин")]
        [Display(Name = "Логин")]
        public virtual string Login { get; set; }
        /*public DateTime Created_At  { get; set; }
        public DateTime Update_At   { get; set; }*/
        public string Created_At { get; set; }
        public string Update_At { get; set; }
        [Required(ErrorMessage = "Введите имя")]
        [Display(Name = "Имя")]
        public string Name          { get; set; }
        [Display(Name = "Роль")]
        public int    Role_Id       { get; set; }
        public string Role_name { get; set; }
        [Display(Name = "Филиал")]
        public int BrancheID        { get; set; }
        public string Branche_name { get; set; }
        /*public BrancheModel Branche 
        {
            get
            {
                BrancheModel theBranche = new BrancheModel();
                theBranche.FindOne(BrancheID);
                return theBranche;
            }
        }
        public RoleModel Role
        {
            get
            {
                RoleModel role = new RoleModel();
                role.FindByID(Role_Id);
                return role;
            }
        }*/

        //получение списка пользователей
        public List<UserModel> ListUsers()
        {
            UserRepository R = new UserRepository();
            return R.Users(null, null, 0, null, null, null, UserModel.CurrentUserId);
        }
        //Авторизация по учетной записи в домене
        public int Authentication(string strLoginName, string strPassword)
        {
            UserRepository R = new UserRepository();
            int UserID = -1;
            if (R.Users(null, strLoginName, 0).Count() == 1)
            {
                UserID = R.Users(null, strLoginName)[0].Id;
                if (UserID != -1)
                {
                    //string adPath = "LDAP://172.30.1.227/DC=corp,DC=fetec,DC=dsv,DC=ru";
                    string adPath = "LDAP://h2s-dc01/DC=corp,DC=fetec,DC=dsv,DC=ru";
                    LdapAuthentication adAuth = new LdapAuthentication(adPath);
                    if (!adAuth.IsAuthenticated(strLoginName.Split('\\')[0], strLoginName.Split('\\')[1], strPassword))
                    {
                        UserID = -1;
                    }

                }
            }
            else 
            {
                throw new Exception("Ошибка авторизации: Пользователь " + strLoginName + " не зарегистрированн в системе");
            }
            
            return UserID;
        }

        public static int CurrentUserId
        {
            get
            {
                int userId = 0;
                string strLoginName = HttpContext.Current.User.Identity.Name;
                if (HttpContext.Current.Request.IsAuthenticated)
                {
#if DEBUG

//                    if (strLoginName == "TOLSHIN_KE\\Kirill" || strLoginName == "TOLSHIN_KE\\Admin") strLoginName = "CORP\\h02-tolshinke";
                    if (strLoginName == "TOLSHIN_KE\\Kirill" || strLoginName == "TOLSHIN_KE\\Admin") strLoginName = "CORP\\h02-turushevna";
                    

#endif
                    UserModel theModel = (new UserModel()).FindByLogin(strLoginName);

                    if (theModel != null)
                    {
                        userId = theModel.Id;
                    }
                }

                return userId;
            }
        }
        
        public static string CurrentUserNameFull
        {
            get
            {
                string userName = string.Empty;

                if (HttpContext.Current.Request.IsAuthenticated)
                {

                    UserModel theModel = (new UserModel()).FindByLogin(HttpContext.Current.User.Identity.Name);

                    if (theModel == null)
                    {
                        userName = HttpContext.Current.User.Identity.Name;
                    }
                    else
                    {
                        userName = theModel.Name;
                    }
                }

                return userName;
            }
        }

        public UserModel FindByID(int ID)
        {
            UserRepository _repo = new UserRepository();
            UserModel theUser = _repo.Users(ID, null, null, null, null, null, UserModel.CurrentUserId)[0];
            
            this.Id = theUser.Id;
            this.Login = theUser.Login;
            this.Name = theUser.Name;
            this.Role_Id = theUser.Role_Id;
            this.BrancheID = theUser.BrancheID;
            return this;
        }
        //Поиск пользователя по Логину в базе 
        public UserModel FindByLogin(string strLoginName)
        {
            UserRepository _repo = new UserRepository();
            if (_repo.Users(null, strLoginName).Count() > 0)
            {
                return _repo.Users(null, strLoginName)[0];
            }

            return null;
        }
        //регистрация пользователя
        public void Create()
        {
            UserRepository _user = new UserRepository();
            _user.CreateUser(this);
        }
        //редактирование пользователя
        public void Edit(string actions_add, string actions_del, string branches_add, string branches_del, string types_add, string types_del)
        {
            UserRepository _user = new UserRepository();
            _user.EditUser(this, actions_add, actions_del, branches_add, branches_del, types_add, types_del);
        }
        public void Delete()
        {
            UserRepository _user = new UserRepository();
            _user.DeleteUser(this);
        }
    }


    public class NewUserModel : UserModel
    {
        [Required(ErrorMessage = "Введите логин")]
        [Display(Name = "Логин AD")]
        [Remote("IsUserLogin_Available", "Validation")]
        public override string Login { get; set; }
    }

    public class UserRepository
    {
        public List<UserModel> Users(Nullable<int> id_usr = null, string login_usr = null, Nullable<int> is_del = null, string name_usr = null, Nullable<int> role_id_usr = null, Nullable<int> branche_id_usr = null, Nullable<int> brnchs_user_id = null, string ord_by = null)
        {
            List<UserModel> User = new List<UserModel>();
            DBConnection conn = new DBConnection();
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_GET", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                if (id_usr == null)
                {
                    cmd.Parameters.AddWithValue("id_user_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_user = new OracleParameter("id_user_", OracleType.Int32);
                    id_user.Direction = ParameterDirection.Input;
                    id_user.Value = id_usr;
                    cmd.Parameters.Add(id_user);
                }
                if (login_usr == null)
                {
                    cmd.Parameters.AddWithValue("login_user_", OracleString.Null);
                }
                else
                {
                    OracleParameter login_user = new OracleParameter("login_user_", OracleType.VarChar);
                    login_user.Direction = ParameterDirection.Input;
                    login_user.Value = login_usr;
                    cmd.Parameters.Add(login_user);
                }
                if (is_del == null)
                {
                    cmd.Parameters.AddWithValue("is_del_", OracleString.Null);
                }
                else
                {
                    OracleParameter is_deleted = new OracleParameter("is_del_", OracleType.Int32);
                    is_deleted.Direction = ParameterDirection.Input;
                    is_deleted.Value = is_del;
                    cmd.Parameters.Add(is_deleted);
                }
                if (name_usr == null)
                {
                    cmd.Parameters.AddWithValue("name_user_", OracleString.Null);
                }
                else
                {
                    OracleParameter name_user = new OracleParameter("name_user_", OracleType.VarChar);
                    name_user.Direction = ParameterDirection.Input;
                    name_user.Value = name_usr;
                    cmd.Parameters.Add(name_user);
                }
                if (role_id_usr == null)
                {
                    cmd.Parameters.AddWithValue("role_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter role_id = new OracleParameter("role_id_", OracleType.Int32);
                    role_id.Direction = ParameterDirection.Input;
                    role_id.Value = role_id_usr;
                    cmd.Parameters.Add(role_id);
                }
                if (branche_id_usr == null)
                {
                    cmd.Parameters.AddWithValue("branche_id_", OracleString.Null);
                }
                else
                {
                    OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                    branche_id.Direction = ParameterDirection.Input;
                    branche_id.Value = branche_id_usr;
                    cmd.Parameters.Add(branche_id);
                }
                //Nullable<int> brnchs_user_id = UserModel.CurrentUserId;
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
                        UserModel theUser = new UserModel();
                        theUser.Id = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theUser.Login = Table.Rows[i]["LOGIN"].ToString();
                        theUser.Created_At =Table.Rows[i]["CREATED_AT"].ToString();
                        theUser.Update_At = Table.Rows[i]["UPDATED_AT"].ToString();
                        theUser.Name = Table.Rows[i]["NAME"].ToString();
                        theUser.Role_Id = Convert.ToInt32(Table.Rows[i]["ROLE_ID"].ToString());
                        theUser.Role_name = Table.Rows[i]["ROLE_NAME"].ToString();
                        theUser.BrancheID = Convert.ToInt32(Table.Rows[i]["BRANCHE_ID"].ToString());
                        theUser.Branche_name = Table.Rows[i]["BRANCHE_S_NAME"].ToString();
                        User.Insert(i, theUser);
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
            return User;
        }
          
        //создание пользователя
        public void CreateUser(UserModel User)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.FN_USER_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter login_user = new OracleParameter("login_user_", OracleType.VarChar);
                OracleParameter name_user = new OracleParameter("name_user_", OracleType.VarChar);
                OracleParameter role_id = new OracleParameter("role_id_", OracleType.Int32);
                OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);

                login_user.Direction = ParameterDirection.Input;
                name_user.Direction = ParameterDirection.Input;
                role_id.Direction = ParameterDirection.Input;
                branche_id.Direction = ParameterDirection.Input;

                login_user.Value = User.Login;
                name_user.Value = User.Name;
                role_id.Value = User.Role_Id;
                branche_id.Value = User.BrancheID;

                cmd.Parameters.Add(login_user);
                cmd.Parameters.Add(name_user);
                cmd.Parameters.Add(role_id);
                cmd.Parameters.Add(branche_id);

                cmd.Parameters.Add("RES", OracleType.Int32);
                cmd.Parameters["RES"].Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();

                int id_user = (int)cmd.Parameters["RES"].Value;


                cmd = new OracleCommand("PKG_WEB.PR_USER_BRANCHE_ADD", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter ba_user_id = new OracleParameter("user_id_", OracleType.Int32);
                OracleParameter ba_branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                ba_user_id.Direction = ParameterDirection.Input;
                ba_branche_id.Direction = ParameterDirection.Input;
                ba_user_id.Value = id_user;
                ba_branche_id.Value = User.BrancheID;
                cmd.Parameters.Add(ba_user_id);
                cmd.Parameters.Add(ba_branche_id);
                cmd.ExecuteNonQuery();
                
                List<ActionModel> ActionsRole = (new RoleModel().FindByID(User.Role_Id)).ActionsRole;
                foreach(ActionModel item in ActionsRole)
                {
                    cmd = new OracleCommand("PKG_WEB.PR_USER_ACTION_ADD", Connection.Connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    OracleParameter aa_user_id = new OracleParameter("user_id_", OracleType.Int32);
                    OracleParameter aa_action_id = new OracleParameter("action_id_", OracleType.Int32);
                    aa_user_id.Direction = ParameterDirection.Input;
                    aa_action_id.Direction = ParameterDirection.Input;
                    aa_user_id.Value = id_user;
                    aa_action_id.Value = item.ID;
                    cmd.Parameters.Add(aa_user_id);
                    cmd.Parameters.Add(aa_action_id);
                    cmd.ExecuteNonQuery();
                }
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

        //Редактирование пользователя
        public void EditUser(UserModel User, string str_actions_id_add_, string str_actions_id_del_, string str_branches_id_add_, string str_branches_id_del_, string str_types_id_add_, string str_types_id_del_)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                try
                {
                    OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_UPDATE", Connection.Connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    OracleParameter id_user = new OracleParameter("id_user_", OracleType.Int32);
                    OracleParameter name_user = new OracleParameter("name_user_", OracleType.VarChar);
                    OracleParameter login_user = new OracleParameter("login_user_", OracleType.VarChar);
                    OracleParameter id_role = new OracleParameter("id_role_", OracleType.Int32);
                    OracleParameter id_branche = new OracleParameter("id_branche_", OracleType.Int32);

                    id_user.Direction = ParameterDirection.Input;
                    name_user.Direction = ParameterDirection.Input;
                    login_user.Direction = ParameterDirection.Input;
                    id_role.Direction = ParameterDirection.Input;
                    id_branche.Direction = ParameterDirection.Input;

                    id_user.Value = User.Id;
                    name_user.Value = User.Name;
                    login_user.Value = User.Login;
                    id_role.Value = User.Role_Id;
                    id_branche.Value = User.BrancheID;

                    cmd.Parameters.Add(id_user);
                    cmd.Parameters.Add(name_user);
                    cmd.Parameters.Add(login_user);
                    cmd.Parameters.Add(id_role);
                    cmd.Parameters.Add(id_branche);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }

                //Добавление прав
                string[] split;
                if (str_actions_id_add_.Length > 0 && str_actions_id_del_.Length > 0)
                {
                    split = (str_actions_id_add_.Trim(new Char[] { ',' })).Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        if (str_actions_id_del_.Replace("," + s, "") != str_actions_id_del_)
                        {
                            str_actions_id_del_ = str_actions_id_del_.Replace("," + s, "");
                            str_actions_id_add_ = str_actions_id_add_.Replace("," + s, "");
                        }
                    }
                    split = null;
                }

                str_actions_id_add_ = str_actions_id_add_.Replace("|", "");
                str_actions_id_del_ = str_actions_id_del_.Replace("|", "");
                if (str_actions_id_add_.Length > 0)
                {
                    str_actions_id_add_ = str_actions_id_add_.Trim(new Char[] { ',' });
                    split = str_actions_id_add_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_ACTION_ADD", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter action_id = new OracleParameter("action_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        action_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        action_id.Value = s;
                        cmd.Parameters.Add(user_id);
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
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_ACTION_DEL", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter action_id = new OracleParameter("action_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        action_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        action_id.Value = s;
                        cmd.Parameters.Add(user_id);
                        cmd.Parameters.Add(action_id);
                        cmd.ExecuteNonQuery();
                    }
                }

                //Добавление филиалов
                split = null;
                if (str_branches_id_add_.Length > 0 && str_branches_id_del_.Length > 0)
                {
                    split = (str_branches_id_add_.Trim(new Char[] { ',' })).Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        if (str_branches_id_del_.Replace("," + s, "") != str_branches_id_del_)
                        {
                            str_branches_id_del_ = str_branches_id_del_.Replace("," + s, "");
                            str_branches_id_add_ = str_branches_id_add_.Replace("," + s, "");
                        }
                    }
                    split = null;
                }

                str_branches_id_add_ = str_branches_id_add_.Replace("|", "");
                str_branches_id_del_ = str_branches_id_del_.Replace("|", "");
                if (str_branches_id_add_.Length > 0)
                {
                    str_branches_id_add_ = str_branches_id_add_.Trim(new Char[] { ',' });
                    split = str_branches_id_add_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_BRANCHE_ADD", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        branche_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        branche_id.Value = s;
                        cmd.Parameters.Add(user_id);
                        cmd.Parameters.Add(branche_id);
                        cmd.ExecuteNonQuery();
                    }
                    split = null;
                }

                if (str_branches_id_del_.Length > 0)
                {
                    str_branches_id_del_ = str_branches_id_del_.Trim(new Char[] { ',' });
                    split = str_branches_id_del_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_BRANCHE_DEL", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter branche_id = new OracleParameter("branche_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        branche_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        branche_id.Value = s;
                        cmd.Parameters.Add(user_id);
                        cmd.Parameters.Add(branche_id);
                        cmd.ExecuteNonQuery();
                    }
                }

                //Добавление типов
                split = null;
                if (str_types_id_add_.Length > 0 && str_types_id_del_.Length > 0)
                {
                    split = (str_types_id_add_.Trim(new Char[] { ',' })).Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        if (str_types_id_del_.Replace("," + s, "") != str_types_id_del_)
                        {
                            str_types_id_del_ = str_types_id_del_.Replace("," + s, "");
                            str_types_id_add_ = str_types_id_add_.Replace("," + s, "");
                        }
                    }
                    split = null;
                }

                str_types_id_add_ = str_types_id_add_.Replace("|", "");
                str_types_id_del_ = str_types_id_del_.Replace("|", "");
                if (str_types_id_add_.Length > 0)
                {
                    str_types_id_add_ = str_types_id_add_.Trim(new Char[] { ',' });
                    split = str_types_id_add_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_TYPE_ADD", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter type_id = new OracleParameter("type_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        type_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        type_id.Value = s;
                        cmd.Parameters.Add(user_id);
                        cmd.Parameters.Add(type_id);
                        cmd.ExecuteNonQuery();
                    }
                    split = null;
                }

                if (str_types_id_del_.Length > 0)
                {
                    str_types_id_del_ = str_types_id_del_.Trim(new Char[] { ',' });
                    split = str_types_id_del_.Split(new Char[] { ',' });
                    foreach (string s in split)
                    {
                        OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_TYPE_DEL", Connection.Connection);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        OracleParameter user_id = new OracleParameter("user_id_", OracleType.Int32);
                        OracleParameter type_id = new OracleParameter("type_id_", OracleType.Int32);
                        user_id.Direction = ParameterDirection.Input;
                        type_id.Direction = ParameterDirection.Input;
                        user_id.Value = User.Id;
                        type_id.Value = s;
                        cmd.Parameters.Add(user_id);
                        cmd.Parameters.Add(type_id);
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

        public void DeleteUser(UserModel User)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_USER_DELETE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_user = new OracleParameter("id_user_", OracleType.Int32);
                id_user.Direction = ParameterDirection.Input;
                id_user.Value = User.Id;
                cmd.Parameters.Add(id_user);
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
    
    //класс Ldap аутентификации
    public class LdapAuthentication
    {
        private string _path;
        private string _filterAttribute;

        public LdapAuthentication(string path)
        {
            _path = path;
        }

        public bool IsAuthenticated(string domain, string username, string pwd)
        {
            username = username.Trim().ToLower();
            string domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path,
                                                       domainAndUsername,
                                                         pwd);

            try
            {
                // Bind to the native AdsObject to force authentication.
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return false;
                }
                // Update the new path to the user in the directory
                _path = result.Path;
                _filterAttribute = (String)result.Properties["cn"][0];
            }
            catch 
            {
                throw new Exception("Ошибка авторизации: Пользователь неизвестен или неверно введен пароль.");
            }
            return true;
        }

        public string GetGroups()
        {
            DirectorySearcher search = new DirectorySearcher(_path);
            search.Filter = "(cn=" + _filterAttribute + ")";
            search.PropertiesToLoad.Add("memberOf");
            StringBuilder groupNames = new StringBuilder();
            try
            {
                SearchResult result = search.FindOne();
                int propertyCount = result.Properties["memberOf"].Count;
                String dn;
                int equalsIndex, commaIndex;

                for (int propertyCounter = 0; propertyCounter < propertyCount;
                     propertyCounter++)
                {
                    dn = (String)result.Properties["memberOf"][propertyCounter];

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if (-1 == equalsIndex)
                    {
                        return null;
                    }
                    groupNames.Append(dn.Substring((equalsIndex + 1),
                                      (commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error obtaining group names. " +
                  ex.Message);
            }
            return groupNames.ToString();
        }
    }
}