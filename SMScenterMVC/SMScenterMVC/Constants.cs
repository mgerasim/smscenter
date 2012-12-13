/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-04-17   R0012       Герасимов           Роли
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMScenterMVC
{
    public static class Constants
    {
        public const string ROLE_SUPERADMIN = "Супер администратор";
        public const string ROLE_ADMIN = "Администратор филиала";
        public const string ROLE_USER = "Пользователь филиала";

        public const int PAGER_LINKS_PER_PAGE = 15;
        public const int PAGER_NUMBER_OF_VISIBLE_LINKS = 5;
    }
}