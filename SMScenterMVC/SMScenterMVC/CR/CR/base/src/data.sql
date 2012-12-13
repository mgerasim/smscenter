prompt PL/SQL Developer import file
prompt Created on 13 Июнь 2012 г. by h02-GerasimovMN
set feedback off
set define off
prompt Dropping BRANCHES...
drop table BRANCHES cascade constraints;
prompt Dropping USER_ROLES...
drop table USER_ROLES cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping ABONENTS...
drop table ABONENTS cascade constraints;
prompt Dropping GROUPS...
drop table GROUPS cascade constraints;
prompt Dropping ABONENT_GROUP_LINK...
drop table ABONENT_GROUP_LINK cascade constraints;
prompt Dropping ERRORS...
drop table ERRORS cascade constraints;
prompt Dropping USER_ACTIONS...
drop table USER_ACTIONS cascade constraints;
prompt Dropping ROLE_ACTION_LINK...
drop table ROLE_ACTION_LINK cascade constraints;
prompt Dropping STATUS_MSG...
drop table STATUS_MSG cascade constraints;
prompt Dropping SUPPORT...
drop table SUPPORT cascade constraints;
prompt Dropping TYPE_TASK...
drop table TYPE_TASK cascade constraints;
prompt Dropping USER_ACTION_LINK...
drop table USER_ACTION_LINK cascade constraints;
prompt Dropping USER_BRANCHE_LINK...
drop table USER_BRANCHE_LINK cascade constraints;
prompt Dropping USER_TYPE_LINK...
drop table USER_TYPE_LINK cascade constraints;
prompt Creating BRANCHES...
create table BRANCHES
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
comment on table BRANCHES
  is 'Филиалы';
alter table BRANCHES
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

prompt Creating USER_ROLES...
create table USER_ROLES
(
  ID          NUMBER not null,
  NAME        VARCHAR2(50),
  DESCRIPTION VARCHAR2(250),
  USER_ID     NUMBER,
  UPDATE_AT   DATE
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
alter table USER_ROLES
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

prompt Creating USERS...
create table USERS
(
  ID         NUMBER(38) not null,
  LOGIN      VARCHAR2(255 CHAR),
  CREATED_AT DATE,
  UPDATED_AT DATE,
  NAME       VARCHAR2(250),
  ROLE_ID    NUMBER,
  BRANCHE_ID NUMBER,
  IS_DELETED NUMBER default 0
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
alter table USERS
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
alter table USERS
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
alter table USERS
  add constraint FK_BRANCHE foreign key (BRANCHE_ID)
  references BRANCHES (ID);
alter table USERS
  add constraint FK_USER_ROLES foreign key (ROLE_ID)
  references USER_ROLES (ID);

prompt Creating ABONENTS...
create table ABONENTS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100 CHAR),
  PHONE       VARCHAR2(11 CHAR),
  DESCRIPTION VARCHAR2(100 CHAR),
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
comment on table ABONENTS
  is 'Справочник телефонов';
alter table ABONENTS
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
alter table ABONENTS
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
alter table ABONENTS
  add constraint FK_BRANCHES_ABONENTS foreign key (BRANCHE_ID)
  references BRANCHES (ID);
alter table ABONENTS
  add constraint FK_USERS_ABONENTS foreign key (USER_ID)
  references USERS (ID);

prompt Creating GROUPS...
create table GROUPS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(200 CHAR),
  DESCRIPTION VARCHAR2(200 CHAR),
  BRANCHE_ID  NUMBER,
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
comment on column GROUPS.IS_DELETE
  is 'Признак того, что группа рассылки удалена, временное поле';
alter table GROUPS
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
alter table GROUPS
  add constraint FK_USER_GROUPS foreign key (USER_ID)
  references USERS (ID);

prompt Creating ABONENT_GROUP_LINK...
create table ABONENT_GROUP_LINK
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
alter table ABONENT_GROUP_LINK
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
alter table ABONENT_GROUP_LINK
  add constraint FK_ABONENTS_AGL foreign key (ABONENT_ID)
  references ABONENTS (ID);
alter table ABONENT_GROUP_LINK
  add constraint FK_GROUPS_AGL foreign key (GROUP_ID)
  references GROUPS (ID);

prompt Creating ERRORS...
create table ERRORS
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
comment on table ERRORS
  is '???? ?????? ??? ???????? ???';
comment on column ERRORS.RESENDED
  is 'Повторная попытка отправки сообщений';
alter table ERRORS
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

prompt Creating USER_ACTIONS...
create table USER_ACTIONS
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100),
  DESCRIPTION VARCHAR2(250)
)
tablespace USERS
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
alter table USER_ACTIONS
  add constraint PK_USER_ACTIONS primary key (ID)
  using index 
  tablespace USERS
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
alter table USER_ACTIONS
  add constraint UK_USER_ACTIONS_NAME unique (NAME)
  using index 
  tablespace USERS
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

prompt Creating ROLE_ACTION_LINK...
create table ROLE_ACTION_LINK
(
  ID        NUMBER not null,
  ROLE_ID   NUMBER,
  ACTION_ID NUMBER
)
tablespace USERS
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
alter table ROLE_ACTION_LINK
  add constraint PK_ROLE_ACTIONS_LINK primary key (ID)
  using index 
  tablespace USERS
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
alter table ROLE_ACTION_LINK
  add constraint FK_ROLE_ACTIONS_LINK_ACTION_ID foreign key (ACTION_ID)
  references USER_ACTIONS (ID);
alter table ROLE_ACTION_LINK
  add constraint FK_ROLE_ACTIONS_LINK_ROLE_ID foreign key (ROLE_ID)
  references USER_ROLES (ID);

prompt Creating STATUS_MSG...
create table STATUS_MSG
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
alter table STATUS_MSG
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

