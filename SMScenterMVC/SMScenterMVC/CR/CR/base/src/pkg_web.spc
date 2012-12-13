create or replace package PKG_WEB is

  -- Author  : H02-TURUSHEVNA
  -- Created : 20.02.2012 15:18:28
  -- Purpose : Пакет для Web интерфейса.

  -- Public type declarations
  --type <TypeName> is <Datatype>;
   type ref_cursor is ref cursor;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations

  --Процедура для выбора заданий
  procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to_ in date,user_id_ in number,branches_user_id_ in number,t_list out ref_cursor);
  ------------------------------------------------
  --Процедура для выбора сообщений задания
  procedure pr_get_messages(id_task_ in number,s_list out ref_cursor);
   --Процедура для выбора сообщений задания
--  procedure pr_get_messages_search(text_ varchar2, phone_ varchar2, task_type_ in number,date_from_ in date,date_to_ in date,user_id_ in number,branches_user_id_ in number,t_list out ref_cursor);
  procedure pr_get_messages_search(text_ varchar2, phone_ varchar2, task_type_ in number,date_from_ in date,date_to_ in date,user_id_ in number,branches_user_id_ in number, rownum_from_ in number, rownum_to_ in number,t_list out ref_cursor);
 
---------------------------------------------------------------------------
  --Функция создания задачи
    --параметры:
            --name_ имя задачи
            --type_ тип задачи:
              --1-Служебная,2-Рекламная,3-Сервисная
            --Возвращает идентификатор задачи.
  function add_task(name_ varchar2, type_ number,user_id_ number) return number;

---------------------------------------------------------------------------
  --Функция вставки sms на отправку, в рамках определённой задачи
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --task_id - идентификатор задачи
            --возвращает иденитификатор sms
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number,user_id_ number) return number;
---------------------------------------------------------------------------
  --Функция вставки sms на отправку
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --возвращает иденитификатор sms
  function add(phone_ varchar2,text_ varchar2,user_id_ number) return number;
---------------------------------------------------------------------------
  --Функция проверки статуса sms
    --параметры:
            --sms_id_ идентификатор sms
            --возвращает статус смс в текстовом виде:
              --Создана, Выполняется, Завершена, Ошибка
  function chk(sms_id_ number) return varchar2;
  
  
------------------------------------------------------
-- Набор процедур для управления типами заданий
------------------------------------------------------
------------------------------------------------------
-- Процедура выборки типов
procedure pr_types_get(id_type_ in number, name_type_ in varchar2, priority_type_ in number, description_type_ in varchar2, types_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor);
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------  
  
------------------------------------------------------
-- Набор процедур для управления Группами
------------------------------------------------------
-- Процедура для выборки групп
procedure pr_group_get(id_group_ in number, name_group_ in varchar2, branche_id_ in number, user_id_ in number, order_by_ in varchar2, branches_user_id_ in number, t_list out ref_cursor);
------------------------------------------------------  
--Процедура для создания группы
procedure pr_group_create(group_name_ in varchar2, creater_id_ in number);
-- Процедура редактирования группы
procedure pr_group_update(id_group_ in number, name_group_ in varchar2, id_updater_ in number);
-- Процедура удаления группы
procedure pr_group_delete(id_group_ in number);
-- Процедура создания связи группа - абонент
procedure pr_group_abonent_add(group_id_ in number, abonent_id_ in number);
-- Процедура удаления связи группа - абонент
procedure pr_group_abonent_del(group_id_ in number, abonent_id_ in number);
------------------------------------------------------  
------------------------------------------------------  
------------------------------------------------------  

------------------------------------------------------
-- Набор процедур для управления Филиалами
------------------------------------------------------
------------------------------------------------------
-- Процедура для выборки филиалов
--procedure pr_branche_get(id_branche_ in number, name_branche_ in varchar2, s_name_branche_ in varchar2, order_by_ in varchar2, t_list out ref_cursor);
procedure pr_branche_get(id_branche_ in number, name_branche_ in varchar2, s_name_branche_ in varchar2, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor);
--Процедура для создания филиала
procedure pr_branche_create(name_branche_ in varchar2, s_name_branche_ in varchar2);
-- Процедура редактирования филиала
procedure pr_branche_update(id_branche_ in number, name_branche_ in varchar2, s_name_branche_ in varchar2);
-- Процедура удаления филиала
--procedure pr_branche_delete(id_branche_ in number);
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


------------------------------------------------------
-- Процедура для выборки пожеланий пользователей
procedure pr_user_wishes_get(id_wishes_ in number, text_wishes_ in VARCHAR2, text_len_ in number, user_id_ in number, create_at_ in date, branche_id_ in number, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor );
--Процедура для создания пожелания
procedure pr_add_wish(user_id_ in number, user_msg_ in varchar2);
------------------------------------------------------

