create or replace package PKG_WEB is

  -- Author  : H02-TURUSHEVNA
  -- Created : 20.02.2012 15:18:28
  -- Purpose : Пакет для Web интерфейса.
/*
  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-06-18  R0047      Михаил Герасимов  Отложенная отправка
2012-06-21  R0049      Михаил Герасимов  Доступ на установку времени отправки
2012-06-25  R0050      Михаил Герасимов  Вставка шаблонов для сообщений
2012-07-27 	       Толшин К.Е.	 Тест
2012-11-19  R0063      Михаил Герасимов  Возможность редактировать филиал для абонента
2012-11-21  R0064      Михаил Герасимов  Добавление поля email
******************************************************************************/

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
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number,user_id_ number, started_ date:=current_date) return number;
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
procedure pr_abonent_create(name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, email_ in varchar2, id_creater_ in number);
-- Процедура редактирования абонента
procedure pr_abonent_update(id_abonent_ in number, name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, email_ in varchar2, branch_id_ in number, id_updater_ in number);
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
-- Процедура выборки тех поддержки
procedure pr_support_get( t_list out ref_cursor);
------------------------------------------------------
-- Функция установки доступа для пользователя
function fn_set_action_for_user(user_id in number, action_name in varchar2) return number;
------------------------------------------------------
-- Создание шаблона для сообщения
procedure pr_smsinfomsg_create(p_name in varchar2, p_text in varchar2, p_spr_id in number, p_new_spr in varchar2 := null);
------------------------------------------------------
end PKG_WEB;
/
create or replace package body PKG_WEB is

/*
  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-06-18  R0047      Михаил Герасимов  Отложенная отправка
2012-06-21  R0049      Михаил Герасимов  Доступ на установку времени отправки
2012-06-25  R0050      Михаил Герасимов  Вставка шаблонов для сообщений
2012-06-26  R0051      Михаил Герасимов  Изменение функции создания филиала
2012-11-19  R0063      Михаил Герасимов  Возможность редактировать филиал для абонента
2012-11-21  R0064      Михаил Герасимов  Добавление поля email
******************************************************************************/

------------------------------------------------------
-- Процедура для выбора заданий
procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to_ in date,user_id_ in number,branches_user_id_ in number,t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     --если все параметры пустые - значит секция where не нужна
     if date_from_ is null and date_to_ is null
     then
