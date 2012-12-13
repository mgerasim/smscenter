create or replace view v_messages as
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
       m.ERROR_ID,
       b.id as branch_id,
       b.s_name as branche_s_name,
       tt.id as type_task_id,
       tt.name as TYPE_TASK,
       u.name as USER_NAME
from messages m
left join status_msg s on s.id=m.status_id
left join abonents a on a.phone=m.phone
left join users u on u.id=m.user_id
left join branches b on b.id=u.branche_id
left join tasks t on t.id=m.task_id
left join type_task tt on tt.id=t.type_task_id
/