------------------------------------------------------
-- Набор процедур для управления Абонентами
------------------------------------------------------
-- Процедура для выборки абонентов
procedure pr_get_abonents(id_abonent_ in number, name_abonent_ in varchar2, phone_abonent_ in varchar2, group_abonent_ in number, order_by_ in varchar2, id_user_ in number, branches_user_id_ in number, t_list out ref_cursor);
-- Процедура создания абонента
procedure pr_abonent_create(name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, id_creater_ in number);
-- Процедура редактирования абонента
procedure pr_abonent_update(id_abonent_ in number, name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, id_updater_ in number);
-- Процедура удаления абонента
procedure pr_abonent_delete(id_abonent_ in number);
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

------------------------------------------------------
-- Набор процедур для управления Ролями и Action'ами
------------------------------------------------------
-- Процедура выборки ролей
procedure pr_roles_get(id_role_ in number, name_role_ in varchar2, description_role_ in varchar2, id_user_ in number, order_by_ in varchar2, t_list out ref_cursor);
-- Процедура создания роли
procedure pr_role_create(name_role_ in varchar2, description_role_ in varchar2, id_creater_ in number);
-- Процедура редактирования роли
procedure pr_role_update(id_role_ in number, name_role_ in varchar2, description_role_ in varchar2, id_updater_ in number);
-- Процедура удаления роли
procedure pr_role_delete(id_role_ in number);
-- Процедура создания связи action - роль
procedure pr_role_action_add(role_id_ in number, action_id_ in number);
-- Процедура удаления связи action - роль
procedure pr_role_action_del(role_id_ in number, action_id_ in number);
------------------------------------------------------
------------------------------------------------------
-- Процедура выборки action'ов
procedure pr_actions_get(id_role_ in number, id_action_ in number, name_action_ in varchar2, description_action_ in varchar2, order_by_ in varchar2, t_list out ref_cursor);
-- Процедура создания action'а
procedure pr_action_create(name_action_ in varchar2, description_action_ in varchar2);
-- Процедура удаления action'а
procedure pr_action_delete(id_action_ in number);
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

------------------------------------------------------
-- Набор инструментов для управления Пользователями
------------------------------------------------------
-- Процедура для выборки пользователей
procedure pr_user_get(id_user_ in number, login_user_ in varchar2, is_del_ in number, name_user_ in varchar2, role_id_ in number, branche_id_ in number, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor);
-- Функция создания пользователя
--procedure pr_user_create(login_user_ in varchar2, name_user_ in varchar2, role_id_ in number, branche_id_ in number);
function fn_user_create(login_user_ in varchar2, name_user_ in varchar2, role_id_ in number, branche_id_ in number) return number;
-- Процедура редактирования пользователя
procedure pr_user_update(id_user_ in number, name_user_ in varchar2, login_user_ in varchar2, id_role_ in number, id_branche_ in number);
-- Процедура удаления пользователя
procedure pr_user_delete(id_user_ in number);
------------------------------------------------------
-- Процедура выборки action'ов пользователя
procedure pr_user_actions_get(id_user_ in number, id_action_ in number, name_action_ in varchar2, description_action_ in varchar2, order_by_ in varchar2, t_list out ref_cursor);
-- Процедура создания связи action - user
procedure pr_user_action_add(user_id_ in number, action_id_ in number);
-- Процедура удаления связи action - user
procedure pr_user_action_del(user_id_ in number, action_id_ in number);
------------------------------------------------------
-- Функция проверки права пользователя
function fn_user_action_access(id_user_ in number, name_action_ in varchar2) return number;
------------------------------------------------------
-- Процедура выборки филиалов пользователя
procedure pr_user_branches_get(id_user_ in number, id_branche_ in number, name_brahcne_ in varchar2, s_name_brahcne_ in varchar2, order_by_ in varchar2, t_list out ref_cursor);
-- Процедура создания связи user - branche
procedure pr_user_branche_add(user_id_ in number, branche_id_ in number);
-- Процедура удаления связи user - branche
procedure pr_user_branche_del(user_id_ in number, branche_id_ in number);
-- Процедура выборки типов пользователя
procedure pr_user_types_get(id_user_ in number, id_type_ in number, name_type_ in varchar2, priority_type_ in number, description_type_ in varchar2, order_by_ in varchar2, t_list out ref_cursor);
-- Процедура создания связи тип - user
procedure pr_user_type_add(user_id_ in number, type_id_ in number);
-- Процедура удаления связи тип - user
procedure pr_user_type_del(user_id_ in number, type_id_ in number);
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
end PKG_WEB;
/

