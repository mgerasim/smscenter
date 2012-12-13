using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SingleSenderWeb.Models;
using System.Data;
using System.Data.OracleClient;

namespace SingleSenderWeb.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public string Error;
        public ActionResult Index()
        {
            ViewData["Message"] = "Добро пожаловать в ASP.NET MVC!";

            ViewData["Error"] = Error;

            List<SelectListItem> items = new List<SelectListItem>();
            items.Add(new SelectListItem
            {
                Text = "Swimming",
                Value = "1"
            });
            items.Add(new SelectListItem
            {
                Text = "Cycling",
                Value = "2",
                Selected = true
            });
            items.Add(new SelectListItem
            {
                Text = "Running",
                Value = "3"
            });


            /*
            
            ViewData["items"] = new[] {
                new SelectListItem
                {
                                                             Text = "Один",
                                                             Value = "1"
                }, 
                new SelectListItem
                {
                                                             Text = "Два",
                                                             Value = "2"
                }, 
                new SelectListItem
                {
                                                             Text = "Три",
                                                             Value = "3"
                } 
            
            };*/

            ViewData["items"] = (new TypeRepository()).AsSelectList(0);
            
            /*
            var model = new SelectTypeModel();

            model.ID = "0";
            model.List = (new TypeRepository()).AsSelectList(0);

            */

            return View();
        }

        public ActionResult Send()
        {
            OracleConnection Connection = new OracleConnection("Data Source=SMSRTKDV; User ID=smscenter; Password=zaq12wsx");
            Connection.Open();

            OracleDataAdapter DataAdapter = new OracleDataAdapter();
            OracleCommand Command = new OracleCommand();
            Command.Connection = Connection;
            Command.CommandText = "PKG_SMS.add";
            Command.CommandType = System.Data.CommandType.StoredProcedure;
            
            OracleTransaction Transaction;
            Transaction = Connection.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
            Command.Transaction = Transaction;

            OracleParameter param = new OracleParameter("RETURN_VALUE", OracleType.Int32);
            param.Direction = ParameterDirection.ReturnValue;
            Command.Parameters.Add(param);

            OracleParameter p_phone = new OracleParameter("phone_", OracleType.VarChar, 255);
            p_phone.Direction =  ParameterDirection.Input;
            p_phone.Value = Request["message.Phone"];
            Command.Parameters.Add(p_phone);

            OracleParameter p_text = new OracleParameter("text_", OracleType.VarChar, 255);
            p_text.Direction = ParameterDirection.Input;
            p_text.Value = Request["message.Message"];
            Command.Parameters.Add(p_text);


            try
            {
                //Command.ExecuteScalar();
                Command.ExecuteNonQuery();
                Transaction.Commit();

            }

            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;
                Transaction.Rollback();
                return View();
            }
           

            return RedirectToAction("About");
        }

        public ActionResult About()
        {
            
            return View();
        }


       
    }
}
