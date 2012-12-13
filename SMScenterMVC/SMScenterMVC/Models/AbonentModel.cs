/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-12   R0003       Герасимов           Создание модели
 * 2012-05-02   R0021       Герасимов           Справочник абонентов
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 * 2012-05-15   R0027       Герасимов           Поддержка DBConnection
 * 2012-05-15   R0028       Герасимов           Валидация
 * 2012-05-21   R0031       Герасимов           Ошибка валидации на уникальность при редактировании модели Абонент
 * 2012-05-21   R0032       Толшин              Исправление всех запросов на хранимые процедуры
 * 2012-11-19   R0063       Михаил Герасимов    Возможность редактировать филиал для абонента
 * 2012-11-21   R0064       Михаил Герасимов    Добавление поля email
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel.DataAnnotations;
using SMScenterMVC.Utils;
using System.Web.Mvc;
using System.Data.OracleClient;

namespace SMScenterMVC.Models
{
    public class AbonentModel
    {
        public int ID { get; set; }
        [Display(Name = "Имя")]
        [Required(ErrorMessage = "* введите Имя")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "* длина Имени должна быть не менее чем 3 и не более чем 20 символов")]
        [Editable(true)]
        public string Name { get; set; }
        [Required(ErrorMessage = "* введите Телефон")]
        [StringLength(11, MinimumLength = 11,ErrorMessage = "* номер Телефона должен состоять из 11-ти символов")]
        [RegularExpression(@"^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$", ErrorMessage = "* неверный формат номера.")]
        [Editable(true)]
        [Display(Name = "Телефон")]
        public virtual string Phone { get; set; }
        [Required(ErrorMessage = "* введите Должность")]
        [Display(Name = "Должность")]
        public string Description { get; set; }
        [Display(Name = "Пользователь")]
        public string UserName { get; set; }
        //public int UserID { get; set; }
        
        public string Branche { get; set; }
        [Display(Name = "Филиал")]
        public int BranchID { get; set; }

        [Display(Name = "Электронный адрес")]
        public string Email { get; set; }

        public List<AbonentModel> FindByGroupID(int GroupID)
        {
            AbonentRepository _repo = new AbonentRepository();
            return _repo.Abonents(null,null,null,GroupID);
        }

        public List<AbonentModel> Abonents()
        {
            AbonentRepository _repo = new AbonentRepository();
            return _repo.Abonents();
        }
        
        public void Update()
        {
            AbonentRepository _repo = new AbonentRepository();
            _repo.Update(this);
        }

        public AbonentModel FindOne(int ID)
        {
            AbonentRepository _repo = new AbonentRepository();
            List<AbonentModel> theAbonents = _repo.Abonents(ID);
            this.ID = theAbonents[0].ID;
            this.Name = theAbonents[0].Name;
            this.Phone = theAbonents[0].Phone;
            this.Description = theAbonents[0].Description;
            this.Branche = theAbonents[0].Branche;
            this.UserName = theAbonents[0].UserName;
            this.BranchID = theAbonents[0].BranchID;
            this.Email = theAbonents[0].Email;
            return this;
        }

        public List<AbonentModel> FindByPhone(string Phone)
        {
            AbonentRepository _repo = new AbonentRepository();
            List<AbonentModel> theAbonents = _repo.Abonents(null,null,Phone);
           
            return theAbonents;
        }

        public List<AbonentModel> FindByPhoneAndID(int ID,string Phone)
        {
            AbonentRepository _repo = new AbonentRepository();
            List<AbonentModel> theAbonents = _repo.Abonents(ID, null, Phone);

            return theAbonents;
        }

        public void Create()
        {
            AbonentRepository _repo = new AbonentRepository();
            _repo.Create(this);
        }

