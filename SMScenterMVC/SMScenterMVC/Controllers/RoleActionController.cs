using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using SMScenterMVC.Utils;

namespace SMScenterMVC.Controllers
{
    public class RoleActionController : Controller
    {
        //
        // GET: /RoleAction/

        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("RoleAction::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "нет Доступа!!!");
                return RedirectToAction("Error", "User", route);
            }
            List<RoleModel> model = (new RoleModel()).FindAll();
            return View(model);
        }

        //
        // GET: /RoleAction/IndexActions

        public ActionResult IndexActions()
        {
            if (!AccessActions.IsAccess("RoleAction::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            List<ActionModel> model = (new ActionModel()).FindAll();
            return View("IndexActions", model);
        }

        //
        // GET: /RoleAction/Details/5

        public PartialViewResult Details(int RoleID)
        {
            if (!AccessActions.IsAccess("RoleAction::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            RoleModel Role = new RoleModel();
            Role = Role.FindByID(Convert.ToInt32(RoleID));
            ViewData["r_id"] = Role.ID;
            ViewData["r_name"] = Role.Name;
            ViewData["r_description"] = Role.Description;
            ViewData["r_update_at"] = Role.Update_at;
            ViewData["r_updater"] = Role.UserName;
            return PartialView("_RoleDetail", Role.Actions());
        }

        //
        // GET: /RoleAction/Create

        public PartialViewResult CreateRole()
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            RoleModel theRole = new RoleModel();
            try
            {
                theRole.UserId = UserModel.CurrentUserId;
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }

            return PartialView("_RoleCreate", theRole);
        }  

        //
        // POST: /RoleAction/Create

        [HttpPost]
        public ActionResult CreateRole(FormCollection collection)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                RoleModel theRole = new RoleModel();
                theRole.Name = collection["Name"];
                theRole.Description = collection["Description"];
                theRole.Create();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return RedirectToAction("Index");
            }
        }

        //
        // GET: /RoleAction/Create

        public PartialViewResult CreateAction()
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            ActionModel theAction = new ActionModel();
            return PartialView("_ActionCreate", theAction);
        }

        //
        // POST: /RoleAction/Create

        [HttpPost]
        public ActionResult CreateAction(FormCollection collection)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                ActionModel theAction = new ActionModel();
                theAction.Name = collection["Name"];
                theAction.Description = collection["Description"];
                theAction.Create();
                return RedirectToAction("IndexActions");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return RedirectToAction("IndexActions");
            }
        }

        //
        // GET: /RoleAction/EditRole/5

        public PartialViewResult EditRoleIndex(int RoleID)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            RoleModel Role = new RoleModel();
            Role = Role.FindByID(RoleID);
            ViewBag.RoleActions = Role.Actions();
            ViewBag.AllActions = Role.ActionsAll();

            return PartialView("_RoleEdit", Role);
        }
        
        //
        // POST: /RoleAction/Edit/5

        [HttpPost]
        public ActionResult EditRole(string rl_act_add, string rl_act_del, FormCollection collection)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                RoleModel theRole = new RoleModel();
                theRole.ID = Convert.ToInt32(collection["ID"]);
                theRole.Name = collection["Name"];
                theRole.Description = collection["Description"];
                //theRole.UserId = UserModel.CurrentUserId;
                theRole.Update(collection["rl_act_add"], collection["rl_act_del"]);
                //theRole.Update(rl_act_add, rl_act_del);
 
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return RedirectToAction("Index");
            }
        }

        //
        // POST: /RoleAction/DeleteRole/5

        //[HttpPost]
        public ActionResult DeleteRole(int id)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add delete logic here
                RoleModel theRole = new RoleModel();
                theRole.FindByID(id);
                theRole.Delete();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Index");
            }
        }


        //
        // POST: /RoleAction/DeleteAction/5

        public ActionResult DeleteAction(int id)
        {
            if (!AccessActions.IsAccess("RoleAction::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add delete logic here
                ActionModel theAction = new ActionModel();
                theAction.FindByID(id);
                theAction.Delete();
                return RedirectToAction("IndexActions");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("IndexActions");
            }
        }
    }
}