--       sql_:='select * from vi_tasks ';
       raise error_date_period;
     else
     --значит есть параметры
     --диапазон дат должен быть обязательно
       if date_from_ is null or date_to_ is null
         then raise error_date_period;
       else
         sql_:='select * from vi_tasks where 1=1';
         sql_:=sql_||'and trunc(created_at) between ';
         --с датой конечно как-то криво получилось т.к. лепилось всё на скорую руку
         sql_:=sql_||'to_date('''||to_char(date_from_,'ddmmyyyy') ||''',''ddmmyyyy'') ';
         sql_:=sql_||' and ';
         sql_:=sql_||'to_date('''||to_char(date_to_,'ddmmyyyy') ||''',''ddmmyyyy'') ';
           if task_type_ is not null
             then sql_:=sql_||' and type_task_id='||task_type_;
           end if;
           if user_id_ is not null
             then sql_:=sql_||' and user_id='||user_id_;
           end if;
           if branches_user_id_ is not null
             then sql_:=sql_||' and branche_id in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
           end if;
           sql_:=sql_||' order by created_at desc';

         end if;
       end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;

--Обработка исключений
    exception
--      when no_data_found then exit;
      when error_date_period then
        raise_application_error(-pkg_error.ERROR_DATE_PERIOD,'Не задан диапазон дат.');

  end;

------------------------------------------------------
--Процедура для выбора сообщений задания
procedure pr_get_messages(id_task_ in number,s_list out ref_cursor) is
  begin
     open s_list for select * from v_messages where task_id=id_task_ order by name_abonent;
  end;

-- Процедура для поиска сообщений
procedure pr_get_messages_search(text_ varchar2, phone_ varchar2, task_type_ in number,date_from_ in date,date_to_ in date,user_id_ in number,branches_user_id_ in number, rownum_from_ in number, rownum_to_ in number,t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     --если все параметры пустые - значит секция where не нужна
     if date_from_ is null and date_to_ is null
     then
       raise error_date_period;
     else
     --значит есть параметры
     --диапазон дат должен быть обязательно
       if date_from_ is null or date_to_ is null
         then raise error_date_period;
       else
--         sql_:='select * from (select rownum as RN, ID, PHONE, CREATED_AT, UPDATED_AT, STATUS, MESSAGE, USER_NAME, ERROR_ID, BRANCHE_S_NAME, TYPE_TASK from v_messages where 1=1 ';
         sql_:='select c2.RN, c2.ID, c2.PHONE, c2.CREATED_AT, c2.UPDATED_AT, c2.STATUS,
                       c2.MESSAGE, c2.USER_NAME, c2.ERROR_ID, c2.BRANCHE_S_NAME, c2.TYPE_TASK
                from (
                  select rownum rn, c.*
                  from (
                       select *
                       from v_messages where 1=1';
         sql_:=sql_||'and trunc(created_at) between ';
         --с датой конечно как-то криво получилось т.к. лепилось всё на скорую руку
         sql_:=sql_||'to_date('''||to_char(date_from_,'ddmmyyyy') ||''',''ddmmyyyy'') ';
         sql_:=sql_||' and ';
         sql_:=sql_||'to_date('''||to_char(date_to_,'ddmmyyyy') ||''',''ddmmyyyy'') ';
           if text_ is not null
--             then sql_:=sql_||' and MESSAGE like''%'||text_||'%''';
             then sql_:=sql_||' and lower(MESSAGE) like lower(''%'||text_||'%'')';
           end if;

           if phone_ is not null
             then sql_:=sql_||' and phone='''||phone_||'''';
           end if;
           if task_type_ is not null
             then sql_:=sql_||' and type_task_id='||task_type_;
           end if;
           if user_id_ is not null
             then sql_:=sql_||' and user_id='||user_id_;
           end if;
           if branches_user_id_ is not null
             then sql_:=sql_||' and branch_id in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
           end if;
--           sql_:=sql_||' order by created_at desc) where 1=1';
           sql_:=sql_||'order by created_at desc
                       ) c
                     ) c2 where 1=1';

           if rownum_from_ is not null
             then sql_:=sql_||' and c2.rn >'||rownum_from_;
           end if;
           if rownum_to_ is not null
             then sql_:=sql_||' and c2.rn <='||rownum_to_;
           end if;

         end if;
       end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;

--Обработка исключений
    exception
--      when no_data_found then exit;
      when error_date_period then
        raise_application_error(-pkg_error.ERROR_DATE_PERIOD,'Не задан диапазон дат.');

  end;
---------------------------------------------------------------------------
--Функция создания задания
    --параметры:
            --name_ имя задачи
            --type_ тип задачи:
              --1-Служебная,2-Рекламная,3-Сервисная
            --Возвращает идентификатор задачи.
function add_task(name_ varchar2, type_ number,user_id_ number) return number is
  task_id_ number;
  begin
    task_id_:=null;
    task_id_:=pkg_sms.add_task(name_,type_);
    if task_id_ is not null and user_id_ is not null then
       update tasks set user_id=user_id_, branche_id=(select u.branche_id from users u where u.id = user_id_) where id= task_id_;
    end if;
    return task_id_;
  end;

---------------------------------------------------------------------------
--Функция вставки sms на отправку, в рамках определённой задачи
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --task_id - идентификатор задачи
            --возвращает иденитификатор sms
function add_to_task(phone_ varchar2,text_ varchar2,task_id number,user_id_ number, started_ date) return number is
  sms_id_ number;
  begin
    sms_id_:=null;
    -- Call the function
    sms_id_ := pkg_sms.add_to_task(phone_,text_,task_id);
    if sms_id_ is not null and user_id_ is not null then
      update messages set user_id=user_id_ where id=sms_id_;
      update messages set started=started_ where id=sms_id_;
    end if;
  return sms_id_;
  end;

---------------------------------------------------------------------------
  --Функция вставки sms на отправку
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --возвращает иденитификатор sms
  function add(phone_ varchar2,text_ varchar2,user_id_ number) return number is
  sms_id_ number;
  begin
    sms_id_:=null;
    -- Call the function
    sms_id_ := pkg_sms.add(phone_,text_);
    if sms_id_ is not null and user_id_ is not null then
      update messages set user_id=user_id_ where id=sms_id_;
    end if;
  return sms_id_;
  end;
---------------------------------------------------------------------------
  --Функция проверки статуса sms
    --параметры:
            --sms_id_ идентификатор sms
            --возвращает статус смс в текстовом виде:
              --Создана, Выполняется, Завершена, Ошибка
  function chk(sms_id_ number) return varchar2 is
  begin
  return pkg_sms.chk(sms_id_);
  end;


--begin
  -- Initialization
  --<Statement>;

------------------------------------------------------
-- Набор процедур для управления типами заданий
------------------------------------------------------
------------------------------------------------------
-- Процедура выборки типов
procedure pr_types_get(id_type_ in number, name_type_ in varchar2, priority_type_ in number, description_type_ in varchar2, types_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, PRIORITY, DESCRIPTION from type_task where 1=1';
     if id_type_ is not null
        then sql_:=sql_||' and ID='||id_type_;
     end if;
     if name_type_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_type_||'%'')';
     end if;
     if priority_type_ is not null
        then sql_:=sql_||' and PRIORITY='||priority_type_;
     end if;
     if description_type_ is not null
        then sql_:=sql_||' and lower(DESCRIPTION) like lower(''%'||description_type_||'%'')';
     end if;
     if types_user_id_ is not null
        then sql_:=sql_||' and ID in (select t.type_id from user_type_link t where t.user_id='||types_user_id_||')';
     end if;
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


------------------------------------------------------
-- Набор процедур для управления Группами
------------------------------------------------------
------------------------------------------------------
-- Процедура для выборки групп
procedure pr_group_get(id_group_ in number, name_group_ in varchar2, branche_id_ in number, user_id_ in number, order_by_ in varchar2, branches_user_id_ in number, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  user_branch_id number;
  begin
     sql_:='select ID, NAME, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY from groups where 1=1';
     if id_group_ is not null
        then sql_:=sql_||' and ID='||id_group_;
     end if;
     if name_group_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_group_||'%'')';
     end if;
     if branche_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID='||branche_id_;
     end if;
     if user_id_ is not null
        then sql_:=sql_||' and USER_ID='||user_id_;
     end if;
     if branches_user_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
     end if;
     sql_:=sql_||' group by ID, NAME, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
--Процедура для создания группы
procedure pr_group_create(group_name_ in varchar2, creater_id_ in number) is
  begin
       INSERT INTO GROUPS(ID, NAME, BRANCHE_ID, USER_ID) VALUES(s_groups.nextval, group_name_, (select u.branche_id from users u where u.id = creater_id_), creater_id_);
  end;
------------------------------------------------------
-- Процедура редактирования группы
procedure pr_group_update(id_group_ in number, name_group_ in varchar2, id_updater_ in number)
is
  error_some_param_empty exception;
  begin
     if id_group_ is not null and name_group_ is not null and id_updater_ is not null
         then update GROUPS set NAME=name_group_, USER_ID=id_updater_, DATE_MODIFY=SYSDATE WHERE ID=id_group_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления группы
procedure pr_group_delete(id_group_ in number)
is
  error_some_param_empty exception;
  begin
     if id_group_ is not null
         then
         DELETE FROM ABONENT_GROUP_LINK WHERE group_id=id_group_;
         DELETE FROM GROUPS WHERE ID= id_group_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура создания связи группа - абонент
procedure pr_group_abonent_add(group_id_ in number, abonent_id_ in number)
is
  begin
       insert into abonent_group_link(id,group_id,abonent_id) values(s_abonent_group_link.nextval, group_id_, abonent_id_);
  end;
------------------------------------------------------
-- Процедура удаления связи группа - абонент
procedure pr_group_abonent_del(group_id_ in number, abonent_id_ in number)
is
  begin
       delete from abonent_group_link where group_id=group_id_ and abonent_id=abonent_id_;
  end;
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

------------------------------------------------------
-- Набор процедур для управления Филиалами
------------------------------------------------------
------------------------------------------------------
-- Процедура для выборки филиалов
procedure pr_branche_get(id_branche_ in number, name_branche_ in varchar2, s_name_branche_ in varchar2, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  user_branch_id number;
  begin
     sql_:='SELECT ID, S_NAME, NAME FROM BRANCHES where 1=1';
     if id_branche_ is not null
        then sql_:=sql_||' and ID='||id_branche_;
     end if;
     if name_branche_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_branche_||'%'')';
     end if;
     if s_name_branche_ is not null
        then sql_:=sql_||' and lower(S_NAME) like lower(''%'||s_name_branche_||'%'')';
     end if;
     if branches_user_id_ is not null
        then sql_:=sql_||' and ID in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
     end if;
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
--Процедура для создания филиала
procedure pr_branche_create(name_branche_ in varchar2, s_name_branche_ in varchar2) is
  begin
       INSERT INTO BRANCHES(ID, NAME, S_NAME) VALUES(s_branches.nextval, name_branche_, s_name_branche_);
       commit;
  end;
------------------------------------------------------
-- Процедура редактирования филиала
procedure pr_branche_update(id_branche_ in number, name_branche_ in varchar2, s_name_branche_ in varchar2)
is
  error_some_param_empty exception;
  begin
     if id_branche_ is not null and name_branche_ is not null and s_name_branche_ is not null
         then UPDATE BRANCHES SET NAME=name_branche_, S_NAME=s_name_branche_ WHERE ID=id_branche_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления филиала
/*procedure pr_branche_delete(id_branche_ in number)
is
    error_some_param_empty exception;
    brahcne_users_cnt number;
  begin
     if id_branche_ is not null then
        select count(*) into brahcne_users_cnt from users where branche_id = id_branche_;
        if brahcne_users_cnt = 0 then
           DELETE FROM BRANCHES WHERE ID=id_branche_;
           commit;
        end if;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;*/
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


------------------------------------------------------
-- Процедура для выборки пожеланий пользователей
procedure pr_user_wishes_get(id_wishes_ in number, text_wishes_ in VARCHAR2, text_len_ in number, user_id_ in number, create_at_ in date, branche_id_ in number, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor )
is
 sql_ varchar2(4000);
  begin
  sql_:='select ID, ';
     if text_len_ is not null
        then
           sql_:=sql_||' case when length(text)>'|| text_len_ ||' then substr(text,0,' ||text_len_|| ')||''...'' else text end as TEXT, ' ;
        else
           sql_:=sql_||' TEXT, ';
     end if;
     sql_:=sql_||' USER_ID, USER_NAME, BRANCHE_ID, BRANCHE_NAME, CREATE_AT from v_user_wishes where 1=1';

     if id_wishes_ is not null
        then sql_:=sql_||' and ID='||id_wishes_;
     end if;
     if text_wishes_ is not null
        then sql_:=sql_||' and TEXT='||text_wishes_;
     end if;
     if user_id_ is not null
        then sql_:=sql_||' and USER_ID=' || user_id_;
     end if;
     if create_at_ is not null
        then sql_:=sql_||' and CREATED_AT='||create_at_;
     end if;
     if branche_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID='||branche_id_;
     end if;
     if branches_user_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
     end if;
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by CREATE_AT desc';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
  --Процедура для создания пожелания
  procedure pr_add_wish(user_id_ in number, user_msg_ in varchar2) is
  tmp number;
  begin
       if user_id_ is not null and user_msg_ is not null then
          insert into user_wishes (id,text,user_id,branche_id) values(S_USER_WISHES.Nextval, user_msg_, user_id_, (select u.branche_id from users u where u.id = user_id_));
          tmp:=PKG_SMS.add(phone_ => '79098526895', text_ => 'Новое пожелание SMS-Центр: '||user_msg_); -- Коля
          tmp:=PKG_SMS.add(phone_ => '79098421077', text_ => 'Новое пожелание SMS-Центр: '||user_msg_); -- Кирилл
          tmp:=PKG_SMS.add(phone_ => '79242115638', text_ => 'Новое пожелание SMS-Центр: '||user_msg_); -- Владимир
          tmp:=PKG_SMS.add(phone_ => '79241086744', text_ => 'Новое пожелание SMS-Центр: '||user_msg_); -- Миха
          commit;
       end if;
  end;
------------------------------------------------------


------------------------------------------------------
-- Набор процедур для управления Абонентами
------------------------------------------------------
------------------------------------------------------
-- Процедура для выборки абонентов
procedure pr_get_abonents(id_abonent_ in number, name_abonent_ in varchar2, phone_abonent_ in varchar2, group_abonent_ in number, order_by_ in varchar2, id_user_ in number, branches_user_id_ in number, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  user_branch_id number;
  begin
     sql_:='select ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, BRANCHE_NAME, USER_ID, USER_NAME from v_abonents where 1=1';
     if id_abonent_ is not null
        then sql_:=sql_||' and ID='||id_abonent_;
     end if;
     if name_abonent_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_abonent_||'%'')';
     end if;
     if phone_abonent_ is not null
        then sql_:=sql_||' and PHONE like ''%'||phone_abonent_||'%''';
     end if;
     if group_abonent_ is not null
        then sql_:=sql_||' and GROUP_ID='||group_abonent_;
     end if;
     if branches_user_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
     end if;
     sql_:=sql_||' group by ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, BRANCHE_NAME, USER_ID, USER_NAME ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания абонента
