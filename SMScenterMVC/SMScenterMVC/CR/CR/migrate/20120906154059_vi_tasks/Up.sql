create or replace view vi_tasks as
select t.id as "ID",
       t.name as "NAME",
       to_char(t.created_at,'DD.MM.YYYY HH24:MI:SS') as "CREATED_AT_FORMAT",
       t.created_at as "CREATED_AT",
       to_char(t.updated_at,'DD.MM.YYYY HH24:MI:SS') as "UPDATED_AT_FORMAT",
       t.updated_at as "UPDATED_AT",
       t.type_task_id as "TYPE_TASK_ID",
       tt.name as "TYPE_TASK_NAME",
       t.user_id as "USER_ID",
       t.group_msg as "GROUP_MSG",
       t.message as "MESSAGE",
       (select m.message from messages m where m.task_id=t.id and rownum=1) as "MSG",
       t.branche_id as "BRANCHE_ID",
       (select case
                when count(case when m.status_id = 1 then 1 else null end) > 0 and count(case when m.status_id in (2,3,4,5) then 1 else null end)=0 then 'Создана'
                when count(case when m.status_id in (1,2) then 1 else null end) > 0 then 'Выполняется'
                when count(case when m.status_id = 4 then 1 else null end) > 0 and count(case when m.status_id in (1,2,3,5) then 1 else null end)=0 then 'Ошибка'
                when count(case when m.status_id in (3,5) then 1 else null end) > 0 and count(case when m.status_id in (1,2,4) then 1 else null end)=0 then 'Завершена'
                when count(case when m.status_id in (3,4,5) then 1 else null end) > 0 and count(case when m.status_id in (1,2) then 1 else null end)=0 then 'Завершена c ошибкой'
               end
         from messages m where m.task_id = t.id) as "STATUS"
    from tasks t
    left join type_task tt on t.type_task_id=tt.id