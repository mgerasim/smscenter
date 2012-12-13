DELETE FROM user_action_link t WHERE t.id=8;
insert into user_action_link(ID, user_id, action_id) (select s_user_action_link.nextval, 8 as user_id, action_id FROM user_action_link t WHERE t.id=9)