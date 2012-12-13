/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-05-03   R0021       Герасимов           Справочник абонентов
 * 2012-05-21   R0031       Герасимов           Поддержка модели NewAbonentModel при создании
 * 2012-11-19   R0063       Михаил Герасимов    Возможность редактировать филиал для абонента
 * 2012-11-21   R0064       Михаил Герасимов    Добавление поля email
 * 2012-12-05   R0067       Михаил Герасимов    Ошибка при редактировании абонента
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
    public class AbonentsController : Controller
    {
        //
        // GET: /Abonents/
        
        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("Abonents::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!"); //Add Parameter
                //route.Add("descr", "Закатай губу, доступа к этой форме не имеешь доступа"); //Add Parameter
                return RedirectToAction("Error", "User", route);
            }
                List<AbonentModel> model = (new AbonentModel()).Abonents();
                return View(model);
        }
    
        //
        // GET: /Abonents/Details/5

        public ActionResult Details(int id)
        {
            if (!AccessActions.IsAccess("Abonents::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            AbonentModel theAbonent = new AbonentModel();
            theAbonent.FindOne(id);
            return View(theAbonent);
        }

        //
        // GET: /Abonents/Create

        public ActionResult Create()
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            NewAbonentModel theAbonent = new NewAbonentModel();
            return View(theAbonent);
        } 

        //
        // POST: /Abonents/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add insert logic here
                AbonentModel theAbonent = new AbonentModel();

                //theAbonent.ID = Convert.ToInt32(collection["ID"]);
                theAbonent.Name = collection["Name"];
                theAbonent.Phone = collection["Phone"];
                theAbonent.Description = collection["Description"];
                theAbonent.Email = collection["Email"];
                
                theAbonent.Create();

                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
        
        //
        // GET: /Abonents/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            AbonentModel theAbonent = new AbonentModel();
            BrancheModel branch = new BrancheModel();
            ViewBag.AllBranches = branch.FindAll();
            return View(theAbonent.FindOne(id));
        }

        //
        // POST: /Abonents/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add update logic here
                AbonentModel theAbonent = new AbonentModel();
                theAbonent.ID = id;
                theAbonent.Name = collection["Name"];
                theAbonent.Phone = collection["Phone"];
                theAbonent.Description = collection["Description"];
                theAbonent.Email = collection["Email"];
                theAbonent.BranchID = Convert.ToInt32(collection["BranchID"]);
                if (theAbonent.BranchID == 0 )
                {
                    UserModel theUser = new UserModel();
                    theAbonent.BranchID = theUser.FindByID(UserModel.CurrentUserId).BrancheID;
                }
                theAbonent.Update();

                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }

        //
        // GET: /Abonents/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            AbonentModel theAbonent = new AbonentModel();
            theAbonent.FindOne(id);
            theAbonent.Delete();
            return RedirectToAction("Index");
        }

        //
        // POST: /Abonents/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (!AccessActions.IsAccess("Abonents::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add delete logic here
                AbonentModel theAbonent = new AbonentModel();
                theAbonent.FindOne(id);
                theAbonent.Delete();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
    }
}
