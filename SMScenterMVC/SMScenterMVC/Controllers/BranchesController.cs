/*
 * Дата         Задание     Ответственный       Комментарий 
 * 2012-05-03   R0021       Герасимов           Справочник филиалов
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
    public class BranchesController : Controller
    {
        //
        // GET: /Branches/

        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("Branches::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            List<BrancheModel> model=(new BrancheModel()).FindAll();            
            return View(model);
        }

        //
        // GET: /Branches/Details/5

        public ActionResult Details(int id)
        {
            if (!AccessActions.IsAccess("Branches::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            BrancheModel model = new BrancheModel();
            model.FindOne(id);
            return View(model);
        }

        //
        // GET: /Branches/Create

        public ActionResult Create()
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            return View();
        } 

        //
        // POST: /Branches/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add insert logic here
                BrancheModel model = new BrancheModel();
                model.name_full = collection["name_full"];
                model.name_short = collection["name_short"];
                model.Create();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
        
        //
        // GET: /Branches/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            BrancheModel model = new BrancheModel();
            model.FindOne(id);
            return View(model);
        }

        //
        // POST: /Branches/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add update logic here
                BrancheModel model = new BrancheModel();
                model.ID = id;
                model.name_full = collection["name_full"];
                model.name_short = collection["name_short"];
                model.Update();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
        /*
        //
        // GET: /Branches/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            BrancheModel model = new BrancheModel();
            model.FindOne(id);
            model.Delete();
            return RedirectToAction("Index");
        }

        //
        // POST: /Branches/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (!AccessActions.IsAccess("Branches::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add delete logic here
                BrancheModel model = new BrancheModel();
                model.FindOne(id);
                model.Delete();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        */
    }
}
