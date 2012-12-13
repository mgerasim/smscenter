alter table SMSINFOMSG
  add constraint FK_MSG_SPR foreign key (SMSINFOSPR_ID)
  references smsinfospr (ID) on delete cascade;