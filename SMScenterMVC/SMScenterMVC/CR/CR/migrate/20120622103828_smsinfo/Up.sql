create sequence S_SMSINFOMSG minvalue 1 maxvalue 9999999999999999 start with 1 increment by 1 cycle;
create sequence S_SMSINFOSPR minvalue 1 maxvalue 9999999999999999 start with 1 increment by 1 cycle;
create table SMSINFOSPR
(
  ID        number null,
  NAME      varchar2(255),
  PARENT_ID number
);
create table SMSINFOMSG
(
  ID            number not null,
  NAME          varchar2(255),
  TEXT          varchar2(1000),
  SMSINFOSPR_ID number
);