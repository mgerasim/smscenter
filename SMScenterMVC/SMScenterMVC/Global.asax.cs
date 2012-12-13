/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-17   R0012       Герасимов           Роли
 * 2012-06-16   R0047       Герасимов           Отложенная отправка
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using SMScenterMVC.Models;

namespace SMScenterMVC
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    

    public class MvcApplication : System.Web.HttpApplication
    {
        
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        public static void AddSuperAdmin()
        {
            if (!Roles.RoleExists(Constants.ROLE_SUPERADMIN))
                Roles.CreateRole(Constants.ROLE_SUPERADMIN);

            if (!Roles.IsUserInRole("superadmin", Constants.ROLE_SUPERADMIN))
                Roles.AddUserToRole("superadmin", Constants.ROLE_SUPERADMIN);
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            ModelBinders.Binders.Add(typeof(DateTime), new Models.DateTimeModelBinder());

        }
    }
}