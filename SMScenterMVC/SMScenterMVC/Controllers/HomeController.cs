/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-06-07   R0040       Герасимов           Создание модели
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMScenterMVC.Models;
using System.Threading;

namespace SMScenterMVC.Controllers
{
    public class HomeController : Controller
    {

        /*public PartialViewResult ShowStat() 
        {
            Thread.Sleep(2000);
            StatParam mailing = new StatParam();
            return PartialView("_ViewPage1", mailing);
        }*/

        public ActionResult Index()
        {
            ViewBag.UserRoleID = "1";
            ViewBag.Message = "Добро пожаловать на веб-ресурс \"SMS-центр!\"";

            var model = new StatMailing()
            {
                Name_task = "JJJ",
                Id_task = "1234"
            };

            return View(model);
        }

        public ActionResult About()
        {
            List<SupportModel> model = (new SupportModel()).Supports();
            return View(model);
        }

        [HttpGet]
        public ActionResult ContactUs()
        {
            if (Request.IsAjaxRequest())
            {
                return PartialView("_ContactUs");
            }

            return View();
        }

        [HttpPost]
        public ActionResult ContactUs(ContactUsInput input)
        {
            // Validate the model being submitted
            if (!ModelState.IsValid)
            {
                // If the incoming request is an Ajax Request
                // then we just return a partial view (snippet) of HTML
                // instead of the full page
                if (Request.IsAjaxRequest())
                    return PartialView("_ContactUs", input);

                return View(input);
            }

            // TODO: A real app would send some sort of email here

            if (Request.IsAjaxRequest())
            {
                // Same idea as above
                ContactUsInput contact = new ContactUsInput();
                contact.Create(UserModel.CurrentUserId, input.Message);
                return PartialView("_ThanksForFeedback", input);
            }

            // A standard (non-Ajax) HTTP Post came in
            // set TempData and redirect the user back to the Home page
            //TempData["Message"] = string.Format("Thanks for the feedback, {0}! We will contact you shortly.", input.Name);
            TempData["Message"] = string.Format("Сообщение отправлено! Мы постараемся оперативно ответить на Ваш вопрос.");
            return RedirectToAction("Index");
        }
    }
}
