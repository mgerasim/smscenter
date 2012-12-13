using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMScenterMVC.Models;
using System.Data.OracleClient;
using System.Data;

namespace SMScenterMVC.Utils
{
    public class AccessActions
    {
        public static bool IsAccess(string ActionName) 
        {            
            return IsAccessDB(UserModel.CurrentUserId, ActionName);
        }

        protected static bool IsAccessDB(int UserId, string ActionName)
        {
            DBConnection Connection = new DBConnection();
            bool is_access = false;
            try
            {
                Connection.Open();
                OracleCommand cmd = new OracleCommand("pkg_web.fn_user_action_access", Connection.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter id_user = new OracleParameter("id_user_", OracleType.Int32);
                OracleParameter name_action = new OracleParameter("name_action_", OracleType.VarChar);
                id_user.Direction = ParameterDirection.Input;
                name_action.Direction = ParameterDirection.Input;
                id_user.Value = UserId;
                name_action.Value = ActionName;
                cmd.Parameters.Add(id_user);
                cmd.Parameters.Add(name_action);
                cmd.Parameters.Add("RES", OracleType.Int32);
                cmd.Parameters["RES"].Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                if ((int)cmd.Parameters["RES"].Value > 0)
                    is_access = true;
                else
                    is_access = false;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }

            return is_access;
        }
    }
}