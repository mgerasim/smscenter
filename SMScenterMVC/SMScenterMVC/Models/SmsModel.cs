using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SMScenterMVC.Models
{
    public class SmsModel
    {
        [Display(Name = "Номер абонента:")]
        [Required(ErrorMessage = "* укажите номер абонента")]
        public string Smsnumber { get; set; }

        [Display(Name = "Отправляемый текст сообщения:")]
        [Required(ErrorMessage = "* выберите отправляемую информацию")]
        public string Msg { get; set; }

        
        static public void SendSms(string smsnumber, string smsmsg)
        {
            StatMailing theMailing = new StatMailing();

            theMailing.Name_task = "ARMSMS_" + smsnumber;
            theMailing.Msg = smsmsg;
            theMailing.SmsList = smsnumber;
            theMailing.TypeID = 3; // 3 - Уведомления

            theMailing.Save();

            return;
        }
    }
}