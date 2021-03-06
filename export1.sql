-------------------------------------------------------
-- Export file for user SMSCENTER                    --
-- Created by h02-GerasimovMN on 15.05.2012, 8:10:19 --
-------------------------------------------------------
--33333333333333333333333333333333333333333333333333333333
spool export1.log

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
  is '�������';
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
  ROLE_ID    NUMBER,
  BRANCHE_ID NUMBER
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
  add constraint FK_BRANCHE foreign key (BRANCHE_ID)
  references SMSCENTER_DEBUG.BRANCHES (ID);
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
  is '���������� ���������';
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
  add constraint UK_ABONENTS unique (PHONE)
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
  is '������� ����, ��� ������ �������� �������, ��������� ����';
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
prompt Creating table ABONENT_GROUP_LINK
prompt =================================
prompt
create table SMSCENTER_DEBUG.ABONENT_GROUP_LINK
(
  ID         NUMBER not null,
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
alter table SMSCENTER_DEBUG.ABONENT_GROUP_LINK
  add constraint ID primary key (ID)
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
alter table SMSCENTER_DEBUG.ABONENT_GROUP_LINK
  add constraint FK_ABONENTS_AGL foreign key (ABONENT_ID)
  references SMSCENTER_DEBUG.ABONENTS (ID);
alter table SMSCENTER_DEBUG.ABONENT_GROUP_LINK
  add constraint FK_GROUPS_AGL foreign key (GROUP_ID)
  references SMSCENTER_DEBUG.GROUPS (ID);

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
  is '����� ���������';
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
  DESCRIPTION VARCHAR2(250),
  RESENDED    NUMBER default 0
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
comment on column SMSCENTER_DEBUG.ERRORS.RESENDED
  is '��������� ������� �������� ���������';
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
prompt Creating table LOG
prompt ==================
prompt
create table SMSCENTER_DEBUG.LOG
(
  DATETIME  TIMESTAMP(3),
  THREAD    VARCHAR2(255),
  LOG_LEVEL VARCHAR2(255),
  LOGGER    VARCHAR2(255),
  MESSAGE   VARCHAR2(4000)
)
tablespace SMSCENTER
  pctfree 10
  initrans 1
  maxtrans 255;

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
  references SMSCENTER_DEBUG.ERRORS (ID);
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
  is '�������� ������������� � ��������';
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
prompt Creating table USER_WISHES
prompt ==========================
prompt
create table SMSCENTER_DEBUG.USER_WISHES
(
  ID        NUMBER not null,
  TEXT      VARCHAR2(500),
  USER_ID   NUMBER not null,
  CREATE_AT DATE default sysdate not null
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
alter table SMSCENTER_DEBUG.USER_WISHES
  add constraint PK_USER_WISHES primary key (ID)
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
alter table SMSCENTER_DEBUG.USER_WISHES
  add constraint FK_USER_ID foreign key (USER_ID)
  references SMSCENTER_DEBUG.USERS (ID);

prompt
prompt Creating sequence S_ABONENTS
prompt ============================
prompt
create sequence SMSCENTER_DEBUG.S_ABONENTS
minvalue 1
maxvalue 9999999999999999999999999999
start with 288
increment by 1
cache 20;

prompt
prompt Creating sequence S_ABONENT_GROUP_LINK
prompt ======================================
prompt
create sequence SMSCENTER_DEBUG.S_ABONENT_GROUP_LINK
minvalue 1
maxvalue 9999999999999999999999999999
start with 402
increment by 1
cache 20;

prompt
prompt Creating sequence S_BRANCHES
prompt ============================
prompt
create sequence SMSCENTER_DEBUG.S_BRANCHES
minvalue 1
maxvalue 99999999999
start with 22
increment by 1
cache 20
cycle;

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
start with 75
increment by 1
cache 20;

prompt
prompt Creating sequence S_MESSAGES
prompt ============================
prompt
create sequence SMSCENTER_DEBUG.S_MESSAGES
minvalue 1
maxvalue 9999999999999999999999999999
start with 49868
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
start with 10378
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
start with 42
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
prompt Creating sequence S_USER_WISHES
prompt ===============================
prompt
create sequence SMSCENTER_DEBUG.S_USER_WISHES
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
select t.id as "ID",
       t.name as "NAME",
       to_char(t.created_at,'DD.MM.YYYY HH24:MI:SS') as "CREATED_AT_FORMAT",
       t.created_at as "CREATED_AT",
       to_char(t.updated_at,'DD.MM.YYYY HH24:MI:SS') as "UPDATED_AT_FORMAT",
       t.updated_at as "UPDATED_AT",
       t.type_task_id as "TYPE_TASK_ID",
       t.user_id as "USER_ID",
       t.group_msg as "GROUP_MSG",
       t.message as "MESSAGE",
       (select m.message from messages m where m.task_id=t.id and rownum=1) as "MSG"
    from tasks t
-- select * from vi_tasks2
/

prompt
prompt Creating view V_MESSAGES
prompt ========================
prompt
create or replace view SMSCENTER_DEBUG.v_messages as
select m."ID",
       m."PHONE",
       a.name as "NAME_ABONENT",
       m."CREATED_AT",
       m."UPDATED_AT",
       m."TASK_ID",
       m."STATUS_ID",
       s.name as status,
       m."MESSAGE",
       m."USER_ID",
       m."ERROR_ID"
from messages m
left join status_msg s on s.id=m.status_id
left join abonents a on a.phone=m.phone
/

prompt
prompt Creating package PKG_ERROR
prompt ==========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_ERROR is
/******************************************************************************			
  -- Author  : H02-GERASIMOVMN
  -- Created : 16.02.2012 13:50:47
  -- Purpose : ����� �������� ���� ������������ ������
  
  ����:       ������:  �����:            ��������:
----------  -------  ----------------  ------------------------------------			
2012-02-16           ������ ���������  �������� ����� ������
2012-02-21           ������ ���������  ���������� ERROR_MESSAGE_NO_FOUND, ERROR_STATUS_NO_FOUND

******************************************************************************/

-- ������ ������
  ERROR_TASK_NAME_EMPTY                constant INTEGER := 20001; -- ��� ������� ������ ����������� ������������
  ERROR_TYPE_NO_FOUND                  constant INTEGER := 20002; -- ������ ���� ������ ������������ ��� �������
  ERROR_MESSAGE_NO_FOUND               constant INTEGER := 20003; -- ��� ������ ���������
  ERROR_STATUS_NO_FOUND                constant INTEGER := 20004; -- ��� ������ ������� ���������
  ERROR_MESSAGE_TEXT                   constant INTEGER := 20005; -- ����������� ����� ��������� 
  ERROR_PHONE_NUMBER                   constant INTEGER := 20006; -- �� ���������� ����� ��������
  ERROR_USER_LOGIN                     constant INTEGER := 20007; -- �� ������ ������������ � ����� �������
  ERROR_DATE_PERIOD                    constant INTEGER := 20008; -- �� ������ �������� ���

end PKG_ERROR;
/

prompt
prompt Creating package PKG_GATE
prompt =========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_GATE is

/*******************************************************************************
  -- �����  : H02-GERASIMOVMN
  -- ���� �������� : 17.02.2012 14:22:47
  -- ��������:  ����� ��� ������ � ��������� �� �������� SMS
  
  ����:       ������:  �����:            ��������:
----------  -------  ----------------  ------------------------------------			
2012-02-17             ������ ���������  �������� ����� ������
2012-02-20             ������ ���������  ���������� ������� update_message
2012-03-30             ������ ���������  ������ ������� update_status. ���������� ��������� p_statuscode

******************************************************************************/

type MSG_CURSOR is REF CURSOR;

/*
  ������� get_messages ���������� ��������� ��� �������� �� SMS
  ������� ���������:
    p_limit:PLS_INTEGER - ����� ��� ������ ������������ ���������
  �������� ���������:
    p_msgs:CURSOR - ������ ���������
*/
PROCEDURE get_messages(p_limit IN PLS_INTEGER, p_msgs OUT MSG_CURSOR);

/*
  ������� update_status ��������� ������ ���������
  ������� ���������:
    p_message_id:PLS_INTEGER - ������������� ���������, � �������� ����������� ������
    p_status_new:PLS_INTEGER - ����� ������ ���������. ��� ��������� ������������� ��������� ������� STATUS_MSG
  �������� ���������:
    �������� ���������� 20003 - ���� ��������� � �������� ��������������� �����������
    �������� ���������� 20004 - ���� ��������� ������ ��������� �����������
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
  -- Purpose : API ��� ��������� �������������
  
  -- Public type declarations
--  type <TypeName> is <Datatype>;
  
  -- Public constant declarations

--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations

---------------------------------------------------------------------------
  --������� ������� sms �� ��������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --���������� �������������� sms  
  function add(phone_ varchar2,text_ varchar2 ) return number;
---------------------------------------------------------------------------
  --������� �������� ������� sms
    --���������:
            --sms_id_ ������������� sms            
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2;
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������            
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number) return number;
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            --���������� �������������� sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number) return number;
---------------------------------------------------------------------------
  --������� ���������� ������������� �������� ������������
  function get_user return number;  

end pkg_sms;
/
grant execute on SMSCENTER_DEBUG.PKG_SMS to SMSUSER;


prompt
prompt Creating package PKG_WEB
prompt ========================
prompt
create or replace package SMSCENTER_DEBUG.PKG_WEB is

  -- Author  : H02-TURUSHEVNA
  -- Created : 20.02.2012 15:18:28
  -- Purpose : ����� ��� Web ����������.
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
   type ref_cursor is ref cursor;
  
  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations

  --��������� ��� ������ �������
  procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to in date,user_id_ in number,t_list out ref_cursor);
  ------------------------------------------------
  --��������� ��� ������ ��������� �������
  procedure pr_get_messages(id_task_ in number,s_list out ref_cursor);
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������            
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number,user_id_ number) return number;
  
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            --���������� �������������� sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number,user_id_ number) return number;
---------------------------------------------------------------------------
  --������� ������� sms �� ��������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --���������� �������������� sms  
  function add(phone_ varchar2,text_ varchar2,user_id_ number) return number;
---------------------------------------------------------------------------
  --������� �������� ������� sms
    --���������:
            --sms_id_ ������������� sms            
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2;
---------------------------------------------------------------------------
  --��������� ��� �������������� ������
  procedure pr_update_group(group_id_ in number, group_abonents_ in varchar2);
  
------------------------------------------------------
  --��������� ��� �������� ������  
  procedure pr_create_group(group_name_ in varchar2, creater_id_ in number);

------------------------------------------------------
  --��������� ��� �������� ���������
  procedure pr_add_wish(user_id_ in number, user_msg_ in varchar2);

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
prompt Creating procedure KILL_DOUBLE_PHONES
prompt =====================================
prompt
create or replace procedure SMSCENTER_DEBUG.kill_double_phones is
cursor phone is select phone from abonents t
                group by phone
                having count(*)>1 
                order by phone;
max_id number;                
begin
  --������� �������� ��� ����������� "��������" ��������� ��-�� ������ ��������� ����������� ��.
  --����� ������ ���� ����� palm face ��� wall, �� � ��������� � pl/sql �� �������������� ����������� �������.
  dbms_output.enable;
  --���� ��������� �� ���� ������ ��������� � ������ ������� ������������ � ������, ����� ������� ����� � abonents
  for j in phone 
  loop
    --������ ���������� ����� ��������� ������.
    select max(id)into max_id from abonents where phone=j.phone;
    --��������� � ������� �� ���������� ������
    for l in (select id from abonents where phone=j.phone and id<>max_id) 
      loop 
        update abonent_group_link gl set gl.abonent_id=max_id where gl.abonent_id=l.id;
        delete from abonents where id=l.id;
       --  dbms_output.put_line('max_id='||max_id||' id='||l.id||' phone='||l.phone);
      end loop;
--  dbms_output.put_line(j.phone);
  end loop;
  commit;
end kill_double_phones;
/

prompt
prompt Creating procedure SMS_ARCHIVING
prompt ================================
prompt
create or replace procedure SMSCENTER_DEBUG.SMS_ARCHIVING is
 i integer;
begin
--   ������������� ������� � ������� MESSAGES (�� ����� ������ 1 ���.)
     INSERT INTO archive_message SELECT * FROM messages t WHERE t.created_at < sysdate-30;
     DELETE FROM messages t WHERE t.created_at < sysdate-30;
--   ������ ������ (�� ��������� ������ 1 ���)     
     DELETE FROM archive_message t WHERE t.created_at < sysdate-356;
     i := PKG_SMS.add(phone_ => '79241086744',text_ => 'SMS ������������� ���������');
end SMS_ARCHIVING;
/

prompt
prompt Creating procedure TMP
prompt ======================
prompt
create or replace procedure SMSCENTER_DEBUG.tmp is
cursor rows is select * from abonent_group_link;
 
begin
  --������� ��� ���������� ���������� �����.
  for j in rows
  loop
  update abonent_group_link s set id=s_abonent_group_link.nextval 
  where s.group_id=j.group_id and s.abonent_id=j.abonent_id;
  end loop;
  commit;
end tmp;
/

prompt
prompt Creating package body PKG_ERROR
prompt ===============================
prompt
create or replace package body SMSCENTER_DEBUG.PKG_ERROR is
/******************************************************************************			
  
  ����:       ������:  �����:            ��������:
----------  -------  ----------------  ------------------------------------			
2012-02-16           ������ ���������  �������� ����� ������

******************************************************************************/

end PKG_ERROR;
/

prompt
prompt Creating package body PKG_GATE
prompt ==============================
prompt
create or replace package body SMSCENTER_DEBUG.PKG_GATE is
/*******************************************************************************
  -- �����  : H02-GERASIMOVMN
  -- ���� �������� : 17.02.2012 14:22:47
  -- ��������:  ����� ��� ������ � ��������� �� �������� SMS
  
  ����:       ������:  �����:            ��������:
----------  -------  ----------------  ------------------------------------			
2012-02-17             ������ ���������  �������� ����� ������
2012-03-29             ������ ���������  ������ ������� get_message
2012-03-30             ������ ���������  ������ ������� update_status. ���������� ���� update_at
2012-03-30             ������ ���������  ������ ������� update_status. ���������� ��������� p_statuscode

******************************************************************************/

PROCEDURE get_messages(p_limit IN PLS_INTEGER, p_msgs OUT MSG_CURSOR)
IS
BEGIN
     OPEN p_msgs FOR SELECT * FROM MESSAGES WHERE status_id=1 and rownum < p_limit+1
     order by id;   
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
     -- �������� �� ������������ �������� ���������
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
     
     -- �������� �� ������������ �������� ������� ��� ���������
     OPEN status_cur;
          FETCH  status_cur INTO status_row;
          IF status_cur%NOTFOUND THEN
             RAISE err_status_no_found; 
          END IF;
     CLOSE status_cur;     
     
     UPDATE messages t SET t.status_id = p_status_new, t.updated_at=sysdate, t.error_id=p_statuscode WHERE t.id = p_message_id;
     
     EXCEPTION
     when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'��� ������ ���������!');   
     WHEN err_message_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_MESSAGE_NO_FOUND,'��������� � ����� '||p_message_id||' �� ������� ��� ����������');  
     WHEN err_status_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_STATUS_NO_FOUND, '������ ��������� '||p_status_new||' �����������');
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
  --������� ������� sms �� ��������
    --���������:
            --_phone -  11-�� ������ ����� �������� �������� � ����� ������.
            --_text - ����� ��������� �������� 255 ��������.
            --���������� �������������� sms  
  function add(phone_ varchar2,text_ varchar2) return number
  is
    mess_id number;
  begin
    mess_id:=pkg_sms.add_to_task(phone_,text_ ,0);
    return mess_id;
  end;  
