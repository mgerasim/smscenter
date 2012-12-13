using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        
        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("User::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            UserModel theUser = new UserModel();
            return View(theUser.ListUsers());
        }

               // GET: /User/Create

        public ActionResult Create()
        {
            if (!AccessActions.IsAccess("User::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            RoleModel role = new RoleModel();
            BrancheModel branch = new BrancheModel();
            //заполнение списка ролей
            ViewBag.Roles = role.FindAll();
            //Заполнение списка филиалов
            ViewBag.Branches = branch.FindAll();
            return View();
        } 

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            if (!AccessActions.IsAccess("User::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                UserModel user = new UserModel();
                user.Login = collection["Login"];
                user.Name = collection["Name"];
                user.Role_Id = Convert.ToInt32(collection["Role_Id"]);
                user.BrancheID = Convert.ToInt32(collection["BrancheID"]);
                user.Create();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /User/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (!AccessActions.IsAccess("User::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            UserModel user = new UserModel();
            RoleModel role = new RoleModel();
            BrancheModel branch = new BrancheModel();
            ActionModel action = new ActionModel();
            TypeModel type = new TypeModel();
            //заполнение списка ролей
            ViewBag.Roles = role.FindAll();
            //Заполнение списка филиалов
            ViewBag.AllBranches = branch.FindAll();
            ViewBag.UserBranches = branch.UserBranches(id);
            ViewBag.UserActions = action.UserActions(id);
            ViewBag.AllActions = action.FindAll();
            ViewBag.UserTypes = type.UserTypes(id);
            ViewBag.AllTypes = type.FindAll();
            user.FindByID(id);
            ViewBag.UsName = user.Name;
            return View(user);
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            if (!AccessActions.IsAccess("User::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                UserModel user = new UserModel();
                user.Id = id;
                user.Login = collection["Login"];
                user.Name = collection["Name"];
                user.Role_Id = Convert.ToInt32(collection["Role_Id"]);
                user.BrancheID = Convert.ToInt32(collection["BrancheID"]);
                user.Edit(collection["us_actn_add"], collection["us_actn_del"], collection["us_brnch_add"], collection["us_brnch_del"], collection["us_type_add"], collection["us_type_del"]);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /User/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (!AccessActions.IsAccess("User::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "��� �������!");
                return RedirectToAction("Error", "User", route);
            }
            UserModel user = new UserModel();
            user.FindByID(id);
            user.Delete();
            return RedirectToAction("Index");
        }

        //
        // POST: /User/Delete/5
    
      /*  [HttpPost]
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
        }*/

        public ActionResult Error(string err)
        {
            ViewBag.Error = err;
            return View();
        } 
    }
}