procedure pr_abonent_create(name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, email_ in varchar2, id_creater_ in number)
is
  error_some_param_empty exception;
  begin
     if name_abonent_ is not null and phone_abonent_ is not null and description_ is not null and id_creater_ is not null
         then INSERT INTO ABONENTS(ID, NAME, PHONE, DESCRIPTION, EMAIL, BRANCHE_ID, USER_ID, DATE_MODIFY) VALUES(s_abonents.nextval, name_abonent_, phone_abonent_, description_, email_, (select u.branche_id from users u where u.id = id_creater_), id_creater_, sysdate);
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура редактирования абонента
procedure pr_abonent_update(id_abonent_ in number, name_abonent_ in varchar2, phone_abonent_ in varchar2, description_ in varchar2, email_ in varchar2, branch_id_ in number, id_updater_ in number)
is
  error_some_param_empty exception;
  begin
     if id_abonent_ is not null and name_abonent_ is not null and phone_abonent_ is not null and description_ is not null and id_updater_ is not null
         then UPDATE ABONENTS SET NAME=name_abonent_, PHONE=phone_abonent_, DESCRIPTION=description_,EMAIL=email_, BRANCHE_ID = branch_id_, USER_ID=id_updater_, DATE_MODIFY=sysdate WHERE ID = id_abonent_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления абонента
