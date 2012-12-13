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
       t.branche_id as "BRANCHE_ID"
    from tasks t
    left join type_task tt on t.type_task_id=tt.id
/

