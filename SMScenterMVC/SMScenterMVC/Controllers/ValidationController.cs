/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-05-16   R0028       Герасимов           Валидация Абонента
 * 2012-05-16   R0029       Герасимов           Валидация Пользователя
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using System.Globalization;

namespace SMScenterMVC.Controllers
{
    public class ValidationController : Controller
    {
        public JsonResult IsAbonentPhone_Available(string Phone)
        {
            AbonentModel theAbonents = new AbonentModel();
            if (theAbonents.FindByPhone(Phone).Count > 0)
            {
                string suggestedUID = String.Format(CultureInfo.InvariantCulture,
                "* абонент с номером {0} уже существует.", Phone);
                return Json(suggestedUID, JsonRequestBehavior.AllowGet);
            }

            return Json(true, JsonRequestBehavior.AllowGet);

        }

        public JsonResult IsUserLogin_Available(string Login)
        {
            UserModel theUser = new UserModel();
            theUser = theUser.FindByLogin(Login);
            if (theUser != null)
            {
                if (theUser.Id > 0)
                {
                    string suggestedUID = String.Format(CultureInfo.InvariantCulture,
                    "Пользователь {0} уже существует.", Login);
                    return Json(suggestedUID, JsonRequestBehavior.AllowGet);
                }
            }

            return Json(true, JsonRequestBehavior.AllowGet);

        }
    }
}
