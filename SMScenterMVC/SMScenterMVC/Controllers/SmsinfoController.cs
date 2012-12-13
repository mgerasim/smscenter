/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-06-22   R0050       Герасимов           Создание файла
 * 2012-08-23   R0054       Герасимов           АРМ SMS: удаление информации и разделов
 * 2012-09-13   R0060       Книжник             АРМ SMS: разделение по филиалам
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Controllers
{
    public class SmsinfoController : Controller
    {
        //
        // GET: /Smsinfo/

        public ActionResult Index()
        {
            return View();
        }

        //
        // POST: /Smsinfo/
        [HttpPost]
        public ActionResult Index(FormCollection collection)
        {
            if (!AccessActions.IsAccess("SmsInfo::Index"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                string smsnumber = collection["Smsnumber"];
                string smsmsg = collection["Msg"];

                SmsModel.SendSms(smsnumber, smsmsg);

                return View();
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }


        public ActionResult Edit()
        {
            List<SmsinfomsgModel> model = (new SmsinfomsgModel()).FindAll("1=2");
            return View(model);
        }

        public ActionResult Stat()
        {
            List<SmsinfomsgModel> model = (new SmsinfomsgModel()).FindAll();
            return View(model);
        }
        

        public ActionResult SmsinfomsgCreate()
        {

            SmsinfosprModel theSpr = new SmsinfosprModel();

            ViewBag.SprList = theSpr.FindAllAsSelectList();
            return PartialView("SmsinfomsgCreate");
        }

        //
        // POST: /Abonents/Create

        [HttpPost]
        public ActionResult SmsinfomsgCreate(FormCollection collection)
        {
            try
            {
                SmsinfomsgModel theMsg = new SmsinfomsgModel();

                theMsg.Name = collection["Name"];
                theMsg.Text = collection["Text"];
                theMsg.NewSprName = collection["NewSprName"];
                theMsg.SmsinfosprID = Convert.ToInt32(collection["SmsinfosprID"]);
                
                theMsg.Create();

                return RedirectToAction("Edit");
            }
            catch (Exception ex)
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", ex.Message);
                return RedirectToAction("Error", "User", route);
            }
        }


        public ActionResult SmsinfosprCreate()
        {

            SmsinfosprModel theSpr = new SmsinfosprModel();

            List<SmsinfosprModel> theList= new List<SmsinfosprModel>();
            theSpr.ID = 0;
            theSpr.Name = "        ";
            theList.Add(theSpr);
            
            theList.AddRange(theSpr.FindAllAsSelectList());

            ViewBag.SprList = theList;
            
            return PartialView("SmsinfosprCreate", theSpr);
        }

        //
        // POST: /Abonents/Create

        [HttpPost]
        public ActionResult SmsinfosprCreate(FormCollection collection)
        {
            try
            {
                SmsinfosprModel theSpr = new SmsinfosprModel();

                theSpr.Name = collection["Name"];
                
                theSpr.ParentID = Convert.ToInt32(collection["Smsinfospr.ParentID"]);


                theSpr.Create();

                return RedirectToAction("Edit");
            }
            catch (Exception ex)
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", ex.Message);
                return RedirectToAction("Error", "User", route);
            }
        }

        public ActionResult SmsinfosprEdit(int ID)
        {

            SmsinfosprModel theSpr = new SmsinfosprModel();

            theSpr.FindOne(ID);

            return PartialView("SmsinfosprEdit", theSpr);
        }

        //
        // POST: /Abonents/Create

        [HttpPost]
        public ActionResult SmsinfosprEdit(int ID, FormCollection collection)
        {
            try
            {
                SmsinfosprModel theSpr = new SmsinfosprModel();

                theSpr.FindOne(ID);
                theSpr.Name = collection["Name"];
                
                theSpr.Update();

                return RedirectToAction("Edit");
            }
            catch (Exception ex)
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", ex.Message);
                return RedirectToAction("Error", "User", route);
            }
        }

        public ActionResult SmsinfosprDelete(int ID)
        {

            try 
            {
                SmsinfosprModel theSpr = new SmsinfosprModel();

                theSpr.FindOne(ID);
                theSpr.Delete();

                return RedirectToAction("Edit");
            }
            catch (Exception ex)
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", ex.Message);
                return RedirectToAction("Error", "User", route);
            }

        }


        public ActionResult SmsinfomsgEdit(int id)
        {

            SmsinfosprModel theSpr = new SmsinfosprModel();
                        
            ViewBag.SprList = theSpr.FindAllAsSelectList();

            SmsinfomsgModel theMsg = new SmsinfomsgModel();
            theMsg = theMsg.FindOne(id);

            ViewBag.Title = theMsg.Name;

            return PartialView("_MsgEdit", theMsg);
        }

        //
        // POST: /Abonents/Edit

        [HttpPost]
        public ActionResult SmsinfomsgEdit(int id, FormCollection collection)
        {
            try
            {
                SmsinfomsgModel theMsg = new SmsinfomsgModel();

                theMsg.ID = id;
                theMsg.Name = collection["Name"];
                theMsg.Text = collection["Text"];
                theMsg.NewSprName = collection["NewSprName"];
                theMsg.SmsinfosprID = Convert.ToInt32(collection["SmsinfosprID"]);

                theMsg.Update();

                return RedirectToAction("Edit");
                //return PartialView("SmsinfomsgEdit", theMsg);
            }
            catch (Exception ex)
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", ex.Message);
                return RedirectToAction("Error", "User", route);
            }
        }

        public ActionResult SmsinfomsgDelete(int id)
        {
            SmsinfomsgModel theMsg = new SmsinfomsgModel();
            theMsg = theMsg.FindOne(id);

            theMsg.Delete();

            return RedirectToAction("Edit");
        }

        public ActionResult MsgIndex(int id)
        {
            List<SmsinfomsgModel> theMsgList = new List<SmsinfomsgModel>();
            theMsgList = (new SmsinfomsgModel()).FindAll("SMSINFOSPR_ID=" + id.ToString());
            return PartialView("_EditAll",theMsgList);
        }

        public ActionResult MsgStat(int id)
        {
            List<SmsinfomsgModel> theMsgList = new List<SmsinfomsgModel>();
            theMsgList = (new SmsinfomsgModel()).FindAll("SMSINFOSPR_ID=" + id.ToString());
            return PartialView("_MsgStat", theMsgList);
        }
        

    }
}
