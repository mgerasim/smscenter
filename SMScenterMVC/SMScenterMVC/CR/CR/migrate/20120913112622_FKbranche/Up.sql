alter table SMSINFOSPR add BRANCHE_ID number;
update smsinfospr set branche_id=202;
alter table SMSINFOSPR
  add constraint FK_BRANCHE_ID foreign key (BRANCHE_ID)
  references branches (ID)