        public void Delete()
        {
            AbonentRepository _repo = new AbonentRepository();
            _repo.Delete(this);
        }
    }

    public class NewAbonentModel : AbonentModel
    {
        [Required(ErrorMessage = "* введите Телефон")]
        [StringLength(11, MinimumLength = 11)]
        [RegularExpression(@"^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$", ErrorMessage = "Неверный формат номера.")]
        [Remote("IsAbonentPhone_Available", "Validation")]
        [Editable(true)]
        [Display(Name = "Телефон:")]
        public override string Phone { get; set; }
    }


    public class AbonentRepository
    {
        public List<AbonentModel> Abonents(Nullable<int> id_abon = null, string nm_abonent = null, string phn_abonent = null, Nullable<int> gr_abonent = null, Nullable<int> id_usr = null, string ord_by = null)
        {
            List<AbonentModel> Abonent = new List<AbonentModel>();
            DBConnection conn = new DBConnection();
            try
            {             
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GET_ABONENTS", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                if (id_abon == null)
                {
                    cmd.Parameters.AddWithValue("id_abonent_", OracleString.Null);
                }
                else
                {
                    OracleParameter id_abonent = new OracleParameter("id_abonent_", OracleType.Int32);
                    id_abonent.Direction = ParameterDirection.Input;
                    id_abonent.Value = id_abon;
                    cmd.Parameters.Add(id_abonent);
                }
                if (nm_abonent == null)
                {
                    cmd.Parameters.AddWithValue("name_abonent_", OracleString.Null);
                }
                else 
                {
                    OracleParameter name_abonent = new OracleParameter("name_abonent_", OracleType.VarChar);
                    name_abonent.Direction = ParameterDirection.Input;
                    name_abonent.Value = nm_abonent;
                    cmd.Parameters.Add(name_abonent);
                }
                if (phn_abonent == null)
                {
                    cmd.Parameters.AddWithValue("phone_abonent_", OracleString.Null);
                }
                else
                {
                    OracleParameter phone_abonent = new OracleParameter("phone_abonent_", OracleType.VarChar);
                    phone_abonent.Direction = ParameterDirection.Input;
                    phone_abonent.Value = phn_abonent;
                    cmd.Parameters.Add(phone_abonent);
                }
                if (gr_abonent == null)
                {
                    cmd.Parameters.AddWithValue("group_abonent_", OracleString.Null);
                }
                else
                {
                    OracleParameter group_abonent = new OracleParameter("group_abonent_", OracleType.Int32);
                    group_abonent.Direction = ParameterDirection.Input;
                    group_abonent.Value = gr_abonent;
                    cmd.Parameters.Add(group_abonent);
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
                        AbonentModel theAbonentModel = new AbonentModel();
                        theAbonentModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                        theAbonentModel.Name = Table.Rows[i]["NAME"].ToString();
                        theAbonentModel.Phone = Table.Rows[i]["PHONE"].ToString();
                        theAbonentModel.Description = Table.Rows[i]["Description"].ToString();
                        theAbonentModel.Branche = Table.Rows[i]["BRANCHE_NAME"].ToString();
                        theAbonentModel.UserName = Table.Rows[i]["USER_NAME"].ToString();                        
                        theAbonentModel.BranchID = (Convert.ToInt32(Table.Rows[i]["BRANCHE_ID"].ToString()));
                        theAbonentModel.Email = Table.Rows[i]["EMAIL"].ToString();                    
                        Abonent.Insert(i, theAbonentModel);
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
            return Abonent;
        }

        public void Create(AbonentModel theAbonent)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ABONENT_CREATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter name_abonent = new OracleParameter("name_abonent_", OracleType.VarChar);
                OracleParameter phone_abonent = new OracleParameter("phone_abonent_", OracleType.VarChar);
                OracleParameter description = new OracleParameter("description_", OracleType.VarChar);
                OracleParameter email = new OracleParameter("email_", OracleType.VarChar);
                OracleParameter id_creater = new OracleParameter("id_creater_", OracleType.Int32);

                name_abonent.Direction = ParameterDirection.Input;
                phone_abonent.Direction = ParameterDirection.Input;
                description.Direction = ParameterDirection.Input;
                email.Direction = ParameterDirection.Input;
                id_creater.Direction = ParameterDirection.Input;

                name_abonent.Value = theAbonent.Name;
                phone_abonent.Value = theAbonent.Phone;
                description.Value = theAbonent.Description;
                if (theAbonent.Email.Length == 0)
                {
                    email.Value = OracleString.Null;
                }
                else
                {
                    email.Value = theAbonent.Email;
                }
                id_creater.Value = UserModel.CurrentUserId;

                cmd.Parameters.Add(name_abonent);
                cmd.Parameters.Add(phone_abonent);
                cmd.Parameters.Add(description);
                cmd.Parameters.Add(email);
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


        public void Update(AbonentModel theAbonent)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ABONENT_UPDATE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_abonent = new OracleParameter("id_abonent_", OracleType.Int32);
                OracleParameter name_abonent = new OracleParameter("name_abonent_", OracleType.VarChar);
                OracleParameter phone_abonent = new OracleParameter("phone_abonent_", OracleType.VarChar);
                OracleParameter description = new OracleParameter("description_", OracleType.VarChar);
                OracleParameter email = new OracleParameter("email_", OracleType.VarChar);
                OracleParameter id_branche = new OracleParameter("branch_id_", OracleType.Int32);
                OracleParameter id_updater = new OracleParameter("id_updater_", OracleType.Int32);

                id_abonent.Direction = ParameterDirection.Input;
                name_abonent.Direction = ParameterDirection.Input;
                phone_abonent.Direction = ParameterDirection.Input;
                description.Direction = ParameterDirection.Input;
                email.Direction = ParameterDirection.Input;
                id_branche.Direction = ParameterDirection.Input;
                id_updater.Direction = ParameterDirection.Input;

                id_abonent.Value = theAbonent.ID;
                name_abonent.Value = theAbonent.Name;
                phone_abonent.Value = theAbonent.Phone;
                description.Value = theAbonent.Description;
                email.Value = theAbonent.Email;
                id_branche.Value = theAbonent.BranchID;
                id_updater.Value = UserModel.CurrentUserId;

                cmd.Parameters.Add(id_abonent);
                cmd.Parameters.Add(name_abonent);
                cmd.Parameters.Add(phone_abonent);
                cmd.Parameters.Add(description);
                cmd.Parameters.Add(email);
                cmd.Parameters.Add(id_branche);
                cmd.Parameters.Add(id_updater);
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

        public void Delete(AbonentModel theAbonent)
        {
            DBConnection Connection = new DBConnection();
            try
            {                
                Connection.Open();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_ABONENT_DELETE", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_abonent = new OracleParameter("id_abonent_", OracleType.Int32);
                id_abonent.Direction = ParameterDirection.Input;
                id_abonent.Value = theAbonent.ID;
                cmd.Parameters.Add(id_abonent);
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