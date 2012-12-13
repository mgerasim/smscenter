create or replace view v_roles as
select r.ID, r.NAME, r.DESCRIPTION, r.USER_ID, u.name as USER_NAME, r.UPDATE_AT
from user_roles r
left join users u on r.user_id=u.id
/*select u.ID, u.LOGIN, u.CREATED_AT, u.UPDATED_AT, u.IS_DELETED,
       u.NAME, u.ROLE_ID, r.name as ROLE_NAME, u.BRANCHE_ID, b.s_name AS BRANCHE_S_NAME
from users u
left join user_roles r on u.role_id=r.id
left join branches b on u.branche_id=b.id*/
/

