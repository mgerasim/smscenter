create or replace view v_abonents as
select t."ID",t."NAME",t."PHONE",t."DESCRIPTION",
       t."EMAIL",
       t."BRANCHE_ID", b.s_name as "BRANCHE_NAME", t."USER_ID",u.name AS "USER_NAME",
       t."DATE_CREATE",t."DATE_MODIFY", a.group_id as group_id
from abonents t
LEFT JOIN Abonent_Group_Link a ON t.id = a.abonent_id
LEFT JOIN USERS u on t.user_id = u.id
LEFT JOIN BRANCHES b on t.branche_id = b.id;