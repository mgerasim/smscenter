using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Controllers
{
    public class UserWishesController : Controller
    {
        //
        // GET: /UserWishes/

        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("UserWishes::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            UserWishesModel Wish = new UserWishesModel();
            return View(Wish.ListUserWishes());
        }

        //
        // GET: /UserWishes/Details/5

        public ActionResult Details(int id)
        {
            if (!AccessActions.IsAccess("UserWishes::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            UserWishesModel Wish = new UserWishesModel();
            return View(Wish.DetailWish(id));
        }

        //
        // GET: /UserWishes/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /UserWishes/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /UserWishes/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /UserWishes/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /UserWishes/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /UserWishes/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
