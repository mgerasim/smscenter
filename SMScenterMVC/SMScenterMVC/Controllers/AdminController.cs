/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-11   R0004       Книжник             Создание Админки
 * 2012-04-13   R0006       Герасимов           Авторизация
 * 2012-04-16   R0010       Герасимов           Добавление user_id при создании рассылки
 * 2012-04-17   R0012       Герасимов           Роли
 * 2012-04-20   R0016       Герасимов           Сохранение роли пользователя в куки
 * 2012-05-02   R0011       Книжник
 * 2012-05-03   R0021       Герасимов           Изменение функции UserModel.CurrentUserId на static
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using System.Web.Security;
using System.Web.Routing;

namespace SMScenterMVC.Controllers
{
    public class AdminController : Controller
    {

        protected override void Initialize(RequestContext requestContext)
        {

            base.Initialize(requestContext);
        }

        //
        // GET: /Admin/
        
        
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            try{
                UserModel Auth = new UserModel();
                int UserID = Auth.Authentication(model.UserName,model.Password);
                if (UserID > 0)
                {
                    UserModel theUser = (new UserRepository()).Users(null,model.UserName)[0];
                    FormsAuthentication.SetAuthCookie(model.UserName + "|" + UserID.ToString() + "|" + theUser.Role_Id.ToString(), true);                    
                                   

                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            
            return View();          
                       
        }

        
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();

            System.Web.HttpContext.Current.Response.Cookies["userrole"].Value = "0";
            return RedirectToAction("LogOn", "Admin");
        }

        
       /*
        //Редактирование пользователя
        public ActionResult EditUser(int id)
        {
            UserModel User = new UserModel();
            User.FindByID(id);
            EditUserModel EditUser = new EditUserModel();
            EditUser.Login = User.Login;
            EditUser.Name = User.Name;
            EditUser.RoleID = User.Role_Id;
            ListUserRoles ListRoles = new ListUserRoles();
            ViewBag.Roles = ListRoles.Roles();
            return View(EditUser);
        }
        [HttpPost]
        public ActionResult EditUser()
        {
  //          UserModel user = new UserModel();
            
        
  //          user.Edit(model);
            return RedirectToAction("ShowUsers", "Admin");
        }
        */
    }
}
