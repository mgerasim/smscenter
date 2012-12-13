alter table MESSAGES drop column STARTED;
alter table MESSAGES add STARTED date default current_timestamp;
UPDATE MESSAGES SET STARTED = current_timestamp;