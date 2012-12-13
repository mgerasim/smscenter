create or replace view v_users as
select u.ID, u.LOGIN, u.CREATED_AT, u.UPDATED_AT, u.IS_DELETED,
       u.NAME, u.ROLE_ID, r.name as ROLE_NAME, u.BRANCHE_ID, b.s_name AS BRANCHE_S_NAME
from users u
left join user_roles r on u.role_id=r.id
left join branches b on u.branche_id=b.id
/