---------------------------------------------------------------------------
  --������� �������� ������� sms
    --���������:
            --sms_id ������������� sms            
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2
  is
  result_ varchar2(20 CHAR);
  begin
    select s.name into result_ from SMSCENTER_DEBUG.messages m
    left join SMSCENTER_DEBUG.status_msg s on m.status_id=s.id
    where m.id=sms_id_;
    return result_;
    
    exception 
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'��� ������ ���������!');            
  end;
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������            
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number) return number
  is
--  result_ number;
  task_id number; 
  error_task_name_empty exception;  
    begin
      --��������� ����� ��������
      if name_ is null 
         or length(trim(name_))=0 
        then raise error_task_name_empty;
      end if;   
      
      task_id:=s_tasks.nextval;
      --������� �������
      insert into tasks (id,name,type_task_id,user_id,group_msg)
      values(task_id,name_,type_,pkg_sms.get_user,0);
     
    return task_id;
    
    exception
      when error_task_name_empty then
        raise_application_error(-pkg_error.ERROR_TASK_NAME_EMPTY,'��� ������������ �������!');     
  end;  
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            --���������� �������������� sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number) return number
  is
  error_phone_number exception;
  error_messge_text exception;
  mess_id number;
  result_ number;
    begin
      result_:=-1; 
