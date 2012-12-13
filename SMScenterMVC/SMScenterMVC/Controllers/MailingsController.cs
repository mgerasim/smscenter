/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-09   R0003       Герасимов           Создание действия для создания задания
 * 2012-04-09   R0001       Толшин              Создание двух переменных типа cookie для хранения параметров выборки - дата "С" и дата "ПО"
 * 2012-04-09   R0003       Герасимов           Поддержка выбора стпавочника
 * 2012-04-13   R0006       Герасимов           Авторизация
 * 2012-04-13   R0007       Герасимов           Поддержка справочника при создании рассылки
 * 2012-09-12   R0059       Герасимов           Статистика отправки сообщений
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using System.Data.OracleClient;
using System.Data;
using System.Threading;
using SMScenterMVC.Utils;
using SMScenterMVC.Helpers;

namespace SMScenterMVC.Controllers
{
    
    public class MailingsController : Controller
    {

        //private int pageSize = 10;
        /*public HttpCookie cookie_tsk_date_from = new HttpCookie("c_tsk_dt_fr");
        public HttpCookie cookie_tsk_date_to = new HttpCookie("c_tsk_dt_to");*/

        //
        public PartialViewResult ShowStat(string tsk_date_from, string tsk_date_to)
        {
            if (!AccessActions.IsAccess("Mailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            Nullable<int> User_ID = null;
            if (!AccessActions.IsAccess("Mailings::Read::All"))
            {
                User_ID = UserModel.CurrentUserId;
            }
            List<StatMailing> _mailings = (new StatMailingRepository()).StatMailings(null, User_ID, tsk_date_from, tsk_date_to, UserModel.CurrentUserId);

            //Thread.Sleep(2000);
            /*
            HttpCookie cookie_tsk_date_from = Request.Cookies["c_tsk_dt_fr"];
            HttpCookie cookie_tsk_date_to = Request.Cookies["c_tsk_dt_to"];

            if (cookie_tsk_date_from.Value != tsk_date_from)
            {
                cookie_tsk_date_from.Value = tsk_date_from;
//                System.Web.HttpContext.Current.Response.Cookies.Add(cookie_tsk_date_from);
                Response.Cookies.Add(cookie_tsk_date_from);
            }
            if (cookie_tsk_date_to.Value != tsk_date_to)
            {
                cookie_tsk_date_to.Value = tsk_date_to;
                Response.Cookies.Add(cookie_tsk_date_to);
            }*/
            return PartialView("_StatResault", _mailings);
        }


        //
        // GET: /Mailings/
        //
        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("Mailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }

            ViewBag.DateFrom = DateTime.Now.AddDays(-1).ToString("dd.MM.yyyy");
            ViewBag.DateTo = DateTime.Now.ToString("dd.MM.yyyy");

            /*//ViewBag.States = (new TypeRepository()).AsSelectList(0);
            //if (System.Web.HttpContext.Current.Request.Cookies["c_tsk_dt_fr"] == null)
            if (Request.Cookies["c_tsk_dt_fr"] == null)
            {
                HttpCookie cookie_tsk_date_from = new HttpCookie("c_tsk_dt_fr");
                HttpCookie cookie_tsk_date_to = new HttpCookie("c_tsk_dt_to");
                //cookie_tsk_date_from.Value = DateTime.Now.AddDays(-1).ToShortDateString();
                cookie_tsk_date_from.Value = DateTime.Now.AddDays(-1).ToString("dd.MM.yyyy");
                cookie_tsk_date_to.Value = DateTime.Now.ToString("dd.MM.yyyy");
                cookie_tsk_date_from.Expires = DateTime.Now.AddDays(1);
                cookie_tsk_date_to.Expires = DateTime.Now.AddDays(1);
                //System.Web.HttpContext.Current.Response.Cookies.Add(cookie_tsk_date_from);
                Response.Cookies.Add(cookie_tsk_date_from);
                Response.Cookies.Add(cookie_tsk_date_to);
            }*/

            return View();
        }


        [HttpPost]
        public PartialViewResult ShowStatSingle(FormCollection collection, string sms_date_from, string sms_date_to, string sms_phone = "", string sms_text = "", int itemsCount = 0, int pageNum = 0, int pagesSize = 10)
        {
            if (!AccessActions.IsAccess("SingleMailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }

            Nullable<int> User_ID = null;
            if (!AccessActions.IsAccess("SingleMailings::Read::All"))
            {
                User_ID = UserModel.CurrentUserId;
            }
            ViewData["PageNum"] = pageNum;
            ViewData["PageSize"] = pagesSize;
            ViewData["DateFrom"] = sms_date_from;
            ViewData["DateTo"] = sms_date_to;
            ViewData["Phone"] = sms_phone;
            ViewData["Text"] = sms_text;
            if (itemsCount > 0)
            {
                ViewData["ItemsCount"] = itemsCount;
            }
            else
            {
                ViewData["ItemsCount"] = (new StatSingleMailingRepository()).StatMailings(sms_text, sms_phone, null, sms_date_from, sms_date_to, User_ID, null, null).Count();
            }

            List<StatSingleMailing> _mailings = (new StatSingleMailingRepository()).StatMailings(sms_text, sms_phone, null, sms_date_from, sms_date_to, User_ID, pagesSize * pageNum, (pagesSize * pageNum) + pagesSize);
            return PartialView("_StatSingleResault", _mailings);
        }
        
        //
        // GET: /Mailings/
        //
        public ActionResult IndexSingle()
        {
            if (!AccessActions.IsAccess("SingleMailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }

            ViewData["DateFrom"] = DateTime.Now.AddDays(-1).ToString("dd.MM.yyyy");
            ViewData["DateTo"] = DateTime.Now.ToString("dd.MM.yyyy");
            return View("IndexSingle");
        }


        //
        // GET: /Mailings/Details/5
        /*
        public ActionResult Details(int id)
        {
            List<DetailMailing> _mailing_detail = (new StatMailingRepository()).Details(id); 
            return View(_mailing_detail);
        }
        */
        //
        public PartialViewResult Details(int id)
        {
            if (!AccessActions.IsAccess("Mailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            List<DetailMailing> _mailing_detail = (new StatMailingRepository()).Details(id);
            //Thread.Sleep(2000);
            ViewBag.ElmId = id.ToString();
            return PartialView("_Details",_mailing_detail);
        }
        //
        // GET: /Mailings/Details_empty/
        public PartialViewResult Details_empty(int id)
        {
            if (!AccessActions.IsAccess("Mailings::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            ViewBag.ElmId = id;
            return PartialView("_Details_empty");
        }

        //
        public ActionResult MailingNew()
        {
            if (!AccessActions.IsAccess("Mailings::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
//            TypeModel type = new TypeRepository();
            ViewBag.Types = (new TypeModel()).FindAll();
            ViewBag.Groups = (new GroupModel()).FindAll();
            //ViewBag.NameRndm = "Задача №"+TypeRepository.LastTaskId();
            StatMailing model = new StatMailing();
            model.Name_task = "Задание №" + TypeRepository.LastTaskId();
            return View(model);
        }
        //
        [HttpPost]
        public ActionResult MailingNew(SMScenterMVC.Models.StatMailing theStatMailing)
        {
            if (!AccessActions.IsAccess("Mailings::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                SMScenterMVC.Models.TypeRepository _repository = new TypeRepository();
                ViewBag.Types = _repository.Types();
                ViewBag.Groups = (new GroupModel()).FindAll();
                theStatMailing.Save();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
        //
        public PartialViewResult Abonents(string GroupID)
        {
            if (!AccessActions.IsAccess("Mailings::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            GroupModel Group = new GroupModel();
            Group = Group.FindOne(Convert.ToInt32(GroupID));
            ViewBag.ID = GroupID;
            return PartialView("_Abonets", Group.Abonents());            
        }

        public PartialViewResult Abonents_empty(string GroupID)
        {
            if (!AccessActions.IsAccess("Mailings::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            ViewBag.ElmId = GroupID;
            return PartialView("_Abonets_empty");
        }
        //
        public ActionResult Stat()
        {
            StatisticaModel theStat = new StatisticaModel();
            theStat.Load();

            ViewBag.theStat = theStat;
            ViewBag.TotalDay    =   theStat.SendedDay + theStat.FailedDay;
            ViewBag.TotalWeek   =   theStat.SendedWeek + theStat.FailedWeek;
            ViewBag.TotalMonth = theStat.SendedMonth + theStat.FailedMonth;
            ViewBag.QueueCount = theStat.QueueCount;
            return View();
        }

    }
}