prompt Creating SUPPORT...
create table SUPPORT
(
  ID      NUMBER(8) not null,
  NAME    VARCHAR2(255) not null,
  EMAIL   VARCHAR2(255) not null,
  SMSMAIL VARCHAR2(255) not null,
  PHONE   VARCHAR2(255) not null
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

prompt Creating TYPE_TASK...
create table TYPE_TASK
(
  ID          NUMBER not null,
  NAME        VARCHAR2(50),
  PRIORITY    NUMBER,
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
comment on table TYPE_TASK
  is '???? ????? ? ?? ?????????';
comment on column TYPE_TASK.ID
  is '?????????? ?????????????';
comment on column TYPE_TASK.NAME
  is '??? ??????';
comment on column TYPE_TASK.PRIORITY
  is '?????????, ??? ?????? ???????? ??? ?????? ?????????';
alter table TYPE_TASK
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

prompt Creating USER_ACTION_LINK...
create table USER_ACTION_LINK
(
  ID        NUMBER not null,
  USER_ID   NUMBER,
  ACTION_ID NUMBER
)
tablespace USERS
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
alter table USER_ACTION_LINK
  add constraint PK_USER_ACTION_LINK primary key (ID)
  using index 
  tablespace USERS
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
alter table USER_ACTION_LINK
  add constraint FK_USER_ACTION_LINK_USER_ID foreign key (USER_ID)
  references USERS (ID);

prompt Creating USER_BRANCHE_LINK...
create table USER_BRANCHE_LINK
(
  ID         NUMBER not null,
  USER_ID    NUMBER,
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
comment on table USER_BRANCHE_LINK
  is 'Привязка пользователей к филиалам';
alter table USER_BRANCHE_LINK
  add constraint PK_USER_BRANCHES primary key (ID)
  disable;
alter table USER_BRANCHE_LINK
  add constraint FK_BRANCHES foreign key (BRANCHE_ID)
  references BRANCHES (ID);
alter table USER_BRANCHE_LINK
  add constraint FK_USERS_2 foreign key (USER_ID)
  references USERS (ID);

prompt Creating USER_TYPE_LINK...
create table USER_TYPE_LINK
(
  ID      NUMBER not null,
  USER_ID NUMBER,
  TYPE_ID NUMBER
)
tablespace USERS
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
alter table USER_TYPE_LINK
  add constraint PK_USER_TYPE_LINK primary key (ID)
  using index 
  tablespace USERS
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
alter table USER_TYPE_LINK
  add constraint FK_USER_TYPE_LINK_TYPE_ID foreign key (TYPE_ID)
  references TYPE_TASK (ID);
alter table USER_TYPE_LINK
  add constraint FK_USER_TYPE_LINK_USER_ID foreign key (USER_ID)
  references USERS (ID);

prompt Disabling triggers for BRANCHES...
alter table BRANCHES disable all triggers;
prompt Disabling triggers for USER_ROLES...
alter table USER_ROLES disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for ABONENTS...
alter table ABONENTS disable all triggers;
prompt Disabling triggers for GROUPS...
alter table GROUPS disable all triggers;
prompt Disabling triggers for ABONENT_GROUP_LINK...
alter table ABONENT_GROUP_LINK disable all triggers;
prompt Disabling triggers for ERRORS...
alter table ERRORS disable all triggers;
prompt Disabling triggers for USER_ACTIONS...
alter table USER_ACTIONS disable all triggers;
prompt Disabling triggers for ROLE_ACTION_LINK...
alter table ROLE_ACTION_LINK disable all triggers;
prompt Disabling triggers for STATUS_MSG...
alter table STATUS_MSG disable all triggers;
prompt Disabling triggers for SUPPORT...
alter table SUPPORT disable all triggers;
prompt Disabling triggers for TYPE_TASK...
alter table TYPE_TASK disable all triggers;
prompt Disabling triggers for USER_ACTION_LINK...
alter table USER_ACTION_LINK disable all triggers;
prompt Disabling triggers for USER_BRANCHE_LINK...
alter table USER_BRANCHE_LINK disable all triggers;
prompt Disabling triggers for USER_TYPE_LINK...
alter table USER_TYPE_LINK disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint FK_BRANCHE;
alter table USERS disable constraint FK_USER_ROLES;
prompt Disabling foreign key constraints for ABONENTS...
alter table ABONENTS disable constraint FK_BRANCHES_ABONENTS;
alter table ABONENTS disable constraint FK_USERS_ABONENTS;
prompt Disabling foreign key constraints for GROUPS...
alter table GROUPS disable constraint FK_USER_GROUPS;
prompt Disabling foreign key constraints for ABONENT_GROUP_LINK...
alter table ABONENT_GROUP_LINK disable constraint FK_ABONENTS_AGL;
alter table ABONENT_GROUP_LINK disable constraint FK_GROUPS_AGL;
prompt Disabling foreign key constraints for ROLE_ACTION_LINK...
alter table ROLE_ACTION_LINK disable constraint FK_ROLE_ACTIONS_LINK_ACTION_ID;
alter table ROLE_ACTION_LINK disable constraint FK_ROLE_ACTIONS_LINK_ROLE_ID;
prompt Disabling foreign key constraints for USER_ACTION_LINK...
alter table USER_ACTION_LINK disable constraint FK_USER_ACTION_LINK_USER_ID;
prompt Disabling foreign key constraints for USER_BRANCHE_LINK...
alter table USER_BRANCHE_LINK disable constraint FK_BRANCHES;
alter table USER_BRANCHE_LINK disable constraint FK_USERS_2;
prompt Disabling foreign key constraints for USER_TYPE_LINK...
alter table USER_TYPE_LINK disable constraint FK_USER_TYPE_LINK_TYPE_ID;
alter table USER_TYPE_LINK disable constraint FK_USER_TYPE_LINK_USER_ID;
prompt Loading BRANCHES...
insert into BRANCHES (ID, S_NAME, NAME)
values (202, 'ПФ', 'Приморский филиал');
insert into BRANCHES (ID, S_NAME, NAME)
values (1, 'ХФ', 'Хабаровский филиал');
insert into BRANCHES (ID, S_NAME, NAME)
values (2, 'АФ', 'Амурский филиал');
commit;
prompt 3 records loaded
prompt Loading USER_ROLES...
insert into USER_ROLES (ID, NAME, DESCRIPTION, USER_ID, UPDATE_AT)
values (1, 'Просмотр', 'Просмотр всех имеющихся форм и данных', 2, to_date('30-05-2012', 'dd-mm-yyyy'));
insert into USER_ROLES (ID, NAME, DESCRIPTION, USER_ID, UPDATE_AT)
values (2, 'Оператор', 'Добавление новых рассылок', 2, to_date('30-05-2012', 'dd-mm-yyyy'));
insert into USER_ROLES (ID, NAME, DESCRIPTION, USER_ID, UPDATE_AT)
values (3, 'Администратор', 'Полные права на редактирование', 2, to_date('31-05-2012', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Loading USERS...
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (43, 'HQ--SvyatenkoAA', to_date('05-06-2012 11:38:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2012 09:26:30', 'dd-mm-yyyy hh24:mi:ss'), 'Святенко А.А.', 3, 202, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (22, 'H02-NaprienkoEG', to_date('26-04-2012', 'dd-mm-yyyy'), to_date('13-06-2012 09:26:41', 'dd-mm-yyyy hh24:mi:ss'), 'Наприенко Е.Г.', 2, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (46, 'h02-marfichevvm', to_date('08-06-2012 10:25:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2012 09:28:18', 'dd-mm-yyyy hh24:mi:ss'), 'Марфичев В.М.', 3, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (6, 'H02-LebedevDS', to_date('26-04-2012', 'dd-mm-yyyy'), to_date('13-06-2012 09:27:55', 'dd-mm-yyyy hh24:mi:ss'), 'Лебедев Д.С.', 2, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (7, 'HQ--DobzhinskiyVV', to_date('26-04-2012', 'dd-mm-yyyy'), to_date('13-06-2012 09:33:09', 'dd-mm-yyyy hh24:mi:ss'), 'Добжинский В.В.', 3, 202, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (8, 'H02-NachSmenySou', to_date('26-04-2012', 'dd-mm-yyyy'), null, 'Начальник смены СОУ', 1, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (9, 'h02-sou', to_date('26-04-2012', 'dd-mm-yyyy'), to_date('13-06-2012 09:21:50', 'dd-mm-yyyy hh24:mi:ss'), 'Начальник смены СОУ', 2, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (42, 'HQ--PipkoIG', to_date('05-06-2012 11:37:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2012 09:27:15', 'dd-mm-yyyy hh24:mi:ss'), 'Пипко И.Г.', 3, 202, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (2, 'h02-tolshinke', to_date('17-02-2012', 'dd-mm-yyyy'), to_date('08-06-2012 14:05:41', 'dd-mm-yyyy hh24:mi:ss'), 'Толшин К.Е.', 3, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (1, 'SMSCENTER', to_date('21-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), 'Администратор', 3, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (5, 'h02-gerasimovmn1', to_date('01-05-2012', 'dd-mm-yyyy'), to_date('06-06-2012 14:25:54', 'dd-mm-yyyy hh24:mi:ss'), 'Герасимов М.Н.', 2, 1, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (4, 'h02-knizhnikVV', to_date('12-04-2012', 'dd-mm-yyyy'), to_date('13-06-2012 10:26:57', 'dd-mm-yyyy hh24:mi:ss'), 'Книжник В.В.', 3, 202, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (226, 'hhh', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'hhh', 1, 202, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (37, 'SMSCENTER_DEBUG', to_date('15-05-2012', 'dd-mm-yyyy'), null, 'Отладчик', 3, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (227, 'ttt', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'ttt', 3, 2, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (228, 'tttt', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'sdfasd', 2, 1, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (229, 'aaaaaaaaaaaaaaaaaaaaa', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'sd', 1, 1, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (230, 'gggggggggggggggggggggg', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'asdf', 1, 1, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (231, 'asdf', to_date('04-06-2012', 'dd-mm-yyyy'), to_date('04-06-2012', 'dd-mm-yyyy'), 'asdf', 3, 1, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (232, 'adsfasdf', to_date('04-06-2012', 'dd-mm-yyyy'), null, 'dsfs', 3, 2, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (233, '1111111', to_date('04-06-2012', 'dd-mm-yyyy'), null, 's', 1, 202, 1);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (44, 'H02-MedyanikOS', to_date('06-06-2012 14:59:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2012 09:28:26', 'dd-mm-yyyy hh24:mi:ss'), 'Медяник О.С.', 2, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (45, 'h02-gerasimovmn', to_date('07-06-2012 09:49:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2012 09:26:59', 'dd-mm-yyyy hh24:mi:ss'), 'Герасимов М.Н.', 3, 1, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (3, 'smsuser', to_date('26-04-2012', 'dd-mm-yyyy'), to_date('05-06-2012 11:39:37', 'dd-mm-yyyy hh24:mi:ss'), 'Пользователи API', 1, 202, 0);
insert into USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID, BRANCHE_ID, IS_DELETED)
values (36, 'h02-turushevna', to_date('12-05-2012', 'dd-mm-yyyy'), to_date('13-06-2012 10:54:56', 'dd-mm-yyyy hh24:mi:ss'), 'Турушев Н.А.', 3, 202, 0);
commit;
prompt 25 records loaded
prompt Loading ABONENTS...
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (165, 'Медяник О.С', '79147768579', 'ведущий инженер программист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (172, 'Куклина Евгения Александровна', '79243093185', 'начальник', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (174, 'Санникова З.А.', '79098965942', 'начальник', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (175, 'Патрин Е.А.', '79622862139', 'начальник', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (184, 'Мордвинцева Татьяна Юрьевна', '79242209029', 'начальник ЦОВ', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (186, 'Шведко Галина Николаевна', '79243045762', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (195, 'Науменко Сергей Васильевич', '79246401730', 'начальник ЛТЦ№1 г.Биробиджан', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (196, 'Сикора Петр Иосифович', '79245401716', 'начальник ЛТЦ№2 п.Смидович', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (197, 'Колбин Олег Владимирович', '79246401720', 'начальник ЛТЦ№3 п.Облучье', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (24, 'Рафиков Ильдус Фаильевич', '79242240008', 'Начальник ЛТЦ № 4 г. Амурск', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (26, 'Журавлев Павел Николаевич', '79241004241', 'Начальник ЛТЦ № 5 п. Чегдомын', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (28, 'Романов Вячеслав Александрович', '79242083608', 'Начальник ЛТЦ № 6 с.им.П.Осипенко', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (29, 'Ждановский Михаил Витальевич', '79098097667', 'Начальник ЛТЦ№7п. Охотск', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (194, 'Михайлов Александр Леонидович', '79242283335', 'начальник ЛТЦ № 1 г.Комсомольск на Амуре', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (192, 'Говардовский Александр Иванович', '79242209002', 'начальник', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (193, 'Семенов Андрей Викторович ', '79242219997', 'начальник ЛТЦ№ 2 п.Ванино', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (177, 'Губер Галина Римовна', '79242199562', 'начальник станционного участка № 1 г.Хабаровск', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (178, 'Золотарев Максим Юрьевич', '79242209052', 'начальник  ЛУ № 1 г.Хабаровска', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (182, 'Матиенко Нина Викторовна', '79241020079', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (199, 'Специалист6', '79098897421', 'Специалист', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (202, 'Васенин Константин Александрович', '79242209019', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (203, 'Портнов Сергей Алексеевич', '79243022016', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (204, 'смена', '79242209032', 'Оперативный дежурный', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (207, 'Толшин К.Е.', '79098421077', 'programmer', 1, 2, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-05-2012 17:30:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (209, 'Мотов Владимир Сергеевич', '79242069887', 'Начальник отдела  технической инфраструктуры ИТ', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (213, 'Сапожников Дмитрий Александрович', '79147728645', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (214, 'Лебедев Дмитрий Сергеевич', '79243042624', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (217, 'Мершеев Олег Александрович', '79098688330', 'Инженер - электроник п. Ванино', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (216, 'Моргунов Максим Александрович', '79242218514', 'Ведущий Инженер - электроник г. Советская Гавань', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (219, 'Кравченко Андрей Анатольевич', '79243042278', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (220, 'Тихонова Галина Николаевна  ', '79242209015', ' ведущий инженер ', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (224, 'Кабацура Владимир Трофимович', '79243033546', 'Нач. отдела МПГОиЧС', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (225, 'Ян Галина', '79145432238', 'руководитель инф.центра избирательной комиссии Хаб.края', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (227, 'Барахтин Дмитрий Андреевич', '79142085491', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (215, 'Вдовенко Александр', '79294087795', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (232, 'Специалист Комсомольск', '79244105166', 'Специалист Комсомольск', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (233, 'Попов Дмитрий Владимирович', '79242209035', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (234, 'Мерзликин Сергей Иванович', '79242209014', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (236, 'Преснов Владимир Федорович', '604905', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (237, 'Минасова Евгения Владимировна', '79241010135', null, 1, 9, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2012 16:59:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (239, 'Федоров Сергей Александрович', '79141765005', 'начальник отдела систем электронного правительства и связи', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (240, 'Воронцов Дмитрий Владимирович', '79241023049', 'главный специалист отдела систем электронного правительства и связи', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (242, 'Деньга Виталий Геннадьевич', '79147728647', 'Начальник ООЭТС', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (243, 'Рябцев Александр Юрьевич', '79243043583', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (246, 'Торгашин Евгений Викторович', '79243084444', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (247, 'Рыбак Виталий Игоревич', '79242219994', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (248, 'Шрейдер Александр Константинович', '79145433511', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (249, 'Смурова Ольга Николаевна', '79243028144', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (252, 'Назарова Марина Михайловна', '79242068893', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (253, 'Манкевич Елена Анатольевна', '79243161661', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (254, 'Кучеренко Андрей Геннадьевич', '79145425098', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (255, 'Гусев Алексей Александрович', '79141688041', 'Заместитель директора филиала-Коммерческий директор Хабаровского филиала ОАО "Ростелеком"', 1, 9, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-05-2012 09:42:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (256, 'Вертлиб Оксана Валентиновна', '79242031853', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (257, 'Кастырина Олеся', '79098406731', 'специалист, Охотск', 1, 44, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2012 08:40:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (259, 'Козадаев Александр Викторович', '79242209047', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (258, 'Разуваев Александр Евгеньевич', '79242209045', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (260, 'Бажанов Алексей Александрович', '79242209102', null, 1, 9, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2012 15:11:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (261, 'Туктамышев Дмитрий Азатович', '79242298880', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (262, 'Волков Александр Алексеевич', '79244110038', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (263, 'Ионов Владимир Васильевич', '79145437272', 'Зам.начальника центра', 1, 9, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2012 18:37:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (264, 'Игнатовский Владимир Викторович', '79098075225', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (265, 'Ушакова Дина', '79244156905', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (266, 'Фролов Андрей Александрович', '79143180137', 'нач.энергоучастка', 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (267, 'Копырин Вадим Владимирович', '79243038007', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (238, 'Старкова Наталия Владимировна', '79242209022', null, 1, 1, to_date('12-04-2012 17:40:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (309, 'Марков Дмитрий Сергеевич', '79246401148', 'начальник ЛТЦ', 1, 9, to_date('09-06-2012 17:33:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-06-2012 17:33:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (308, 'Трегубов Сергей Владимирович', '79242095574', 'Ведущий инженер-электроник', 1, 9, to_date('24-05-2012 08:53:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-05-2012 08:53:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (9, 'Тимощенко Нина Викторовна', '79242209030', 'Начальник службы по работе с операторами', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (22, 'Забаев Алексей Борисович', '79242283338', 'Начальник ', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (23, 'Насонов Максим Васильевич', '79242240045', 'Главный инженер ', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (34, 'Гиневский Валерий Мичеславович', '79246467667', 'начальник', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (35, 'Савельев Сергей Николаевич', '79246401719', 'Главный инженер', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (37, 'Баранов Анатолий Николаевич', '79242298882', 'Начальник', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (38, 'Гильдебрант Виктор Генрихович', '79242298881', 'Главный инженер', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (41, 'Сазанов Константин Михайлович ', '79098606602', 'Заместитель начальника узла', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (82, 'Кондратьев Александр Викторович', '79242200838', 'главный инженер', 1, 9, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2012 09:03:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (101, 'Печать счетов Аян', '79241023051', 'специалист Аян', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (113, 'Наприенко Елена Геннадьевна', '79145464610', 'ведущий инженер программист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (114, 'Громовик Людмила Владимировна', '79242113064', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (115, 'Деменко Наталья Васильевна', '79246461015', 'начальник', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (117, 'Кривенок Галина Александровна', '79098861597', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (118, 'Кузнецова Елена Александровна', '79242217670', 'инженер программист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (120, 'Павленко Ирина Станиславовна', '79145461741', 'Специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (121, 'Силина Г.А.', '79242298925', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (123, 'Морозова Анна Николаевна', '79243040724', 'инженер программист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (125, 'Стец Л.Л.', '79147776500', 'Специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (126, 'Волоскова Н.В.', '79098621337', 'Специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (128, 'Герасимов М.Н.', '79241086744', 'программист', 1, 2, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2012 18:53:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (131, 'Стец Л.Л.', '79142198200', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (133, 'Деменко Наталья Васильевна', '79648271995', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (138, 'Горпиченко Т.', '79098419393', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (139, 'Васильева Т.А.', '79098769894', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (141, 'Ким Ирина Васильевна', '79622998119', 'Начальник ЦПС г.Советская Гавань', 1, 44, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2012 08:42:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (143, 'Комар Е.Н.', '79242032058', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (144, 'Гончаренко Н.А.', '79142043267', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (145, 'Кай Е.П.', '79098568346', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (147, 'Глозман А.', '79145414344', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (119, 'Мамонтова В.В.', '79144118332', 'Специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (150, 'Попенко Валентина Прокопьевна', '79626783079', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (156, 'Специалист1', '79098592007', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 100 records committed...
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (157, 'Специалист2', '79241133013', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (158, 'специалист3', '79142139058', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into ABONENTS (ID, NAME, PHONE, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (160, 'специалист5', '79242209043', 'специалист', 1, 1, to_date('12-04-2012 17:40:22', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 103 records loaded
prompt Loading GROUPS...
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (75, 'эл.энергия Смидовичи', null, 1, 9, to_date('09-06-2012 17:30:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-06-2012 17:38:39', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (23, 'СПС', 'Иванов Иван Иванович', 1, 1, to_date('26-07-2010', 'dd-mm-yyyy'), null, 't');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (9, 'Оповещение при авариях на сетях РУЭС Советская Гавань', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (36, 'Печать счетов для организаций', 'Наприенко Елена Геннадьевна', 1, 44, to_date('03-11-2010', 'dd-mm-yyyy'), to_date('08-06-2012 08:44:22', 'dd-mm-yyyy hh24:mi:ss'), 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (37, 'Печать счетов для населения', 'Наприенко Елена Геннадьевна', 1, 44, to_date('04-12-2010', 'dd-mm-yyyy'), to_date('08-06-2012 08:43:53', 'dd-mm-yyyy hh24:mi:ss'), 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (40, 'Попов  Д.В   89242209035', 'Диспетчер СОУ', 1, 1, to_date('15-02-2011', 'dd-mm-yyyy'), null, 't');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (43, 'оповещение при авариях на городской ЦТЭТ г.Хабаровск', 'Диспетчер СОУ', 1, 1, to_date('31-03-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (8, 'Оповещение при авариях на сетях межрайонного ЦТЭТ Николаевск на Амуре', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (32, 'Оповещение при авариях на сетях межрайонного ЦТЭТ СовГавань', 'Диспетчер СОУ', 1, 1, to_date('21-09-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (6, 'Оповещение при авариях на сетях межрайонного ЦТЭТ г.Комсомольск на Амуре', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (7, 'Оповещение при авариях на сетях межрайонного ЦТЭТ г. Биробиджана', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (3, 'Оповещение при авариях СПД', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (31, 'СОУ', 'Диспетчер СОУ', 1, 1, to_date('23-08-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (45, 'Мониторинг черных СТК-карт', 'Иванов Иван Иванович', 1, 1, to_date('06-06-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (42, 'Начальник службы.продаж корпоративным клиентам', 'Диспетчер СОУ', 1, 1, to_date('01-03-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (33, 'Программисты группы спец.программных систем', 'Иванов Иван Иванович', 1, 1, to_date('23-09-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (47, 'оповещение при авариях на сетях ТЦТЭТ', 'Диспетчер СОУ', 1, 1, to_date('22-07-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (48, 'ЧС', 'Диспетчер СОУ', 1, 1, to_date('14-08-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (50, 'Оповещение при хищениях и порче имущества', 'Диспетчер СОУ', 1, 1, to_date('09-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (51, 'оповещение правительства края', 'Диспетчер СОУ', 1, 1, to_date('13-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (52, 'отдел организации эксплуатации транспортной сети', 'Диспетчер СОУ', 1, 1, to_date('19-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (4, 'Оповещение при авариях программного обеспечения', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (53, 'оповещение при авариях С1', 'Диспетчер СОУ', 1, 1, to_date('26-01-2012', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (2, 'Оповещение при авариях на межрайонном ЦТЭТ г.Хабаровск', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (54, 'оповещение при авариях на сетях межрайонного ЦТЭТ г.Хабаровска', 'Диспетчер СОУ', 1, 1, to_date('09-02-2012', 'dd-mm-yyyy'), null, 'f');
insert into GROUPS (ID, NAME, DESCRIPTION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (5, 'Оповещение при авариях на электросетях', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
commit;
prompt 26 records loaded
prompt Loading ABONENT_GROUP_LINK...
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (451, 32, 217);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (452, 32, 193);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (449, 32, 192);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (450, 32, 82);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (384, 45, 207);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (417, 50, 234);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (418, 50, 237);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (419, 50, 233);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (420, 50, 247);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (421, 50, 238);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (183, 6, 22);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (184, 6, 23);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (185, 6, 24);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (186, 6, 26);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (187, 6, 28);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (188, 6, 29);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (189, 6, 101);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (190, 6, 139);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (191, 7, 34);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (192, 7, 35);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (193, 8, 37);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (194, 8, 38);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (195, 9, 192);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (196, 9, 41);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (199, 4, 184);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (201, 33, 207);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (202, 33, 128);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (206, 4, 220);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (208, 4, 186);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (210, 36, 115);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (211, 36, 117);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (212, 36, 114);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (213, 36, 138);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (214, 36, 139);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (215, 36, 101);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (216, 36, 125);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (217, 36, 126);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (218, 36, 144);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (219, 36, 145);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (220, 36, 119);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (221, 36, 113);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (222, 36, 118);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (223, 36, 120);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (224, 36, 121);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (225, 37, 113);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (226, 37, 114);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (227, 37, 115);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (228, 37, 117);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (229, 37, 118);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (230, 37, 119);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (231, 37, 120);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (232, 37, 121);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (233, 37, 123);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (234, 37, 125);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (235, 37, 126);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (238, 36, 133);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (239, 36, 131);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (240, 37, 133);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (241, 37, 138);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (242, 37, 139);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (243, 37, 141);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (244, 37, 143);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (245, 37, 144);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (246, 37, 145);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (247, 37, 147);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (248, 36, 147);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (249, 36, 150);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (250, 37, 150);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (251, 37, 156);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (252, 37, 157);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (253, 37, 158);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (254, 37, 260);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (255, 37, 160);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (256, 36, 156);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (257, 36, 157);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (258, 36, 158);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (259, 36, 260);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (260, 36, 160);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (262, 37, 165);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (263, 36, 165);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (267, 42, 249);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (268, 37, 172);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (269, 36, 172);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (270, 37, 175);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (271, 37, 174);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (272, 36, 175);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (276, 43, 203);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (277, 43, 182);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (278, 43, 238);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (279, 43, 184);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (280, 43, 220);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (281, 43, 186);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (285, 6, 194);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (286, 7, 195);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (287, 7, 196);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (288, 7, 197);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (289, 37, 199);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (293, 31, 204);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (296, 4, 209);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (298, 4, 214);
commit;
prompt 100 records committed...
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (299, 5, 215);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (309, 36, 261);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (310, 37, 261);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (312, 37, 232);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (319, 51, 239);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (320, 51, 240);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (323, 5, 243);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (335, 36, 257);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (336, 54, 258);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (337, 54, 259);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (338, 54, 260);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (339, 54, 261);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (340, 54, 262);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (341, 54, 263);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (342, 54, 264);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (344, 5, 266);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (345, 54, 267);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (372, 48, 224);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (437, 2, 178);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (438, 2, 263);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (439, 2, 259);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (440, 2, 267);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (441, 2, 253);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (442, 2, 184);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (443, 2, 252);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (444, 2, 258);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (445, 2, 220);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (446, 2, 261);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (447, 2, 186);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (448, 52, 242);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (453, 3, 202);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (435, 2, 260);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (436, 2, 177);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (454, 3, 184);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (455, 3, 203);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (456, 3, 238);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (457, 3, 220);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (458, 3, 186);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (459, 3, 308);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (460, 53, 256);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (461, 53, 255);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (462, 53, 253);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (463, 53, 252);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (464, 53, 247);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (465, 53, 249);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (466, 53, 246);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (467, 53, 265);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (468, 53, 248);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (469, 53, 308);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (473, 47, 263);
insert into ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (474, 47, 213);
commit;
prompt 151 records loaded
prompt Loading ERRORS...
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (0, 'No Error', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (1, 'Message Length is invalid', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (2, 'Command Length is invalid', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (3, 'Invalid Command ID', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (4, 'Incorrect BIND Status for given command', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (5, 'ESME Already in Bound State', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (6, 'Invalid Priority Flag', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (7, 'Invalid Registered Delivery Flag', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (8, 'System Error', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (10, 'Invalid Source Address', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (11, 'Invalid Dest Addr', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (12, 'Message ID is invalid', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (13, 'bind Failed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (14, 'Invalid Password', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (15, 'Invalid System ID', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (17, 'Cancel SM Failed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (19, 'Replace SM Failed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (20, 'Message Queue Full', null, 1);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (21, 'Invalid Service Type', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (51, 'Invalid number of destinations', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (52, 'Invalid Distribution List name', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (64, 'Destination flag is invalid(submit_multi)', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (66, 'Invalid `submit with replace? request(i.e. submit_sm with replace_if_present_flag set)', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (67, 'Invalid esm_class field data', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (68, 'Cannot Submit to Distribution List', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (69, 'submit_sm or submit_multi failed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (72, 'Invalid Source address TON', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (73, 'Invalid Source address NPI', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (80, 'Invalid Destination address TON', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (81, 'Invalid Destination address NPI', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (83, 'Invalid system_type field', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (84, 'Invalid replace_if_present flag', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (85, 'Invalid number of messages', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (88, 'Throttling error (ESME has exceeded allowed message limits)', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (97, 'Invalid Scheduled Delivery Time', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (98, 'Invalid message validity period (Expiry time)', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (99, 'Predefined Message Invalid or Not Found', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (100, 'ESME Receiver Temporary App Error Code', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (101, 'ESME Receiver Permanent App Error Code', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (102, 'ESME Receiver Reject Message Error Code', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (103, 'query_sm request failed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (192, 'Error in the optional part of the PDU Body', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (193, 'Optional Parameter not allowed', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (194, 'Invalid Parameter Length', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (195, 'Expected Optional Parameter missing', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (196, 'Invalid Optional Parameter Value', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (254, 'Delivery Failure (used for data_sm_resp)', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (255, 'Unknown Error', null, 0);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (1001, 'Not CanSend', null, 1);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (1002, 'WaitOne', null, 1);
insert into ERRORS (ID, NAME, DESCRIPTION, RESENDED)
values (1003, 'TryGetValue', null, 1);
commit;
prompt 51 records loaded
prompt Loading USER_ACTIONS...
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (11, 'Abonents::Read', 'Просмотр абонентов');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (12, 'Abonents::Write', 'Редактирование абонентов');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (13, 'Branches::Read', 'Просмотр справочника филиалов');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (14, 'Branches::Write', 'Редактирование справочника филиалов');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (15, 'Groups::Read', 'Просмотр справочника групп');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (16, 'Groups::Write', 'Редактирование справочника групп');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (17, 'User::Read', 'Просмотр справочника пользователей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (18, 'User::Write', 'Редактирование справочника пользователей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (19, 'Mailings::Read', 'Просмотр списка заданий');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (20, 'Mailings::Write', 'Создание задания');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (21, 'RoleAction::Read', 'Просмотр справочника прав и ролей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (22, 'RoleAction::Write', 'Редактирование справочников прав и ролей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (23, 'Mailings::Read::All', 'Просмотр списка заданий всех пользователей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (25, 'SingleMailings::Read', 'Просмотр одиночных сообщений');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (26, 'SingleMailings::Read::All', 'Просмотр одиночных сообщений всех пользователей');
insert into USER_ACTIONS (ID, NAME, DESCRIPTION)
values (27, 'UserWishes::Read', 'Просмотр пожеланий от пользователей');
commit;
prompt 16 records loaded
prompt Loading ROLE_ACTION_LINK...
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (20, 3, 12);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (21, 3, 11);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (22, 3, 13);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (23, 3, 14);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (24, 3, 15);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (25, 3, 16);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (26, 3, 19);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (27, 3, 20);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (28, 3, 21);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (29, 3, 22);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (30, 3, 17);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (31, 3, 18);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (32, 2, 19);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (33, 2, 20);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (34, 2, 12);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (35, 2, 11);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (36, 2, 16);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (37, 2, 15);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (38, 1, 19);
insert into ROLE_ACTION_LINK (ID, ROLE_ID, ACTION_ID)
values (39, 3, 23);
commit;
prompt 20 records loaded
prompt Loading STATUS_MSG...
insert into STATUS_MSG (ID, NAME)
values (1, 'Создана');
insert into STATUS_MSG (ID, NAME)
values (2, 'Выполняется');
insert into STATUS_MSG (ID, NAME)
values (3, 'Отправлена');
insert into STATUS_MSG (ID, NAME)
values (4, 'Ошибка');
insert into STATUS_MSG (ID, NAME)
values (5, 'Доставлена');
commit;
prompt 5 records loaded
prompt Loading SUPPORT...
insert into SUPPORT (ID, NAME, EMAIL, SMSMAIL, PHONE)
values (1, 'Герасимов Михаил Николаевич', 'GerasimovMN@khv.dv.rt.ru', '79241086744', '(4212)32-21-51');
insert into SUPPORT (ID, NAME, EMAIL, SMSMAIL, PHONE)
values (2, 'Книжник Владимир Валерьевич', 'KnizhnikVV@khv.dv.rt.ru', '79242115638', '(4212)32-22-68');
insert into SUPPORT (ID, NAME, EMAIL, SMSMAIL, PHONE)
values (3, 'Толшин Кирилл Евгеньвич', 'TolshinKE@khv.dv.rt.ru', '79098421077', '(4212)32-21-05');
insert into SUPPORT (ID, NAME, EMAIL, SMSMAIL, PHONE)
values (4, 'Турушев Николай Александрович', 'TurushevNA@khv.dv.rt.ru', '79098526895', '(4212)32-21-63');
commit;
prompt 4 records loaded
prompt Loading TYPE_TASK...
insert into TYPE_TASK (ID, NAME, PRIORITY, DESCRIPTION)
values (4, 'Массовая', 4, '( рассылки с многочисленными абонентами более 50 000, в том числе и рекламмные');
insert into TYPE_TASK (ID, NAME, PRIORITY, DESCRIPTION)
values (1, 'Служебная', 1, 'информация об авариях - высший приоритет');
insert into TYPE_TASK (ID, NAME, PRIORITY, DESCRIPTION)
values (2, 'Сервисная ', 2, 'уведомления, для которых критично время задержки, например о смене пароля, новый пароль, уведомления работы своих сервисов');
insert into TYPE_TASK (ID, NAME, PRIORITY, DESCRIPTION)
values (3, 'Уведомления', 3, 'для них не критично время задержки, например о поступлении платежа, превышения лимита использования трафика');
commit;
prompt 4 records loaded
prompt Loading USER_ACTION_LINK...
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (90, 43, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (91, 43, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (92, 43, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (93, 43, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (94, 43, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (95, 43, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (96, 43, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (97, 43, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (98, 43, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (256, 46, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (257, 46, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (258, 46, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (259, 46, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (260, 46, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (261, 46, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (262, 46, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (263, 46, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (264, 46, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (278, 36, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (280, 36, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (110, 4, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (111, 4, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (112, 4, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (113, 4, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (114, 4, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (115, 4, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (116, 4, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (202, 45, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (203, 45, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (204, 45, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (205, 45, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (206, 45, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (207, 45, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (208, 45, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (209, 45, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (210, 45, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (211, 45, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (212, 45, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (213, 45, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (214, 45, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (215, 45, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (216, 45, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (217, 45, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (218, 45, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (219, 45, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (220, 45, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (221, 45, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (222, 45, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (223, 45, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (224, 45, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (225, 45, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (226, 45, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (227, 45, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (265, 46, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (266, 46, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (267, 46, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (268, 46, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (269, 46, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (270, 46, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (272, 2, 27);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (279, 36, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (281, 36, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (282, 36, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (283, 36, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (284, 36, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (285, 36, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (286, 36, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (81, 42, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (82, 42, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (83, 42, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (84, 42, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (85, 42, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (86, 42, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (87, 42, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (88, 42, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (89, 42, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (271, 4, 27);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (275, 45, 27);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (276, 45, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (277, 45, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (273, 4, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (274, 4, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (1, 2, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (290, 36, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (12, 36, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (13, 36, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (15, 2, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (18, 2, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (19, 2, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (21, 2, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (22, 2, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (23, 2, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (26, 9, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (27, 9, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (28, 9, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (29, 9, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (30, 9, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (31, 9, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (33, 2, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (35, 2, 23);
commit;
prompt 100 records committed...
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (38, 2, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (39, 2, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (40, 2, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (41, 2, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (42, 231, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (43, 231, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (44, 231, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (45, 231, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (46, 231, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (47, 231, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (48, 231, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (49, 231, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (50, 231, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (51, 231, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (52, 231, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (53, 231, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (54, 231, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (55, 232, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (56, 232, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (57, 232, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (58, 232, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (59, 232, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (60, 232, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (61, 232, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (62, 232, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (63, 232, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (64, 232, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (65, 232, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (66, 232, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (67, 232, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (68, 233, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (117, 2, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (118, 2, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (119, 2, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (120, 2, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (121, 2, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (122, 2, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (123, 2, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (124, 2, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (125, 2, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (126, 2, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (127, 2, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (128, 2, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (129, 2, 14);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (196, 45, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (197, 45, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (198, 45, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (199, 45, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (200, 45, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (201, 45, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (230, 42, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (231, 42, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (232, 7, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (233, 7, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (234, 7, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (235, 7, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (236, 7, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (237, 43, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (238, 43, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (239, 22, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (240, 22, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (241, 6, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (242, 6, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (243, 6, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (244, 6, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (245, 6, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (246, 6, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (247, 6, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (248, 6, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (249, 6, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (289, 36, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (157, 4, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (158, 4, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (159, 4, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (160, 4, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (161, 4, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (162, 4, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (163, 4, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (164, 4, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (165, 4, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (166, 4, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (170, 4, 13);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (171, 4, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (172, 4, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (173, 4, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (174, 4, 22);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (175, 4, 21);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (176, 4, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (177, 4, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (178, 4, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (179, 4, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (182, 44, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (183, 44, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (184, 44, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (185, 44, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (186, 44, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (187, 44, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (188, 22, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (189, 22, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (190, 22, 15);
commit;
prompt 200 records committed...
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (191, 22, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (192, 22, 19);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (193, 22, 23);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (194, 22, 20);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (195, 45, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (250, 7, 11);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (251, 7, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (252, 7, 15);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (253, 7, 16);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (254, 7, 17);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (255, 7, 18);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (228, 2, 26);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (229, 2, 25);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (287, 4, 12);
insert into USER_ACTION_LINK (ID, USER_ID, ACTION_ID)
values (288, 4, 11);
commit;
prompt 215 records loaded
prompt Loading USER_BRANCHE_LINK...
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (64, 43, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (65, 3, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (66, 5, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (74, 46, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (75, 46, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (76, 46, 2);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (78, 36, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (62, 42, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (63, 2, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (67, 5, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (68, 5, 2);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (1, 22, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (2, 6, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (72, 2, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (4, 8, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (5, 9, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (7, 1, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (70, 45, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (71, 7, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (14, 37, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (77, 4, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (69, 44, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (55, 231, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (56, 232, 2);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (57, 233, 202);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (73, 2, 2);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (79, 4, 1);
insert into USER_BRANCHE_LINK (ID, USER_ID, BRANCHE_ID)
values (80, 4, 2);
commit;
prompt 28 records loaded
prompt Loading USER_TYPE_LINK...
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (1, 2, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (2, 2, 2);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (3, 2, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (4, 2, 4);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (5, 9, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (6, 22, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (29, 36, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (30, 36, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (8, 43, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (9, 43, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (10, 22, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (11, 45, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (12, 45, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (13, 45, 2);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (14, 45, 4);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (17, 4, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (18, 4, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (19, 42, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (20, 42, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (21, 7, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (22, 7, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (23, 6, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (24, 6, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (25, 46, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (26, 46, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (27, 44, 1);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (28, 44, 3);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (31, 4, 4);
insert into USER_TYPE_LINK (ID, USER_ID, TYPE_ID)
values (32, 4, 2);
commit;
prompt 29 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint FK_BRANCHE;
alter table USERS enable constraint FK_USER_ROLES;
prompt Enabling foreign key constraints for ABONENTS...
alter table ABONENTS enable constraint FK_BRANCHES_ABONENTS;
alter table ABONENTS enable constraint FK_USERS_ABONENTS;
prompt Enabling foreign key constraints for GROUPS...
alter table GROUPS enable constraint FK_USER_GROUPS;
prompt Enabling foreign key constraints for ABONENT_GROUP_LINK...
alter table ABONENT_GROUP_LINK enable constraint FK_ABONENTS_AGL;
alter table ABONENT_GROUP_LINK enable constraint FK_GROUPS_AGL;
prompt Enabling foreign key constraints for ROLE_ACTION_LINK...
alter table ROLE_ACTION_LINK enable constraint FK_ROLE_ACTIONS_LINK_ACTION_ID;
alter table ROLE_ACTION_LINK enable constraint FK_ROLE_ACTIONS_LINK_ROLE_ID;
prompt Enabling foreign key constraints for USER_ACTION_LINK...
alter table USER_ACTION_LINK enable constraint FK_USER_ACTION_LINK_USER_ID;
prompt Enabling foreign key constraints for USER_BRANCHE_LINK...
alter table USER_BRANCHE_LINK enable constraint FK_BRANCHES;
alter table USER_BRANCHE_LINK enable constraint FK_USERS_2;
prompt Enabling foreign key constraints for USER_TYPE_LINK...
alter table USER_TYPE_LINK enable constraint FK_USER_TYPE_LINK_TYPE_ID;
alter table USER_TYPE_LINK enable constraint FK_USER_TYPE_LINK_USER_ID;
prompt Enabling triggers for BRANCHES...
alter table BRANCHES enable all triggers;
prompt Enabling triggers for USER_ROLES...
alter table USER_ROLES enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for ABONENTS...
alter table ABONENTS enable all triggers;
prompt Enabling triggers for GROUPS...
alter table GROUPS enable all triggers;
prompt Enabling triggers for ABONENT_GROUP_LINK...
alter table ABONENT_GROUP_LINK enable all triggers;
prompt Enabling triggers for ERRORS...
alter table ERRORS enable all triggers;
prompt Enabling triggers for USER_ACTIONS...
alter table USER_ACTIONS enable all triggers;
prompt Enabling triggers for ROLE_ACTION_LINK...
alter table ROLE_ACTION_LINK enable all triggers;
prompt Enabling triggers for STATUS_MSG...
alter table STATUS_MSG enable all triggers;
prompt Enabling triggers for SUPPORT...
alter table SUPPORT enable all triggers;
prompt Enabling triggers for TYPE_TASK...
alter table TYPE_TASK enable all triggers;
prompt Enabling triggers for USER_ACTION_LINK...
alter table USER_ACTION_LINK enable all triggers;
prompt Enabling triggers for USER_BRANCHE_LINK...
alter table USER_BRANCHE_LINK enable all triggers;
prompt Enabling triggers for USER_TYPE_LINK...
alter table USER_TYPE_LINK enable all triggers;
set feedback on
set define on
prompt Done.
