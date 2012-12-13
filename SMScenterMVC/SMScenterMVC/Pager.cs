using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMScenterMVC
{
    public class Pager
    {
        // Список ссылок на страницы
        protected List<string> links = null;

        // Список ссылок на страницы
        public List<string> Links { get { return links; } }

        // Количество объектов на одной странице
        protected int perPage = Constants.PAGER_LINKS_PER_PAGE;

        // Количество отображаемых страниц перед многоточием
        protected int visible = Constants.PAGER_NUMBER_OF_VISIBLE_LINKS;

        // Конструктор.
        // Параметры: currentPage - номер текущей страницы, totalCount - количество объектов всего (на всех страницах),
        // queryString - полная строка GET-параметров
        public Pager(string currentPage, int totalCount, System.Collections.Specialized.NameValueCollection queryString)
        {
            int iCurrent = 1;
            int.TryParse(currentPage, out iCurrent);
            if (iCurrent < 1) iCurrent = 1;
            links = GetLinks(totalCount, iCurrent, perPage, visible, queryString);
        }

        // Формирование списка ссылок на страницы
        protected List<string> GetLinks(int countItems, int currentPage, int itemsPerPage, int links_visible, System.Collections.Specialized.NameValueCollection query)
        {
            string strQueryString = "?";

            foreach (string key in query.Keys)
            {
                if (key != "page") strQueryString = string.Format("{0}{1}={2}&", strQueryString, key, query[key]);
            }

            int countPages = (int)Math.Ceiling((double)countItems / (double)itemsPerPage);

            List<string> result = new List<string>();

            bool bThreeDots1 = false;
            bool bThreeDots2 = false;

            int links_visible_head = links_visible;
            if (links_visible >= (currentPage - links_visible)) links_visible_head = links_visible * 3 + 1;
            int links_visible_tail = links_visible;
            if ((currentPage + links_visible) >= (countPages - links_visible)) links_visible_tail = links_visible * 3 + 1;

            for (int i = 1; i <= countPages; i++)
            {
                if (i <= links_visible_head
                    || i > (countPages - links_visible_tail)
                    || (i <= currentPage && i >= (currentPage - links_visible))
                    || (i >= currentPage && i <= (currentPage + links_visible)))
                {
                    if (i == currentPage) result.Add(i.ToString());
                    else result.Add(string.Format("<a href='{0}page={1}'>{2}</a>", strQueryString, i, i));
                }
                else
                {
                    if (i < currentPage)
                    {
                        if (!bThreeDots1)
                        {
                            result.Add("...");
                            bThreeDots1 = true;
                        }
                    }
                    else
                    {
                        if (!bThreeDots2)
                        {
                            result.Add("...");
                            bThreeDots2 = true;
                        }
                    }
                }
            }

            return result;
        }
    }
}