procedure pr_abonent_delete(id_abonent_ in number)
is
  error_some_param_empty exception;
  begin
     if id_abonent_ is not null then
        DELETE FROM ABONENT_GROUP_LINK WHERE ABONENT_ID = id_abonent_;
        DELETE FROM ABONENTS WHERE ID = id_abonent_;
        commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

------------------------------------------------------
-- Набор процедур для управления Ролями и Action'ами
------------------------------------------------------
------------------------------------------------------
-- Процедура выборки ролей
procedure pr_roles_get(id_role_ in number, name_role_ in varchar2, description_role_ in varchar2, id_user_ in number, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, DESCRIPTION, USER_ID, USER_NAME, UPDATE_AT from v_roles where 1=1';
     if id_role_ is not null
        then sql_:=sql_||' and ID='||id_role_;
     end if;
     if name_role_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_role_||'%'')';
     end if;
     if description_role_ is not null
        then sql_:=sql_||' and lower(DESCRIPTION) like lower(''%'||description_role_||'%'')';
     end if;
     if id_user_ is not null
        then sql_:=sql_||' and USER_ID='||id_user_;
     end if;
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания роли
procedure pr_role_create(name_role_ in varchar2, description_role_ in varchar2, id_creater_ in number)
is
  error_some_param_empty exception;
  begin
     if name_role_ is not null and description_role_ is not null and id_creater_ is not null
         then insert into user_roles(id,name,description,user_id,update_at) values(s_user_roles.nextval, name_role_, description_role_, id_creater_, sysdate);
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура редактирования роли
procedure pr_role_update(id_role_ in number, name_role_ in varchar2, description_role_ in varchar2, id_updater_ in number)
is
  error_some_param_empty exception;
  begin
     if id_role_ is not null and name_role_ is not null and description_role_ is not null and id_updater_ is not null
         then update USER_ROLES set NAME=name_role_, DESCRIPTION=description_role_, USER_ID=id_updater_, UPDATE_AT=SYSDATE WHERE ID=id_role_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления роли
procedure pr_role_delete(id_role_ in number)
is
  error_some_param_empty exception;
  begin
     if id_role_ is not null
         then
         delete from role_action_link where role_id=id_role_;
         delete from USER_ROLES WHERE ID=id_role_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура создания связи action - роль
procedure pr_role_action_add(role_id_ in number, action_id_ in number)
is
  begin
       insert into role_action_link(id,role_id,action_id) values(s_role_action_link.nextval, role_id_, action_id_);
  end;
------------------------------------------------------
-- Процедура удаления связи action - роль
procedure pr_role_action_del(role_id_ in number, action_id_ in number)
is
  begin
       delete from role_action_link where role_id=role_id_ and action_id=action_id_;
  end;
------------------------------------------------------
------------------------------------------------------
-- Процедура выборки action'ов
procedure pr_actions_get(id_role_ in number, id_action_ in number, name_action_ in varchar2, description_action_ in varchar2, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, DESCRIPTION from v_role_actions where 1=1';
     if id_role_ is not null
        then sql_:=sql_||' and ROLE_ID='||id_role_;
     end if;
     if id_action_ is not null
        then sql_:=sql_||' and ID='||id_action_;
     end if;
     if name_action_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_action_||'%'')';
     end if;
     if description_action_ is not null
        then sql_:=sql_||' and lower(DESCRIPTION) like lower(''%'||description_action_||'%'')';
     end if;
     sql_:=sql_||' group by ID, NAME, DESCRIPTION ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания action'а
procedure pr_action_create(name_action_ in varchar2, description_action_ in varchar2)
is
  error_some_param_empty exception;
  begin
     if name_action_ is not null and description_action_ is not null
         then insert into user_actions(id,name,description) values(s_actions.nextval, name_action_, description_action_);
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления action'а
procedure pr_action_delete(id_action_ in number)
is
  error_some_param_empty exception;
  begin
     if id_action_ is not null
         then
         delete from user_action_link WHERE ACTION_ID=id_action_;
         delete from role_action_link WHERE ACTION_ID=id_action_;
         delete from user_actions WHERE ID=id_action_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

------------------------------------------------------
-- Набор инструментов для управления Пользователями
------------------------------------------------------
------------------------------------------------------
-- Процедура для выборки пользователей
procedure pr_user_get(id_user_ in number, login_user_ in varchar2, is_del_ in number, name_user_ in varchar2, role_id_ in number, branche_id_ in number, branches_user_id_ in number, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  begin
     sql_:='select ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, ROLE_NAME, BRANCHE_ID, BRANCHE_S_NAME from v_users where 1=1';
     if id_user_ is not null
        then sql_:=sql_||' and ID='||id_user_;
     end if;
     if is_del_ is not null
        then sql_:=sql_||' and IS_DELETED='||is_del_;
     end if;
     if login_user_ is not null
        then sql_:=sql_||' and lower(LOGIN) like lower('''||login_user_||''')';
     end if;
     if name_user_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_user_||'%'')';
     end if;
     if role_id_ is not null
        then sql_:=sql_||' and ROLE_ID='||role_id_;
     end if;
     if branche_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID='||branche_id_;
     end if;
     if branches_user_id_ is not null
        then sql_:=sql_||' and BRANCHE_ID in (select t.branche_id from user_branche_link t where t.user_id='||branches_user_id_||')';
     end if;
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Функция создания пользователя
function fn_user_create(login_user_ in varchar2, name_user_ in varchar2, role_id_ in number, branche_id_ in number) return number
is
  id_user number;
  begin
     id_user := 0;
     if login_user_ is not null and name_user_ is not null and role_id_ is not null and branche_id_ is not null
         then
              id_user := S_USERS.NEXTVAL;
              insert into users(ID,LOGIN,CREATED_AT,NAME,ROLE_ID, BRANCHE_ID) values (id_user, login_user_, sysdate, name_user_, role_id_, branche_id_);
              commit;
     end if;
     return id_user;
  end;
------------------------------------------------------
-- Процедура редактирования пользователя
procedure pr_user_update(id_user_ in number, name_user_ in varchar2, login_user_ in varchar2, id_role_ in number, id_branche_ in number)
is
  error_some_param_empty exception;
  begin
     if id_user_ is not null and name_user_ is not null and login_user_ is not null and id_role_ is not null and id_branche_ is not null
         then update USERS set LOGIN=login_user_, UPDATED_AT=SYSDATE, NAME=name_user_, ROLE_ID=id_role_, BRANCHE_ID=id_branche_ where ID=id_user_;
         commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура удаления пользователя
procedure pr_user_delete(id_user_ in number)
is
  error_some_param_empty exception;
  begin
     if id_user_ is not null
         then --DELETE FROM ABONENTS WHERE ID = id_user_;
              update users set IS_DELETED = 1 where id = id_user_;
              commit;
     else
         raise error_some_param_empty;
     end if;
     exception
      when error_some_param_empty then
        raise_application_error(-pkg_error.ERROR_SOME_PARAM_EMPTY,'Заданы не все параметры.');
  end;
------------------------------------------------------
-- Процедура выборки action'ов пользователя
procedure pr_user_actions_get(id_user_ in number, id_action_ in number, name_action_ in varchar2, description_action_ in varchar2, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, DESCRIPTION from v_user_actions where 1=1';
     if id_user_ is not null
        then sql_:=sql_||' and USER_ID='||id_user_;
     end if;
     if id_action_ is not null
        then sql_:=sql_||' and ID='||id_action_;
     end if;
     if name_action_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_action_||'%'')';
     end if;
     if description_action_ is not null
        then sql_:=sql_||' and lower(DESCRIPTION) like lower(''%'||description_action_||'%'')';
     end if;
     sql_:=sql_||' group by ID, NAME, DESCRIPTION ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания связи action - user
procedure pr_user_action_add(user_id_ in number, action_id_ in number)
is
  begin
       if user_id_ is not null and action_id_ is not null
          then
          insert into user_action_link(id,user_id,action_id) values(s_user_action_link.nextval, user_id_, action_id_);
          commit;
       end if;
  end;
------------------------------------------------------
-- Процедура удаления связи action - user
procedure pr_user_action_del(user_id_ in number, action_id_ in number)
is
  begin
       if user_id_ is not null and action_id_ is not null
          then
          delete from user_action_link where user_id=user_id_ and action_id=action_id_;
          commit;
       end if;
  end;
------------------------------------------------------
-- Функция проверки права пользователя
function fn_user_action_access(id_user_ in number, name_action_ in varchar2) return number
is
  is_access number;
  begin
       select count(*) into is_access
       from v_user_actions
       where user_id = id_user_
             and name = name_action_;
       return is_access;
  end;
------------------------------------------------------
-- Процедура выборки филиалов пользователя
procedure pr_user_branches_get(id_user_ in number, id_branche_ in number, name_brahcne_ in varchar2, s_name_brahcne_ in varchar2, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, S_NAME from v_user_branches where 1=1';
     if id_user_ is not null
        then sql_:=sql_||' and USER_ID='||id_user_;
     end if;
     if id_branche_ is not null
        then sql_:=sql_||' and ID='||id_branche_;
     end if;
     if name_brahcne_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_brahcne_||'%'')';
     end if;
     if s_name_brahcne_ is not null
        then sql_:=sql_||' and lower(S_NAME) like lower(''%'||s_name_brahcne_||'%'')';
     end if;
     sql_:=sql_||' group by ID, NAME, S_NAME ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания связи user - branche
procedure pr_user_branche_add(user_id_ in number, branche_id_ in number)
is
  begin
       if user_id_ is not null and branche_id_ is not null
          then
          insert into user_branche_link(id,user_id,branche_id) values(s_user_branche_link.nextval, user_id_, branche_id_);
          commit;
       end if;
  end;
------------------------------------------------------
-- Процедура удаления связи user - branche
procedure pr_user_branche_del(user_id_ in number, branche_id_ in number)
is
  begin
       if user_id_ is not null and branche_id_ is not null
          then
          delete from user_branche_link where user_id=user_id_ and branche_id=branche_id_;
          commit;
       end if;
  end;

------------------------------------------------------
-- Процедура выборки типов пользователя
procedure pr_user_types_get(id_user_ in number, id_type_ in number, name_type_ in varchar2, priority_type_ in number, description_type_ in varchar2, order_by_ in varchar2, t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select ID, NAME, PRIORITY, DESCRIPTION from v_user_types where 1=1';
     if id_user_ is not null
        then sql_:=sql_||' and USER_ID='||id_user_;
     end if;
     if id_type_ is not null
        then sql_:=sql_||' and ID='||id_type_;
     end if;
     if name_type_ is not null
        then sql_:=sql_||' and lower(NAME) like lower(''%'||name_type_||'%'')';
     end if;
     if priority_type_ is not null
        then sql_:=sql_||' and PRIORITY='||priority_type_;
     end if;
     if description_type_ is not null
        then sql_:=sql_||' and lower(DESCRIPTION) like lower(''%'||description_type_||'%'')';
     end if;
     sql_:=sql_||' group by ID, NAME, PRIORITY, DESCRIPTION ';
     if order_by_ is not null
        then sql_:=sql_||' order by '||order_by_;
     else
        sql_:=sql_||' order by lower(NAME)';
     end if;
     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------
-- Процедура создания связи тип - user
procedure pr_user_type_add(user_id_ in number, type_id_ in number)
is
  begin
       if user_id_ is not null and type_id_ is not null
          then
          insert into user_type_link(id,user_id,type_id) values(s_user_type_link.nextval, user_id_, type_id_);
          commit;
       end if;
  end;
------------------------------------------------------
-- Процедура удаления связи тип - user
procedure pr_user_type_del(user_id_ in number, type_id_ in number)
is
  begin
       if user_id_ is not null and type_id_ is not null
          then
          delete from user_type_link where user_id=user_id_ and type_id=type_id_;
          commit;
       end if;
  end;
------------------------------------------------------
-- Процедура выборки тех поддержки
procedure pr_support_get( t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     sql_:='select * from support  ';

     dbms_output.enable;
     dbms_output.put_line(sql_);
     open t_list for sql_;
  end;
------------------------------------------------------

function fn_set_action_for_user(user_id in number, action_name in varchar2) return number
is
  v_action_id user_actions.id%type;

begin

     SELECT id INTO v_action_id 	FROM USER_ACTIONS WHERE USER_ACTIONS.NAME=action_name;

     IF v_action_id is not null THEN

     pkg_web.pr_user_action_add(user_id, v_action_id) ;
     return 1;
    END IF;


    return 0;
end;

procedure pr_smsinfomsg_create(p_name in varchar2, p_text in varchar2, p_spr_id in number, p_new_spr in varchar2 := null)
is
  v_spr_id number :=0;
begin
     if (p_new_spr is not null and p_new_spr != '') then
        v_spr_id:=s_smsinfospr.nextval;
        INSERT INTO SMSINFOSPR(ID,NAME,PARENT_ID) VALUES(v_spr_id, p_new_spr, p_spr_id);
     else
         v_spr_id := p_spr_id;
     end if;

     INSERT INTO SMSINFOMSG(ID,NAME,TEXT,SMSINFOSPR_ID) VALUES(S_SMSINFOMSG.NEXTVAL, p_name, p_text, v_spr_id);
end;

end PKG_WEB;
/
