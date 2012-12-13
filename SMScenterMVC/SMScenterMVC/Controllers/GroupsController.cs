/*
 * Дата         Задание     Ответственный       Комментарий 
 * 2012-05-03   R0022       Герасимов           Удаление группы из справочника
 * 2012-05-27   R0027       Герасимов           Поддержка DBConnection
 * 2012-11-28   R0066       Михаил Герасимов    Возможность редактировать филиал для группы
 * 2012-12-07   R0069       Михаил Герасимов    Ошибка при редактировании группы. Терялась ссылка на филиал
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
    public class GroupsController : Controller
    {
        //
        // GET: /Groups/

        public ActionResult Index()
        {
            if (!AccessActions.IsAccess("Groups::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            List<GroupModel> model = (new GroupModel()).FindAll();
            return View(model);
        }

        //
        // GET: /Groups/Details/5

        public PartialViewResult Details(int GroupID)
        {
            if (!AccessActions.IsAccess("Groups::Read"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            GroupModel Group = new GroupModel();
            Group = Group.FindOne(Convert.ToInt32(GroupID));
            ViewBag.ID = GroupID;
            ViewBag.NameGr = Group.Name;
            return PartialView("_Abonents", Group.Abonents());
        }

        //
        // GET: /Groups/Create

        public PartialViewResult Create()
        {
            if (!AccessActions.IsAccess("Groups::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }

            GroupModel theGroup = new GroupModel();
            try
            {
                theGroup.User = (new UserModel()).FindByID(UserModel.CurrentUserId);
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }

            return PartialView("_GroupCreate");
        } 

        //
        // POST: /Groups/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            if (!AccessActions.IsAccess("Groups::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                GroupModel theGroup = new GroupModel();
                theGroup.Name = collection["Name"];
                theGroup.BranchID = Convert.ToInt32(collection["BranchID"]);
                theGroup.Create();
                return RedirectToAction("Index");
            }
            catch
            {
                //return View("Index");
                return RedirectToAction("Index");
            }
        }

        
        //
        // GET: /Groups/Edit/5

        public PartialViewResult EditIndex(int GroupID)
        {
            if (!AccessActions.IsAccess("Groups::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                ViewBag.Error = "Нет доступа!";
                return PartialView("_Error");
            }
            
            GroupModel Group = new GroupModel();
            Group = Group.FindOne(GroupID);
            
            ViewBag.GroupAbonents = Group.Abonents();
            ViewBag.AllAbonents = Group.AbonentsAll();
            BrancheModel branch = new BrancheModel();
            ViewBag.AllBranches = branch.FindAll();
            return PartialView("_AbonentsGroupEdit", Group);
        }

        public ActionResult Edit(FormCollection collection)
        {
            if (!AccessActions.IsAccess("Groups::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                GroupModel theGroup = new GroupModel();
                theGroup.ID = Convert.ToInt32(collection["ID"]);
                theGroup.Name = collection["Name"];
                theGroup.BranchID = Convert.ToInt32(collection["BranchID"]);
                if (theGroup.BranchID == 0)
                {
                    UserModel theUser = new UserModel();
                    theGroup.BranchID = theUser.FindByID(UserModel.CurrentUserId).BrancheID;
                }
                theGroup.Update(collection["gr_abon_add"], collection["gr_abon_del"]);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return RedirectToAction("Index");
            }
        }

        //
        // GET: /Groups/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (!AccessActions.IsAccess("Groups::Write"))
            {
                System.Web.Routing.RouteValueDictionary route = new System.Web.Routing.RouteValueDictionary();
                route.Add("err", "Нет доступа!");
                return RedirectToAction("Error", "User", route);
            }
            try
            {
                // TODO: Add delete logic here
                GroupModel theGroup = new GroupModel();
                theGroup.FindOne(id);
                theGroup.Delete();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Index");
            }
        }
    }
}
