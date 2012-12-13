create or replace view v_user_types as
select t.ID, t.NAME, t.PRIORITY, T.DESCRIPTION, r.user_id
from type_task t
LEFT JOIN user_type_link r ON t.id = r.type_id
/

