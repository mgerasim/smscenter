create or replace view v_user_actions as
select u.ID, u.NAME, u.DESCRIPTION, r.user_id
from user_actions u
LEFT JOIN user_action_link r ON u.id = r.action_id
/

