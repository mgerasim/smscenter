alter table MESSAGES add STARTED timestamp default sysdate;
UPDATE MESSAGES SET STARTED = sysdate;