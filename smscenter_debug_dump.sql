prompt PL/SQL Developer import file
prompt Created on 4 Апрель 2012 г. by h02-GerasimovMN
set feedback off
set define off
prompt Disabling triggers for SMSCENTER.BRANCHES...
alter table SMSCENTER.BRANCHES disable all triggers;
prompt Disabling triggers for SMSCENTER.USER_ROLES...
alter table SMSCENTER.USER_ROLES disable all triggers;
prompt Disabling triggers for SMSCENTER.USERS...
alter table SMSCENTER.USERS disable all triggers;
prompt Disabling triggers for SMSCENTER.ABONENTS...
alter table SMSCENTER.ABONENTS disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.ABONENT_GROUP_LINK...
alter table SMSCENTER_DEBUG.ABONENT_GROUP_LINK disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.ARCHIVE_MESSAGE...
alter table SMSCENTER_DEBUG.ARCHIVE_MESSAGE disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.ERRORS...
alter table SMSCENTER_DEBUG.ERRORS disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.GROUPS...
alter table SMSCENTER_DEBUG.GROUPS disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.STATUS_MSG...
alter table SMSCENTER_DEBUG.STATUS_MSG disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.TYPE_TASK...
alter table SMSCENTER_DEBUG.TYPE_TASK disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.TASKS...
alter table SMSCENTER_DEBUG.TASKS disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.MESSAGES...
alter table SMSCENTER_DEBUG.MESSAGES disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.TEMPLATES...
alter table SMSCENTER_DEBUG.TEMPLATES disable all triggers;
prompt Disabling triggers for SMSCENTER_DEBUG.USER_BRANCHE_LINK...
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK disable all triggers;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.USERS...
alter table SMSCENTER_DEBUG.USERS disable constraint FK_USER_ROLES;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.ABONENTS...
alter table SMSCENTER_DEBUG.ABONENTS disable constraint FK_BRANCHES_ABONENTS;
alter table SMSCENTER_DEBUG.ABONENTS disable constraint FK_USERS_ABONENTS;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.GROUPS...
alter table SMSCENTER_DEBUG.GROUPS disable constraint FK_USER_GROUPS;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.TASKS...
alter table SMSCENTER_DEBUG.TASKS disable constraint FK_TYPE_TASK;
alter table SMSCENTER_DEBUG.TASKS disable constraint FK_USERS_TASKS;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.MESSAGES...
alter table SMSCENTER_DEBUG.MESSAGES disable constraint FK_STATUS_MSG;
alter table SMSCENTER_DEBUG.MESSAGES disable constraint FK_TASKS_NOTES;
alter table SMSCENTER_DEBUG.MESSAGES disable constraint FK_USERS;
prompt Disabling foreign key constraints for SMSCENTER_DEBUG.USER_BRANCHE_LINK...
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK disable constraint FK_BRANCHES;
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK disable constraint FK_USERS_2;
prompt Deleting SMSCENTER_DEBUG.USER_BRANCHE_LINK...
delete from SMSCENTER_DEBUG.USER_BRANCHE_LINK;
commit;
prompt Deleting SMSCENTER_DEBUG.TEMPLATES...
delete from SMSCENTER_DEBUG.TEMPLATES;
commit;
prompt Deleting SMSCENTER_DEBUG.MESSAGES...
delete from SMSCENTER_DEBUG.MESSAGES;
commit;
prompt Deleting SMSCENTER_DEBUG.TASKS...
delete from SMSCENTER_DEBUG.TASKS;
commit;
prompt Deleting SMSCENTER_DEBUG.TYPE_TASK...
delete from SMSCENTER_DEBUG.TYPE_TASK;
commit;
prompt Deleting SMSCENTER_DEBUG.STATUS_MSG...
delete from SMSCENTER_DEBUG.STATUS_MSG;
commit;
prompt Deleting SMSCENTER_DEBUG.GROUPS...
delete from SMSCENTER_DEBUG.GROUPS;
commit;
prompt Deleting SMSCENTER_DEBUG.ERRORS...
delete from SMSCENTER_DEBUG.ERRORS;
commit;
prompt Deleting SMSCENTER_DEBUG.ARCHIVE_MESSAGE...
delete from SMSCENTER_DEBUG.ARCHIVE_MESSAGE;
commit;
prompt Deleting SMSCENTER_DEBUG.ABONENT_GROUP_LINK...
delete from SMSCENTER_DEBUG.ABONENT_GROUP_LINK;
commit;
prompt Deleting SMSCENTER_DEBUG.ABONENTS...
delete from SMSCENTER_DEBUG.ABONENTS;
commit;
prompt Deleting SMSCENTER_DEBUG.USERS...
delete from SMSCENTER_DEBUG.USERS;
commit;
prompt Deleting SMSCENTER_DEBUG.USER_ROLES...
delete from SMSCENTER_DEBUG.USER_ROLES;
commit;
prompt Deleting SMSCENTER_DEBUG.BRANCHES...
delete from SMSCENTER_DEBUG.BRANCHES;
commit;
prompt Loading SMSCENTER_DEBUG.BRANCHES...
insert into SMSCENTER_DEBUG.BRANCHES (ID, S_NAME, NAME)
values (1, 'ХФ', 'Хабаровский филиал');
commit;
prompt 1 records loaded
prompt Loading SMSCENTER_DEBUG.USER_ROLES...
insert into SMSCENTER_DEBUG.USER_ROLES (ID, NAME, DESCRIPTION)
values (1, 'Просмотр', 'Просмотр всех имеющихся форм и данных');
insert into SMSCENTER_DEBUG.USER_ROLES (ID, NAME, DESCRIPTION)
values (2, 'Оператор', 'Добавление новых рассылок');
insert into SMSCENTER_DEBUG.USER_ROLES (ID, NAME, DESCRIPTION)
values (3, 'Администратор', 'Полные права на редактирование');
commit;
prompt 3 records loaded
prompt Loading SMSCENTER_DEBUG.USERS...
insert into SMSCENTER_DEBUG.USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID)
values (2, 'h02-tolshinke', to_date('17-02-2012', 'dd-mm-yyyy'), null, 'Толшин К.Е.', 1);
insert into SMSCENTER_DEBUG.USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID)
values (1, 'SMSCENTER', to_date('21-03-2012', 'dd-mm-yyyy'), null, 'Администратор', 3);
insert into SMSCENTER_DEBUG.USERS (ID, LOGIN, CREATED_AT, UPDATED_AT, NAME, ROLE_ID)
values (3, 'smsuser', null, null, 'Пользователи API', 1);
commit;
prompt 3 records loaded
prompt Loading SMSCENTER_DEBUG.ABONENTS...
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (1, 'Торгашин Евгений Викторович ', '79243084444', 'Заместитель Генерального директора-директор Хабаровского филиала', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (9, 'Тимощенко Нина Викторовна', '79242209030', 'Начальник службы по работе с операторами', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (17, 'Васенин Константин Александрович', '79242209019', 'Начальник отдела', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (22, 'Забаев Алексей Борисович', '79242283338', 'Начальник ', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (23, 'Насонов Максим Васильевич', '79242240045', 'Главный инженер ', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (34, 'Гиневский Валерий Мичеславович', '79246467667', 'начальник', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (35, 'Савельев Сергей Николаевич', '79246401719', 'Главный инженер', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (37, 'Баранов Анатолий Николаевич', '79242298882', 'Начальник', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (38, 'Гильдебрант Виктор Генрихович', '79242298881', 'Главный инженер', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (40, 'Говардовский Александр Иванович', '79242209002', 'Начальник узла', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (41, 'Сазанов Константин Михайлович ', '79098606602', 'Заместитель начальника узла', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (76, 'Мордвинцева Татьяна Юрьевна', '79242209029', 'Начальник ЦОВ', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (78, 'Мордвинцева Татьяна Юрьевна', '79242209029', 'Начальник ЦОВ', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (80, 'Мордвинцева Татьяна Юрьевна', '79242209029', 'начальник ЦОВ', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (82, 'Кондратьев Александр Викторович', '79242204943', 'главный инженер', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (85, 'Толшин К.Е.', '79098421077', 'программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (86, 'Тихонова Галина Николаевна', '79242209015', 'Ведущий инженер ЦБР', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (87, 'Тихонова Галина Николаевна', '79242209015', 'ведущий инженер ЦБР', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (89, 'Тихонова Галина Николаевна', '79242209015', 'ведущий инженер ЦБР', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (91, 'Шведко Галина Николаевна', '79243045762', null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (92, 'Шведко Галина Николаевна', '79243045762', null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (94, 'Шведко Галина Николаевна', '79243045762', null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (95, 'Деменко Наталья Васильевна', '79246461015', 'инженер программист 2 категории', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (96, 'Кривенок Галина Александровна', '79098861597', 'Ведущий специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (98, 'Громовик Людмила Владимировна', '79242113064', 'Специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (99, 'Кастырина О.В.', '79098419393', 'специалист Охотск', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (100, 'Печать счетов Чумикан', '79098769894', 'специалист Чумикан', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (101, 'Печать счетов Аян', '79241023051', 'специалист Аян', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (102, 'Стец Л.Л.', '79147776500', 'специалист Амурск', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (103, 'Волоскова Н.В.', '79098621337', 'специалист Чегдомын', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (104, 'Гончаренко Н.А.', '79142043267', 'специалист Переяславка', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (105, 'Кай Е.П.', '79098568346', 'специалист Богородск', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (107, 'Наприенко Елена Геннадьевна', '79145464610', 'ведущий инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (109, 'Кузнецова Елена Александровна', '79242217670', 'инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (110, 'Павленко Ирина Станиславовна', '79145461741', 'ведущий специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (111, 'Силина Г.А.', '79242298925', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (113, 'Наприенко Елена Геннадьевна', '79145464610', 'ведущий инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (114, 'Громовик Людмила Владимировна', '79242113064', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (115, 'Деменко Наталья Васильевна', '79246461015', 'начальник', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (117, 'Кривенок Галина Александровна', '79098861597', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (118, 'Кузнецова Елена Александровна', '79242217670', 'инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (120, 'Павленко Ирина Станиславовна', '79145461741', 'Специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (121, 'Силина Г.А.', '79242298925', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (123, 'Морозова Анна Николаевна', '79243040724', 'инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (125, 'Стец Л.Л.', '79147776500', 'Специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (126, 'Волоскова Н.В.', '79098621337', 'Специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (127, 'Кравченко Андрей Анатольевич', '79243042278', 'и.о.начальник ЦБР', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (128, 'программист', '79241086744', null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (130, 'Деменко Наталья Васильевна', '79648271995', 'инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (131, 'Стец Л.Л.', '79142198200', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (133, 'Деменко Наталья Васильевна', '79648271995', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (138, 'Горпиченко Т.', '79098419393', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (139, 'Васильева Т.А.', '79098769894', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (141, 'Котова И.В.', '79622998119', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (143, 'Комар Е.Н.', '79242032058', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (144, 'Гончаренко Н.А.', '79142043267', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (145, 'Кай Е.П.', '79098568346', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (146, 'Глозман А.', '79145414344', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (147, 'Глозман А.', '79145414344', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (106, 'Мамонтова В.В.', '79144118332', 'специалист Николаевск', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (119, 'Мамонтова В.В.', '79144118332', 'Специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (149, 'Попенко Валентина Прокопьевна', '79626783079', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (150, 'Попенко Валентина Прокопьевна', '79626783079', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (151, 'Специалист1', '79098592007', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (152, 'Специалист2', '79241133013', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (153, 'Специалист3', '79142139058', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (154, 'Специалист4', '79242209102', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (155, 'Специалист5', '79242209043', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (156, 'Специалист1', '79098592007', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (157, 'Специалист2', '79241133013', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (158, 'специалист3', '79142139058', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (159, 'специалист4', '79242209102', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (160, 'специалист5', '79242209043', 'специалист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (163, 'Ушакова Дина Владимировна', '79244156905', 'начальник службы инфамационно-аналитического обеспечения', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (234, 'Мерзликин Сергей Иванович', '79242209014', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (235, 'Рыбак Виталий Игоревич', '79242219994', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (236, 'Преснов Владимир Федорович', '604905', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (237, 'Минасова Евгения Владимировна', '79242209018', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (239, 'Федоров Сергей Александрович', '79141765005', 'начальник отдела систем электронного правительства и связи', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (240, 'Воронцов Дмитрий Владимирович', '79241023049', 'главный специалист отдела систем электронного правительства и связи', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (241, 'Панкратов Валерий Валерьевич', '79243080062', 'ООЭТС, ЛКС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (242, 'Деньга Виталий Геннадьевич', '79147728647', 'Начальник ООЭТС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (243, 'Рябцев Александр Юрьевич', '79243043583', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (244, 'Копырин Вадим Владимирович', '79243038007', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (245, 'Копырин Вадим Владимирович', '79243038007', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (246, 'Торгашин Евгений Викторович', '79243084444', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (247, 'Рыбак Виталий Игоревич', '79242219994', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (248, 'Шрейдер Александр Константинович', '79145433511', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (249, 'Смурова Ольга Николаевна', '79243028144', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (252, 'Назарова Марина Михайловна', '79242068893', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (253, 'Манкевич Елена Анатольевна', '79243161661', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (254, 'Кучеренко Андрей Геннадьевич', '79145425098', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (255, 'Гусев Алексей Александрович', '79243101015', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (256, 'Вертлиб Оксана Валентиновна', '79242031853', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (257, 'Специалист', '79098406731', 'специалист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (259, 'Козадаев Александр Викторович', '79242209047', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (258, 'Разуваев Александр Евгеньевич', '79242209045', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (260, 'Бажанов Алексей Александрович', '79242209102', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (261, 'Туктамышев Дмитрий Азатович', '79242298880', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (262, 'Волков Александр Алексеевич', '79244110038', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 100 records committed...
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (263, 'Калугин Василий Васильевич', '79241004334', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (264, 'Игнатовский Владимир Викторович', '79098075225', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (265, 'Ушакова Дина', '79244156905', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (266, 'Фролов Андрей Александрович', '79143180137', 'нач.энергоучастка', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (267, 'Копырин Вадим Владимирович', '79243038007', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (200, 'Старкова Наталия Владимировна', '79242209022', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (183, 'Старкова Наталия Владимировна', '79242209022', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (238, 'Старкова Наталия Владимировна', '79242209022', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (164, 'Медяник О.С', '79147768579', 'ведущий инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (165, 'Медяник О.С', '79147768579', 'ведущий инженер программист', null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (167, 'Попов Дмитрий Владимирович сл.РЕЖ. СЕКР.связи 7-924-220-90-35', null, null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (168, null, null, null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (169, 'Шрейдер Александр Константинович', '79145433511', null, null, null, to_date('04-04-2012 09:51:51', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (170, 'Смурова Ольга Николаевна', '79243028144', 'Начальник службы.продаж корпоративным клиентам', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (171, 'Куклина Евгения Александровна', '79243093185', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (172, 'Куклина Евгения Александровна', '79243093185', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (173, 'Патрин Е.А.', '79622862139', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (174, 'Санникова З.А.', '79098965942', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (175, 'Патрин Е.А.', '79622862139', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (181, 'Портнов Сергей Алексеевич', '79243022016', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (184, 'Мордвинцева Татьяна Юрьевна', '79242209029', 'начальник ЦОВ', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (185, 'Тихонова Галина Николаевна', '79242209015', 'ведущий инженер ЦБР', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (186, 'Шведко Галина Николаевна', '79243045762', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (188, 'Кравченко Андрей Анатольевич', '79243042278', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (195, 'Науменко Сергей Васильевич', '79246401730', 'начальник ЛТЦ№1 г.Биробиджан', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (196, 'Сикора Петр Иосифович', '79245401716', 'начальник ЛТЦ№2 п.Смидович', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (197, 'Колбин Олег Владимирович', '79246401720', 'начальник ЛТЦ№3 п.Облучье', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (24, 'Рафиков Ильдус Фаильевич', '79242240008', 'Начальник ЛТЦ № 4 г. Амурск', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (26, 'Журавлев Павел Николаевич', '79241004241', 'Начальник ЛТЦ № 5 п. Чегдомын', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (28, 'Романов Вячеслав Александрович', '79242083608', 'Начальник ЛТЦ № 6 с.им.П.Осипенко', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (29, 'Ждановский Михаил Витальевич', '79098097667', 'Начальник ЛТЦ№7п. Охотск', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (31, 'Дегтярев Валентин Иванович', '79241023051', 'Начальник ЛТЦ№ 8 п. Аян', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (32, 'Вьюшков Александр Ильич', '79098769894', 'Начальник ЛТЦ№ 9 п. Чумикан', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (194, 'Михайлов Александр Леонидович', '79242283335', 'начальник ЛТЦ № 1 г.Комсомольск на Амуре', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (192, 'Говардовский Александр Иванович', '79242209002', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (193, 'Семенов Андрей Викторович ', '79242219997', 'начальник ЛТЦ№ 2 п.Ванино', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (10, 'Разуваев Александр Евгеньевич', '79242209045', 'начальник', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (13, 'Калугин Василий Васильевич', '79241004334', 'Начальник ЛУ№ 2 п. Бикин', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (14, 'Туктамышев Дмитрий Азарович', '79242298880', 'Начальник ЛТЦ № 3 п. Вяземский', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (15, 'Бажанов Алексей Александрович', '79242209102', 'Начальник ЛТЦ № 2 п.Троицкий', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (177, 'Губер Галина Римовна', '79242199562', 'начальник станционного участка № 1 г.Хабаровск', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (178, 'Золотарев Максим Юрьевич', '79242209052', 'начальник  ЛУ № 1 г.Хабаровска', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (179, 'Казадаев Александр Викторович', '79242209047', 'начальник ЛУ № 2 г.Хабаровск', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (2, 'Рыбак  Виталий  Игоревич', '79242219994', 'Заместитель технического директора по эксплуатации', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (182, 'Матиенко Нина Викторовна', '79241020079', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (16, 'Ежова Наталья Владимировна', '79242209022', 'Начальник цеха передачи данных', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (199, 'Специалист6', '79098897421', 'Специалист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (202, 'Васенин Константин Александрович', '79242209019', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (203, 'Портнов Сергей Алексеевич', '79243022016', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (204, 'смена', '79242209032', 'Оперативный дежурный', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (206, 'Смурова Ольга Николаевна', '79243028144', 'Начальник службы продаж корпоративным клиентам', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (207, 'Толшин К.Е.', '79098421077', 'programmer', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (209, 'Мотов Владимир Сергеевич', '79242069887', 'Начальник отдела  технической инфраструктуры ИТ', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (83, 'Толшин Кирилл Евгеньевич', '79098421077', 'Инженер-программист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (84, 'Герасимов Михаил Николаевич', '79241086744', 'Ведущий инженер-программист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (213, 'Сапожников Дмитрий Александрович', '79147728645', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (214, 'Лебедев Дмитрий Сергеевич', '79243042624', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (217, 'Мершеев Олег Александрович', '79098688330', 'Инженер - электроник п. Ванино', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (216, 'Моргунов Максим Александрович', '79242218514', 'Ведущий Инженер - электроник г. Советская Гавань', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (219, 'Кравченко Андрей Анатольевич', '79243042278', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (220, 'Тихонова Галина Николаевна  ', '79242209015', ' ведущий инженер ', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (224, 'Кабацура Владимир Трофимович', '79243033546', 'Нач. отдела МПГОиЧС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (225, 'Ян Галина', '79145432238', 'руководитель инф.центра избирательной комиссии Хаб.края', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (226, 'Назарова Марина Михайловна', '79242068893', 'Начальник ОДС РЦУСС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (227, 'Барахтин Дмитрий Андреевич', '79142085491', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (228, 'Манкевич Елена Анатольевна  ', '79243161661', 'Начальник РЦУСС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (215, 'Вдовенко Александр', '79294087795', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (229, 'п. Переяславка', '79242298880', 'специалист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (230, 'п Переяславка', '79242298880', 'специалист', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (231, 'Кучеренко Андрей Геннадьевич', '79145425098', 'заместитель начальника РЦУСС', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (232, 'Специалист Комсомольск', '79244105166', 'Специалист Комсомольск', null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SMSCENTER_DEBUG.ABONENTS (ID, NAME, PHONE, DESCRIPRION, BRANCHE_ID, USER_ID, DATE_CREATE, DATE_MODIFY)
values (233, 'Попов Дмитрий Владимирович', '79242209035', null, null, null, to_date('04-04-2012 09:52:46', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 172 records loaded
prompt Loading SMSCENTER_DEBUG.ABONENT_GROUP_LINK...
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (1, 1, 1);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (2, 1, 2);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (3, 1, 9);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (4, 2, 10);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (5, 2, 13);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (6, 2, 14);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (7, 2, 15);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (8, 3, 16);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (9, 3, 17);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (10, 6, 22);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (11, 6, 23);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (12, 6, 24);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (13, 6, 26);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (14, 6, 28);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (15, 6, 29);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (16, 6, 31);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (17, 6, 32);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (18, 7, 34);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (19, 7, 35);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (20, 8, 37);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (21, 8, 38);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (22, 9, 40);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (23, 9, 41);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (24, 2, 76);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (25, 3, 78);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (26, 4, 80);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (27, 32, 82);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (28, 33, 83);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (29, 33, 84);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (30, 34, 85);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (31, 2, 86);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (32, 3, 87);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (33, 4, 89);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (34, 3, 91);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (35, 4, 92);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (36, 2, 94);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (37, 36, 95);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (38, 36, 96);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (39, 36, 98);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (40, 36, 99);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (41, 36, 100);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (42, 36, 101);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (43, 36, 102);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (44, 36, 103);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (45, 36, 104);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (46, 36, 105);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (47, 36, 106);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (48, 36, 107);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (49, 36, 109);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (50, 36, 110);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (51, 36, 111);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (52, 37, 113);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (53, 37, 114);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (54, 37, 115);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (55, 37, 117);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (56, 37, 118);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (57, 37, 119);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (58, 37, 120);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (59, 37, 121);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (60, 37, 123);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (61, 37, 125);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (62, 37, 126);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (63, 2, 127);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (64, 39, 128);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (65, 36, 130);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (66, 36, 131);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (67, 37, 133);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (68, 37, 138);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (69, 37, 139);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (70, 37, 141);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (71, 37, 143);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (72, 37, 144);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (73, 37, 145);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (74, 37, 146);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (75, 36, 147);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (76, 36, 149);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (77, 37, 150);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (78, 37, 151);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (79, 37, 152);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (80, 37, 153);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (81, 37, 154);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (82, 37, 155);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (83, 36, 156);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (84, 36, 157);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (85, 36, 158);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (86, 36, 159);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (87, 36, 160);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (88, 1, 163);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (89, 37, 164);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (90, 36, 165);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (91, 40, 167);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (93, 1, 169);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (94, 42, 170);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (95, 37, 171);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (96, 36, 172);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (97, 37, 173);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (98, 37, 174);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (99, 36, 175);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (100, 2, 177);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (101, 2, 178);
commit;
prompt 100 records committed...
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (102, 2, 179);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (103, 43, 181);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (104, 43, 182);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (105, 43, 183);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (106, 43, 184);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (107, 43, 185);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (108, 43, 186);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (109, 3, 188);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (110, 32, 192);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (111, 32, 193);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (112, 6, 194);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (113, 7, 195);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (114, 7, 196);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (115, 7, 197);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (116, 37, 199);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (117, 44, 200);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (118, 44, 202);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (119, 44, 203);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (120, 31, 204);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (121, 1, 206);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (122, 45, 207);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (123, 4, 209);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (124, 47, 213);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (125, 4, 214);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (126, 5, 215);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (127, 32, 216);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (128, 32, 217);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (129, 1, 219);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (130, 1, 220);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (131, 48, 224);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (132, 1, 225);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (133, 1, 226);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (134, 47, 227);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (135, 1, 228);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (136, 36, 229);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (137, 37, 230);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (138, 1, 231);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (139, 37, 232);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (140, 50, 233);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (141, 50, 234);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (142, 50, 235);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (143, 50, 236);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (144, 50, 237);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (145, 50, 238);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (146, 51, 239);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (147, 51, 240);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (148, 52, 241);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (149, 52, 242);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (150, 5, 243);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (151, 1, 244);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (152, 2, 245);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (153, 53, 246);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (154, 53, 247);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (155, 53, 248);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (156, 53, 249);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (157, 53, 252);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (158, 53, 253);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (159, 53, 254);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (160, 53, 255);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (161, 53, 256);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (162, 36, 257);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (163, 54, 258);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (164, 54, 259);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (165, 54, 260);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (166, 54, 261);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (167, 54, 262);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (168, 54, 263);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (169, 54, 264);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (170, 53, 265);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (171, 5, 266);
insert into SMSCENTER_DEBUG.ABONENT_GROUP_LINK (ID, GROUP_ID, ABONENT_ID)
values (172, 54, 267);
commit;
prompt 171 records loaded
prompt Loading SMSCENTER_DEBUG.ARCHIVE_MESSAGE...
prompt Table is empty
prompt Loading SMSCENTER_DEBUG.ERRORS...
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (0, 'No Error', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (1, 'Message Length is invalid', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (2, 'Command Length is invalid', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (3, 'Invalid Command ID', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (4, 'Incorrect BIND Status for given command', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (5, 'ESME Already in Bound State', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (6, 'Invalid Priority Flag', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (7, 'Invalid Registered Delivery Flag', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (8, 'System Error', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (10, 'Invalid Source Address', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (11, 'Invalid Dest Addr', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (12, 'Message ID is invalid', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (13, 'bind Failed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (14, 'Invalid Password', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (15, 'Invalid System ID', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (17, 'Cancel SM Failed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (19, 'Replace SM Failed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (20, 'Message Queue Full', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (21, 'Invalid Service Type', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (51, 'Invalid number of destinations', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (52, 'Invalid Distribution List name', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (64, 'Destination flag is invalid(submit_multi)', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (66, 'Invalid `submit with replace? request(i.e. submit_sm with replace_if_present_flag set)', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (67, 'Invalid esm_class field data', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (68, 'Cannot Submit to Distribution List', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (69, 'submit_sm or submit_multi failed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (72, 'Invalid Source address TON', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (73, 'Invalid Source address NPI', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (80, 'Invalid Destination address TON', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (81, 'Invalid Destination address NPI', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (83, 'Invalid system_type field', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (84, 'Invalid replace_if_present flag', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (85, 'Invalid number of messages', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (88, 'Throttling error (ESME has exceeded allowed message limits)', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (97, 'Invalid Scheduled Delivery Time', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (98, 'Invalid message validity period (Expiry time)', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (99, 'Predefined Message Invalid or Not Found', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (100, 'ESME Receiver Temporary App Error Code', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (101, 'ESME Receiver Permanent App Error Code', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (102, 'ESME Receiver Reject Message Error Code', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (103, 'query_sm request failed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (192, 'Error in the optional part of the PDU Body', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (193, 'Optional Parameter not allowed', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (194, 'Invalid Parameter Length', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (195, 'Expected Optional Parameter missing', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (196, 'Invalid Optional Parameter Value', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (254, 'Delivery Failure (used for data_sm_resp)', null);
insert into SMSCENTER_DEBUG.ERRORS (ID, NAME, DESCRIPTION)
values (255, 'Unknown Error', null);
commit;
prompt 48 records loaded
prompt Loading SMSCENTER_DEBUG.GROUPS...
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (27, 'Новая группа', 'Диспетчер СОУ', 1, 1, to_date('28-07-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (28, 'sdfsdfsdf', 'Диспетчер СОУ', 1, 1, to_date('28-07-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (23, 'СПС', 'Иванов Иван Иванович', 1, 1, to_date('26-07-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (29, '123', 'Диспетчер СОУ', 1, 1, to_date('18-08-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (30, 'СОУ', 'Диспетчер СОУ', 1, 1, to_date('23-08-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (9, 'Оповещение при авариях на сетях РУЭС Советская Гавань', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (35, 'test3', 'Иванов Иван Иванович', 1, 1, to_date('23-09-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (36, 'Печать счетов для организаций', 'Наприенко Елена Геннадьевна', 1, 1, to_date('03-11-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (34, 'test2', 'Иванов Иван Иванович', 1, 1, to_date('23-09-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (37, 'Печать счетов для населения', 'Наприенко Елена Геннадьевна', 1, 1, to_date('04-12-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (38, 'программист', 'Диспетчер СОУ', 1, 1, to_date('20-12-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (40, 'Попов  Д.В   89242209035', 'Диспетчер СОУ', 1, 1, to_date('15-02-2011', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (41, '15 служба спец. связи', 'Диспетчер СОУ', 1, 1, to_date('15-02-2011', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (43, 'оповещение при авариях на городской ЦТЭТ г.Хабаровск', 'Диспетчер СОУ', 1, 1, to_date('31-03-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (8, 'Оповещение при авариях на сетях межрайонного ЦТЭТ Николаевск на Амуре', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (32, 'Оповещение при авариях на сетях межрайонного ЦТЭТ СовГавань', 'Диспетчер СОУ', 1, 1, to_date('21-09-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (6, 'Оповещение при авариях на сетях межрайонного ЦТЭТ г.Комсомольск на Амуре', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (7, 'Оповещение при авариях на сетях межрайонного ЦТЭТ г. Биробиджана', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (3, 'Оповещение при авариях СПД', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (44, 'Оповещение по авариям СПД', 'Диспетчер СОУ', 1, 1, to_date('11-05-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (31, 'СОУ', 'Диспетчер СОУ', 1, 1, to_date('23-08-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (39, 'програмист', 'Диспетчер СОУ', 1, 1, to_date('20-12-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (45, 'Мониторинг черных СТК-карт', 'Иванов Иван Иванович', 1, 1, to_date('06-06-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (42, 'Начальник службы.продаж корпоративным клиентам', 'Диспетчер СОУ', 1, 1, to_date('01-03-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (46, 'Ковтун Андрей Викторович', 'Диспетчер СОУ', 1, 1, to_date('06-07-2011', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (33, 'Программисты группы спец.программных систем', 'Иванов Иван Иванович', 1, 1, to_date('23-09-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (47, 'оповещение при авариях на сетях ТЦТЭТ', 'Диспетчер СОУ', 1, 1, to_date('22-07-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (48, 'ЧС', 'Диспетчер СОУ', 1, 1, to_date('14-08-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (49, 'Оповещение при хищениях и порче имущества', 'Диспетчер СОУ', 1, 1, to_date('09-12-2011', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (50, 'Оповещение при хищениях и порче имущества', 'Диспетчер СОУ', 1, 1, to_date('09-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (51, 'оповещение правительства края', 'Диспетчер СОУ', 1, 1, to_date('13-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (52, 'отдел организации эксплуатации транспортной сети', 'Диспетчер СОУ', 1, 1, to_date('19-12-2011', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (4, 'Оповещение при авариях программного обеспечения', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (1, 'Оповещение по авариям категории С1', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (53, 'оповещение при авариях С1', 'Диспетчер СОУ', 1, 1, to_date('26-01-2012', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (2, 'Оповещение при авариях на межрайонном ЦТЭТ г.Хабаровск', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 't');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (54, 'оповещение при авариях на сетях межрайонного ЦТЭТ г.Хабаровска', 'Диспетчер СОУ', 1, 1, to_date('09-02-2012', 'dd-mm-yyyy'), null, 'f');
insert into SMSCENTER_DEBUG.GROUPS (ID, NAME, DESCRIPTION, BRANCHES_ID, USER_ID, DATE_CREATE, DATE_MODIFY, IS_DELETE)
values (5, 'Оповещение при авариях на электросетях', null, 1, 1, to_date('28-05-2010', 'dd-mm-yyyy'), null, 'f');
commit;
prompt 38 records loaded
prompt Loading SMSCENTER_DEBUG.STATUS_MSG...
insert into SMSCENTER_DEBUG.STATUS_MSG (ID, NAME)
values (1, 'Создана');
insert into SMSCENTER_DEBUG.STATUS_MSG (ID, NAME)
values (2, 'Выполняется');
insert into SMSCENTER_DEBUG.STATUS_MSG (ID, NAME)
values (3, 'Завершена');
insert into SMSCENTER_DEBUG.STATUS_MSG (ID, NAME)
values (4, 'Ошибка');
commit;
prompt 4 records loaded
prompt Loading SMSCENTER_DEBUG.TYPE_TASK...
insert into SMSCENTER_DEBUG.TYPE_TASK (ID, NAME, PRIORITY)
values (1, '?????????', 1);
insert into SMSCENTER_DEBUG.TYPE_TASK (ID, NAME, PRIORITY)
values (2, '?????????', 2);
insert into SMSCENTER_DEBUG.TYPE_TASK (ID, NAME, PRIORITY)
values (3, '?????????', 3);
commit;
prompt 3 records loaded
prompt Loading SMSCENTER_DEBUG.TASKS...
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10032, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10047, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10051, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10131, 'TEST', to_date('16-02-2012 15:35:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10062, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10133, 'TEST', to_date('16-02-2012 15:38:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10002, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10003, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10004, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10069, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10008, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10028, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10029, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10161, 'MyTest3', to_date('21-03-2012 20:13:37', 'dd-mm-yyyy hh24:mi:ss'), null, 2, 1, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10001, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10025, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10104, 'TEST', to_date('16-02-2012 14:30:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10066, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10073, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10158, 'MyTest', to_date('21-03-2012 20:04:03', 'dd-mm-yyyy hh24:mi:ss'), null, 3, 1, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (0, 'Default', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10054, 'TEST', null, to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10097, 'TEST', to_date('16-02-2012 14:27:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10098, 'TEST', to_date('16-02-2012 14:27:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10099, 'TEST', to_date('16-02-2012 14:27:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10100, 'TEST', to_date('16-02-2012 14:28:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10101, 'TEST', to_date('16-02-2012 14:29:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10102, 'TEST', to_date('16-02-2012 14:29:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10103, 'TEST', to_date('16-02-2012 14:29:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2012 15:39:03', 'dd-mm-yyyy hh24:mi:ss'), 1, null, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10179, 'тестовое', to_date('29-03-2012 08:45:53', 'dd-mm-yyyy hh24:mi:ss'), null, 1, 1, 0, null);
insert into SMSCENTER_DEBUG.TASKS (ID, NAME, CREATED_AT, UPDATED_AT, TYPE_TASK_ID, USER_ID, GROUP_MSG, MESSAGE)
values (10178, 'default', to_date('28-03-2012 12:27:35', 'dd-mm-yyyy hh24:mi:ss'), null, 1, null, 0, null);
commit;
prompt 31 records loaded
prompt Loading SMSCENTER_DEBUG.MESSAGES...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10231, '79241086744', to_date('29-03-2012 09:10:57', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Пользователь API', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10232, '79241086744', to_date('29-03-2012 10:07:11', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Пользователь API', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10243, '79025060691', to_date('30-03-2012 00:35:28', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10244, '79025060691', to_date('30-03-2012 00:49:27', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10245, '79025060691', to_date('30-03-2012 00:50:38', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10246, '79025060691', to_date('30-03-2012 00:52:40', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10247, '79025060691', to_date('30-03-2012 00:55:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10248, '79025060691', to_date('30-03-2012 00:57:15', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10255, '79242123628', to_date('30-03-2012 15:02:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л/с: 2200292918; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10256, '79502875042', to_date('30-03-2012 15:02:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л/с: 102219542345; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10290, '79147088536', to_date('30-03-2012 16:29:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:29:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28124942360; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10291, '79024845733', to_date('30-03-2012 16:34:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102187242340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10292, '79024845733', to_date('30-03-2012 16:34:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102187242340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10293, '79024845733', to_date('30-03-2012 16:34:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102187242340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10294, '79244808382', to_date('30-03-2012 16:34:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243521665; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10295, '79624166122', to_date('30-03-2012 16:36:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10296, '79024834062', to_date('30-03-2012 16:40:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101796042320; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10297, '79024834062', to_date('30-03-2012 16:40:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101796042320; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10298, '79024834062', to_date('30-03-2012 16:40:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:41:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101796042320; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10299, '79142041064', to_date('30-03-2012 16:41:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:41:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000091147; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10300, '79626735422', to_date('30-03-2012 16:45:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:45:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350016329; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10301, '79622995592', to_date('30-03-2012 16:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380009838; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 1 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 10 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10302, '79098409859', to_date('30-03-2012 16:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350003186; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Отделение сберегательного банка 9070/90799; сумма 4 025 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 743 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10303, '79242064775', to_date('30-03-2012 16:56:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000776725; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Отделение сберегательного банка 9070/26; сумма 509 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -280 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10309, '79242064775', to_date('30-03-2012 17:25:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:25:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000776725; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Отделение сберегательного банка 9070/26; сумма 509 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 229 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10327, '79140839019', to_date('30-03-2012 19:51:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242261748; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10328, '79140839019', to_date('30-03-2012 19:51:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242261748; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10329, '79024838255', to_date('30-03-2012 19:55:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'test', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10331, '79140745639', to_date('30-03-2012 20:12:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:13:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10332, '79140745639', to_date('30-03-2012 20:13:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:13:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10336, '79242559257', to_date('30-03-2012 20:54:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:54:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101987142360; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10337, '79142063414', to_date('30-03-2012 20:57:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:58:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 633001  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10338, '79635675387', to_date('30-03-2012 21:44:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 21:44:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10339, '79089698373', to_date('30-03-2012 21:51:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 21:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10235, '79025060691', to_date('29-03-2012 15:09:30', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Test', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10236, '79025060691', to_date('29-03-2012 18:56:45', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Test', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10238, '70000060691', to_date('29-03-2012 18:59:03', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 4, 'Test', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10252, '79098785332', to_date('30-03-2012 14:59:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л/с: 2350018932; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10253, '79098785332', to_date('30-03-2012 14:59:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л/с: 2350018932; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10254, '79089957694', to_date('30-03-2012 15:00:51', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Л.с. 68734942320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ВЦЭС; сумма 1 260 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10340, '79089698373', to_date('30-03-2012 21:52:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 21:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10342, '79140832578', to_date('30-03-2012 22:00:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 22:00:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242233465; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10343, '79142052769', to_date('30-03-2012 22:06:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 22:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 998449  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10344, '79147219912', to_date('30-03-2012 22:24:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 22:24:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10345, '79142151701', to_date('30-03-2012 23:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 23:27:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10346, '79241879717', to_date('30-03-2012 23:41:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 23:41:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10347, '79147425842', to_date('31-03-2012 00:40:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 00:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10348, '79242613272', to_date('31-03-2012 00:46:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 00:47:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 776640  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10349, '79621539540', to_date('31-03-2012 01:58:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 01:58:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 181087  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10350, '79098054307', to_date('31-03-2012 02:18:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 02:18:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10351, '79502956606', to_date('31-03-2012 07:52:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 07:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10352, '79143966563', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10353, '79089731587', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 87166942357; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 252 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10354, '79089952120', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 61413242320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 055 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10355, '79089952120', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 61413242320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 055 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10356, '79146877112', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoe-077805 на 257 121 897 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10357, '79246406733', to_date('31-03-2012 08:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoelns20101118171042 на 380 306 386 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10358, '79625858289', to_date('31-03-2012 08:29:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 08:30:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10359, '79638255639', to_date('31-03-2012 10:01:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10360, '79145841128', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10361, '79025243267', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1222537597 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10362, '79242281152', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700118195; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10363, '79635675387', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350019984; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10364, '79140745639', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102193542335; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10365, '79146580333', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102006942320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10366, '79141724708', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380013641; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10367, '79502880651', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101639342320; дата: 31.03.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10368, '79144171371', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:02:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380019444; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash Region 750)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10369, '79242124665', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000476088; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Таун 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10370, '79242124665', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000476088; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10169, '78002223344', null, null, 10047, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10206, '79098526895', to_date('21-03-2012 20:40:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 20:40:53', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, '''Домой идёшь? Колян Т.''', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10171, '78002223344', null, null, 10051, 2, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10180, '78002223344', null, null, 10062, 2, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10207, '79242154780', to_date('21-03-2012 20:42:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 20:42:29', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Домой идёшь? Колян Т. :)', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10208, '79241086744', to_date('22-03-2012 12:19:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-03-2012 12:19:21', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Привет! Миша посмотри рабочую почту. Просят временно входящие СМС пересылать не в eFlow, а на e-mail.', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10209, '79098526895', to_date('22-03-2012 12:33:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-03-2012 12:33:33', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Привет! Миша посмотри рабочую почту. Просят временно входящие СМС пересылать не в eFlow, а на e-mail.', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10190, '79098526895', to_date('21-03-2012 11:15:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 12:47:37', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'ТестимТестим', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10191, '79098526895', to_date('21-03-2012 13:13:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 13:14:01', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'ТестимТестим', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10192, '79147768200', to_date('21-03-2012 13:28:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 13:28:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Тестирование смс АКОС', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10196, '79147768200', to_date('21-03-2012 13:30:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 13:45:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Срок выявления и устранения технической проблемы по Вашей заявке №_____требует дополнительного времени для решения. По результатам про', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10199, '79147768200', to_date('21-03-2012 14:28:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 14:28:42', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № _____находиться на стадии выявления и устранения технических проблем.', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10200, '79098526895', to_date('21-03-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 14:28:54', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № _____находиться на стадии выявления и устранения технических проблем.', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10202, '79098526895', to_date('21-03-2012 19:14:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 19:15:05', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка #', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10203, '79098526895', to_date('21-03-2012 19:42:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 19:42:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Test', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10182, '78002223344', null, null, 10066, 2, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10189, '79098526895', to_date('20-03-2012 20:36:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 12:46:13', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Test Тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10158, '79098421077', to_date('11-03-2012 17:26:28', 'dd-mm-yyyy hh24:mi:ss'), null, 10001, 3, '1', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10204, '79098526895', to_date('21-03-2012 19:43:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2012 19:43:47', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Test2', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10172, '78002223344', null, null, 10054, 2, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10110, '79241086744', null, null, 10008, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10111, '79241086744', null, to_date('02-03-2012 13:51:16', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10112, '79241086744', null, to_date('02-03-2012 13:51:23', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10113, '79241086744', null, to_date('02-03-2012 13:51:26', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10114, '79241086744', null, to_date('02-03-2012 13:54:22', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10115, '79241086744', null, to_date('02-03-2012 13:58:14', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10116, '79241086744', null, to_date('02-03-2012 14:00:50', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10117, '79241086744', null, to_date('02-03-2012 14:02:28', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10118, '79241086744', null, to_date('02-03-2012 14:02:31', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10119, '79241086744', null, to_date('02-03-2012 14:03:14', 'dd-mm-yyyy hh24:mi:ss'), 10001, 3, 'SMS тест', null, null);
commit;
prompt 100 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10120, '79241086744', null, to_date('02-03-2012 14:03:18', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10121, '79241086744', null, to_date('02-03-2012 14:03:21', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10122, '79241086744', null, to_date('02-03-2012 14:03:24', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10123, '79241086744', null, to_date('02-03-2012 14:03:27', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10124, '79241086744', null, to_date('02-03-2012 14:03:30', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10125, '79241086744', null, to_date('02-03-2012 14:05:05', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10126, '79241086744', null, to_date('02-03-2012 14:05:08', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10127, '79241086744', null, to_date('02-03-2012 14:05:11', 'dd-mm-yyyy hh24:mi:ss'), 10001, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10128, '79241086744', null, to_date('02-03-2012 14:06:12', 'dd-mm-yyyy hh24:mi:ss'), 10002, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10129, '79241086744', null, to_date('02-03-2012 14:06:15', 'dd-mm-yyyy hh24:mi:ss'), 10002, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10130, '79241086744', null, to_date('02-03-2012 14:06:18', 'dd-mm-yyyy hh24:mi:ss'), 10002, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10131, '79241086744', null, to_date('02-03-2012 14:06:21', 'dd-mm-yyyy hh24:mi:ss'), 10002, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10132, '79241086744', null, to_date('02-03-2012 14:08:04', 'dd-mm-yyyy hh24:mi:ss'), 10002, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10133, '79241086744', null, to_date('02-03-2012 14:08:07', 'dd-mm-yyyy hh24:mi:ss'), 10002, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10134, '79241086744', null, to_date('02-03-2012 14:08:10', 'dd-mm-yyyy hh24:mi:ss'), 10002, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10135, '79241086744', null, to_date('02-03-2012 14:19:25', 'dd-mm-yyyy hh24:mi:ss'), 10002, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10136, '79241086744', null, to_date('02-03-2012 14:19:31', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10137, '79241086744', null, to_date('02-03-2012 14:22:39', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10138, '79241086744', null, to_date('02-03-2012 14:22:45', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10139, '79241086744', null, to_date('02-03-2012 15:00:13', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10140, '79241086744', null, to_date('02-03-2012 15:00:19', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10141, '79241086744', null, to_date('02-03-2012 15:00:25', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10142, '79241086744', null, to_date('02-03-2012 15:00:31', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10143, '79241086744', null, to_date('02-03-2012 15:00:37', 'dd-mm-yyyy hh24:mi:ss'), 10003, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10144, '79241086744', null, to_date('02-03-2012 15:00:43', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10145, '79241086744', null, to_date('02-03-2012 15:00:49', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10146, '79241086744', null, to_date('02-03-2012 15:00:55', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10147, '79241086744', null, to_date('02-03-2012 15:04:43', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10148, '79241086744', null, to_date('02-03-2012 15:04:49', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10149, '79241086744', null, to_date('21-03-2012 09:19:34', 'dd-mm-yyyy hh24:mi:ss'), 10004, 4, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10150, '79241086744', null, to_date('30-03-2012 14:18:39', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10151, '79241086744', null, to_date('30-03-2012 14:18:39', 'dd-mm-yyyy hh24:mi:ss'), 10004, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10152, '79241086744', null, to_date('30-03-2012 14:18:39', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10153, '79241086744', null, to_date('30-03-2012 14:18:39', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10154, '79241086744', null, to_date('30-03-2012 14:18:39', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10155, '79241086744', null, to_date('30-03-2012 15:35:55', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10156, '79241086744', null, to_date('30-03-2012 15:35:55', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10157, '79241086744', null, to_date('30-03-2012 15:35:55', 'dd-mm-yyyy hh24:mi:ss'), 10008, 3, 'SMS тест', null, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10229, '79241086744', to_date('29-03-2012 08:39:01', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'тест', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10230, '79241086744', to_date('29-03-2012 08:46:32', 'dd-mm-yyyy hh24:mi:ss'), null, 10179, 3, 'тестовое', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10250, '79098710147', to_date('30-03-2012 14:48:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 14:48:39', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350001709; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10257, '79146092474', to_date('30-03-2012 15:11:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:35:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75094941651; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10258, '79146092474', to_date('30-03-2012 15:11:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:35:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75094941651; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10261, '79147386004', to_date('30-03-2012 15:16:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 20309842320; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10262, '79242446034', to_date('30-03-2012 15:17:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 82278442373; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Дальнегорск ЦОК; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 102 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10263, '79146092474', to_date('30-03-2012 15:26:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75094941651; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10276, '87772223344', to_date('30-03-2012 16:02:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, '71112223344', 1, 11);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10279, '79245288988', to_date('30-03-2012 16:12:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102135942340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10280, '79245288988', to_date('30-03-2012 16:12:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102135942340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10281, '79245288988', to_date('30-03-2012 16:12:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102135942340; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10305, '79141792393', to_date('30-03-2012 17:08:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380019748; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 820 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10228, '79242154780', to_date('28-03-2012 12:30:16', 'dd-mm-yyyy hh24:mi:ss'), null, 10178, 3, 'тест', null, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10233, '79098526895', to_date('29-03-2012 12:26:30', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Pora obedat`', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10234, '79098526895', to_date('29-03-2012 12:27:58', 'dd-mm-yyyy hh24:mi:ss'), null, 0, 3, 'Пора обедать.', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10249, '79241086744', to_date('30-03-2012 11:13:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 14:16:39', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'test', 1, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10264, '79241966790', to_date('30-03-2012 15:29:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 424532228; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: КАССА: (С-КУРИЛЬСК ППП-1); сумма 141 руб.;' || chr(10) || 'поставщик: ОАО "МТТ";' || chr(10) || 'состояние счета по поставщику: -3 631 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10267, '79024890810', to_date('30-03-2012 15:39:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:39:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 82318842320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 510 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 257 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10269, '79242450854', to_date('30-03-2012 15:44:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:44:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22204542335; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Большой Камень ЦОК; сумма 1 350 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 47 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10270, '79243321324', to_date('30-03-2012 15:46:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102223642345; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10271, '79243321324', to_date('30-03-2012 15:46:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102223642345; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10272, '79242448487', to_date('30-03-2012 15:51:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102203142335; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10273, '79147356617', to_date('30-03-2012 15:54:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24250042352; дата платежа 27.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 440 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10274, '79084488915', to_date('30-03-2012 15:57:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:57:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 35538342320; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 461 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 268 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10275, '79140745639', to_date('30-03-2012 15:57:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:58:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102193542335; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10277, '79247280888', to_date('30-03-2012 16:03:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101765942340; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Уссурийск ЦОК 1; сумма 1 250 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 17 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10278, '79242448487', to_date('30-03-2012 16:07:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102203142335; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10287, '79532296270', to_date('30-03-2012 16:26:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:26:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102146842320; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10289, '79147088536', to_date('30-03-2012 16:28:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:28:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28124942360; дата: 26.03.2012; ' || chr(10) || 'подключена услуга (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-минимум Сити 1024 Кбит/с) Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10306, '79502990550', to_date('30-03-2012 17:18:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:18:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13601642320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 70 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 333 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10307, '79622995592', to_date('30-03-2012 17:23:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:24:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380009838; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 1 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 210 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10308, '79098409859', to_date('30-03-2012 17:23:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:24:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350003186; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Отделение сберегательного банка 9070/90799; сумма 4 025 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 5 767 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10310, '79025572572', to_date('30-03-2012 17:28:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:29:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4459242320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК; сумма 3 728 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10311, '79241260122', to_date('30-03-2012 17:50:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10312, '79243091905', to_date('30-03-2012 17:55:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1219338336 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10313, '79243091905', to_date('30-03-2012 17:55:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1219338336 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10315, '79024838255', to_date('30-03-2012 18:14:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:15:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'test', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10316, '79142041064', to_date('30-03-2012 18:17:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:17:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000091147; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10323, '79241112237', to_date('30-03-2012 19:03:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10333, '79246772635', to_date('30-03-2012 20:13:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:13:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73921441620; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 990 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 641 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10341, '79624166122', to_date('30-03-2012 21:57:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 21:57:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242224017; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10251, '79024838255', to_date('30-03-2012 14:51:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 14:51:39', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'test', 3, null);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10259, '79146092474', to_date('30-03-2012 15:11:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75094941651; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10260, '79241438155', to_date('30-03-2012 15:12:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:37:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73731441654; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10265, '79242605460', to_date('30-03-2012 15:36:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:37:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1216574510 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10268, '79098526895', to_date('30-03-2012 15:40:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60412142360; период Ноябрь   2011' || chr(10) || 'ОАО "Ростелеком": Начислено=1 272 руб. Оплачено=1 300 руб. К оплате=1 236 руб.' || chr(10) || 'РИО "Панорама": Начислено=80 руб. Оплачено=0 руб. К оплате=80 руб.' || chr(10) || 'Газета "Раз в неделю": Начислено=66 руб. Оплачено=0 руб. К оплате=66 руб.' || chr(10) || 'Редакция газеты "Выбор": Начислено=207 руб. Оплачено=0 руб. К оплате=207 руб.' || chr(10) || 'Газета "Из рук в руки": Начислено=220 руб. Оплачено=0 руб. К оплате=220 руб.' || chr(10) || 'ООО "Реклама+ТВ": Начислено=144 руб. Оплачено=0 руб. К оплате=144 руб.' || chr(10) || 'Газета "Владивосток": Начислено=192 руб. Оплачено=0 руб. К оплате=192 руб.' || chr(10) || 'МУП "Редакция газеты "Вести": Начислено=120 руб. Оплачено=0 руб. К оплате=120 руб.' || chr(10) || '', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10282, '79147073449', to_date('30-03-2012 16:13:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:14:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 36657442320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ОАО АКБ "ПРИМОРЬЕ"; сумма 988 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 279 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10283, '79025228992', to_date('30-03-2012 16:13:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:14:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1241772250 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10284, '79098594403', to_date('30-03-2012 16:15:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:16:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200144665; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ОТА): ' || chr(10) || 'АОН', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10285, '79142122378', to_date('30-03-2012 16:17:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:18:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000103245; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10286, '79242531540', to_date('30-03-2012 16:18:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:19:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67071342360; дата: 30.03.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Мой Ростелеком"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10288, '79532296270', to_date('30-03-2012 16:26:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 16:26:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102146842320; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10304, '79147070777', to_date('30-03-2012 16:59:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 17:00:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 31457742334; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 834 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10314, '79145827186', to_date('30-03-2012 18:02:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 45718841620; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: КАССА 16 ЦОК 3 БЛАГОВЕЩЕНСК; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 031 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10317, '79246401119', to_date('30-03-2012 18:41:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:42:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2221596101  произошло изменение пароля в Личный кабинет', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10318, '79141679149', to_date('30-03-2012 18:44:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:44:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10319, '79141679149', to_date('30-03-2012 18:44:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:44:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10320, '79242658096', to_date('30-03-2012 18:54:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:54:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53229442361; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ОАО АКБ "ПРИМОРЬЕ"; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 47 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10321, '79148121637', to_date('30-03-2012 18:57:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 18:58:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10322, '79622255685', to_date('30-03-2012 19:03:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000728065; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Платежная система Е-ПОРТ; сумма 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 331 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10324, '79241112237', to_date('30-03-2012 19:04:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
commit;
prompt 200 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10325, '79242621397', to_date('30-03-2012 19:40:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 59950342340; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 901 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10326, '79142183980', to_date('30-03-2012 19:48:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 19:48:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380019490; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10330, '79098635689', to_date('30-03-2012 20:08:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 711696  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10334, '79147280702', to_date('30-03-2012 20:35:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 91754942361; дата: 30.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10335, '79147280702', to_date('30-03-2012 20:35:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2012 20:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 91754942361; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10489, '79621255562', to_date('31-03-2012 19:02:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244164651; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10494, '79245285008', to_date('31-03-2012 19:11:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1289886704 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10495, '79143268417', to_date('31-03-2012 19:11:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102060942335; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10496, '79147728647', to_date('31-03-2012 19:30:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:30:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 251128  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10504, '79242097347', to_date('31-03-2012 21:54:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 21:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2210606343; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10506, '79145714971', to_date('01-04-2012 04:09:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 04:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с.: 72101241643; период расчета: Март     2012;состояние счета: ' || chr(10) || 'ОАО "Ростелеком" = -1 182,90 руб.;', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10518, '79141882857', to_date('01-04-2012 10:02:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10519, '79532272811', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10520, '79644364664', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 62702442340; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10521, '79644364664', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 62702442340; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10522, '79241944718', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437104998; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 256 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10523, '79621020509', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244245680; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10524, '79241944718', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437104998; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10525, '79241944718', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437104998; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10526, '79241944718', to_date('01-04-2012 10:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437104998; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10527, '79621168875', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242271231; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Traffic Region)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10528, '79020692605', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 71496142356; дата: 01.04.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10529, '79020692605', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 71496142356; дата: 01.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10530, '79141724039', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010201; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10531, '79145578875', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27085041620; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10532, '79622851756', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46597241620; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10533, '79145578875', to_date('01-04-2012 10:02:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27085041620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10534, '79145578875', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27085041620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10535, '79145578875', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27085041620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10536, '79622851756', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46597241620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10537, '79622851756', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46597241620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10538, '79622851756', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46597241620; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10539, '79089881536', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 32935342373; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Region Traffic 2000)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10540, '79098973711', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000094479; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10541, '79149661063', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 6098242320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Office 40)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10542, '79084423133', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 494442320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Office 200)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10543, '79084423133', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 494442320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Office 200)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10411, '79242473529', to_date('31-03-2012 10:05:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 50013142345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10483, '79622982110', to_date('31-03-2012 18:12:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2700061573; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 675 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10590, '79621117061', to_date('01-04-2012 13:23:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:24:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10591, '79621547223', to_date('01-04-2012 13:35:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:36:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10592, '79621547223', to_date('01-04-2012 13:36:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:36:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10593, '79621547223', to_date('01-04-2012 13:36:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:36:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10594, '79621547223', to_date('01-04-2012 13:36:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10595, '79621547223', to_date('01-04-2012 13:36:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10596, '79621547223', to_date('01-04-2012 13:37:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10597, '79621547223', to_date('01-04-2012 13:37:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10598, '79621547223', to_date('01-04-2012 13:37:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Информационная SMS-рассылка от ОАО "Ростелеком"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10599, '79621547223', to_date('01-04-2012 13:37:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:38:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244411038; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Информационная SMS-рассылка от ОАО "Ростелеком"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10600, '79098601233', to_date('01-04-2012 13:42:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:43:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000116263; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10601, '79142183141', to_date('01-04-2012 13:44:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:44:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10602, '79141536383', to_date('01-04-2012 13:51:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:52:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10603, '79241235191', to_date('01-04-2012 13:55:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:55:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10604, '79147160064', to_date('01-04-2012 13:59:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:59:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10605, '79147160064', to_date('01-04-2012 13:59:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 13:59:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10606, '79625852884', to_date('01-04-2012 14:03:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 14:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000011943; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10607, '79146738947', to_date('01-04-2012 14:24:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 14:25:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 51532342360; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10608, '79621117061', to_date('01-04-2012 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 14:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10609, '79621117061', to_date('01-04-2012 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 14:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10610, '79147160064', to_date('01-04-2012 15:09:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 15:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10611, '79147160064', to_date('01-04-2012 15:09:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 15:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10612, '79638255639', to_date('01-04-2012 15:12:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 15:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350016429; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10613, '79241428050', to_date('01-04-2012 15:33:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 15:33:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 15716741620; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10614, '79046231879', to_date('01-04-2012 15:40:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 15:40:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67686042320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10615, '79242146870', to_date('01-04-2012 16:00:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:01:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1257678484 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10616, '79242146870', to_date('01-04-2012 16:00:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:01:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1257678484 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10617, '79146416315', to_date('01-04-2012 16:01:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 176690  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10618, '79146542999', to_date('01-04-2012 16:14:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10619, '79241495041', to_date('01-04-2012 16:16:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 74049241653; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10371, '79142053081', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700021390; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10372, '79098401535', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000473986; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10373, '79142188206', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380018452; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10374, '79145793964', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 54857341643; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Flash Town 300) Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10375, '79638150922', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73930341620; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10376, '79144257444', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000579185; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Социальный"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10377, '79098728727', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200313419; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10378, '79243025366', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000067334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10379, '79243025366', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000067334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10380, '79243025366', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000067334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10381, '79243025366', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000067334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10382, '79098866061', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380019291; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10383, '79098710256', to_date('31-03-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000081118; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10384, '79098710256', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000081118; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10385, '79242262270', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000098388; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10386, '79242262270', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000098388; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10387, '79149729153', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 30858642361; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10388, '79242314610', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 31561942334; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10389, '79147070777', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 31457742334; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash Region 750)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10390, '79140745639', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102193542335; дата: 31.03.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Flash City 3) Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10391, '79146877112', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 26013942360; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10392, '79089749129', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:07:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 23847542320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10393, '79502865911', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 92106342320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10394, '79146838569', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 20951042345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10395, '79140669823', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 89042642345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10396, '79140669823', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 89042642345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10397, '79242314610', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 31561942334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10398, '79242314610', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 31561942334; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10399, '79241293852', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 68670342360; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10400, '79241293852', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 68670342360; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10401, '79147219912', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27576342360; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
commit;
prompt 300 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10402, '79242088600', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200312275; дата: 31.03.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10403, '79242010100', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200172249; дата: 31.03.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10404, '79098973711', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000094479; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10405, '79098973711', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000094479; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10406, '79098973711', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000094479; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10407, '79247363331', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101895342345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10408, '79247363331', to_date('31-03-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101895342345; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10409, '79241235191', to_date('31-03-2012 10:04:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10410, '79147867090', to_date('31-03-2012 10:04:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13655541520; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 324 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10412, '79246416463', to_date('31-03-2012 10:09:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000088204; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10413, '79246416463', to_date('31-03-2012 10:14:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:14:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000088204; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10415, '79510228115', to_date('31-03-2012 10:25:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:25:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 33938142363; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: (ПЧТ) УГЛЕКАМЕНСК; сумма 992 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10416, '79621201280', to_date('31-03-2012 10:31:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:31:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10417, '79242841279', to_date('31-03-2012 10:31:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:32:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10418, '79146672067', to_date('31-03-2012 10:45:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:46:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 33397742365; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: (ПЧТ) ВЛ-АЛЕКСАНДРОВСКОЕ; сумма 1 700 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 44 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10419, '79243209118', to_date('31-03-2012 10:56:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 36029142320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 034-ПОЧТОВОЕ ОТДЕЛЕНИЕ; сумма 176 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 558 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10420, '79046246062', to_date('31-03-2012 11:03:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 17089042320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 657 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10421, '79140874392', to_date('31-03-2012 11:14:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:15:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243522057; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10422, '79140874392', to_date('31-03-2012 11:14:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:15:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243522057; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10423, '79147978732', to_date('31-03-2012 11:36:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:37:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101500342320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 565 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 166 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10424, '79242124665', to_date('31-03-2012 11:42:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:42:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000476088; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10425, '79242124665', to_date('31-03-2012 11:45:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:46:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000476088; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10428, '79147506567', to_date('31-03-2012 12:12:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:13:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10429, '79145432391', to_date('31-03-2012 12:30:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:30:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700023122; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10431, '79146457721', to_date('31-03-2012 12:36:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244413695; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ОТА): ' || chr(10) || 'АОН', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10432, '79644337159', to_date('31-03-2012 12:46:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:47:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 83218542340; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10435, '79638064363', to_date('31-03-2012 12:50:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:51:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53839941643; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Платежная система РНКО("Город"); сумма 1 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 16 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10436, '79098868404', to_date('31-03-2012 13:03:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10437, '79243369241', to_date('31-03-2012 13:06:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101914242320; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "HD"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10438, '79025243267', to_date('31-03-2012 13:11:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1222537597 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10440, '79242125664', to_date('31-03-2012 13:28:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:28:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10441, '79242619903', to_date('31-03-2012 13:34:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:35:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13575042340; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 38 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10442, '79644318871', to_date('31-03-2012 13:36:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10837642340; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10443, '79046292079', to_date('31-03-2012 13:39:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:39:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1238029034 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10444, '79140846321', to_date('31-03-2012 13:48:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:48:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4243320079; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 2 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 101 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10445, '79098401535', to_date('31-03-2012 13:56:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:57:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000473986; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10446, '79146672651', to_date('31-03-2012 13:58:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:58:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 67137042363; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОВК КАПИТАЛ; сумма 1 003 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10447, '79242576501', to_date('31-03-2012 14:10:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:10:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101454442363; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОВК КАПИТАЛ; сумма 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 600 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10448, '79046298762', to_date('31-03-2012 14:28:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:29:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 81362842320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: КАРТА IP-ТЕЛЕФОНИИ; сумма 300 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 799 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10449, '79241000855', to_date('31-03-2012 14:33:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10450, '79147057725', to_date('31-03-2012 14:38:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:39:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 66350842320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 037-ПОЧТОВОЕ ОТДЕЛЕНИЕ; сумма 1 506 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10451, '79147057725', to_date('31-03-2012 14:39:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:39:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 66350842320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 037-ПОЧТОВОЕ ОТДЕЛЕНИЕ; сумма 15 000 руб.;' || chr(10) || 'поставщик: ООО "Фарпост";' || chr(10) || 'состояние счета по поставщику: -14 272 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10452, '79635634687', to_date('31-03-2012 14:41:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:41:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350017025; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10453, '79142175007', to_date('31-03-2012 14:51:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:52:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380032008; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10454, '79142175007', to_date('31-03-2012 14:53:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 14:54:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380032008  произошло изменение пароля в Личный кабинет', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10455, '79147160064', to_date('31-03-2012 15:07:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63282342320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 940 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 645 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10456, '79146812322', to_date('31-03-2012 15:07:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80576842360; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 3 272 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10457, '79145478892', to_date('31-03-2012 15:11:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:11:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 954275  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10458, '79242262270', to_date('31-03-2012 15:21:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:22:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000098388; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 3 335 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10459, '79241840327', to_date('31-03-2012 15:22:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:22:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243215107; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10460, '79242262270', to_date('31-03-2012 15:23:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:23:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000098388; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 109 руб.;' || chr(10) || 'поставщик: ОАО "МТТ";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10461, '79020658695', to_date('31-03-2012 15:29:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:29:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13972442320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 1; сумма 750 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 6 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10462, '79241189017', to_date('31-03-2012 15:33:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:34:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000134526; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 121 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10463, '79146896998', to_date('31-03-2012 15:35:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 100498142320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК; сумма 680 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10464, '79145467148', to_date('31-03-2012 15:49:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:49:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2200108827; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Платежная система КИБЕРПЛАТ; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком" (МГ/МН);' || chr(10) || 'состояние счета по поставщику: 1 247 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10465, '79621548892', to_date('31-03-2012 15:57:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:57:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10466, '79140662216', to_date('31-03-2012 15:58:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 15:59:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 77668042340; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10467, '79638111196', to_date('31-03-2012 15:59:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:00:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73881041620; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 161 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10468, '79638111196', to_date('31-03-2012 15:59:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:00:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73881041620; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 161 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10469, '79098728727', to_date('31-03-2012 16:13:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:13:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200313419; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10470, '79621117061', to_date('31-03-2012 16:17:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:17:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10414, '79242281152', to_date('31-03-2012 10:19:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 10:20:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700118195; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10426, '79142053081', to_date('31-03-2012 11:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:49:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700021390; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10427, '79142053081', to_date('31-03-2012 11:49:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 11:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700021390; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10430, '79145432391', to_date('31-03-2012 12:30:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:31:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700023122; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10433, '79241151772', to_date('31-03-2012 12:49:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2700096689; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 514 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10434, '79241151772', to_date('31-03-2012 12:49:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 12:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2700096689; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 514 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10439, '79242088600', to_date('31-03-2012 13:19:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 13:20:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200312275; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10471, '79621117061', to_date('31-03-2012 16:35:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:36:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10472, '79147051435', to_date('31-03-2012 16:46:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:47:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18346342320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 1; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 368 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10473, '79147794991', to_date('31-03-2012 16:50:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 16:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380002046; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "HD"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10474, '79242676150', to_date('31-03-2012 17:00:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 17:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 65533142373; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 1 430 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10475, '79145497747', to_date('31-03-2012 17:07:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 17:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000099291; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10476, '79638200020', to_date('31-03-2012 17:40:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 17:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2700047779; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА "РАПИДА"; сумма 10 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 013 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10477, '79143942137', to_date('31-03-2012 17:41:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 17:42:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10478, '79025217501', to_date('31-03-2012 17:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 17:56:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 65923242340; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10479, '79046292079', to_date('31-03-2012 18:08:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1238029034 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10480, '79046292079', to_date('31-03-2012 18:08:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:08:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1238029034 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10481, '79046292079', to_date('31-03-2012 18:09:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:09:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1238029034 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10482, '79242636185', to_date('31-03-2012 18:11:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1243976961 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10484, '79145509731', to_date('31-03-2012 18:15:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:15:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 49097041620; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10485, '79638200020', to_date('31-03-2012 18:38:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:39:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700047779; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10486, '79638200020', to_date('31-03-2012 18:40:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:40:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700047779; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10487, '79242636185', to_date('31-03-2012 18:44:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:45:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1243976961 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10488, '79147919766', to_date('31-03-2012 18:46:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 18:47:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21522442320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком" (МГ/МН);' || chr(10) || 'состояние счета по поставщику: 1 062 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10490, '79621255562', to_date('31-03-2012 19:02:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:03:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244164651; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10491, '79141882857', to_date('31-03-2012 19:05:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380031870; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10492, '79141882857', to_date('31-03-2012 19:05:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:06:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380031870; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10493, '79245285008', to_date('31-03-2012 19:11:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:12:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1289886704 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10497, '79242179551', to_date('31-03-2012 19:31:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:32:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000354825; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Платежная система Е-ПОРТ; сумма 700 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10498, '79143268417', to_date('31-03-2012 19:50:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 19:50:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102060942335; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10499, '79644318871', to_date('31-03-2012 20:05:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 20:05:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10837642340; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10500, '79146834621', to_date('31-03-2012 20:32:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 20:32:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101576742340; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 82 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10501, '79621146855', to_date('31-03-2012 20:38:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 20:39:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 01031953', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10502, '79621255562', to_date('31-03-2012 21:43:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 21:43:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244164651; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10503, '79242678924', to_date('31-03-2012 21:54:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2012 21:54:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101249742373; дата: 31.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10505, '79294091976', to_date('01-04-2012 00:58:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 00:58:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10507, '79244211498', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoe-167196 на 123 982 249 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10508, '79241245546', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoe-171567 на 138 474 667 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10509, '79242600756', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoe-093683 на 8 997 260 байт превысил лимит в счет абонплаты', 3, 0);
commit;
prompt 400 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10510, '79141881530', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина pppoesvg20090312155505 на 93 916 634 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10511, '79241483595', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Трафик логина 100007964 на 34 833 417 байт превысил лимит в счет абонплаты', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10512, '79146930126', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 492642365; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -90 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10513, '79147160064', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10514, '79147160064', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10515, '79147160064', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10516, '79147160064', to_date('01-04-2012 08:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10517, '79243256177', to_date('01-04-2012 08:29:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 08:29:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 646830  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10567, '79510191704', to_date('01-04-2012 10:17:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 95022742334; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10568, '79242621397', to_date('01-04-2012 10:19:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:19:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10569, '79242621397', to_date('01-04-2012 10:19:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:19:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 59950342340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10570, '79242621397', to_date('01-04-2012 10:29:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:30:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 59950342340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10571, '79147975429', to_date('01-04-2012 10:34:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:34:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48538842340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10572, '79242567731', to_date('01-04-2012 10:42:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:42:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10573, '79147975429', to_date('01-04-2012 10:56:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:56:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48538842340; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10574, '79242490253', to_date('01-04-2012 10:57:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67685642331; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10575, '79146930126', to_date('01-04-2012 11:04:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 492642365; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 10 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10576, '79145578875', to_date('01-04-2012 11:08:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27085041620; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10577, '79146432775', to_date('01-04-2012 11:08:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437111218; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10578, '79146432775', to_date('01-04-2012 11:08:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437111218; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 1', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10579, '79143982966', to_date('01-04-2012 11:25:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:26:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75138941641; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10580, '79147090406', to_date('01-04-2012 11:31:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 11:31:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27740542360; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10544, '79147160064', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10545, '79147338696', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 33809642363; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10546, '79247210280', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 12855342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10547, '79247210280', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 12855342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10548, '79084445196', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 34309942372; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10549, '79084445196', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 34309942372; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10550, '79147984705', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28939742320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10551, '79147984705', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28939742320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10552, '79621117061', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10553, '79622982110', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700061573; дата: 01.04.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10554, '79147160064', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10555, '79147160064', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10556, '79241113808', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350014346; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10557, '79241113808', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350014346; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10558, '79241113808', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350014346; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10559, '79241113808', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350014346; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10560, '79098973711', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000094479; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10561, '79143125667', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380026403; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10562, '79241207550', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 56153642357; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10563, '79143125667', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380026403; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10564, '79145769772', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 24570941643; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10565, '79140903097', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243320508; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10566, '79147034469', to_date('01-04-2012 10:02:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25290042320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10581, '79146714897', to_date('01-04-2012 12:01:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10582, '79147160064', to_date('01-04-2012 12:16:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10583, '79147160064', to_date('01-04-2012 12:16:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10584, '79147160064', to_date('01-04-2012 12:17:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:18:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10585, '79147160064', to_date('01-04-2012 12:17:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:18:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10586, '79140690033', to_date('01-04-2012 12:22:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:22:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 20180442320; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 1; сумма 1 203 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 765 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10587, '79147975429', to_date('01-04-2012 12:42:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:42:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48538842340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10588, '79147160064', to_date('01-04-2012 12:45:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10589, '79147160064', to_date('01-04-2012 12:45:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 12:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10620, '79145769772', to_date('01-04-2012 16:18:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:18:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10663, '79242819296', to_date('02-04-2012 08:56:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:56:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4244711190; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 3552785: (ТЫМОВСК); сумма 1 832 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10664, '79624150415', to_date('02-04-2012 08:56:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:56:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4242274792; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 3528349: (51/2 ГОС ПУРКАЕВА 78-2); сумма 2 350 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 11 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10665, '79241899016', to_date('02-04-2012 08:58:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:58:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 42447322; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 3552785: (ТЫМОВСК); сумма 10 102 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10666, '79241956020', to_date('02-04-2012 08:58:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:58:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4244712222; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 3552785: (ТЫМОВСК); сумма 3 619 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10667, '79142113021', to_date('02-04-2012 09:03:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 09:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350004952; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ОАО "ДАЛЬКОМБАНК"; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 13 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10668, '79243310001', to_date('02-04-2012 09:16:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 09:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 69493042357; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Лучегорск ЦОК; сумма 1 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 28 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10669, '79098725702', to_date('02-04-2012 09:16:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 09:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350019464; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 890 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 925 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10672, '79146818125', to_date('02-04-2012 10:02:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101534342320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10673, '79146748938', to_date('02-04-2012 10:02:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100790542320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10674, '79147034469', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25290042320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10675, '79244834585', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424311867; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10676, '79024801268', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 21517842320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10677, '79024801268', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 21517842320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Основной"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10678, '79149701454', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 66730242335; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10679, '79625804096', to_date('02-04-2012 10:02:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242223522; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash City 1024)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10680, '79142060637', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000431585; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash City 4)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10681, '79621000522', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424521378; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 256 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10682, '79146459998', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437110288; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash Region 1024)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10683, '79621000522', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424521378; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10684, '79621000522', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424521378; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10685, '79621000522', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424521378; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10686, '79242164156', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200300993; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10687, '79147338696', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 33809642363; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10688, '79145962039', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 17054141620; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10689, '79145524936', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46043041656; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10690, '79638045327', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 16107941620; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10691, '79638045327', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 16107941620; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10692, '79143332212', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 90247942340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10621, '79244830037', to_date('01-04-2012 16:22:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:23:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424335597; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10622, '79644318871', to_date('01-04-2012 16:24:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:24:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10837642340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10623, '79241113808', to_date('01-04-2012 16:28:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:28:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350014346; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10624, '79146943330', to_date('01-04-2012 16:36:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:36:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10625, '79149701454', to_date('01-04-2012 16:42:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:42:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 66730242335; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10626, '79241279985', to_date('01-04-2012 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:46:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1263300496 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10627, '79621255562', to_date('01-04-2012 16:49:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:49:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244164651; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10628, '79241279985', to_date('01-04-2012 16:52:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 16:52:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1263300496 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10630, '79084482479', to_date('01-04-2012 17:28:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 17:28:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26364042320; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 460 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -60 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10631, '79141882857', to_date('01-04-2012 17:47:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 17:47:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380031870; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10633, '79242146870', to_date('01-04-2012 18:00:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:01:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1257678484 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10634, '79242146870', to_date('01-04-2012 18:01:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:01:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1257678484 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10637, '79644318871', to_date('01-04-2012 18:50:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:51:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10837642340; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10639, '79502920732', to_date('01-04-2012 19:08:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 19:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101415542320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10640, '79502920732', to_date('01-04-2012 19:09:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 19:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101415542320; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10641, '79244315684', to_date('01-04-2012 19:15:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 19:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 983276  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10642, '79147377115', to_date('01-04-2012 19:25:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 19:25:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 920932  ', 3, 0);
commit;
prompt 500 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10643, '79147161818', to_date('01-04-2012 20:15:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 20:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "HD Optix" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10644, '79242677343', to_date('01-04-2012 20:37:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 20:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 50941342340; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10645, '79241840327', to_date('01-04-2012 20:52:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 20:52:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243215107; дата: 01.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10646, '79241112237', to_date('01-04-2012 21:16:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 21:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2510042193; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10647, '79621080374', to_date('01-04-2012 21:26:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 21:27:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10648, '79242812500', to_date('01-04-2012 21:53:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 21:54:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА greenisland     ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10649, '79146884902', to_date('01-04-2012 22:09:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 22:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 615293  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10650, '79146094986', to_date('02-04-2012 01:45:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 01:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10661, '79147064319', to_date('02-04-2012 08:09:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10662, '79046259048', to_date('02-04-2012 08:17:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:18:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24083942352; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 920 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 991 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10708, '79242399747', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 71710242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10709, '79147794991', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380002046; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10710, '79098424550', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000854486; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10711, '79098424550', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:06:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000854486; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10712, '79025550387', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28018842320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10713, '79025550387', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28018842320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10714, '79532101505', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 20908642345; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10715, '79149701454', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 66730242335; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10716, '79046231879', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67686042320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10717, '79147176688', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 54048342360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10718, '79025067795', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13277042320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10719, '79147975429', to_date('02-04-2012 10:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48538842340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10720, '79147160064', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10721, '79147160064', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63282342320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10722, '79294295499', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 26292942360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10723, '79147176688', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 54048342360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10724, '79294295499', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 26292942360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10725, '79024817107', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101455342320; дата: 30.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10726, '79147143198', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:09:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13109242320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10727, '79147143198', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13109242320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10728, '79147143198', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13109242320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10729, '79146947394', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102172642320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10730, '79146947394', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102172642320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10731, '79244561772', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:10:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10732, '79244561772', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10733, '79244561772', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10734, '79244561772', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10735, '79147915244', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102168742320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10736, '79147915244', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:11:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102168742320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Максимальное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10737, '79241249449', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 30422642331; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Таун 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10738, '79147335604', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100572742320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10739, '79147335604', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100572742320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10740, '79147335604', to_date('02-04-2012 10:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100572742320; дата: 31.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10741, '79020575509', to_date('02-04-2012 10:07:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:12:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 30713242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10742, '79242220336', to_date('02-04-2012 10:11:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380030169; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 1 700 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 14 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10755, '79245217250', to_date('02-04-2012 11:48:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:48:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101573142340; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Уссурийск ЦОК 1; сумма 723 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 300 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10756, '79622992184', to_date('02-04-2012 11:48:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:49:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 659601  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10751, '79242009124', to_date('02-04-2012 11:40:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:41:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1264743150 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10752, '79242009124', to_date('02-04-2012 11:40:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:41:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1264743150 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10754, '79502822923', to_date('02-04-2012 11:44:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1266495043 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10757, '79244561772', to_date('02-04-2012 11:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:56:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 102166642320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК; сумма 1 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 100 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10758, '79084422599', to_date('02-04-2012 12:07:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101231242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "HD Optix" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10759, '79143727855', to_date('02-04-2012 12:25:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:25:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000854186; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10760, '79644442026', to_date('02-04-2012 12:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:27:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102174542320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10762, '79098864898', to_date('02-04-2012 12:32:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:32:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380013780; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 2 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 98 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10763, '79242357997', to_date('02-04-2012 12:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:33:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 71498042337; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Артем ЦОК 1; сумма 1 040 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 90 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10765, '79098864898', to_date('02-04-2012 12:34:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:34:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380013780; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 2 170 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 268 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10766, '79141596810', to_date('02-04-2012 12:35:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:35:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000162272; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ТТП 10 ЦПП; сумма 1 550 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 5 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10767, '79024817107', to_date('02-04-2012 12:38:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:38:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101455342320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 62; сумма 700 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 459 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10768, '79140724382', to_date('02-04-2012 12:42:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:42:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1275457790 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10769, '79140724382', to_date('02-04-2012 12:43:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:43:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1275457790 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10770, '79143903543', to_date('02-04-2012 12:45:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69009241620; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10771, '79145524936', to_date('02-04-2012 12:45:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:45:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 46043041656; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10772, '79024845787', to_date('02-04-2012 12:48:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:49:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10773, '79244201593', to_date('02-04-2012 12:48:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:49:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73555542340; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Уссурийск ЦОК 1; сумма 650 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 830 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10774, '79147562222', to_date('02-04-2012 13:36:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 13:37:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л/с: 42422399820; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ОТА): ' || chr(10) || 'АОН', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10776, '79242490253', to_date('02-04-2012 13:44:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 13:45:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67685642331; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10781, '79243414599', to_date('02-04-2012 14:30:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:30:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29119141643; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ЦЕНТР ОБСЛУЖИВАНИЯ КЛИЕНТОВ Г. СВОБОДНЫЙ; сумма 1 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 200 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10788, '79243310001', to_date('02-04-2012 14:48:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:48:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69493042357; дата: 02.04.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Мой Ростелеком"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10790, '79241445368', to_date('02-04-2012 14:53:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:53:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11098941654; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: КАССА СКОВОРОДИНО; сумма 3 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 60 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10791, '79644442026', to_date('02-04-2012 14:56:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:57:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102174542320; дата: 02.04.2012; подключена услуга (IPTV):' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10792, '79621117061', to_date('02-04-2012 14:57:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:57:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 02.04.2012; произведено снятие (Доп. услуги ШПД):' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10671, '79241279985', to_date('02-04-2012 09:56:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 09:57:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1263300496 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10743, '79140724382', to_date('02-04-2012 10:33:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:34:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1275457790 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10744, '79241187553', to_date('02-04-2012 10:36:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:37:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380023538; дата: 14.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ОТА): ' || chr(10) || 'ПереадресацияПереадресация', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10747, '79241187553', to_date('02-04-2012 10:41:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:41:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380023538; дата: 14.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ОТА): ' || chr(10) || 'ПереадресацияПереадресация', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10748, '79025051281', to_date('02-04-2012 10:48:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:48:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101527442320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 62; сумма 600 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 993 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10749, '79246709059', to_date('02-04-2012 10:58:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:58:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 40549541620; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 2 480 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10750, '79084463875', to_date('02-04-2012 11:13:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 56160342365; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 2 366 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 276 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10753, '79241086744', to_date('02-04-2012 11:41:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 11:41:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'tetst', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10761, '79644442026', to_date('02-04-2012 12:27:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:27:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102174542320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10764, '79098864898', to_date('02-04-2012 12:33:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 12:33:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380013780; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 30 руб.;' || chr(10) || 'поставщик: ОАО "МТТ";' || chr(10) || 'состояние счета по поставщику: 2 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10775, '79621204686', to_date('02-04-2012 13:39:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 13:40:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242239460; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10777, '79146665553', to_date('02-04-2012 13:58:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 13:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1269690696 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10778, '79621117061', to_date('02-04-2012 14:03:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:04:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10779, '79146912141', to_date('02-04-2012 14:28:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:28:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 36775842320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10780, '79140677662', to_date('02-04-2012 14:29:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:29:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 36015842361; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash Region 750)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10785, '79145856069', to_date('02-04-2012 14:41:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:41:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73923241641; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: КАССА 3 ЦОК  БЕЛОГОРСК; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 000 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10786, '79622951727', to_date('02-04-2012 14:43:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:43:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50020141638; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: КАССА ТАМБОВКА; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 689 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10789, '79024893807', to_date('02-04-2012 14:50:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102222642320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10793, '79502975718', to_date('02-04-2012 14:57:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:58:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 66939842320; дата платежа 02.04.2012; поступила оплата от: Владивосток ЦОК 1; сумма 167 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 335 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10794, '79146529024', to_date('02-04-2012 14:58:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102112442340; дата: 02.04.2012; подключена услуга (Доп. услуги ШПД):' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10795, '79242581637', to_date('02-04-2012 14:58:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101978842363; дата: 02.04.2012; подключена услуга (IPTV):' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10796, '79242581637', to_date('02-04-2012 14:59:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101978842363; дата: 02.04.2012; подключена услуга (IPTV):' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10797, '79644393863', to_date('02-04-2012 14:59:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:00:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1298864705 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10799, '79146665553', to_date('02-04-2012 15:16:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:16:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1269690696 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10801, '79098016751', to_date('02-04-2012 15:18:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:18:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2210612840; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: Отделение почтовой связи 680539; сумма 1 802 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10629, '79241894225', to_date('01-04-2012 17:17:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 17:17:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 330269  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10632, '79242146870', to_date('01-04-2012 17:59:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:00:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1257678484 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10638, '79098158089', to_date('01-04-2012 19:02:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 19:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с.: 47674341620; период расчета: Март     2012;состояние счета: ' || chr(10) || 'ОАО "Ростелеком" = 400,68 руб.;', 3, 0);
commit;
prompt 600 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10745, '79622888287', to_date('02-04-2012 10:39:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:40:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000036512; дата платежа 29.03.2012;' || chr(10) || 'поступила оплата от: 681000 МУП "ЕРКЦ" (ФИЛИАЛ №3) SL3_14 Г.КОМСОМОЛЬСК-НА-АМУРЕ; сумма 825 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 122 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10746, '79241187553', to_date('02-04-2012 10:40:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:40:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380023538; дата: 14.03.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ОТА): ' || chr(10) || 'Трассировка злонамеренных вызововТрассировка злонамеренных вызовов', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10782, '79024864422', to_date('02-04-2012 14:31:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:32:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102251742320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10783, '79241207550', to_date('02-04-2012 14:39:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:39:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 56153642357; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10784, '79024834549', to_date('02-04-2012 14:39:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:40:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102258942320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10787, '79098421077', to_date('02-04-2012 14:47:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 14:47:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'предусмотри,.. блеать!', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10798, '79244274022', to_date('02-04-2012 15:15:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:16:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 36832742320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 172 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10800, '79146731904', to_date('02-04-2012 15:16:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:17:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102125542320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10802, '79242211584', to_date('02-04-2012 15:19:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:20:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380018853; дата платежа 27.03.2012;' || chr(10) || 'поступила оплата от: РКЦ СОВЕТСКАЯ ГАВАНЬ; сумма 1 416 руб.;' || chr(10) || 'поставщик: ;' || chr(10) || 'состояние счета по поставщику: -33 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10803, '79025240156', to_date('02-04-2012 15:19:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:20:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24033642320; дата платежа 28.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 220 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10804, '79502814756', to_date('02-04-2012 15:19:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:20:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101281642320; дата платежа 28.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 299 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 299 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10805, '79024846126', to_date('02-04-2012 15:21:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:22:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102107442320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10806, '79242051707', to_date('02-04-2012 15:24:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:24:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200313086; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10807, '79242051707', to_date('02-04-2012 15:24:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:24:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200313086; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10808, '79089731355', to_date('02-04-2012 15:27:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:27:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 53000042357; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10809, '79098731356', to_date('02-04-2012 15:34:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:35:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10810, '79241318095', to_date('02-04-2012 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:36:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102048242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10811, '79241318095', to_date('02-04-2012 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:36:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102048242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10812, '79146863579', to_date('02-04-2012 15:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:37:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101476242365; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10813, '79144003923', to_date('02-04-2012 15:37:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:37:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10814, '79146226090', to_date('02-04-2012 15:48:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:49:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 25256941535; дата платежа 22.03.2012;' || chr(10) || 'поступила оплата от: ТЕРМИНАЛ Е-ПОРТ ГОС-809; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 442 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10815, '79242601683', to_date('02-04-2012 15:51:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102208142340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10816, '79242601683', to_date('02-04-2012 15:51:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102208142340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10817, '79294046133', to_date('02-04-2012 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:56:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000849506; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10818, '79024893807', to_date('02-04-2012 15:59:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 15:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102222642320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10819, '79242469612', to_date('02-04-2012 16:09:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:09:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102232042320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10635, '79242146870', to_date('01-04-2012 18:01:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1257678484 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10636, '79242146870', to_date('01-04-2012 18:01:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2012 18:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1257678484 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10651, '79242490253', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10652, '79241207550', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10653, '79046207439', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1296832333 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10654, '79502822923', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1266495043 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10655, '79142137287', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:02:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10656, '79244251403', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10657, '79242252943', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10658, '79243277940', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10659, '79145711111', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73781141620; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 719 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 077 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10660, '79140903097', to_date('02-04-2012 08:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 08:03:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10670, '79025243267', to_date('02-04-2012 09:40:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 09:40:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1222537597 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10693, '79644457166', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 82812842373; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10694, '79098089063', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200327653; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10695, '79098089063', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200327653; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10696, '79140903097', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:13:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243320508; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10697, '79140903097', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:14:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243320508; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10698, '79140859734', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:14:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243612190; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10699, '79147787871', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:14:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380014497; дата: 02.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10700, '79622850018', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:14:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67591341620; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10701, '79241151772', to_date('02-04-2012 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:14:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700096689; дата: 02.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10702, '79241151772', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700096689; дата: 02.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10703, '79098525978', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350018788; дата: 02.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10704, '79241150030', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000077833; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10705, '79143332212', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 90247942340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10706, '79242252943', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:15:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700104159; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10707, '79242399747', to_date('02-04-2012 10:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 10:16:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 71710242320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10830, '79149758559', to_date('02-04-2012 16:50:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69341042360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10831, '79149758559', to_date('02-04-2012 16:50:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69341042360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10832, '79242306141', to_date('02-04-2012 16:50:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:51:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53381042334; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Вольно-Надеждинское ЦОК; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 000 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10854, '79502920732', to_date('02-04-2012 18:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:33:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101415542320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 24; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 537 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10871, '79241112237', to_date('02-04-2012 21:02:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 21:03:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2510042193; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10872, '79241112237', to_date('02-04-2012 21:02:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 21:03:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2510042193; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10877, '79024839458', to_date('03-04-2012 00:16:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 00:16:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Распределение out_saldo_online закончено на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10878, '79024839458', to_date('03-04-2012 00:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 00:49:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Закончено перераспределение сальдо после расчета на 413', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10879, '79024839458', to_date('03-04-2012 00:55:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 00:55:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Предрасчетная процедура закончена на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10880, '79147066275', to_date('03-04-2012 01:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 01:56:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 122176  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10881, '79024839458', to_date('03-04-2012 07:00:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 07:00:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Закончено перераспределение сальдо после расчета на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10883, '79024839458', to_date('03-04-2012 07:50:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 07:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Обороты собраны на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10884, '79241114275', to_date('03-04-2012 08:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10885, '79025214688', to_date('03-04-2012 08:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10886, '79147066275', to_date('03-04-2012 08:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19475142320; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 3 800 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 467 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10887, '79145641864', to_date('03-04-2012 08:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30123741656; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ФКБ "ДАЛЬКОМБАНК" ТЫНДИНСКИЙ; сумма 1 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -337 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10888, '79147066275', to_date('03-04-2012 08:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10889, '79046259048', to_date('03-04-2012 08:15:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24083942352; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 184 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 175 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10890, '79024839458', to_date('03-04-2012 08:34:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Обороты собраны на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10891, '79243310001', to_date('03-04-2012 08:37:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 69493042357; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Лучегорск ЦОК; сумма 1 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 29 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10894, '79147059249', to_date('03-04-2012 09:34:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'DVPLATS_MAG 0', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10895, '79243114632', to_date('03-04-2012 09:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350004263; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 894 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 16 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10896, '79025087789', to_date('03-04-2012 09:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13621141320; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=903 руб. Оплачено=2 777 руб. К оплате=902 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10897, '79148567315', to_date('03-04-2012 09:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 846341320; период Март     2012' || chr(10) || 'ОАО "МТТ": Начислено=49 руб. Оплачено=0 руб. К оплате=48 руб.' || chr(10) || 'ОАО "Ростелеком": Начислено=1 092 руб. Оплачено=1 000 руб. К оплате=1 047 руб.' || chr(10) || 'ООО "Агентство Беркут": Начислено=0 руб. Оплачено=0 руб. Переплата=2 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10898, '79148641646', to_date('03-04-2012 09:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11498941343; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=306 руб. Оплачено=433 руб. К оплате=306 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10899, '79098516512', to_date('03-04-2012 09:42:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350017625; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 000 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10900, '79644301187', to_date('03-04-2012 09:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 09:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74975342344; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Покровка ЦОК; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 650 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10901, '79025571286', to_date('03-04-2012 10:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 14602842320; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 16 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10902, '79244218653', to_date('03-04-2012 10:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10903, '79244218653', to_date('03-04-2012 10:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10904, '79244218653', to_date('03-04-2012 10:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10853, '79244326429', to_date('02-04-2012 18:32:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:33:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101692442340; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10858, '79242485369', to_date('02-04-2012 19:15:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:15:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101139142340; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 083 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11006, '79143835959', to_date('03-04-2012 11:18:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1289319893 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11007, '79143835959', to_date('03-04-2012 11:18:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1289319893 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11008, '79024828993', to_date('03-04-2012 11:20:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:21:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101670142320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11009, '79025052992', to_date('03-04-2012 11:20:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:21:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 61551642320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ОТА): ' || chr(10) || 'Переадресация', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11010, '79147088599', to_date('03-04-2012 11:22:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:22:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11011, '79084405311', to_date('03-04-2012 11:25:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:26:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102225942320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11012, '79242609292', to_date('03-04-2012 11:30:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:30:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1223629501 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11013, '79242609292', to_date('03-04-2012 11:30:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:30:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1223629501 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11016, '79146872036', to_date('03-04-2012 11:49:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1243028587 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11018, '79147364000', to_date('03-04-2012 11:59:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1287882661 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11021, '79241112730', to_date('03-04-2012 12:26:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:27:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11022, '79241326792', to_date('03-04-2012 12:33:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73268042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11023, '79624165933', to_date('03-04-2012 12:39:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242295975; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "Взрослый"', 3, 0);
commit;
prompt 700 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11027, '79624165933', to_date('03-04-2012 12:45:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242295975; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11029, '79242594783', to_date('03-04-2012 13:04:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101195642340; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Уссурийск ЦОК 1; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 648 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11031, '79147990433', to_date('03-04-2012 13:17:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101233442320; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11032, '79147990433', to_date('03-04-2012 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101233442320; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11033, '79147990433', to_date('03-04-2012 13:18:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101233442320; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11056, '79143846025', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12608341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=849 руб. Оплачено=1 046 руб. К оплате=849 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11057, '79145859738', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12101041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 359 руб. Оплачено=1 300 руб. К оплате=1 321 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11058, '79143884697', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12192541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=876 руб. Оплачено=955 руб. К оплате=876 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11059, '79145799119', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11753341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=600 руб. Оплачено=300 руб. К оплате=570 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11060, '79246818617', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:33:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12390841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=839 руб. Оплачено=686 руб. К оплате=839 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11061, '79145546470', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12059841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 633 руб. Оплачено=2 500 руб. К оплате=2 633 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11062, '79246813974', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11687441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 092 руб. Оплачено=1 080 руб. К оплате=1 092 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10822, '79242635827', to_date('02-04-2012 16:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:18:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101834042361; дата платежа 24.03.2012;' || chr(10) || 'поступила оплата от: АРСЕНЬЕВСКИЙ ОСБ №7718; сумма 410 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10829, '79149758559', to_date('02-04-2012 16:49:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:50:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69341042360; дата: 28.03.2012; ' || chr(10) || 'подключена услуга (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-минимум Сити 1024 Кбит/с) Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10834, '79145553908', to_date('02-04-2012 17:06:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:07:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11003241656; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10835, '79145553908', to_date('02-04-2012 17:06:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:07:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11003241656; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10836, '79242845911', to_date('02-04-2012 17:13:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:13:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42422389699; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10838, '79146528847', to_date('02-04-2012 17:21:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:21:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 303854  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10839, '79243070088', to_date('02-04-2012 17:22:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:23:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10840, '79242162543', to_date('02-04-2012 17:23:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:24:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000084087; дата: 02.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание ШПД в блокировке Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10841, '79146758111', to_date('02-04-2012 17:50:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:50:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 355646  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10842, '79147967680', to_date('02-04-2012 18:03:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:04:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68565642360; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 1 490 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 453 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10845, '79241957673', to_date('02-04-2012 18:08:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:09:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 42434100452; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ФИЛИАЛ АК СБ РФ ОАО ЮЖНО-САХАЛИНСКОЕ ОТДЕЛЕНИЕ № 8567 Г.ЮЖНО-САХАЛИНСК; сумма 1 877 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10846, '79020696410', to_date('02-04-2012 18:12:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:12:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1224344273 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10847, '79020696410', to_date('02-04-2012 18:12:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:12:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1224344273 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10850, '79020696410', to_date('02-04-2012 18:15:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:15:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1224344273 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10851, '79020696410', to_date('02-04-2012 18:15:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:15:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1224344273 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10987, '79622998554', to_date('03-04-2012 10:25:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:25:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380028489; дата платежа 14.03.2012;' || chr(10) || 'поступила оплата от: 682860 Почтовое отделение 60; сумма 1 412 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 412 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10993, '79241251978', to_date('03-04-2012 11:04:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 35874542320; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 25 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -1 236 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10994, '79241251978', to_date('03-04-2012 11:04:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 35874542320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 2 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -1 236 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10995, '79147160340', to_date('03-04-2012 11:04:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 25036142320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 1 267 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10996, '79024807033', to_date('03-04-2012 11:04:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 93831642320; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 1 615 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 190 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10997, '79024807033', to_date('03-04-2012 11:04:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 93831642320; дата платежа 01.04.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 35 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 190 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11001, '79143321368', to_date('03-04-2012 11:08:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с.: 101478542360; период расчета: Март     2012;состояние счета: ' || chr(10) || 'ОАО "Ростелеком" = 411,48 руб.;', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11002, '79510106623', to_date('03-04-2012 11:08:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102223042347; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11003, '79510106623', to_date('03-04-2012 11:08:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102223042347; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11004, '79147778788', to_date('03-04-2012 11:09:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11005, '79147778788', to_date('03-04-2012 11:09:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10823, '79241279985', to_date('02-04-2012 16:20:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:20:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1263300496 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10824, '79149627584', to_date('02-04-2012 16:26:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:27:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102146042340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10825, '79149627584', to_date('02-04-2012 16:26:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:27:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102146042340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10833, '79143860730', to_date('02-04-2012 16:59:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:59:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55074041653; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ЗЕЯ ПОЧТА РОССИИ; сумма 1 101 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком" (МГ/МН);' || chr(10) || 'состояние счета по поставщику: 1 101 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10837, '79242298029', to_date('02-04-2012 17:15:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 17:16:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350002690; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 3 673 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10852, '79147967680', to_date('02-04-2012 18:30:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:30:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 68565642360; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10855, '79146110887', to_date('02-04-2012 18:38:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:39:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 74111541656; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10856, '79146521047', to_date('02-04-2012 18:45:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:46:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 231019  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10857, '79638409557', to_date('02-04-2012 19:14:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:15:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380029641; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10859, '79141724039', to_date('02-04-2012 19:26:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:27:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010201; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10860, '79141922292', to_date('02-04-2012 19:28:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:29:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000600805; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Отделение сберегательного банка 9070/16; сумма 759 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10862, '79241019986', to_date('02-04-2012 19:31:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:31:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000044974; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 800 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 376 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10863, '79243216756', to_date('02-04-2012 20:01:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:01:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10864, '79146049627', to_date('02-04-2012 20:06:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:06:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74104541641; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: КАССА 3 ЦОК  БЕЛОГОРСК; сумма 410 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10865, '79624162929', to_date('02-04-2012 20:07:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:08:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242273319; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10866, '79244830037', to_date('02-04-2012 20:09:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:09:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424335597; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10867, '79024839458', to_date('02-04-2012 20:29:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:29:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Распределение out_saldo_online закончено на 413', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10868, '79144083645', to_date('02-04-2012 20:44:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:45:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000128048; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10870, '79242685604', to_date('02-04-2012 20:56:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:57:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10873, '79242488520', to_date('02-04-2012 21:04:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 21:05:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 34509342340  Уважаемый абонент! 02.04. 21:04 Вы воспользовались услугой ' || chr(10) || '                           "Обещанный Платеж" в размере 3041.69 руб. Пополнить баланс на эту сумму необходимо до 07.04.2012 Ваш Ростелеком.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10874, '79626742791', to_date('02-04-2012 21:41:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 21:42:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380014670; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10875, '79025571286', to_date('02-04-2012 21:48:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 21:48:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 14602842320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 16 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10876, '79242488235', to_date('02-04-2012 23:35:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 23:35:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10983, '79622987802', to_date('03-04-2012 10:14:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000845625; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10991, '79147059249', to_date('03-04-2012 10:50:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'DVPLATS_AMUR 0', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10998, '79242404907', to_date('03-04-2012 11:05:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101546042320; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: ПРИМОРСКОЕ ОСБ N8635 Г.ВЛАДИВОСТОК(НАЛ); сумма 1 005 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 166 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10999, '79143321368', to_date('03-04-2012 11:05:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101478542360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Информационная SMS-рассылка от ОАО "Ростелеком"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11014, '79146872036', to_date('03-04-2012 11:42:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1243028587 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11015, '79147975429', to_date('03-04-2012 11:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48538842340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11017, '79638132060', to_date('03-04-2012 11:52:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10892, '79244256606', to_date('03-04-2012 08:43:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10893, '79502990550', to_date('03-04-2012 08:43:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 08:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13601642320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 1 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 060 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11019, '79146723993', to_date('03-04-2012 12:15:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101466442340; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Уссурийск ЦОК 1; сумма 1 200 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 366 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11020, '79098563723', to_date('03-04-2012 12:16:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2350019000; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11024, '79624165933', to_date('03-04-2012 12:39:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11025, '79244435034', to_date('03-04-2012 12:42:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 80300041641; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11026, '79624165933', to_date('03-04-2012 12:42:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242295975; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11028, '79144257444', to_date('03-04-2012 12:59:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 12:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000579185; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: 681000 ОТДЕЛЕНИЕ ЭЛ.СВЯЗИ № 000; сумма 700 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 44 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11030, '79147990433', to_date('03-04-2012 13:17:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101233442320; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11034, '79147176688', to_date('03-04-2012 13:22:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:23:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1262830220 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11035, '79246773188', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 31930341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 223 руб. Оплачено=1 301 руб. К оплате=1 186 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11036, '79145770130', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11151241654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=217 руб. Оплачено=0 руб. К оплате=801 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11037, '79145801606', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:34:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 10702041654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=986 руб. Оплачено=550 руб. К оплате=962 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11038, '79145567167', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63045541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 684 руб. Оплачено=2 626 руб. К оплате=2 684 руб.' || chr(10) || 'ОАО "Ростелеком" (МГ/МН): Начислено=5 616 руб. Оплачено=1 859 руб. К оплате=5 616 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11039, '79145553908', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11003241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 612 руб. Оплачено=1 760 руб. К оплате=1 610 руб.' || chr(10) || 'ЗАО "КТТК": Начислено=184 руб. Оплачено=100 руб. К оплате=183 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11040, '79145914595', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 10284441656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=773 руб. Оплачено=750 руб. К оплате=739 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11041, '79146139658', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 10908841656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 052 руб. Оплачено=0 руб. К оплате=4 068 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11042, '79241484931', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 10428441656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 109 руб. Оплачено=0 руб. К оплате=2 060 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11043, '79146100054', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 10399341656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=608 руб. Оплачено=0 руб. К оплате=816 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11044, '79638030417', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11109241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 479 руб. Оплачено=1 260 руб. К оплате=1 479 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11045, '79241445368', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11098941654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 952 руб. Оплачено=0 руб. К оплате=6 126 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11046, '79241409536', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18552741634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 674 руб. Оплачено=1 748 руб. К оплате=1 674 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11047, '79619511200', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13337141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 362 руб. Оплачено=1 500 руб. К оплате=769 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11048, '79145624386', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60289141647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 951 руб. Оплачено=1 940 руб. К оплате=1 947 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11049, '79143900804', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18469941634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 310 руб. Оплачено=2 000 руб. К оплате=1 292 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11050, '79143822836', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18620541634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=810 руб. Оплачено=777 руб. К оплате=810 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11051, '79246834166', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22721041647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 046 руб. Оплачено=2 100 руб. К оплате=1 979 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11052, '79146003826', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:37:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19530041653; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 463 руб. Оплачено=2 470 руб. К оплате=2 313 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11053, '79145723292', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:38:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12081741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 097 руб. Оплачено=1 068 руб. К оплате=1 097 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11054, '79638026756', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:38:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18177841636; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=380 руб. Оплачено=500 руб. К оплате=335 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11055, '79145661202', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:38:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12525241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 947 руб. Оплачено=2 000 руб. К оплате=1 876 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10820, '79242469612', to_date('02-04-2012 16:09:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:09:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102232042320; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
commit;
prompt 800 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10821, '79244561772', to_date('02-04-2012 16:10:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:10:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 02.04.2012; ' || chr(10) || 'произведена блокировка (ОТА): ' || chr(10) || 'Содержание абонентской линии в блокировке (4232398773)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10826, '79140761750', to_date('02-04-2012 16:29:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:30:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102061742340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10827, '79140761750', to_date('02-04-2012 16:29:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:30:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102061742340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10828, '79626772677', to_date('02-04-2012 16:33:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 16:34:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350019265; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 901 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 901 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10843, '79147789554', to_date('02-04-2012 18:04:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:04:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380008687; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10844, '79147789554', to_date('02-04-2012 18:04:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:05:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380008687; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10848, '79020696410', to_date('02-04-2012 18:12:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:13:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1224344273 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10849, '79020696410', to_date('02-04-2012 18:12:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 18:13:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1224344273 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10861, '79626774098', to_date('02-04-2012 19:29:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 19:29:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350004309; дата платежа 30.03.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 1 051 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10869, '79024839458', to_date('02-04-2012 20:46:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2012 20:47:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Предрасчетная процедура закончена на 413', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10882, '79024839458', to_date('03-04-2012 07:11:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 07:11:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Закончено перераспределение сальдо после расчета на 416', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10905, '79244218653', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10906, '79244218653', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10907, '79242065207', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000096443; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10908, '79147794991', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380002046; дата: 02.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10909, '79147789554', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380008687; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10910, '79622985333', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000034817; дата: 02.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10911, '79244218653', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10912, '79244218653', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10913, '79244561772', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 03.04.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10914, '79244561772', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 03.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание ШПД в блокировке Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10915, '79244561772', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 03.04.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10916, '79244561772', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102166642320; дата: 03.04.2012; ' || chr(10) || 'произведена блокировка (IPTV): ' || chr(10) || 'Поддержание услуги кабельного вещания в блокировке Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10917, '79147562052', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242299093; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash City 1024)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10918, '79140922866', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243218161; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash City 4096)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10919, '79624166122', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242224017; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10920, '79024801268', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 21517842320; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10921, '79244890293', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242276276; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10922, '79098884818', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000456805; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10923, '79098884818', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000456805; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10924, '79098884818', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000456805; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10925, '79098073681', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2560128805; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10926, '79098073681', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2560128805; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10927, '79638045327', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 16107941620; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10928, '79619511200', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13337141620; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-Оптикс 1+ Сити) ME', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10929, '79145691999', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 21345341643; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-Оптикс 1+ Сити) ME', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10930, '79246735201', to_date('03-04-2012 10:00:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73088741620; дата: 03.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-Оптикс 1+ Сити) ME', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10931, '79638045327', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 16107941620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10932, '79145944050', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 47334941620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10933, '79145944050', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 47334941620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10934, '79532036359', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 87432842356; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10935, '79147160340', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25036142320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10936, '79146665553', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 74701842335; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10937, '79146665553', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 74701842335; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10938, '79242308530', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 95243442357; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10939, '79242308530', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 95243442357; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10940, '79140400040', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101425942340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10941, '79241344225', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 71723042337; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10942, '79142056825', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100809242357; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10943, '79084484558', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 36579942320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10944, '79084484558', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 36579942320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10945, '79146991796', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75213042345; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10946, '79146991796', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75213042345; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10947, '79147980742', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63490842360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10948, '79147980742', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63490842360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10949, '79245280602', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 68777042360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10950, '79245280602', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 68777042360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10951, '79140400040', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101425942340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10952, '79244202725', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 85136042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10953, '79681664256', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 83324842355; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10954, '79681664256', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 83324842355; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10955, '79681664256', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 83324842355; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10956, '79622850018', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 67591341620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10957, '79147066275', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 19475142320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. видео контента): ' || chr(10) || 'Дополнительный блок телеканалов "HD"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10958, '79140859734', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243612190; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10959, '79532036359', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 87432842356; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10960, '79532036359', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 87432842356; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10961, '79147911861', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 69605142320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10962, '79146937210', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102247342335; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10963, '79089890234', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 61484042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10964, '79510213199', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 35954642340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10965, '79510213199', to_date('03-04-2012 10:00:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 35954642340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10966, '79621248708', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42422401857; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10967, '79089890234', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 61484042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10968, '79244202725', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 85136042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10969, '79147130757', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27487942320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10970, '79142056825', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100809242357; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10971, '79046257128', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 48694842346; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10972, '79532036359', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 87432842356; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10973, '79147160340', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25036142320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10974, '79621248708', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42422401857; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10975, '79142025363', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200293936; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (ОТА): ' || chr(10) || 'Снятие телефона по ведомости (4212425165)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10976, '79080606780', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13003642320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10977, '79146092474', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75094941651; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10978, '79025056185', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102089442320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10979, '79025056185', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102089442320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10980, '79241056545', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000839645; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (SMS-информирование): ' || chr(10) || 'Пакет SMS-сообщений 2', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10981, '79241056545', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000839645; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10982, '79241056545', to_date('03-04-2012 10:00:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000839645; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10984, '79147232707', to_date('03-04-2012 10:17:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12045142320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА КИБЕРПЛАТ; сумма 450 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 900 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10985, '79141724039', to_date('03-04-2012 10:17:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010201; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10986, '79098643180', to_date('03-04-2012 10:24:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:24:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380028080; дата платежа 14.03.2012;' || chr(10) || 'поступила оплата от: 682855 Почтовое отделение 55; сумма 1 769 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 769 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10988, '79098287760', to_date('03-04-2012 10:31:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:31:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000285945; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10989, '79242375414', to_date('03-04-2012 10:32:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:32:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10990, '79622976154', to_date('03-04-2012 10:48:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 10:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000051024; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 681021 ПОЧТОВОЕ ОТДЕЛЕНИЕ 681021 № POST_681021; сумма 1 809 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (10992, '79624166122', to_date('03-04-2012 10:59:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242224017; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11000, '79245245064', to_date('03-04-2012 11:07:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 11:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 36600442320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 300 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11256, '79638186135', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:38:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46661141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 438 руб. Оплачено=1 469 руб. К оплате=2 615 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11257, '79145720616', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:38:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46748041656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=5 891 руб. Оплачено=0 руб. К оплате=3 064 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11258, '79145504116', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46767841656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 155 руб. Оплачено=1 000 руб. К оплате=2 023 руб.' || chr(10) || '', 3, 0);
commit;
prompt 900 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11259, '79638032380', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46851241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=2 288 руб. Переплата=351 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11260, '79146160420', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46871141643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=392 руб. Оплачено=1 425 руб. К оплате=249 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11261, '79145770130', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46898941654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 509 руб. Оплачено=0 руб. К оплате=5 826 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11262, '79140402486', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 46997341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=120 руб. Оплачено=0 руб. К оплате=2 456 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11263, '79243424500', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47276141654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 022 руб. Оплачено=2 473 руб. К оплате=4 964 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11264, '79143995004', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47297241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=430 руб. Оплачено=132 руб. К оплате=430 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11265, '79145944050', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47334941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=700 руб. Оплачено=700 руб. К оплате=676 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11266, '79246800062', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47354641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=589 руб. Оплачено=600 руб. К оплате=567 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11267, '79246714853', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:40:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47448441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=979 руб. Оплачено=922 руб. К оплате=979 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11268, '79145659004', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:41:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47495241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 296 руб. Оплачено=1 249 руб. К оплате=1 296 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11269, '79241411638', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:41:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47647341656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=679 руб. Оплачено=679 руб. К оплате=679 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11270, '79145726235', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:41:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47966041642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 750 руб. Оплачено=1 500 руб. К оплате=1 709 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11271, '79098125024', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:41:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 48000541647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=580 руб. Оплачено=1 100 руб. К оплате=557 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11272, '79243406098', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:41:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 48324241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=1 007 руб. К оплате=649 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11273, '79146182817', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 48428741653; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 130 руб. Оплачено=1 100 руб. К оплате=445 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11274, '79619519390', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53413541658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 416 руб. Оплачено=0 руб. К оплате=3 636 руб.' || chr(10) || 'ОАО "МТТ": Начислено=23 руб. Оплачено=0 руб. К оплате=23 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11275, '79145928405', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53120141639; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=4 509 руб. Оплачено=7 000 руб. К оплате=3 945 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11276, '79145509731', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 49097041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=331 руб. К оплате=1 048 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11277, '79622849140', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:42:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 49449941658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=30 руб. Оплачено=0 руб. К оплате=3 087 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11278, '79146093982', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 49786141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=904 руб. Оплачено=1 000 руб. К оплате=213 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11279, '79246710800', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 49970341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 839 руб. Оплачено=1 300 руб. К оплате=1 750 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11280, '79246710800', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 49970341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 839 руб. Оплачено=1 300 руб. К оплате=1 750 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11281, '79622951727', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50020141638; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=999 руб. Оплачено=2 000 руб. Переплата=690 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11282, '79143824060', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:43:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50317641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 200 руб. К оплате=1 043 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11283, '79246714528', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50318541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 726 руб. Оплачено=3 023 руб. К оплате=866 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11284, '79140414131', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50409841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=209 руб. Оплачено=1 500 руб. К оплате=60 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11285, '79241420837', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50511341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=1 000 руб. К оплате=940 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11286, '79246842072', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 50550341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 414 руб. Оплачено=1 312 руб. К оплате=1 413 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11287, '79145931666', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:44:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 51157441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=789 руб. Оплачено=0 руб. К оплате=528 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11288, '79145770655', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 51182541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=35 руб. Оплачено=0 руб. К оплате=1 991 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11063, '79140462895', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12270541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=668 руб. Оплачено=214 руб. К оплате=668 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11064, '79145594286', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11823241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 151 руб. Оплачено=1 120 руб. К оплате=1 141 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11065, '79143812845', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12056741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 372 руб. Оплачено=1 360 руб. К оплате=1 372 руб.' || chr(10) || 'ОАО "МТТ": Начислено=5 руб. Оплачено=0 руб. К оплате=5 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11066, '79246805869', to_date('03-04-2012 13:32:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:45:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11874441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=698 руб. Оплачено=735 руб. К оплате=696 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11067, '79182910722', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:46:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11693941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 046 руб. Оплачено=1 475 руб. К оплате=1 046 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11068, '79143826022', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:46:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11894141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=752 руб. Оплачено=800 руб. К оплате=702 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11069, '79241438695', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:46:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11761541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=466 руб. Оплачено=990 руб. К оплате=466 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11070, '79145670067', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:46:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11987141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=803 руб. Оплачено=0 руб. К оплате=1 757 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11071, '79145550015', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:46:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12039541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=746 руб. Оплачено=0 руб. К оплате=2 034 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11072, '79638080696', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21443941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 001 руб. Оплачено=1 000 руб. К оплате=996 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11073, '79145548976', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12186141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 323 руб. Оплачено=1 310 руб. К оплате=1 323 руб.' || chr(10) || 'ЗАО "КТТК": Начислено=209 руб. Оплачено=0 руб. К оплате=209 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11074, '79145841128', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12149541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=685 руб. Оплачено=665 руб. К оплате=685 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11075, '79143942782', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21270141643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 105 руб. Оплачено=1 000 руб. К оплате=1 092 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11076, '79246804512', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12548941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=737 руб. Оплачено=660 руб. К оплате=735 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11077, '79246705651', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 14748741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=42 руб. Оплачено=0 руб. Переплата=462 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11078, '79098197780', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16784741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=378 руб. Оплачено=0 руб. Переплата=46 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11079, '79145526474', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 17151441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 803 руб. Оплачено=2 000 руб. К оплате=2 555 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11080, '79145994581', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19674341644; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 398 руб. Оплачено=0 руб. К оплате=2 754 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11081, '79248476620', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:48:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19675341644; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 398 руб. Оплачено=1 400 руб. К оплате=1 379 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11082, '79145624386', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21824041647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 153 руб. Оплачено=1 140 руб. К оплате=1 151 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11083, '79098850063', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22757441647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 419 руб. Оплачено=961 руб. К оплате=1 419 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11084, '79638049850', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22354941646; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=838 руб. Оплачено=900 руб. К оплате=712 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11085, '79140648004', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19623541644; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 964 руб. Оплачено=1 290 руб. К оплате=1 659 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=1 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11086, '79145828045', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19010041636; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 984 руб. Оплачено=1 300 руб. К оплате=1 916 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11087, '79145972177', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13052641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 341 руб. Оплачено=2 531 руб. К оплате=1 340 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11088, '79143885890', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15258141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 243 руб. Оплачено=0 руб. К оплате=2 058 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11089, '79143885890', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15258141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 243 руб. Оплачено=0 руб. К оплате=2 058 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11090, '79145559712', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16805241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=244 руб. Оплачено=250 руб. К оплате=229 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11091, '79622850496', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:50:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16155541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 305 руб. Оплачено=958 руб. К оплате=1 305 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11092, '79140468792', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12781341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=978 руб. Оплачено=1 000 руб. К оплате=2 021 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11093, '79145616225', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 18059541649; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 733 руб. Оплачено=500 руб. К оплате=1 671 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11094, '79619532966', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21015841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=254 руб. Оплачено=179 руб. К оплате=267 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11095, '79619532966', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21015841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=254 руб. Оплачено=179 руб. К оплате=267 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11096, '79145559641', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:51:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22019841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=886 руб. Оплачено=0 руб. К оплате=1 760 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11097, '79145555088', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11794341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 830 руб. Оплачено=2 518 руб. К оплате=2 829 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11098, '79145555088', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11794341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 830 руб. Оплачено=2 518 руб. К оплате=2 829 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11099, '79145691999', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 21345341643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 426 руб. Оплачено=1 000 руб. К оплате=1 200 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11100, '79246803518', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12544041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 271 руб. Оплачено=1 243 руб. К оплате=1 271 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11101, '79246811580', to_date('03-04-2012 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:52:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12357141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=958 руб. Оплачено=1 076 руб. К оплате=958 руб.' || chr(10) || 'ОАО "Ростелеком" (ИСС): Начислено=0 руб. Оплачено=0 руб. Переплата=10 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11102, '79145693548', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12692741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 978 руб. Оплачено=2 000 руб. К оплате=1 971 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11103, '79143837175', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19386741642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=453 руб. Оплачено=1 150 руб. К оплате=419 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11104, '79145799140', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19426741642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=522 руб. Оплачено=1 000 руб. Переплата=66 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11105, '79143877388', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16661341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 269 руб. Оплачено=1 150 руб. К оплате=1 240 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11106, '79145512498', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:53:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12216841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=716 руб. Оплачено=850 руб. К оплате=705 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11107, '79145500002', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16709241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 794 руб. Оплачено=1 947 руб. К оплате=1 794 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11108, '79145389708', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 14550241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=852 руб. Оплачено=806 руб. К оплате=852 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11109, '79622940636', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16212441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 592 руб. Оплачено=1 495 руб. К оплате=1 591 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11110, '79622855319', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 17362841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=929 руб. Оплачено=929 руб. К оплате=929 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11111, '79145830387', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13633241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 012 руб. Оплачено=261 руб. К оплате=1 012 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11112, '79145998513', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:55:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15388741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 185 руб. Оплачено=1 313 руб. К оплате=1 184 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11113, '79145506351', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:55:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13952641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=986 руб. Оплачено=770 руб. К оплате=986 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11114, '79241428050', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:55:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15716741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 650 руб. Оплачено=2 500 руб. К оплате=1 238 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11115, '79145386697', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:55:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15964741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 179 руб. Оплачено=1 242 руб. К оплате=1 178 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11116, '79145555028', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:55:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13546441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=320 руб. Оплачено=300 руб. Переплата=98 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11117, '79638059715', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:56:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15579841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 167 руб. Оплачено=1 000 руб. К оплате=871 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11118, '79145547839', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:56:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13822541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=1 000 руб. Переплата=598 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11119, '79622854554', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:56:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13987941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=500 руб. Переплата=0 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11120, '79143934757', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:56:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16772341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 448 руб. Оплачено=1 417 руб. К оплате=1 448 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11121, '79246725431', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:56:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13239141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 114 руб. Оплачено=1 467 руб. К оплате=2 114 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11122, '79145848500', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:57:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 35037241658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 173 руб. Оплачено=2 884 руб. К оплате=3 173 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11123, '79145584440', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:57:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 17693841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=772 руб. Оплачено=510 руб. К оплате=764 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11124, '79622957777', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:57:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24175041658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 820 руб. Оплачено=3 000 руб. К оплате=420 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11125, '79638044932', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:57:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22689641646; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 102 руб. Оплачено=3 300 руб. К оплате=3 035 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11126, '79145962039', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:57:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 17054141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=364 руб. Оплачено=0 руб. К оплате=926 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11127, '79622831759', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:58:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 12115141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 486 руб. Оплачено=1 800 руб. К оплате=1 471 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11128, '79098844586', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:58:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24086941658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=478 руб. Оплачено=425 руб. К оплате=478 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11129, '79146195021', to_date('03-04-2012 13:32:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:58:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 14993541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 314 руб. Оплачено=2 630 руб. К оплате=4 512 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11130, '79143911187', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:58:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24345241658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 744 руб. Оплачено=2 000 руб. К оплате=2 675 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11131, '79143965651', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:58:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24258841658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 245 руб. Оплачено=1 243 руб. К оплате=1 245 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11132, '79638045327', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16107941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 504 руб. Оплачено=0 руб. К оплате=2 836 руб.' || chr(10) || '', 3, 0);
commit;
prompt 1000 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11133, '79145549370', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 11736741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 092 руб. Оплачено=1 081 руб. К оплате=1 092 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11134, '79638054043', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22140141647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=534 руб. Оплачено=500 руб. К оплате=359 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11135, '79622831680', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24453241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 748 руб. Оплачено=3 000 руб. К оплате=5 412 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11136, '79145769772', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 13:59:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24570941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 411 руб. Оплачено=1 500 руб. К оплате=1 295 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11137, '79243414512', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 24572741643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=972 руб. Оплачено=1 000 руб. К оплате=931 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11138, '79145745279', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 25898441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 672 руб. Оплачено=5 604 руб. К оплате=2 672 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11139, '79145562526', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26231841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=813 руб. Оплачено=1 000 руб. К оплате=342 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11140, '79145781303', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26019641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 683 руб. Оплачено=711 руб. К оплате=1 682 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11141, '79145927288', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:00:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26057741653; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 267 руб. Оплачено=2 237 руб. К оплате=2 267 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11142, '79246782483', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 40432841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 805 руб. Оплачено=1 500 руб. К оплате=476 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11143, '79098144388', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 40449441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 499 руб. Оплачено=1 266 руб. К оплате=1 498 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11144, '79246709059', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 40549541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 743 руб. Оплачено=0 руб. К оплате=5 223 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11145, '79098136181', to_date('03-04-2012 13:32:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 31031541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 423 руб. Оплачено=0 руб. К оплате=1 334 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11146, '79622947966', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:01:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 23556441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=393 руб. Оплачено=800 руб. К оплате=379 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11147, '79143858538', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26990341644; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 224 руб. Оплачено=2 000 руб. К оплате=2 122 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11148, '79145578875', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27085041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 134 руб. Оплачено=1 672 руб. К оплате=1 133 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11149, '79145874582', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27049441649; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 577 руб. Оплачено=1 700 руб. К оплате=1 540 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11150, '79622946453', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27256041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 768 руб. Оплачено=2 500 руб. К оплате=2 326 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11151, '79145925039', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27460241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 829 руб. Оплачено=1 598 руб. К оплате=1 829 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11152, '79098854122', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27384041634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=285 руб. Оплачено=248 руб. К оплате=285 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11153, '79246728233', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27347641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=964 руб. Оплачено=900 руб. К оплате=952 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11154, '79622930933', to_date('03-04-2012 13:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27387741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=536 руб. Оплачено=600 руб. К оплате=300 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11155, '79241478514', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28042141647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=614 руб. Оплачено=590 руб. К оплате=610 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11156, '79145822333', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:03:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28072641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=473 руб. Оплачено=0 руб. К оплате=919 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11157, '79145666719', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28138741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 317 руб. Оплачено=1 056 руб. К оплате=1 317 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11158, '79146102000', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28121441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=4 126 руб. Оплачено=3 055 руб. К оплате=4 126 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11159, '79246787612', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28123341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 294 руб. Оплачено=4 500 руб. К оплате=2 219 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11160, '79246804303', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28251141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 606 руб. Оплачено=1 650 руб. К оплате=1 592 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11161, '79246813261', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:04:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28083941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=817 руб. Оплачено=55 руб. К оплате=813 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=21 руб.' || chr(10) || 'ЗАО "Аудиотеле": Начислено=0 руб. Оплачено=0 руб. Переплата=10 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11162, '79098175278', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27814141658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 887 руб. Оплачено=3 000 руб. К оплате=1 202 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11163, '79638156033', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27936341647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=801 руб. Оплачено=813 руб. К оплате=801 руб.' || chr(10) || 'ОАО "МТТ": Начислено=12 руб. Оплачено=54 руб. К оплате=11 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11164, '79246803405', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28045541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=869 руб. Оплачено=965 руб. К оплате=869 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11165, '79246734648', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 27898341652; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 120 руб. Оплачено=771 руб. К оплате=1 120 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11166, '79622846498', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:05:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28013841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=874 руб. Оплачено=0 руб. Переплата=31 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11167, '79622931995', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28024641643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 047 руб. Оплачено=1 866 руб. К оплате=2 046 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11168, '79146173054', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28556841656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 101 руб. Оплачено=1 200 руб. К оплате=1 080 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11169, '79145794545', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28457041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 058 руб. Оплачено=1 045 руб. К оплате=1 057 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11170, '79638009470', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28457041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 058 руб. Оплачено=1 045 руб. К оплате=1 057 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11171, '79146138606', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28279741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 492 руб. Оплачено=1 480 руб. К оплате=1 491 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11172, '79622930181', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28461841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=890 руб. Оплачено=1 030 руб. К оплате=803 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=90 руб. Переплата=3 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11173, '79145855757', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 23697141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=17 710 руб. Оплачено=33 790 руб. К оплате=17 710 руб.' || chr(10) || 'ОАО "Ростелеком" (МГ/МН): Начислено=779 руб. Оплачено=874 руб. К оплате=779 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11174, '79143871700', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28264241634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 103 руб. Оплачено=1 000 руб. К оплате=1 586 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11175, '79246807874', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28390641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 030 руб. Оплачено=2 000 руб. К оплате=1 881 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11176, '79246834648', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:07:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28257441643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=777 руб. Оплачено=750 руб. К оплате=763 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11177, '79098848542', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15735841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 464 руб. Оплачено=1 652 руб. К оплате=1 464 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11178, '79143977727', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28928741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=840 руб. Оплачено=715 руб. К оплате=839 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11179, '79145830913', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28659141658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 650 руб. Оплачено=1 700 руб. К оплате=1 514 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11180, '79246751592', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28745941658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 373 руб. Оплачено=1 320 руб. К оплате=1 370 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11181, '79246826566', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:08:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28736941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=632 руб. Оплачено=400 руб. К оплате=626 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11182, '79145699102', to_date('03-04-2012 13:32:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28878041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=336 руб. Оплачено=413 руб. К оплате=487 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11183, '79622949096', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28655241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 597 руб. Оплачено=4 000 руб. К оплате=957 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11184, '79622852462', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28648841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 731 руб. Оплачено=1 500 руб. К оплате=1 629 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11185, '79246803770', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29013841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=706 руб. Оплачено=2 073 руб. К оплате=706 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11186, '79143263356', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29337741658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 544 руб. Оплачено=4 970 руб. К оплате=2 533 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11187, '79246803535', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29023841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 090 руб. Оплачено=2 200 руб. К оплате=2 306 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11188, '79143966563', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 16600041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=869 руб. Оплачено=1 000 руб. К оплате=865 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11189, '79145972954', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29387341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 069 руб. Оплачено=1 035 руб. К оплате=1 069 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11190, '79622945199', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28753541658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 069 руб. Оплачено=1 000 руб. К оплате=3 520 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11191, '79246792530', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:10:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15080741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 834 руб. Оплачено=1 420 руб. К оплате=1 833 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11192, '79638092161', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29227241634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=30 руб. Оплачено=247 руб. К оплате=3 750 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11193, '79638058809', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29225141639; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 199 руб. Оплачено=1 000 руб. К оплате=81 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11194, '79622854204', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29115441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 378 руб. Оплачено=1 440 руб. К оплате=1 377 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11195, '79246734351', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29293741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 724 руб. Оплачено=1 700 руб. К оплате=1 718 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11196, '79243414599', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:11:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29119141643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 335 руб. Оплачено=1 120 руб. К оплате=1 335 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11197, '79246705673', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29262341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 978 руб. Оплачено=1 500 руб. К оплате=1 640 руб.' || chr(10) || 'ОАО "МТТ": Начислено=78 руб. Оплачено=0 руб. Переплата=48 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11198, '79241439306', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29864641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 472 руб. Оплачено=1 712 руб. К оплате=1 471 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=0 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11199, '79248402055', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29799741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 130 руб. Оплачено=1 500 руб. К оплате=742 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11200, '79146120686', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29816041658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=450 руб. К оплате=342 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11201, '79146003127', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:12:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29891041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 269 руб. Оплачено=1 448 руб. К оплате=877 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11202, '79098177925', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29968541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=841 руб. Оплачено=612 руб. К оплате=680 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11203, '79143955297', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29967941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 647 руб. Оплачено=1 700 руб. К оплате=1 626 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11204, '79246782215', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29554541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 339 руб. Оплачено=3 000 руб. К оплате=3 284 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=1 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11205, '79145672842', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29691341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=865 руб. Оплачено=1 000 руб. Переплата=410 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11206, '79140424200', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:13:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29705941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 478 руб. Оплачено=2 000 руб. К оплате=1 294 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11207, '79098177246', to_date('03-04-2012 13:32:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29620841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=889 руб. Оплачено=700 руб. К оплате=815 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11208, '79145770130', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63087741654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=5 436 руб. Оплачено=12 000 руб. К оплате=3 309 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11209, '79098950041', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29537641645; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 959 руб. Оплачено=0 руб. К оплате=4 228 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11210, '79147483647', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29709841651; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 394 руб. Оплачено=1 200 руб. К оплате=393 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11211, '79143938461', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:14:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29562641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 349 руб. Оплачено=1 600 руб. К оплате=1 347 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11212, '79619520435', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29605341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=443 руб. Оплачено=1 000 руб. Переплата=823 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11213, '79638009729', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29544041634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 576 руб. Оплачено=1 800 руб. К оплате=2 558 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11214, '79140434735', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29574341649; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 963 руб. Оплачено=350 руб. К оплате=1 963 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11215, '79145660498', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29697641656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 029 руб. Оплачено=864 руб. К оплате=1 029 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11216, '79638060887', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:15:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29545441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=315 руб. Оплачено=500 руб. К оплате=65 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11217, '79638024315', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30182041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=990 руб. Оплачено=1 000 руб. К оплате=881 руб.' || chr(10) || 'ЗАО "КТТК": Начислено=17 руб. Оплачено=0 руб. Переплата=24 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11218, '79622932096', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30218841647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 312 руб. Оплачено=3 944 руб. К оплате=1 311 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11219, '79143805380', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30066941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=670 руб. Оплачено=2 100 руб. К оплате=650 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=36 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11220, '79246706437', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30031141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 559 руб. Оплачено=2 550 руб. К оплате=1 533 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11221, '79145641864', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:16:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30123741656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 342 руб. Оплачено=0 руб. К оплате=2 879 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. К оплате=366 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11222, '79244474386', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30171341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 510 руб. Оплачено=2 200 руб. К оплате=2 434 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11223, '79146055088', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30235241648; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 790 руб. Оплачено=2 000 руб. К оплате=152 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11224, '79098111169', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30058441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=779 руб. Оплачено=779 руб. К оплате=779 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11225, '79619515297', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30149741638; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 149 руб. Оплачено=1 000 руб. К оплате=757 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11226, '79241410019', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:17:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 20161541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=695 руб. Оплачено=1 644 руб. К оплате=541 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11227, '79241410019', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 20161541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=695 руб. Оплачено=1 644 руб. К оплате=541 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11228, '79246773188', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 44834641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 529 руб. Оплачено=1 550 руб. К оплате=1 501 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11229, '79619548748', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 52907941644; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=7 918 руб. Оплачено=0 руб. К оплате=15 818 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11230, '79246831373', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30283541643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=706 руб. Оплачено=675 руб. К оплате=706 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11231, '79246831773', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:18:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30283541643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=706 руб. Оплачено=675 руб. К оплате=706 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11232, '79248421875', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30261441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=779 руб. Оплачено=0 руб. К оплате=777 руб.' || chr(10) || '', 3, 0);
commit;
prompt 1100 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11233, '79241401884', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30369941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=388 руб. Оплачено=384 руб. К оплате=387 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11234, '79246723371', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30325141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=757 руб. Оплачено=0 руб. Переплата=5 284 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11235, '79145384656', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 44926441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 360 руб. Оплачено=2 000 руб. К оплате=715 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11236, '79145384656', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 44926441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 360 руб. Оплачено=2 000 руб. К оплате=715 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11237, '79145794469', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:21:00', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45044841654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 816 руб. Оплачено=3 000 руб. К оплате=2 622 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11238, '79145722323', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:21:00', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45047741643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 430 руб. Оплачено=478 руб. К оплате=1 948 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11239, '79145525182', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:21:00', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45194341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 230 руб. Оплачено=2 230 руб. К оплате=2 230 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11240, '79143904790', to_date('03-04-2012 13:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:21:00', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45445741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=972 руб. Оплачено=800 руб. К оплате=972 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11241, '79143840654', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:21:00', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45696441643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 449 руб. Оплачено=1 299 руб. К оплате=1 449 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11242, '79145827186', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 45718841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 000 руб. К оплате=18 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11243, '79143901372', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 59759641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 225 руб. Оплачено=1 099 руб. К оплате=1 225 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11244, '79145524936', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46043041656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=850 руб. Оплачено=850 руб. К оплате=849 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11245, '79243461388', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46116041645; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 199 руб. Оплачено=0 руб. К оплате=2 394 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11246, '79145699708', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46184241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=646 руб. Оплачено=565 руб. К оплате=646 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11247, '79146010936', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46228141643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=880 руб. Оплачено=1 500 руб. К оплате=341 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11248, '79098130277', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46323541658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=174 руб. Оплачено=29 руб. К оплате=174 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11249, '79145795552', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46385441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=417 руб. Оплачено=700 руб. К оплате=327 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11250, '79246729049', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46416741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=618 руб. Оплачено=500 руб. К оплате=599 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11251, '79098128485', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46566641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 329 руб. Оплачено=3 310 руб. К оплате=3 327 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11252, '79622851756', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46597241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 629 руб. Оплачено=1 350 руб. К оплате=1 582 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11253, '79622851756', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46597241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 629 руб. Оплачено=1 350 руб. К оплате=1 582 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11254, '79143807165', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46613441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=1 139 руб. К оплате=1 139 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11255, '79098953070', to_date('03-04-2012 13:32:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 46618941645; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 730 руб. Оплачено=1 712 руб. К оплате=1 730 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11421, '79248420004', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73740241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=739 руб. Оплачено=600 руб. К оплате=724 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11422, '79244420213', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73670541651; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 291 руб. Оплачено=1 149 руб. К оплате=292 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11423, '79246711096', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73299741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=650 руб. К оплате=643 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11424, '79145630524', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73037741647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 258 руб. Оплачено=1 473 руб. К оплате=1 258 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11425, '79098153059', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 72593241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 049 руб. К оплате=1 049 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11426, '79140435240', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73355641643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=999 руб. Оплачено=1 000 руб. К оплате=998 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11427, '79145613043', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73528941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 072 руб. Оплачено=100 руб. К оплате=1 069 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11428, '79143881316', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73613941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 049 руб. К оплате=1 049 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11429, '79140449926', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73600641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=499 руб. К оплате=499 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11430, '79246750194', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73674441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=739 руб. Оплачено=736 руб. К оплате=739 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11431, '79246750194', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73674441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=739 руб. Оплачено=736 руб. К оплате=739 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11432, '79146131285', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73674441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=739 руб. Оплачено=736 руб. К оплате=739 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11433, '79143807402', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 72849341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=803 руб. Оплачено=650 руб. К оплате=795 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11434, '79143807402', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 72849341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=803 руб. Оплачено=650 руб. К оплате=795 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11435, '79145380113', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73255641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 885 руб. Оплачено=2 859 руб. К оплате=1 885 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11436, '79246804922', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73332941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=500 руб. К оплате=646 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11437, '79143830865', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 72655341647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=542 руб. Оплачено=550 руб. К оплате=541 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11438, '79143805589', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73642341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 749 руб. Оплачено=0 руб. К оплате=3 197 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11439, '79241438155', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73731441654; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 593 руб. Оплачено=6 000 руб. К оплате=446 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11440, '79098189090', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73722441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=666 руб. Оплачено=610 руб. К оплате=666 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11441, '79147483647', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 99647341656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=854 руб. Оплачено=1 010 руб. К оплате=845 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11442, '79241438695', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74387041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 руб. Оплачено=0 руб. К оплате=38 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11443, '79143835353', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74158741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=249 руб. Оплачено=0 руб. К оплате=833 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11444, '79619569241', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74249241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=1 000 руб. Переплата=98 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11445, '79244411058', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74111341643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=236 руб. К оплате=1 138 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11446, '79243412002', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73777141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=499 руб. К оплате=649 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11447, '79622840625', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73847341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=611 руб. К оплате=1 139 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11448, '79140444279', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74077041643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=212 руб. Оплачено=210 руб. К оплате=3 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11449, '79146112707', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 75025541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 028 руб. Оплачено=0 руб. К оплате=1 028 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11450, '79619597571', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73845941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 299 руб. Оплачено=1 255 руб. К оплате=1 299 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11451, '79145637776', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 75013641647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=367 руб. Оплачено=0 руб. К оплате=367 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11452, '79619544925', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 75139141658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=264 руб. Оплачено=0 руб. К оплате=264 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11453, '79244484913', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 74454741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=898 руб. Оплачено=0 руб. К оплате=898 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11454, '79143825541', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л.с. 73790141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=650 руб. К оплате=648 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11498, '79243057781', to_date('03-04-2012 13:59:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11500, '79146990393', to_date('03-04-2012 14:01:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:25:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 4, 'Л/с: 101117542360; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11501, '79638200020', to_date('03-04-2012 14:03:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2700047779; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ОТА): ' || chr(10) || 'Антивирус Kaspersky Internet Security 2011, подписка на 1 компьютерАнтивирус Kaspersky Internet Security 2011, подписка на 1 компьютер', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11502, '79147161818', to_date('03-04-2012 14:03:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11503, '79147161818', to_date('03-04-2012 14:03:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11505, '79241086744', to_date('03-04-2012 14:09:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11507, '79243182829', to_date('03-04-2012 14:10:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000454106; дата платежа 31.03.2012;' || chr(10) || 'поступила оплата от: 681000 МУП "ЕРКЦ" (ФИЛИАЛ №4) 50/22 SL4_1 Г.КОМСОМОЛЬСК-НА-АМУРЕ; сумма 306 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11511, '79020771709', to_date('03-04-2012 14:19:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101723342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11514, '79020771709', to_date('03-04-2012 14:21:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101723342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11515, '79241428050', to_date('03-04-2012 14:24:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15716741620; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: 72: КАССА 4, 5, 6 БЛАГОВЕЩЕНСК; сумма 1 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 912 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11516, '79638059715', to_date('03-04-2012 14:24:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15579841620; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: КАССА 2 ЦОК 1 Благовещенск; сумма 871 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 167 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11517, '79143995004', to_date('03-04-2012 14:24:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 47297241620; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 430 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 430 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11519, '79241833879', to_date('03-04-2012 14:29:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42437104845; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4243727714)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11522, '79242036379', to_date('03-04-2012 14:34:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:35:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200236885; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-КОМБИНИРОВАННЫЙ (основной) (4212545750)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11523, '79098848542', to_date('03-04-2012 14:35:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:36:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 15735841620; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '416: Передача голос. инф. ПОВРЕМЕННЫЙ (4162474027)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11524, '79241825864', to_date('03-04-2012 14:35:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:36:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424313188; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4243141311)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11525, '79147555451', to_date('03-04-2012 14:36:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:37:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242241609; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4242797982)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11526, '79621236871', to_date('03-04-2012 14:38:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:39:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242267823; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-КОМБИНИРОВАННЫЙ (основной) (4242774274)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11527, '79241807077', to_date('03-04-2012 14:38:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:39:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242235675; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-КОМБИНИРОВАННЫЙ (основной) (4242770500)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11528, '79242854862', to_date('03-04-2012 14:39:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:40:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243516731; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4243542063)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11529, '79241086744', to_date('03-04-2012 14:49:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:50:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11531, '79084483681', to_date('03-04-2012 15:00:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1261300925 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11532, '79020771709', to_date('03-04-2012 15:00:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101723342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11533, '79147161818', to_date('03-04-2012 15:02:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:03:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11534, '79020771709', to_date('03-04-2012 15:03:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:04:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101723342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11535, '79098512012', to_date('03-04-2012 15:05:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:06:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000088769; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-ПОВРЕМЕННЫЙ (4212547099)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11536, '79638189866', to_date('03-04-2012 15:07:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:08:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73161641641  Уважаемый абонент! 03.04. 15:07 Вы воспользовались услугой ' || chr(10) || '                           "Обещанный Платеж" в размере 1858 руб. Пополнить баланс на эту сумму необходимо до 08.04.2012 Ваш Ростелеком.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11537, '79098643180', to_date('03-04-2012 15:11:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:12:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380028080; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-ПОВРЕМЕННЫЙ (4213721064)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11538, '79510295646', to_date('03-04-2012 15:13:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:14:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27459842320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11455, '79145690374', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75123441643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=224 руб. Оплачено=0 руб. К оплате=224 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11456, '79832458333', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75127341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=295 руб. Оплачено=0 руб. К оплате=295 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11457, '79146092474', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75094941651; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=321 руб. Оплачено=2 000 руб. Переплата=1 679 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11458, '79638158605', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74097641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=699 руб. Оплачено=288 руб. К оплате=699 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11459, '79145550465', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75123641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=230 руб. Оплачено=0 руб. К оплате=230 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11460, '79098102594', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73819041658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 057 руб. Оплачено=950 руб. К оплате=1 046 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11461, '79147483647', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73784541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=617 руб. Оплачено=200 руб. К оплате=536 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11462, '79145608089', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74479141641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=552 руб. Оплачено=0 руб. К оплате=552 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11463, '79146132049', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73786941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=929 руб. Оплачено=1 281 руб. К оплате=928 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11464, '79098135483', to_date('03-04-2012 13:32:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73961341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=545 руб. Оплачено=293 руб. К оплате=545 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11465, '79146110887', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74111541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=862 руб. Переплата=1 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11466, '79145711111', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73781141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=984 руб. Оплачено=0 руб. К оплате=627 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11467, '79145772214', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74152841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=119 руб. Оплачено=258 руб. К оплате=119 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11468, '79638111196', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73881041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=600 руб. Переплата=22 руб.' || chr(10) || '', 3, 0);
commit;
prompt 1200 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11469, '79638111196', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73881041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=600 руб. Переплата=22 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11470, '79146049627', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74104541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=0 руб. К оплате=1 057 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11471, '79243413808', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74055241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=293 руб. Переплата=0 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11472, '79145856069', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73923241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=549 руб. Оплачено=500 руб. К оплате=49 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11473, '79098104197', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75010441641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=327 руб. Оплачено=0 руб. К оплате=327 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11474, '79638150922', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73930341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=223 руб. Оплачено=0 руб. К оплате=223 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11475, '79144294569', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75048841641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 038 руб. Оплачено=0 руб. К оплате=1 038 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11476, '79246728133', to_date('03-04-2012 13:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73985241647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=669 руб. Оплачено=379 руб. К оплате=669 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11477, '79145533078', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75017341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=226 руб. Оплачено=0 руб. К оплате=226 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11478, '79243470444', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74231241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=150 руб. Переплата=747 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11479, '79619514553', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73993241647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=400 руб. К оплате=495 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11480, '79241495041', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74049241653; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 152 руб. Оплачено=1 150 руб. К оплате=3 149 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11481, '79638154776', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75050641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=80 руб. Оплачено=0 руб. К оплате=80 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11482, '79145591173', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 74217341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 301 руб. Оплачено=1 500 руб. К оплате=204 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11483, '79143982966', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75138941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=32 руб. Оплачено=0 руб. К оплате=32 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11484, '79622940897', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73932841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 532 руб. Оплачено=270 руб. К оплате=1 531 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11485, '79146149965', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73780041643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 539 руб. Оплачено=1 550 руб. К оплате=1 526 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11486, '79146172334', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 75052041643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=398 руб. Оплачено=0 руб. К оплате=398 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11487, '79143896266', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73940341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=1 000 руб. Переплата=1 000 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11488, '79146000601', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73950841652; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 699 руб. Оплачено=1 150 руб. К оплате=1 688 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11489, '79246772635', to_date('03-04-2012 13:32:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73921441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 749 руб. Оплачено=990 руб. К оплате=108 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11490, '79242597845', to_date('03-04-2012 13:36:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 52836742340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11491, '79146541022', to_date('03-04-2012 13:37:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 18788342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11492, '79147071156', to_date('03-04-2012 13:45:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25917842320; дата: 01.04.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11493, '79020520274', to_date('03-04-2012 13:48:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102066942340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11494, '79020520274', to_date('03-04-2012 13:48:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:26:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102066942340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11495, '79147161818', to_date('03-04-2012 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11496, '79147161818', to_date('03-04-2012 13:59:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11497, '79147161818', to_date('03-04-2012 13:59:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11499, '79098863527', to_date('03-04-2012 14:00:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380028142; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ЦПП Ванино; сумма 609 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 991 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11504, '79024834062', to_date('03-04-2012 14:06:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101796042320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11506, '79146990393', to_date('03-04-2012 14:09:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101117542360; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11508, '79146990393', to_date('03-04-2012 14:10:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101117542360; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11509, '79146990393', to_date('03-04-2012 14:11:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101117542360; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11510, '79510295646', to_date('03-04-2012 14:14:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 27459842320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11512, '79622986436', to_date('03-04-2012 14:20:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380030771; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 796 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11513, '79622986436', to_date('03-04-2012 14:20:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380030771; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Касса абон.отд.; сумма 796 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11518, '79621227846', to_date('03-04-2012 14:26:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 42422286005; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4242727921)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11520, '79241956935', to_date('03-04-2012 14:30:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4244712676; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '424: ГТС-ПОВРЕМЕННЫЙ (4244721567)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11521, '79241086744', to_date('03-04-2012 14:30:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11530, '79141883922', to_date('03-04-2012 14:56:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:57:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380012023; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-ПОВРЕМЕННЫЙ (4213866433)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11539, '79146541022', to_date('03-04-2012 15:13:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:14:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 18788342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11540, '79242597845', to_date('03-04-2012 15:13:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:14:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 52836742340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11541, '79141535117', to_date('03-04-2012 15:15:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:16:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000359405; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-ПОВРЕМЕННЫЙ (4212534600)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11542, '79024839458', to_date('03-04-2012 15:18:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:18:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Обороты собраны на 413', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11543, '79241086744', to_date('03-04-2012 15:21:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:22:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11544, '79145998333', to_date('03-04-2012 15:22:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:23:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11545, '79622225402', to_date('03-04-2012 15:25:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:26:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200318379; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: ГТС-ПОВРЕМЕННЫЙ (4212488782)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11546, '79084483681', to_date('03-04-2012 15:25:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:26:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1261300925 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11547, '79098088813', to_date('03-04-2012 15:26:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:27:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000122692; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ТПП 76/3 СЕРВИСНЫЙ ЦЕНТР; сумма 1 146 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 146 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11548, '79098088813', to_date('03-04-2012 15:27:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:28:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000122692; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ТПП 76/3 СЕРВИСНЫЙ ЦЕНТР; сумма 354 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 500 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11289, '79146098845', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 52800041643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=992 руб. Оплачено=646 руб. К оплате=991 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11290, '79146197975', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 51186541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 965 руб. Оплачено=2 000 руб. К оплате=1 894 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11291, '79241411225', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 51198141656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=904 руб. Оплачено=800 руб. К оплате=902 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11292, '79243406641', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30436241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 586 руб. Оплачено=1 520 руб. К оплате=1 585 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11293, '79145566416', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 81230241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=240 руб. Оплачено=0 руб. К оплате=443 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11294, '79145596829', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 51245941641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=629 руб. Оплачено=600 руб. К оплате=1 246 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11295, '79638002246', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55770141656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 554 руб. Оплачено=1 500 руб. К оплате=2 510 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11296, '79145646272', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 52130041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=419 руб. Оплачено=998 руб. К оплате=418 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11297, '79241473882', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 30460941648; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=816 руб. Оплачено=0 руб. К оплате=1 566 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11298, '79145936887', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80149241658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 737 руб. Оплачено=1 557 руб. К оплате=2 736 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=91 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11299, '79243448582', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53123341634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=380 руб. Оплачено=360 руб. К оплате=380 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11300, '79145562526', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55797641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 300 руб. Оплачено=1 500 руб. К оплате=192 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11301, '79638050912', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 52676341639; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 330 руб. Оплачено=4 602 руб. К оплате=2 329 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11302, '79638088786', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 15589141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 892 руб. Оплачено=1 750 руб. К оплате=1 870 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11303, '79638141010', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80287741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 056 руб. Оплачено=926 руб. К оплате=1 056 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11304, '79145749484', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53052341643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=330 руб. Оплачено=330 руб. К оплате=330 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11305, '79248485136', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80157641636; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 333 руб. Оплачено=1 104 руб. К оплате=1 315 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11306, '79248485136', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80159541636; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=150 руб. Оплачено=394 руб. К оплате=142 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11307, '79246819110', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55807541642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 835 руб. Оплачено=0 руб. К оплате=5 463 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11308, '79638107783', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55779441648; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 087 руб. Оплачено=0 руб. К оплате=1 911 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11309, '79622946452', to_date('03-04-2012 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 23882041658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 322 руб. Оплачено=1 500 руб. К оплате=1 125 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11310, '79139726289', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 70286741652; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=29 255 руб. Оплачено=27 471 руб. К оплате=29 255 руб.' || chr(10) || 'ОАО "Ростелеком" (МГ/МН): Начислено=5 758 руб. Оплачено=0 руб. К оплате=5 758 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11311, '79622842040', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 22058741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 099 руб. Оплачено=700 руб. К оплате=1 020 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11312, '79246721087', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 14556641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 288 руб. Оплачено=2 421 руб. К оплате=2 287 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11313, '79244435034', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80300041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 293 руб. Оплачено=1 289 руб. К оплате=1 293 руб.' || chr(10) || 'ОАО "МТТ": Начислено=21 руб. Оплачено=0 руб. К оплате=21 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11314, '79145890799', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55682841643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 654 руб. Оплачено=0 руб. К оплате=4 574 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11315, '79145848067', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 26007141658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=30 руб. Оплачено=0 руб. К оплате=120 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11316, '79622931299', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80270441658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 021 руб. К оплате=1 049 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11317, '79145650405', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 80312541656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 442 руб. Оплачено=2 325 руб. К оплате=2 442 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11318, '79143835886', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53878441642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 394 руб. Оплачено=10 руб. К оплате=4 672 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11319, '79246806102', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53792641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=940 руб. Оплачено=0 руб. К оплате=265 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11320, '79145656450', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53738241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 334 руб. Оплачено=1 900 руб. К оплате=783 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11321, '79143979240', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53418441643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 760 руб. Оплачено=1 750 руб. К оплате=1 757 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11322, '79622856020', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53823341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=880 руб. Оплачено=1 000 руб. К оплате=788 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11323, '79638064363', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53839941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 597 руб. Оплачено=2 309 руб. К оплате=1 581 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11324, '79146039153', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 53780041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=923 руб. Оплачено=1 050 руб. К оплате=909 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11325, '79145659068', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54184441620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 383 руб. Оплачено=2 200 руб. К оплате=2 363 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11326, '79140427244', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:27:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54377741643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 434 руб. Оплачено=1 959 руб. К оплате=2 434 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11327, '79143807133', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54570341643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=2 288 руб. К оплате=1 048 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11328, '79244403179', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54570941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 498 руб. Оплачено=3 000 руб. К оплате=1 484 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11329, '79638100456', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54570941643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 498 руб. Оплачено=3 000 руб. К оплате=1 484 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11330, '79243462503', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54702341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=270 руб. Переплата=69 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11331, '79241476909', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54745641647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=582 руб. Оплачено=1 300 руб. К оплате=515 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11332, '79098134136', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54637641656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 525 руб. Оплачено=2 500 руб. К оплате=1 692 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11333, '79098116062', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54917441658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=824 руб. Оплачено=2 000 руб. К оплате=425 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11334, '79638103971', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54572141656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 799 руб. Оплачено=1 700 руб. К оплате=1 758 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11335, '79246742803', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54685041641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 869 руб. Оплачено=2 032 руб. К оплате=1 868 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11336, '79145902913', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54638041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=210 руб. Оплачено=0 руб. К оплате=8 143 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11337, '79244404035', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54897241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=920 руб. К оплате=496 руб.' || chr(10) || '', 3, 0);
commit;
prompt 1300 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11338, '79638183234', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54621841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=799 руб. Оплачено=0 руб. К оплате=1 233 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11339, '79619568466', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 54414141647; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=112 руб. Оплачено=1 500 руб. К оплате=40 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11340, '79622932127', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 58443241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=859 руб. Оплачено=600 руб. К оплате=818 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11341, '79622856332', to_date('03-04-2012 13:32:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 57451241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 574 руб. Оплачено=509 руб. К оплате=1 574 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11342, '79244484913', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 62009241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=657 руб. Оплачено=0 руб. К оплате=3 337 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11343, '79244484913', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 62009241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=657 руб. Оплачено=0 руб. К оплате=3 337 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11344, '79145512000', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 56913341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=824 руб. Оплачено=324 руб. К оплате=824 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11345, '79146193498', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60685241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 092 руб. Оплачено=2 506 руб. К оплате=1 092 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11346, '79145723069', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 56125241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=729 руб. Оплачено=975 руб. К оплате=728 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11347, '79143988286', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 57855241655; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 261 руб. Оплачено=0 руб. Переплата=222 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11348, '79145745244', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 57481241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 676 руб. Оплачено=1 768 руб. К оплате=1 676 руб.' || chr(10) || 'ОАО "МТТ": Начислено=0 руб. Оплачено=0 руб. Переплата=20 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11349, '79246711913', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 56989241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=929 руб. Оплачено=0 руб. К оплате=1 239 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11350, '79145553167', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 61617241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 648 руб. Оплачено=550 руб. К оплате=1 398 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11351, '79146021304', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60803241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=620 руб. Оплачено=462 руб. К оплате=620 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11352, '79145940045', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55003241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=879 руб. Оплачено=1 000 руб. К оплате=756 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11353, '79143860730', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 55074041653; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=3 613 руб. Оплачено=3 601 руб. К оплате=3 613 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11354, '79619534970', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 58501541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 522 руб. Оплачено=1 776 руб. К оплате=1 522 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11355, '79619521660', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 57089341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 360 руб. Оплачено=0 руб. К оплате=3 983 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11356, '79143811674', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 58879341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 639 руб. Оплачено=1 700 руб. Переплата=83 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11357, '79143811674', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 58879341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 639 руб. Оплачено=1 700 руб. Переплата=83 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11358, '79140419244', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 59933641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=699 руб. Оплачено=1 000 руб. Переплата=145 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11359, '79246791114', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60577241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 277 руб. Оплачено=1 479 руб. К оплате=1 277 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11360, '79619596999', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 59979241638; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=429 руб. Оплачено=0 руб. К оплате=429 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11361, '79246840830', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60645341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=957 руб. Оплачено=0 руб. К оплате=2 439 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11362, '79145694583', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 56811241642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 488 руб. Оплачено=2 010 руб. Переплата=14 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11363, '79246829100', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 61645241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 124 руб. Оплачено=1 100 руб. К оплате=1 096 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11364, '79140416688', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 64435241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=224 руб. Оплачено=0 руб. К оплате=4 573 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11365, '79098178442', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 62637241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 093 руб. Оплачено=952 руб. К оплате=1 093 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11366, '79246717818', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63359241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=809 руб. Оплачено=0 руб. К оплате=1 617 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11367, '79622850018', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 67591341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=286 руб. Оплачено=1 000 руб. Переплата=1 288 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11368, '79246806902', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63897241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 366 руб. Оплачено=1 430 руб. К оплате=1 284 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11369, '79146091567', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 67697341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=30 руб. Оплачено=2 860 руб. К оплате=30 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11370, '79145552370', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 64315241642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 429 руб. Оплачено=0 руб. К оплате=2 535 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11371, '79145384346', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68391741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 029 руб. Оплачено=1 000 руб. К оплате=589 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11372, '79248474814', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68473641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 839 руб. Оплачено=1 835 руб. К оплате=1 839 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11373, '79246705820', to_date('03-04-2012 13:32:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 64803241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 783 руб. Оплачено=0 руб. К оплате=5 548 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11374, '79246711539', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 67535241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=397 руб. Оплачено=470 руб. К оплате=393 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11375, '79145669090', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68537241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=672 руб. Оплачено=2 000 руб. К оплате=1 703 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11376, '79619530748', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:28:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63615241639; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 236 руб. Оплачено=2 050 руб. К оплате=2 231 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11377, '79241406710', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 62235241634; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 199 руб. Оплачено=1 000 руб. К оплате=1 039 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11378, '79244454653', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63031041656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=0 руб. Оплачено=0 руб. Переплата=1 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11379, '79145380165', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 65385241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 536 руб. Оплачено=1 500 руб. К оплате=1 310 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11380, '79246754447', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68625341658; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 934 руб. Оплачено=2 199 руб. К оплате=1 934 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11381, '79248415216', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63747241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 738 руб. Оплачено=0 руб. К оплате=5 547 руб.' || chr(10) || 'ОАО "Ростелеком" (МГ/МН): Начислено=715 руб. Оплачено=742 руб. К оплате=715 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11382, '79145523341', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63151241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=773 руб. Оплачено=0 руб. К оплате=3 060 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11383, '79145523341', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 63151241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=773 руб. Оплачено=0 руб. К оплате=3 060 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11384, '79143903536', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 69297341641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 168 руб. Оплачено=753 руб. К оплате=1 167 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11385, '79246722507', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 71162141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=779 руб. Оплачено=778 руб. К оплате=779 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11386, '79246722507', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 71162141620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=779 руб. Оплачено=778 руб. К оплате=779 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11387, '79098952601', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 72359241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 090 руб. Оплачено=800 руб. К оплате=702 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11388, '79145830599', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 68987241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 499 руб. Оплачено=2 000 руб. К оплате=953 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11389, '79638008833', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 69543241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 387 руб. Оплачено=1 500 руб. К оплате=1 168 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11390, '79243470803', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 70713241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=2 119 руб. Оплачено=1 500 руб. К оплате=2 104 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11391, '79143903543', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 69009241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 474 руб. Оплачено=1 400 руб. К оплате=1 431 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11392, '79145998333', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 70085241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=622 руб. Оплачено=1 500 руб. К оплате=580 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11393, '79145980342', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 70519241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=370 руб. Оплачено=310 руб. К оплате=370 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11394, '79145567367', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73203241656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=500 руб. К оплате=495 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11395, '79145787619', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73344241643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=60 руб. К оплате=386 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11396, '79145590583', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73397241641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=499 руб. Оплачено=150 руб. К оплате=485 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11397, '79145683202', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73413641620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 080 руб. Оплачено=0 руб. К оплате=2 160 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11398, '79638077407', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73417841656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=0 руб. К оплате=1 276 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11399, '79241410122', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 99977141656; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=280 руб. Оплачено=0 руб. К оплате=543 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11400, '79145667874', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73424041620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=285 руб. Оплачено=0 руб. К оплате=797 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11401, '79243433414', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73257641643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=564 руб. Оплачено=241 руб. К оплате=564 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11402, '79143955155', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73232341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=549 руб. Оплачено=500 руб. К оплате=529 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11403, '79143934774', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73232541620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 049 руб. Оплачено=1 049 руб. К оплате=1 048 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11404, '79143881213', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73527341642; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 700 руб. Оплачено=1 700 руб. К оплате=1 522 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11405, '79145594473', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73665841620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=933 руб. Оплачено=600 руб. К оплате=754 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11406, '79619514752', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73225241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=1 000 руб. К оплате=293 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11407, '79143870818', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73731541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 558 руб. Оплачено=1 600 руб. К оплате=1 516 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11408, '79143870818', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73731541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 558 руб. Оплачено=1 600 руб. К оплате=1 516 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11409, '79140491859', to_date('03-04-2012 13:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73657941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=829 руб. Оплачено=232 руб. К оплате=829 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11410, '79246720288', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 72819341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=779 руб. Оплачено=1 015 руб. К оплате=777 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11411, '79246735201', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73088741620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=58 руб. Оплачено=0 руб. Переплата=1 214 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11412, '79140495331', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73109541641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=0 руб. К оплате=1 246 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11413, '79638189866', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73161641641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=929 руб. Оплачено=0 руб. К оплате=1 858 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11414, '79622846116', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73249241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=765 руб. Оплачено=1 049 руб. К оплате=765 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11415, '79246804908', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73523741641; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=809 руб. Оплачено=800 руб. К оплате=786 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11416, '79146006766', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73147241620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=739 руб. Оплачено=2 000 руб. К оплате=47 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11417, '79143883351', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73705941620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=649 руб. Оплачено=729 руб. К оплате=649 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11418, '79638184745', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73252341620; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=768 руб. Оплачено=1 000 руб. К оплате=174 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11419, '79145768451', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73662541643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=0 руб. К оплате=2 005 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11420, '79145768451', to_date('03-04-2012 13:32:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 14:31:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 73662541643; период Март     2012' || chr(10) || 'ОАО "Ростелеком": Начислено=1 139 руб. Оплачено=0 руб. К оплате=2 005 руб.' || chr(10) || '', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11549, '79242016440', to_date('03-04-2012 15:31:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:32:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200153051; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11553, '79084483681', to_date('03-04-2012 15:39:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:40:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1261300925 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11554, '79241050502', to_date('03-04-2012 15:39:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:40:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000059268; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '421: СТС-ПОВРЕМЕННЫЙ (4212495916)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11555, '79241086744', to_date('03-04-2012 15:45:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:46:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11557, '79241086744', to_date('03-04-2012 15:46:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:02:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS удаление архива завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11563, '79147054134', to_date('03-04-2012 16:02:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:03:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 101325242320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК; сумма 34 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 169 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11564, '79622252485', to_date('03-04-2012 16:04:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:04:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010084; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11565, '79084406863', to_date('03-04-2012 16:14:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:15:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102225842320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11566, '79145998333', to_date('03-04-2012 16:23:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:24:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 70085241620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11567, '79241239707', to_date('03-04-2012 16:25:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:26:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102247942335; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11574, '79141666763', to_date('03-04-2012 16:42:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:43:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380019190; дата: 03.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11577, '79147373000', to_date('03-04-2012 16:59:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:00:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28557942320; дата: 24.03.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11579, '79241545233', to_date('03-04-2012 17:15:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:16:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2633775048; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Платежная система Е-ПОРТ; сумма 3 500 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 896 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11604, '79243273323', to_date('03-04-2012 18:41:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:42:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 33735942363; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4236369688)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11606, '79243378209', to_date('03-04-2012 18:47:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:48:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 28539442320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-КОМБИНИРОВАННЫЙ (основной) (4232316050)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11611, '79242523078', to_date('03-04-2012 19:08:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:09:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 62779042337; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4233748057)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11616, '79025054929', to_date('03-04-2012 19:32:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:33:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 24893642320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232640718)', 3, 0);
commit;
prompt 1400 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11619, '79621117061', to_date('03-04-2012 19:43:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:44:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11620, '79243462503', to_date('03-04-2012 20:07:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 20:08:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11621, '79147059249', to_date('03-04-2012 20:52:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 20:53:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'DVPLATS_AMUR 0', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11622, '79244218653', to_date('03-04-2012 20:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 20:58:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11623, '79244218653', to_date('03-04-2012 20:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 20:58:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11624, '79244218653', to_date('03-04-2012 20:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 20:58:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11625, '79644446655', to_date('03-04-2012 21:00:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 21:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 19006442340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11626, '79024839458', to_date('03-04-2012 21:07:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 21:08:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Предрасчетная процедура закончена на 423', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11627, '79244218653', to_date('03-04-2012 21:59:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 22:00:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11628, '79241113003', to_date('03-04-2012 22:00:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 22:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11630, '79242556528', to_date('03-04-2012 22:10:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 22:11:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 297640  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11631, '79242556528', to_date('03-04-2012 22:11:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 22:11:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш индивидуальный пароль для входа в ИССА 297640  ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11632, '79024839458', to_date('04-04-2012 02:45:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 02:46:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Распределение out_saldo_online закончено на 421', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11633, '79024839458', to_date('04-04-2012 06:35:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 06:36:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Закончено перераспределение сальдо после расчета на 415', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11634, '79024839458', to_date('04-04-2012 06:42:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 06:43:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Предрасчетная процедура закончена на 421', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11636, '79621116574', to_date('04-04-2012 07:52:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 07:53:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11637, '79146873635', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11559, '79147161818', to_date('03-04-2012 15:47:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:48:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101568042340; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11568, '79142007616', to_date('03-04-2012 16:27:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:27:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2200305434; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Отделение почтовой связи 680018; сумма 1 152 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 75 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11569, '79626758305', to_date('03-04-2012 16:27:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:27:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000774905; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Отделение почтовой связи 680014; сумма 1 330 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 24 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11580, '79084492868', to_date('03-04-2012 17:18:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:19:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102187642360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11583, '79245278755', to_date('03-04-2012 17:31:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:32:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73943542320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232386448)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11584, '79242408914', to_date('03-04-2012 17:34:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:35:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 59958542320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232646396)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11585, '79502990550', to_date('03-04-2012 17:40:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:41:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 13601642320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 7; сумма 31 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 163 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11586, '79242584066', to_date('03-04-2012 17:41:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:42:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 52258942363; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4236363622)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11587, '79147325427', to_date('03-04-2012 17:46:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:47:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102026542363; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4236369816)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11588, '79098061302', to_date('03-04-2012 17:49:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:50:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2350019936; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Николаевск-на-Амуре СЦ; сумма 3 619 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11589, '79246742630', to_date('03-04-2012 17:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:56:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75147141620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11590, '79246742630', to_date('03-04-2012 17:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:56:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 75147141620; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11591, '79046289515', to_date('03-04-2012 17:57:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:58:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 64619642320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232461894)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11592, '79098468717', to_date('03-04-2012 18:01:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:02:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000033758; дата: 03.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Таун 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11593, '79149777725', to_date('03-04-2012 18:05:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:06:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 33499342360; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: Передача голос. инф. ПОВРЕМЕННЫЙ (4236690072)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11594, '79147113966', to_date('03-04-2012 18:06:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:07:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 34403242340; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4234329613)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11595, '79502846010', to_date('03-04-2012 18:08:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:09:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11601, '79246791114', to_date('03-04-2012 18:32:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:33:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 60577241620; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: КАССА 15 ЦОК 3 Благовещенск; сумма 1 278 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 278 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11602, '79084499444', to_date('03-04-2012 18:34:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:35:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 91020142320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232320547)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11603, '79046277544', to_date('03-04-2012 18:36:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:37:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 28023342320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 62; сумма 3 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 561 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11607, '79147388978', to_date('03-04-2012 18:48:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:48:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 65153942360; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4236610132)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11608, '79510228775', to_date('03-04-2012 18:54:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:55:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 78380842360; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-СОЦИАЛЬНЫЙ (4236653087)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11609, '79147055450', to_date('03-04-2012 18:58:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:59:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 30266042320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-КОМБИНИРОВАННЫЙ (основной) (4232468638)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11610, '79024838006', to_date('03-04-2012 19:03:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:04:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 25507942320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232206380)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11614, '79141724039', to_date('03-04-2012 19:27:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:28:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010201; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11550, '79024838400', to_date('03-04-2012 15:31:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:32:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваша заявка № 1212719197 на подключение Домашнего интернета принята. После проверки технической возможности подключения с Вами свяжутся наши специалисты. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11551, '79024838400', to_date('03-04-2012 15:31:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:32:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'По заявке № 1212719197 есть техническая возможность подключения Домашнего интернета. В ближайшее время с Вами свяжутся наши специалисты для согласования времени выезда для подключения оборудования. Ваш Ростелеком. Телефон 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11560, '79621230278', to_date('03-04-2012 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:56:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 424319788; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: КАССА: (ПОРОНАЙСК ППП); сумма 2 191 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 2 194 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11561, '79241086744', to_date('03-04-2012 15:58:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:59:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11562, '79245285008', to_date('03-04-2012 15:59:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:00:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка № 1289886704 на подключение Домашнего интернета: по указанному Вами адресу в данный момент отсутствует техническая возможность подключения. Ваш Ростелеком. Тел. 8 800 1000 800', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11573, '79147059249', to_date('03-04-2012 16:34:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:34:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'DVPLATS_MAG 0', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11575, '79147787871', to_date('03-04-2012 16:45:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:46:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380014497; дата: 03.04.2012; ' || chr(10) || 'произведено снятие блокировки (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 512 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11582, '79089670504', to_date('03-04-2012 17:30:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 29996442340; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4234269633)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11600, '79146799967', to_date('03-04-2012 18:28:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:29:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10797942320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: Передача голос. инф. ПОВРЕМЕННЫЙ (4232206103)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11605, '79147063444', to_date('03-04-2012 18:44:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:44:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 13722442320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-КОМБИНИРОВАННЫЙ (основной) (4232603134)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11629, '79147609875', to_date('03-04-2012 22:02:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 22:03:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Заявка на участие в акции принята.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11635, '79024839458', to_date('04-04-2012 07:10:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 07:11:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Закончено перераспределение сальдо после расчета на 423', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11649, '79244218653', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 55315342340; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11650, '79145553908', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11003241656; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11651, '79241150030', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000077833; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11652, '79146488804', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424319602; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Регион 256 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11653, '79140919181', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4242272843; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Flash City 1024)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11654, '79146436616', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243510793; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 256 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11655, '79146488804', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424319602; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11656, '79146488804', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424319602; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 512 Кбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11657, '79146488804', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424319602; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11658, '79146436616', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243510793; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11659, '79146436616', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243510793; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11660, '79146436616', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4243510793; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11661, '79146488804', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 424319602; дата: 04.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Абон. плата за обмен трафиком между пользов. внутри сети ОАО "Ростелеком" ("MATRIX", Р2Р)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11662, '79622252485', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380010084; дата: 04.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11663, '79098468073', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380028699; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11664, '79146548530', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 63245742335; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11665, '79622854204', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 29115441620; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-Оптикс 2+ Сити) ME', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11666, '79241428050', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 15716741620; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт ШПД (Домо-Оптикс Старт Сити) ME', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11667, '79146181110', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10202741656; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11668, '79241326792', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 73268042340; дата: 04.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ШПД): ' || chr(10) || 'Абонентская плата за порт DSL (Домо-минимум Сити 1024 Кбит/с)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11552, '79242016440', to_date('03-04-2012 15:32:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:33:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200153051; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Доступ к порталу www.disland.ru', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11556, '79241086744', to_date('03-04-2012 15:45:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:46:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS удаление архива завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11558, '79241086744', to_date('03-04-2012 15:46:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 15:47:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS удаление архива завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11570, '79098983498', to_date('03-04-2012 16:28:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:29:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000071231; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 1 150 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 23 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11571, '79147735320', to_date('03-04-2012 16:28:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:29:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 4000723526; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 1 350 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: -36 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11572, '79098466177', to_date('03-04-2012 16:28:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:29:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 2380017021; дата платежа 02.04.2012;' || chr(10) || 'поступила оплата от: Терминалы самообслуживания Cберегательного банка; сумма 2 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком" (МГ/МН);' || chr(10) || 'состояние счета по поставщику: 2 000 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11576, '79140705120', to_date('03-04-2012 16:56:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 16:57:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11259342320; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11578, '79242388008', to_date('03-04-2012 17:04:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:05:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с.: 23796842320; период расчета: Март     2012;состояние счета: ' || chr(10) || 'ОАО "Ростелеком" = ,08 руб.;', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11581, '79084492868', to_date('03-04-2012 17:19:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 17:20:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102187642360; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11596, '79146892925', to_date('03-04-2012 18:11:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:12:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 16529742320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-СОЦИАЛЬНЫЙ (4232336182)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11597, '79146748938', to_date('03-04-2012 18:12:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:13:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 100790542320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-ПОВРЕМЕННЫЙ (4232640967)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11615, '79024839458', to_date('03-04-2012 19:30:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:31:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Предрасчетная процедура закончена на 415', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11644, '79241086744', to_date('04-04-2012 08:39:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:39:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'SMS архивирование завершено', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11669, '79098646071', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2380015594; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11670, '79147965513', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 29603042320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11671, '79644355918', to_date('04-04-2012 10:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 91389442360; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11672, '79146779033', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 80999042376; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11673, '79146779033', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 80999042376; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ночное ускорение"', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11674, '79146779033', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 80999042376; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11675, '79242336272', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 64463142320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11676, '79644355918', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 91389442360; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11677, '79147061981', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 31291042320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11678, '79241150583', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000399445; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11679, '79241150583', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000399445; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11680, '79141558499', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200255202; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11681, '79098460673', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000338266; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
commit;
prompt 1500 records committed...
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11682, '79242065207', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000096443; дата: 04.04.2012; ' || chr(10) || 'произведена блокировка (ШПД): ' || chr(10) || 'Поддержание DSL в блокировке', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11683, '79145555088', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11794341641; дата: 04.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11684, '79145555088', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 11794341641; дата: 04.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11685, '79644318871', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 10837642340; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 8 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11686, '79242336272', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 64463142320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11687, '79635630934', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200174277; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11688, '79635630934', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200174277; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11689, '79024829760', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102107642320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11690, '79024829760', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102107642320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11646, '79149741084', to_date('04-04-2012 09:02:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 09:03:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11691, '79242114501', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200225701; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11692, '79146600315', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 87689542320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ОТА): ' || chr(10) || 'АОН', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11693, '79244391486', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102063142340; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11694, '79244391486', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102063142340; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11695, '79502922216', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101374542320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11696, '79502922216', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101374542320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11697, '79502922216', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 101374542320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (IPTV): ' || chr(10) || 'Кабельное вещание - Абонентская плата "Базовый" Metro Ethernet', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11698, '79089988681', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:01:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102237042320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11699, '79644303267', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 95429142352; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11700, '79644303267', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 95429142352; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11701, '79622254879', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000855667; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11702, '79622254879', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000855667; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 4 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11703, '79502977984', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102191042361; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11704, '79502977984', to_date('04-04-2012 10:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102191042361; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11705, '79622228815', to_date('04-04-2012 10:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4000856325; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11706, '79502903636', to_date('04-04-2012 10:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102269542320; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11707, '79145480030', to_date('04-04-2012 10:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200198120; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11708, '79145480030', to_date('04-04-2012 10:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 2200198120; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11709, '79143337173', to_date('04-04-2012 10:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 102161842361; дата: 04.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Отмена ограничений" ', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11638, '79147361706', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11639, '79098460673', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11640, '79098460673', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 20 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11641, '79025573253', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 61475942320; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 1 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 235 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11642, '79146408733', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 42443381; дата платежа 04.04.2012;' || chr(10) || 'поступила оплата от: ОАО "ТРАНСКРЕДИТБАНК"; сумма 2 359 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 0 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11643, '79098884818', to_date('04-04-2012 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:01:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Контактные данные сохранены.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11647, '79246803535', to_date('04-04-2012 09:14:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 09:15:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 29023841641; дата платежа 04.04.2012;' || chr(10) || 'поступила оплата от: КАССА 2 ЦОК  БЕЛОГОРСК; сумма 2 400 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 373 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11598, '79241395321', to_date('03-04-2012 18:13:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:14:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Ваш порог превысил 10 Гб, для восстановления скорости вы можете воспользоваться доп. услугой "Турбо кнопка" через ИССА или в абонентском отделе', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11599, '79243321207', to_date('03-04-2012 18:25:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 18:26:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 88346542345; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: СТС-ПОВРЕМЕННЫЙ (4234524502)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11612, '79046280071', to_date('03-04-2012 19:19:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:20:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 62907142320; дата: 01.04.2012; ' || chr(10) || 'произведен переход на другой ТП (ОТА): ' || chr(10) || '423: ГТС-КОМБИНИРОВАННЫЙ (основной) (4232330340)', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11613, '79241406710', to_date('03-04-2012 19:26:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:27:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 62235241634; дата платежа 03.04.2012;' || chr(10) || 'поступила оплата от: ПЛАТЕЖНАЯ СИСТЕМА Е-ПОРТ; сумма 1 100 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 260 руб.', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11617, '79621117061', to_date('03-04-2012 19:41:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:42:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 03.04.2012; ' || chr(10) || 'произведено снятие (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 2 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11618, '79621117061', to_date('03-04-2012 19:41:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2012 19:42:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л/с: 4245250640; дата: 03.04.2012; ' || chr(10) || 'подключена услуга (Доп. услуги ШПД): ' || chr(10) || 'Опция "Ускорение" до 1 Мбит/с', 3, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11645, '79241086744', to_date('04-04-2012 08:45:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 08:46:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Привет! Миша!', 1, 0);
insert into SMSCENTER_DEBUG.MESSAGES (ID, PHONE, CREATED_AT, UPDATED_AT, TASK_ID, STATUS_ID, MESSAGE, USER_ID, ERROR_ID)
values (11648, '79046265847', to_date('04-04-2012 09:49:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2012 09:50:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 3, 'Л.с. 19799542320; дата платежа 04.04.2012;' || chr(10) || 'поступила оплата от: Владивосток ЦОК 1; сумма 1 000 руб.;' || chr(10) || 'поставщик: ОАО "Ростелеком";' || chr(10) || 'состояние счета по поставщику: 1 110 руб.', 3, 0);
commit;
prompt 1544 records loaded
prompt Loading SMSCENTER_DEBUG.TEMPLATES...
prompt Table is empty
prompt Loading SMSCENTER_DEBUG.USER_BRANCHE_LINK...
prompt Table is empty
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.USERS...
alter table SMSCENTER_DEBUG.USERS enable constraint FK_USER_ROLES;
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.ABONENTS...
alter table SMSCENTER_DEBUG.ABONENTS enable constraint FK_BRANCHES_ABONENTS;
alter table SMSCENTER_DEBUG.ABONENTS enable constraint FK_USERS_ABONENTS;
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.GROUPS...
alter table SMSCENTER_DEBUG.GROUPS enable constraint FK_USER_GROUPS;
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.TASKS...
alter table SMSCENTER_DEBUG.TASKS enable constraint FK_TYPE_TASK;
alter table SMSCENTER_DEBUG.TASKS enable constraint FK_USERS_TASKS;
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.MESSAGES...
alter table SMSCENTER_DEBUG.MESSAGES enable constraint FK_STATUS_MSG;
alter table SMSCENTER_DEBUG.MESSAGES enable constraint FK_TASKS_NOTES;
alter table SMSCENTER_DEBUG.MESSAGES enable constraint FK_USERS;
prompt Enabling foreign key constraints for SMSCENTER_DEBUG.USER_BRANCHE_LINK...
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK enable constraint FK_BRANCHES;
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK enable constraint FK_USERS_2;
prompt Enabling triggers for SMSCENTER_DEBUG.BRANCHES...
alter table SMSCENTER_DEBUG.BRANCHES enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.USER_ROLES...
alter table SMSCENTER_DEBUG.USER_ROLES enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.USERS...
alter table SMSCENTER_DEBUG.USERS enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.ABONENTS...
alter table SMSCENTER_DEBUG.ABONENTS enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.ABONENT_GROUP_LINK...
alter table SMSCENTER_DEBUG.ABONENT_GROUP_LINK enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.ARCHIVE_MESSAGE...
alter table SMSCENTER_DEBUG.ARCHIVE_MESSAGE enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.ERRORS...
alter table SMSCENTER_DEBUG.ERRORS enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.GROUPS...
alter table SMSCENTER_DEBUG.GROUPS enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.STATUS_MSG...
alter table SMSCENTER_DEBUG.STATUS_MSG enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.TYPE_TASK...
alter table SMSCENTER_DEBUG.TYPE_TASK enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.TASKS...
alter table SMSCENTER_DEBUG.TASKS enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.MESSAGES...
alter table SMSCENTER_DEBUG.MESSAGES enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.TEMPLATES...
alter table SMSCENTER_DEBUG.TEMPLATES enable all triggers;
prompt Enabling triggers for SMSCENTER_DEBUG.USER_BRANCHE_LINK...
alter table SMSCENTER_DEBUG.USER_BRANCHE_LINK enable all triggers;
set feedback on
set define on
prompt Done.
