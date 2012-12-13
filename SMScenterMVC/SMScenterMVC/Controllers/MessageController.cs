using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Utils;
using System.Data.OracleClient;
using System.Data;

namespace SMScenterMVC.Controllers
{
    public class MessageController : Controller
    {
        //
        // GET: /Message/

        public ActionResult Create(string phone, string text)
        {
            DBConnection conn = new DBConnection();
            string strText = text;
            try
            {             
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_SMS.add", conn.Connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                OracleParameter phone_ = new OracleParameter("phone_", OracleType.VarChar);
                phone_.Direction = ParameterDirection.Input;
                phone_.Value = phone;
                OracleParameter text_ = new OracleParameter("text_", OracleType.VarChar);
                text_.Direction = ParameterDirection.Input;
                text_.Value = text;

                cmd.Parameters.Add(phone_);
                cmd.Parameters.Add(text_);
                cmd.Parameters.AddWithValue("priority_", OracleNumber.Null);

                OracleParameter prm3 = new OracleParameter("dv", OracleType.Number);
                prm3.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(prm3);

                cmd.ExecuteNonQuery();

                strText = prm3.Value.ToString();
            

            }
            catch (Exception ex)
            {
                strText = ex.Message.ToString();
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }

            ViewBag.Text = strText;
            return View();
        }

    }
}
