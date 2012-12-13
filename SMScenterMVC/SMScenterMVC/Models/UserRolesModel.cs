/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-05-02   R0011       Книжник
 * 2012-05-14   R0027       Герасимов           Разделение на актуальную и отладочную версию
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Models
{
    /*//Модель пользовательские роли
    public class UserRolesModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        //получение списка ролей
        public List<UserRolesModel> ListRoles()
        {
            RoleRepository _model = new RoleRepository();
            return _model.Roles();
        }
        public UserRolesModel FindByID(int ID)
        {
           RoleRepository _rolerep = new RoleRepository();
           UserRolesModel _role = _rolerep.FindByID(ID);
           this.ID = _role.ID;
           this.Name = _role.Name;
           this.Description = _role.Description;
           return this;
        }

    }
    
    //получение списка ролей
    public class RoleRepository
    {
        public List<UserRolesModel> Roles()
        {
            List<UserRolesModel> ListRoles = new List<UserRolesModel>();
            DBConnection DBconnect = new DBConnection();
            string Query = "select * from user_roles";
            DataTable Table = new DataTable();
            try
            {
                DBconnect.Open();
                DBconnect.ExecQuerySelect(Query, ref Table);

                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    UserRolesModel role = new UserRolesModel();
                    role.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                    role.Name = Table.Rows[i]["NAME"].ToString();
                    role.Description = Table.Rows[i]["DESCRIPTION"].ToString();
                    ListRoles.Insert(i, role);

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                DBconnect.Close();
            }
            return ListRoles;
        }

        public UserRolesModel FindByID(int ID)
        {
            UserRolesModel role = new UserRolesModel();
            DBConnection DBconnect = new DBConnection();
            try
            {
                
                DataTable Table = new DataTable();
                string Query = string.Format("select * from user_roles where ID = {0}",ID);
                DBconnect.Open();
                DBconnect.ExecQuerySelect(Query, ref Table);
                if (Table.Rows.Count==1)
                {
                    role.ID = Convert.ToInt32(Table.Rows[0]["ID"].ToString());
                    role.Name = Table.Rows[0]["NAME"].ToString();
                    role.Description = Table.Rows[0]["DESCRIPTION"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                DBconnect.Close();
            }
            return role;
        }

    }*/
}