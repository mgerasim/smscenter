--------------------------------------------------------
-- Export file for user SMSCENTER                     --
-- Created by h02-GerasimovMN on 04.04.2012, 10:04:26 --
--------------------------------------------------------

spool export.log

prompt
prompt Creating table BRANCHES
prompt =======================
prompt
create table SMSCENTER_DEBUG.BRANCHES
(
  ID     NUMBER not null,
  S_NAME VARCHAR2(10 CHAR),
  NAME   VARCHAR2(50 CHAR)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSCENTER_DEBUG.BRANCHES
  is 'Филиалы';
alter table SMSCENTER_DEBUG.BRANCHES
  add constraint PK_BRANCH primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_ROLES
prompt =========================
prompt
create table SMSCENTER_DEBUG.USER_ROLES
(
  ID          NUMBER not null,
  NAME        VARCHAR2(50),
  DESCRIPTION VARCHAR2(250)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.USER_ROLES
  add constraint PK_USER_ROLES primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERS
prompt ====================
prompt
create table SMSCENTER_DEBUG.USERS
(
  ID         NUMBER(38) not null,
  LOGIN      VARCHAR2(255 CHAR),
  CREATED_AT DATE,
  UPDATED_AT DATE,
  NAME       VARCHAR2(250),
  ROLE_ID    NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.USERS
  add primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.USERS
  add constraint UK_LOGIN unique (LOGIN)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.USERS
  add constraint FK_USER_ROLES foreign key (ROLE_ID)
  references SMSCENTER_DEBUG.USER_ROLES (ID);

prompt
prompt Creating table ABONENTS
prompt =======================
prompt
create table SMSCENTER_DEBUG.ABONENTS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100 CHAR),
  PHONE       VARCHAR2(11 CHAR),
  DESCRIPRION VARCHAR2(100 CHAR),
  BRANCHE_ID  NUMBER,
  USER_ID     NUMBER,
  DATE_CREATE DATE default sysdate,
  DATE_MODIFY DATE
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSCENTER_DEBUG.ABONENTS
  is 'Справочник телефонов';
alter table SMSCENTER_DEBUG.ABONENTS
  add constraint PK_ABONENTS primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.ABONENTS
  add constraint FK_BRANCHES_ABONENTS foreign key (BRANCHE_ID)
  references SMSCENTER_DEBUG.BRANCHES (ID);
alter table SMSCENTER_DEBUG.ABONENTS
  add constraint FK_USERS_ABONENTS foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating table ABONENT_GROUP_LINK
prompt =================================
prompt
create table SMSCENTER_DEBUG.ABONENT_GROUP_LINK
(
  ID         NUMBER,
  GROUP_ID   NUMBER,
  ABONENT_ID NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVE_MESSAGE
prompt ==============================
prompt
create table SMSCENTER_DEBUG.ARCHIVE_MESSAGE
(
  ID         NUMBER(38) not null,
  PHONE      VARCHAR2(255 CHAR),
  CREATED_AT DATE default sysdate,
  UPDATED_AT DATE,
  TASK_ID    NUMBER(38) default 0 not null,
  STATUS_ID  NUMBER default 1 not null,
  MESSAGE    VARCHAR2(1024 CHAR),
  USER_ID    NUMBER,
  ERROR_ID   NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSCENTER_DEBUG.ARCHIVE_MESSAGE
  is 'Архив сообщений';
comment on column SMSCENTER_DEBUG.ARCHIVE_MESSAGE.TASK_ID
  is '0 - ??????? ?? ?????????';
comment on column SMSCENTER_DEBUG.ARCHIVE_MESSAGE.STATUS_ID
  is '1 - ?????? - ?????? ????????';
comment on column SMSCENTER_DEBUG.ARCHIVE_MESSAGE.MESSAGE
  is '????? ??? ?????????';
alter table SMSCENTER_DEBUG.ARCHIVE_MESSAGE
  add constraint PK_ARCHIVE_MESSAGES primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERRORS
prompt =====================
prompt
create table SMSCENTER_DEBUG.ERRORS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100),
  DESCRIPTION VARCHAR2(250)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSCENTER_DEBUG.ERRORS
  is '???? ?????? ??? ???????? ???';
alter table SMSCENTER_DEBUG.ERRORS
  add constraint PK_ERRORS primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GROUPS
prompt =====================
prompt
create table SMSCENTER_DEBUG.GROUPS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(200 CHAR),
  DESCRIPTION VARCHAR2(200 CHAR),
  BRANCHES_ID NUMBER,
  USER_ID     NUMBER,
  DATE_CREATE DATE default sysdate,
  DATE_MODIFY DATE,
  IS_DELETE   VARCHAR2(1 CHAR)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SMSCENTER_DEBUG.GROUPS.IS_DELETE
  is 'Признак того, что группа рассылки удалена, временное поле';
alter table SMSCENTER_DEBUG.GROUPS
  add constraint PK_GROUPS primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.GROUPS
  add constraint FK_USER_GROUPS foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating table STATUS_MSG
prompt =========================
prompt
create table SMSCENTER_DEBUG.STATUS_MSG
(
  ID   NUMBER not null,
  NAME VARCHAR2(100)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.STATUS_MSG
  add constraint PK_STATUS_SMS primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TYPE_TASK
prompt ========================
prompt
create table SMSCENTER_DEBUG.TYPE_TASK
(
  ID       NUMBER not null,
  NAME     VARCHAR2(50),
  PRIORITY NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSCENTER_DEBUG.TYPE_TASK
  is '???? ????? ? ?? ?????????';
comment on column SMSCENTER_DEBUG.TYPE_TASK.ID
  is '?????????? ?????????????';
comment on column SMSCENTER_DEBUG.TYPE_TASK.NAME
  is '??? ??????';
comment on column SMSCENTER_DEBUG.TYPE_TASK.PRIORITY
  is '?????????, ??? ?????? ???????? ??? ?????? ?????????';
alter table SMSCENTER_DEBUG.TYPE_TASK
  add constraint PK_TYPE_TASK primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKS
prompt ====================
prompt
create table SMSCENTER_DEBUG.TASKS
(
  ID           NUMBER(38) not null,
  NAME         VARCHAR2(255 CHAR),
  CREATED_AT   DATE default sysdate,
  UPDATED_AT   DATE,
  TYPE_TASK_ID NUMBER,
  USER_ID      NUMBER,
  GROUP_MSG    NUMBER default 0 not null,
  MESSAGE      VARCHAR2(1024)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SMSCENTER_DEBUG.TASKS.GROUP_MSG
  is '??????? ?? ???????? ?????????? ??? ????? ????? ?????????. 0 - ? messages, 1-? tasks';
alter table SMSCENTER_DEBUG.TASKS
  add primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.TASKS
  add constraint FK_TYPE_TASK foreign key (TYPE_TASK_ID)
  references SMSCENTER_DEBUG.TYPE_TASK (ID);
alter table SMSCENTER_DEBUG.TASKS
  add constraint FK_USERS_TASKS foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating table MESSAGES
prompt =======================
prompt
create table SMSCENTER_DEBUG.MESSAGES
(
  ID         NUMBER(38) not null,
  PHONE      VARCHAR2(255 CHAR),
  CREATED_AT DATE default sysdate,
  UPDATED_AT DATE,
  TASK_ID    NUMBER(38) default 0 not null,
  STATUS_ID  NUMBER default 1 not null,
  MESSAGE    VARCHAR2(1024 CHAR),
  USER_ID    NUMBER,
  ERROR_ID   NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SMSCENTER_DEBUG.MESSAGES.TASK_ID
  is '0 - ??????? ?? ?????????';
comment on column SMSCENTER_DEBUG.MESSAGES.STATUS_ID
  is '1 - ?????? - ?????? ????????';
comment on column SMSCENTER_DEBUG.MESSAGES.MESSAGE
  is '????? ??? ?????????';
alter table SMSCENTER_DEBUG.MESSAGES
  add primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SMSCENTER_DEBUG.MESSAGES
  add constraint FK_ERRORS foreign key (ERROR_ID)
  references SMSCENTER_DEBUG.ERRORS (ID)
  disable;
alter table SMSCENTER_DEBUG.MESSAGES
  add constraint FK_STATUS_MSG foreign key (STATUS_ID)
  references SMSCENTER_DEBUG.STATUS_MSG (ID);
alter table SMSCENTER_DEBUG.MESSAGES
  add constraint FK_TASKS_NOTES foreign key (TASK_ID)
  references SMSCENTER_DEBUG.TASKS (ID);
alter table SMSCENTER_DEBUG.MESSAGES
  add constraint FK_USERS foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating table TEMPLATES
prompt ========================
prompt
create table SMSCENTER_DEBUG.TEMPLATES
(
  ID NUMBER not null
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SMSCENTER_DEBUG.TEMPLATES
  is '??????????????, ??? ? ?????? ??????? ????? ??????? ?????????, ?? ??? ??????????? ????????? ??? ?? ??????.';
alter table SMSCENTER_DEBUG.TEMPLATES
  add constraint PK_TEMPLATES primary key (ID)
  using index 
  tablespace SMSCENTER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table USER_BRANCHE_LINK
prompt ================================
prompt
create table SMSCENTER_DEBUG.USER_BRANCHE_LINK
(
  ID         NUMBER,
  USER_ID    NUMBER,
  BRANCHE_ID NUMBER
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SMSCENTER_DEBUG.USER_BRANCHE_LINK
  is 'Привязка пользователей к филиалам';
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK
  add constraint PK_USER_BRANCHES primary key (ID)
  disable;
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK
  add constraint FK_BRANCHES foreign key (BRANCHE_ID)
  references SMSCENTER_DEBUG.BRANCHES (ID);
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK
  add constraint FK_USERS_2 foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating sequence S_ABONENTS
prompt ============================
prompt
create sequence SMSCENTER_DEBUG.S_ABONENTS
minvalue 1
maxvalue 9999999999999999999999999999
start with 268
increment by 1
cache 20;

prompt
prompt Creating sequence S_ABONENT_GROUP_LINK
prompt ======================================
prompt
create sequence SMSCENTER_DEBUG.S_ABONENT_GROUP_LINK
minvalue 1
maxvalue 9999999999999999999999999999
start with 173
increment by 1
cache 20;

prompt
prompt Creating sequence S_ERRROR
prompt ==========================
prompt
create sequence SMSCENTER_DEBUG.S_ERRROR
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_GROUPS
prompt ==========================
prompt
create sequence SMSCENTER_DEBUG.S_GROUPS
minvalue 1
maxvalue 9999999999999999999999999999
start with 55
increment by 1
cache 20;

prompt
prompt Creating sequence S_MESSAGES
prompt ============================
prompt
create sequence SMSCENTER_DEBUG.S_MESSAGES
minvalue 1
maxvalue 9999999999999999999999999999
start with 11728
increment by 1
cache 20;

prompt
prompt Creating sequence S_STATUS_MSG
prompt ==============================
prompt
create sequence SMSCENTER_DEBUG.S_STATUS_MSG
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence S_TASKS
prompt =========================
prompt
create sequence SMSCENTER_DEBUG.S_TASKS
minvalue 1
maxvalue 9999999999999999999999999999
start with 10198
increment by 1
cache 20;

prompt
prompt Creating sequence S_TYPE_TASK
prompt =============================
prompt
create sequence SMSCENTER_DEBUG.S_TYPE_TASK
minvalue 1
maxvalue 9999999999999999999999999999
start with 4
increment by 1
cache 20;

prompt
prompt Creating sequence S_USERS
prompt =========================
prompt
create sequence SMSCENTER_DEBUG.S_USERS
minvalue 1
maxvalue 9999999999999999999999999999
start with 22
increment by 1
cache 20;

prompt
prompt Creating sequence S_USER_ROLES
prompt ==============================
prompt
create sequence SMSCENTER_DEBUG.S_USER_ROLES
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating view UTV_RESULT_FULL
prompt =============================
prompt
CREATE OR REPLACE VIEW SMSCENTER_DEBUG.UTV_RESULT_FULL AS
SELECT utp.id utp_id, program, ut.id unittest_id,
          tc.id testcase_id, utr.outcome_id, run_id,
          start_on, end_on, utr.status, utr.description
     FROM ut_utp utp,
          ut_unittest ut,
          ut_testcase tc,
          ut_outcome oc,
          utr_outcome utr
    WHERE utp.id = ut.utp_id
      AND ut.id = tc.unittest_id
      AND tc.id = oc.testcase_id
      AND oc.id = utr.outcome_id
/
grant select, insert, update, delete, references on SMSCENTER_DEBUG.UTV_RESULT_FULL to PUBLIC;


prompt
prompt Creating view UTV_LAST_RUN
prompt ==========================
prompt
CREATE OR REPLACE VIEW SMSCENTER_DEBUG.UTV_LAST_RUN AS
SELECT a.id utp_id, program, run_id last_run_id
     FROM ut_utp a,
          (SELECT   utp_id, MAX (run_id) run_id
               FROM utv_result_full
           GROUP BY utp_id) b
    WHERE a.id = b.utp_id(+)
/
grant select, insert, update, delete, references on SMSCENTER_DEBUG.UTV_LAST_RUN to PUBLIC;


prompt
prompt Creating view VI_TASKS
prompt ======================
prompt
create or replace view SMSCENTER_DEBUG.vi_tasks as
select "ID","NAME","CREATED_AT","UPDATED_AT","TYPE_TASK_ID"
    from tasks
/

prompt
prompt Creating package PKG_ERROR
prompt ==========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_ERROR is
/******************************************************************************			
  -- Author  : H02-GERASIMOVMN
  -- Created : 16.02.2012 13:50:47
  -- Purpose : ????? ???????? ???? ???????????? ??????
  
  ????:       ??????:  ?????:            ????????:
----------  -------  ----------------  ------------------------------------			
2012-02-16           ?????? ?????????  ???????? ????? ??????
2012-02-21           ?????? ?????????  ?????????? ERROR_MESSAGE_NO_FOUND, ERROR_STATUS_NO_FOUND

******************************************************************************/

-- ?????? ??????
  ERROR_TASK_NAME_EMPTY                constant INTEGER := 20001; -- ??? ??????? ?????? ??????????? ????????????
  ERROR_TYPE_NO_FOUND                  constant INTEGER := 20002; -- ?????? ???? ?????? ???????????? ??? ???????
  ERROR_MESSAGE_NO_FOUND               constant INTEGER := 20003; -- ??? ?????? ?????????
  ERROR_STATUS_NO_FOUND                constant INTEGER := 20004; -- ??? ?????? ??????? ?????????
  ERROR_MESSAGE_TEXT                   constant INTEGER := 20005; -- ??????????? ????? ????????? 
  ERROR_PHONE_NUMBER                   constant INTEGER := 20006; -- ?? ?????????? ????? ????????
  ERROR_USER_LOGIN                     constant INTEGER := 20007; -- ?? ?????? ???????????? ? ????? ???????

end PKG_ERROR;
/

prompt
prompt Creating package PKG_GATE
prompt =========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_GATE is

/*******************************************************************************
  -- Автор  : H02-GERASIMOVMN
  -- Дата создания : 17.02.2012 14:22:47
  -- ОПИСАНИЕ:  Пакет для работы с заданиями на отправку SMS
  
  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------			
2012-02-17             Михаил Герасимов  Создание этого пакета
2012-02-20             Михаил Герасимов  Добавление функции update_message
2012-03-30             Михаил Герасимов  Правка функции update_status. Добавления параметра p_statuscode

******************************************************************************/

type MSG_CURSOR is REF CURSOR;

/*
  Функция get_messages возвращает сообщения для отправки по SMS
  Входные параметры:
    p_limit:PLS_INTEGER - лимит для списка возвращаемых сообщений
  Выходные параметры:
    p_msgs:CURSOR - список сообщений
*/
PROCEDURE get_messages(p_limit IN PLS_INTEGER, p_msgs OUT MSG_CURSOR);

/*
  Функция update_status обновляет статус сообщения
  Входные параметры:
    p_message_id:PLS_INTEGER - идентификатор сообщения, у которого обновляется статус
    p_status_new:PLS_INTEGER - новый статус сообщения. Код сообщения соответствует множеству таблицы STATUS_MSG
  Выходные параметры:
    Вызывает исключение 20003 - если сообщение с заданным идентификатором отсутствует
    Вызывает исключение 20004 - если указанный статус сообщения отсутствует
*/
PROCEDURE update_status(p_message_id IN PLS_INTEGER, p_status_new IN PLS_INTEGER, p_statuscode IN PLS_INTEGER := 0);

end PKG_GATE;
/

prompt
prompt Creating package PKG_SMS
prompt ========================
prompt
create or replace package SMSCENTER_DEBUG.pkg_sms is

  -- Author  : H02-TURUSHEVNA
  -- Created : 15.02.2012 14:23:27
  -- Purpose : API для сторонних разработчиков
  
  -- Public type declarations
--  type <TypeName> is <Datatype>;
  
  -- Public constant declarations

--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations

---------------------------------------------------------------------------
  --Функция вставки sms на отправку
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --возвращает иденитификатор sms  
  function add(phone_ varchar2,text_ varchar2 ) return number;
---------------------------------------------------------------------------
  --Функция проверки статуса sms
    --параметры:
            --sms_id_ идентификатор sms            
            --возвращает статус смс в текстовом виде:
              --Создана, Выполняется, Завершена, Ошибка
  function chk(sms_id_ number) return varchar2;
---------------------------------------------------------------------------
  --Функция создания задачи
    --параметры:
            --name_ имя задачи            
            --type_ тип задачи:
              --1-Служебная,2-Рекламная,3-Сервисная
            --Возвращает идентификатор задачи.
  function add_task(name_ varchar2, type_ number) return number;
---------------------------------------------------------------------------
  --Функция вставки sms на отправку, в рамках определённой задачи
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --task_id - идентификатор задачи
            --возвращает иденитификатор sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number) return number;
---------------------------------------------------------------------------
  --Функция возвращает идентификатор текущего пользователя
  function get_user return number;  

end pkg_sms;
/

prompt
prompt Creating package PKG_WEB
prompt ========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_WEB is

  -- Author  : H02-TURUSHEVNA
  -- Created : 20.02.2012 15:18:28
  -- Purpose : ????? ??? Web ??????????.
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
   type ref_cursor is ref cursor;
  
  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations

  --????????? ??? ?????? ???????
  procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to in date,user_id_ in number,t_list out ref_cursor);
  ------------------------------------------------
  --????????? ??? ?????? ????????? ???????
  procedure pr_get_messages(id_task_ in number,s_list out ref_cursor);


end PKG_WEB;
/

prompt
prompt Creating package UT_PKG_GATE
prompt ============================
prompt
create or replace package SMSCENTER_DEBUG.UT_PKG_GATE is

/*******************************************************************************
  -- ?????  : H02-GERASIMOVMN
  -- ???? ???????? : 21.02.2012 9:12:46
  -- ????????:  ????? UT_PKG_GATE ??? ?????????? ?????????? ???????????? ?????? PKG_GATE
  
  ????:       ??????:  ?????:            ????????:
----------  -------  ----------------  ------------------------------------			
2012-02-21           ?????? ?????????  ???????? ????? ??????

******************************************************************************/
PROCEDURE ut_setup;

PROCEDURE ut_update_status;
 
PROCEDURE ut_teardown;

end UT_PKG_GATE;
/

prompt
prompt Creating procedure SMS_ARCHIVING
prompt ================================
prompt
create or replace procedure SMSCENTER_DEBUG.SMS_ARCHIVING is
 i integer;
begin
--   Архивирование записей в таблице MESSAGES (по умолч старше 1 мес.)
     INSERT INTO archive_message SELECT * FROM messages t WHERE t.created_at < sysdate-30;
     DELETE FROM messages t WHERE t.created_at < sysdate-30;
--   Чистка архива (по умолчанию старше 1 год)     
     DELETE FROM archive_message t WHERE t.created_at < sysdate-356;
     i := PKG_SMS.add(phone_ => '79241086744',text_ => 'SMS архивирование завершено');
end SMS_ARCHIVING;
/

prompt
prompt Creating package body PKG_ERROR
prompt ===============================
prompt
create or replace package body SMSCENTER_DEBUG.PKG_ERROR is
/******************************************************************************			
  
  ????:       ??????:  ?????:            ????????:
----------  -------  ----------------  ------------------------------------			
2012-02-16           ?????? ?????????  ???????? ????? ??????

******************************************************************************/

end PKG_ERROR;
/

prompt
prompt Creating package body PKG_GATE
prompt ==============================
prompt
create or replace package body SMSCENTER_DEBUG.PKG_GATE is
/*******************************************************************************
  -- Автор  : H02-GERASIMOVMN
  -- Дата создания : 17.02.2012 14:22:47
  -- ОПИСАНИЕ:  Пакет для работы с заданиями на отправку SMS
  
  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------			
2012-02-17             Михаил Герасимов  Создание этого пакета
2012-03-29             Михаил Герасимов  Правка функции get_message
2012-03-30             Михаил Герасимов  Правка функции update_status. Обновление даты update_at
2012-03-30             Михаил Герасимов  Правка функции update_status. Добавления параметра p_statuscode

******************************************************************************/

PROCEDURE get_messages(p_limit IN PLS_INTEGER, p_msgs OUT MSG_CURSOR)
IS
BEGIN
     OPEN p_msgs FOR SELECT * FROM MESSAGES WHERE status_id=1 and rownum < p_limit+1;   
END;

PROCEDURE update_status(p_message_id IN PLS_INTEGER, p_status_new IN PLS_INTEGER, p_statuscode IN PLS_INTEGER)
IS
    err_message_no_found EXCEPTION;
    err_status_no_found EXCEPTION;
    mess_id number;
--    CURSOR message_cur IS SELECT ID FROM MESSAGES WHERE ID = p_message_id;
--    message_row messages%ROWTYPE;
    CURSOR status_cur IS SELECT * FROM STATUS_MSG WHERE ID = p_status_new;
    status_row status_msg%ROWTYPE;
BEGIN     
     -- проверка на корректность указания сообщения
     select id into mess_id from messages where id=p_message_id;
     if mess_id<>p_message_id then
     raise err_message_no_found;
     end if;
     
/*     OPEN message_cur;
          FETCH  message_cur INTO message_row;
          IF message_cur%NOTFOUND THEN
             RAISE err_message_no_found; 
          END IF;
     CLOSE message_cur;*/
     
     -- проверка на корректность указания статуса для сообщения
     OPEN status_cur;
          FETCH  status_cur INTO status_row;
          IF status_cur%NOTFOUND THEN
             RAISE err_status_no_found; 
          END IF;
     CLOSE status_cur;     
     
     UPDATE messages t SET t.status_id = p_status_new, t.updated_at=sysdate, t.error_id=p_statuscode WHERE t.id = p_message_id;
     
     EXCEPTION
     when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'Нет такого сообщения!');   
     WHEN err_message_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_MESSAGE_NO_FOUND,'Сообщение с кодом '||p_message_id||' не найдено для обновления');  
     WHEN err_status_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_STATUS_NO_FOUND, 'Статус сообщения '||p_status_new||' отсутствует');
END;

end PKG_GATE;
/

prompt
prompt Creating package body PKG_SMS
prompt =============================
prompt
create or replace package body SMSCENTER_DEBUG.pkg_sms is

  -- Private type declarations
--  type <TypeName> is <Datatype>;
  
  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
--  <VariableName> <Datatype>;

  -- Function and procedure implementations
/*  function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/

--begin

-----------------------------------------------------------------------------  
  --Функция вставки sms на отправку
    --параметры:
            --_phone -  11-ти знчный номер сотового телефона с кодом страны.
            --_text - текст сообщения максимум 255 символов.
            --возвращает иденитификатор sms  
  function add(phone_ varchar2,text_ varchar2) return number
  is
    mess_id number;
  begin
    mess_id:=pkg_sms.add_to_task(phone_,text_ ,0);
    return mess_id;
  end;  
---------------------------------------------------------------------------
  --Функция проверки статуса sms
    --параметры:
            --sms_id идентификатор sms            
            --возвращает статус смс в текстовом виде:
              --Создана, Выполняется, Завершена, Ошибка
  function chk(sms_id_ number) return varchar2
  is
  result_ varchar2(20);
  begin
    select s.name into result_ from SMSCENTER_DEBUG.messages m
    left join SMSCENTER_DEBUG.status_msg s on m.status_id=s.id
    where m.id=sms_id_;
    return result_;
    
    exception 
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'Нет такого сообщения!');            
  end;
---------------------------------------------------------------------------
  --Функция создания задачи
    --параметры:
            --name_ имя задачи            
            --type_ тип задачи:
              --1-Служебная,2-Рекламная,3-Сервисная
            --Возвращает идентификатор задачи.
  function add_task(name_ varchar2, type_ number) return number
  is
--  result_ number;
  task_id number; 
  error_task_name_empty exception;  
    begin
      --Проверяем номер телефона
      if name_ is null 
         or length(trim(name_))=0 
        then raise error_task_name_empty;
      end if;   
      
      task_id:=s_tasks.nextval;
      --вставка задания
      insert into tasks (id,name,type_task_id,user_id,group_msg)
      values(task_id,name_,type_,pkg_sms.get_user,0);
     
    return task_id;
    
    exception
      when error_task_name_empty then
        raise_application_error(-pkg_error.ERROR_TASK_NAME_EMPTY,'Нет наименования задания!');     
  end;  
---------------------------------------------------------------------------
  --Функция вставки sms на отправку, в рамках определённой задачи
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --task_id - идентификатор задачи
            --возвращает иденитификатор sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number) return number
  is
  error_phone_number exception;
  error_messge_text exception;
  mess_id number;
  result_ number;
    begin
      result_:=-1; 
--Проверка параметров
      --Проверяем номер телефона
      if phone_ is null 
         or length(trim(phone_))<>11 
         or length(trim(translate(phone_, '0123456789',' '))) is not null
        then raise error_phone_number;
      end if;
      --Проверяем текст сообщения
      if text_ is null or length(trim(phone_))=0
        then raise error_messge_text;
      end if;
      --Получаем идентификатор
     mess_id:=s_messages.nextval;   
--Вставка сообщения с привязкой к заданию по умолчанию.
      insert into messages(id,phone,message,user_id,task_id)
       values(mess_id,trim(phone_),text_,pkg_sms.get_user,task_id);        
      result_:=mess_id;
    return result_;

--Обработка исключений   
    exception
--      when no_data_found then exit;
      when error_phone_number then
        raise_application_error(-pkg_error.ERROR_PHONE_NUMBER,'Не корректно задан номер телефона! Должно быть 11 цифр.');
      when error_messge_text then
        raise_application_error(-pkg_error.ERROR_MESSAGE_TEXT,'Текст сообщения отсутствует!');
      when others then raise;              
  end;  

---------------------------------------------------------------------------
  --Функция возвращает идентификатор текущего пользователя
  function get_user return number  
  is
  user_id number;
    begin
    select id into user_id from SMSCENTER_DEBUG.users
    where upper(trim(login))=upper(trim(user));
    return user_id;
     
  exception
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_USER_LOGIN,'Не найден пользователь!');        
  end;  
  -- Initialization
  --<Statement>;
  end pkg_sms;
/

prompt
prompt Creating package body PKG_WEB
prompt =============================
prompt
create or replace package body SMSCENTER_DEBUG.PKG_WEB is

  -- Private type declarations
--  type <TypeName> is <Datatype>;
  
  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
--  <VariableName> <Datatype>;

  -- Function and procedure implementations
  --????????? ??? ?????? ???????
  ------------------------------------------------------
  procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to in date,user_id_ in number,t_list out ref_cursor) is
  sql_ varchar2(4000);
  begin
     --???? ??? ????????? ?????? - ?????? ?????? where ?? ?????
     if task_type_ is null and date_from_ is null and date_to is null and user_id_ is null
     then 
       sql_:='select * from vi_tasks ';
     else
       sql_:='select * from vi_tasks where ';
         if task_type_ is not null
           then sql_:=sql_||'type_task_id='||task_type_;
         end if;
     end if;
  
     open t_list for sql_;
  end;

  ------------------------------------------------------
  --????????? ??? ?????? ????????? ???????
  procedure pr_get_messages(id_task_ in number,s_list out ref_cursor) is
  begin
     open s_list for select * from messages where task_id=id_task_;
  end;
  
--begin
  -- Initialization
  --<Statement>;
end PKG_WEB;
/

prompt
prompt Creating package body UT_PKG_GATE
prompt =================================
prompt
create or replace package body SMSCENTER_DEBUG.UT_PKG_GATE is
/*******************************************************************************
  ????:       ??????:  ?????:            ????????:
----------  -------  ----------------  ------------------------------------			
2012-02-21           ?????? ?????????  ???????? ????? ??????

******************************************************************************/

PROCEDURE ut_setup 
IS
BEGIN
      NULL;
END;

PROCEDURE ut_teardown
IS
BEGIN
      ROLLBACK;
END;


PROCEDURE ut_update_status
IS
BEGIN
     -- ????????? ? ????? 999 - ?? ?????? ????????????
     Utassert.throws(msg_in => '??????? ?????? ???????? ?????????? 20003 ??? ???????? ?????????????? ?????????:',
                            check_call_in => 'DECLARE i number; BEGIN PKG_GATE.update_status(999,1); END;',
                            against_exc_in => -PKG_ERROR.ERROR_MESSAGE_NO_FOUND);
                            
     -- ?????? ? ????? 999 (STATUS_MSG) ?? ?????? ????????????
     -- ????????? ? ????? 0 ?????? ???? ? ??
     Utassert.throws(msg_in => '??????? ?????? ???????? ?????????? 20004 ??? ???????? ??????? ?????????:',
                            check_call_in => 'DECLARE i number; BEGIN PKG_GATE.update_status(10157,999); END;',
                            against_exc_in => -PKG_ERROR.ERROR_STATUS_NO_FOUND);
END;

end UT_PKG_GATE;
/


spool off
