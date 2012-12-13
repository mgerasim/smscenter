create or replace view v_user_branches as
select ub.branche_id AS ID, b.name, b.s_name, ub.user_id
from user_branche_link ub
left join branches b on ub.branche_id=b.id
/

