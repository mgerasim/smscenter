create or replace view v_user_wishes as
select t.id, t.text, t.user_id, u.name as USER_NAME, t.branche_id, b.s_name as BRANCHE_NAME , t.create_at
from user_wishes t
left join users u on t.user_id=u.id
left join branches b on t.branche_id=b.id
/

