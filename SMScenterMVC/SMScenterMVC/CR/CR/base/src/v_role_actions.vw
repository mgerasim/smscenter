create or replace view v_role_actions as
select u.ID, u.NAME, u.DESCRIPTION, r.role_id
from user_actions u
LEFT JOIN role_action_link r ON u.id = r.action_id
/