--�������� ����������
      --��������� ����� ��������
      if phone_ is null 
         or length(trim(phone_))<>11 
         or length(trim(translate(phone_, '0123456789',' '))) is not null
        then raise error_phone_number;
      end if;
      --��������� ����� ���������
      if text_ is null or length(trim(phone_))=0
        then raise error_messge_text;
      end if;
      --�������� �������������
     mess_id:=s_messages.nextval;   
--������� ��������� � ��������� � ������� �� ���������.
      insert into messages(id,phone,message,user_id,task_id)
       values(mess_id,trim(phone_),text_,pkg_sms.get_user,task_id);        
      result_:=mess_id;
    return result_;

--��������� ����������   
    exception
--      when no_data_found then exit;
      when error_phone_number then
        raise_application_error(-pkg_error.ERROR_PHONE_NUMBER,'�� ��������� ����� ����� ��������! ������ ���� 11 ����.');
      when error_messge_text then
        raise_application_error(-pkg_error.ERROR_MESSAGE_TEXT,'����� ��������� �����������!');
      when others then raise;              
  end;  

---------------------------------------------------------------------------
  --������� ���������� ������������� �������� ������������
  function get_user return number  
  is
  user_id number;
    begin
    select id into user_id from SMSCENTER_DEBUG.users
    where upper(trim(login))=upper(trim(user));
    return user_id;
     
  exception
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_USER_LOGIN,'�� ������ ������������!');        
  end;  
  -- Initialization
  --<Statement>;
  end pkg_sms;
