using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Mvc.Ajax;
using System.Text;

namespace SMScenterMVC.Helpers
{
    public static class Paging
    {
        public static MvcHtmlString PagingNavigator(this AjaxHelper helper, string sms_date_from, string sms_date_to, string sms_phone, string sms_text, int pageNum, int itemsCount, int pagesSize, string loadElmId)
        {
            StringBuilder sb = new StringBuilder();
            if (pageNum > 0)
            {
                sb.Append(helper.ActionLink("<Назад", "ShowStatSingle", new { sms_date_from = sms_date_from, sms_date_to = sms_date_to, sms_phone = sms_phone, sms_text = sms_text, itemsCount = itemsCount, pageNum = pageNum - 1, pagesSize = pagesSize }, new AjaxOptions
                                {
                                    HttpMethod = "POST",
                                    InsertionMode = InsertionMode.Replace,
                                    UpdateTargetId = "searchResult",
                                    LoadingElementId = loadElmId
                                }));
            }
            else
            {
                sb.Append(HttpUtility.HtmlEncode("<Назад"));
            }
            sb.Append(" - ");

            int pagesCount = (int)Math.Ceiling((double)itemsCount / pagesSize);
            //int pagesCount = Math.Ceiling itemsCount / pagesSize;

            if (pageNum < pagesCount - 1)
            {
                sb.Append(helper.ActionLink("Вперед>", "ShowStatSingle", new { sms_date_from = sms_date_from, sms_date_to = sms_date_to, sms_phone = sms_phone, sms_text = sms_text, itemsCount = itemsCount, pageNum = pageNum + 1, pagesSize = pagesSize }, new AjaxOptions
                                {
                                    HttpMethod = "POST",
                                    InsertionMode = InsertionMode.Replace,
                                    UpdateTargetId = "searchResult",
                                    LoadingElementId = loadElmId
                                }));
            }
            else
            {
                sb.Append(HttpUtility.HtmlEncode("Вперед>"));
            }
            return MvcHtmlString.Create(sb.ToString());
        }
    }
}