/
grant execute on SMSCENTER_DEBUG.PKG_SMS to SMSUSER;


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
  --��������� ��� ������ �������
  ------------------------------------------------------
procedure pr_get_tasks(task_type_ in number,date_from_ in date,date_to in date,user_id_ in number,t_list out ref_cursor)
is
  sql_ varchar2(4000);
  error_date_period exception;
  begin
     --���� ��� ��������� ������ - ������ ������ where �� �����
     if task_type_ is null and date_from_ is null and date_to is null and user_id_ is null
     then 
       sql_:='select * from vi_tasks ';
     else
     --������ ���� ���������
     --�������� ��� ������ ���� �����������
       if (date_from_ is null or date_to is null)
         then raise error_date_period;
       else     
         sql_:='select * from vi_tasks where ';
         sql_:=sql_||'trunc(created_at) between ';
         --� ����� ������� ���-�� ����� ���������� �.�. �������� �� �� ������ ���� 
         sql_:=sql_||'to_date('''||to_char(date_from_,'ddmmyyyy') ||''',''ddmmyyyy'') ';
         sql_:=sql_||' and ';
         sql_:=sql_||'to_date('''||to_char(date_to,'ddmmyyyy') ||''',''ddmmyyyy'') ';
           if task_type_ is not null
             then sql_:=sql_||' and type_task_id='||task_type_;
           end if;
           if user_id_ is not null
             then sql_:=sql_||' and user_id='||user_id_;
           end if;
           sql_:=sql_||' order by created_at desc';
           
         end if;    
       end if;
     dbms_output.enable;  
     dbms_output.put_line(sql_);
     open t_list for sql_;
     
--��������� ����������   
    exception
--      when no_data_found then exit;
      when error_date_period then
        raise_application_error(-pkg_error.ERROR_DATE_PERIOD,'�� ����� �������� ���.');
     
  end;

  ------------------------------------------------------
  --��������� ��� ������ ��������� �������
  procedure pr_get_messages(id_task_ in number,s_list out ref_cursor) is
  begin
     open s_list for select * from v_messages where task_id=id_task_ order by name_abonent;
  end;
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������            
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number,user_id_ number) return number is
  task_id_ number;
  begin
  task_id_:=null;
  task_id_:=pkg_sms.add_task(name_,type_);
  if task_id_ is not null and user_id_ is not null then 
  update tasks set user_id=user_id_ where id= task_id_;
  end if;
  return task_id_;
  end;
  
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            --���������� �������������� sms  
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number,user_id_ number) return number is
  sms_id_ number;
  begin
    sms_id_:=null;
    -- Call the function
    sms_id_ := pkg_sms.add_to_task(phone_,text_,task_id);  
    if sms_id_ is not null and user_id_ is not null then
      update messages set user_id=user_id_ where id=sms_id_;
    end if;
  return sms_id_;
  end;

---------------------------------------------------------------------------
  --������� ������� sms �� ��������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --���������� �������������� sms  
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
  --������� �������� ������� sms
    --���������:
            --sms_id_ ������������� sms            
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2 is
  begin
  return pkg_sms.chk(sms_id_);
  end;   
  
  
--begin
  -- Initialization
  --<Statement>;
------------------------------------------------------
  --��������� ��� �������������� ������
  procedure pr_update_group(group_id_ in number, group_abonents_ in varchar2) is
--  group_abs varchar2(2000);
  begin
--     open s_list for select * from v_messages where task_id=id_task_;
--       select * from groups where id=group_id_;
--       update groups set name=group_name_ where id=group_id_;
--       group_abs := trim(group_abonents_);
--       delete from abonent_group_link where group_id = group_id_ and abonent_id in(group_abonents_);
--       delete from abonent_group_link where group_id = group_id_;
       insert into abonent_group_link(id,group_id,abonent_id) values(s_abonent_group_link.nextval, group_id_, group_abonents_);
  end;
  
------------------------------------------------------
  --��������� ��� �������� ������
  procedure pr_create_group(group_name_ in varchar2, creater_id_ in number) is
  begin
       INSERT INTO GROUPS(ID, NAME, BRANCHES_ID, USER_ID) VALUES(s_groups.nextval, group_name_, 1, creater_id_);
  end;
  
------------------------------------------------------
  --��������� ��� �������� ���������
  procedure pr_add_wish(user_id_ in number, user_msg_ in varchar2) is
  begin
       insert into user_wishes (id,text,user_id) values(S_USER_WISHES.Nextval, user_msg_, user_id_);
  end;

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
