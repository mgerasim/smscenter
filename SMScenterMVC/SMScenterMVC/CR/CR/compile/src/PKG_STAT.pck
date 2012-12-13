create or replace package PKG_STAT is
/*
  -- Author  : H02-GERASIMOVMN
  -- Created : 12.09.2012 14:41:03
  -- Purpose :

   Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-09-12  R0059    Михаил Герасимов  Создание этого пакета

*/
type ref_cursor is ref cursor;

procedure sc_month(p_stat out ref_cursor);

procedure sc_week(p_stat out ref_cursor);

procedure sc_day(p_stat out ref_cursor);

procedure sc_queue(p_stat out ref_cursor);

end PKG_STAT;
/
create or replace package body PKG_STAT is
/*
 Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-09-12  R0059    Михаил Герасимов  Создание этого пакета


*/


procedure sc_month(p_stat out ref_cursor)
is

begin
     open p_stat FOR
                 SELECT
                t.status_id  AS STATUS,
                    count(*) AS MSGCNT
                FROM
                    messages t
                WHERE
                    EXTRACT( YEAR FROM t.updated_at) = EXTRACT(YEAR FROM sysdate)
                    AND
                    EXTRACT( MONTH FROM t.updated_at) = EXTRACT(MONTH FROM sysdate)
                GROUP BY
                      t.status_id;

end;

procedure sc_week(p_stat out ref_cursor)
is
begin
     open p_stat FOR
               SELECT
                  t.status_id AS STATUS,
                  count(*)    AS MSGCNT
          FROM
              messages t
          WHERE
               to_date((to_char(t.updated_at+ (1-to_char(t.updated_at,'D')))  ), 'DD.MM.YY')>=
               to_date((to_char(sysdate+ (1-to_char(sysdate,'D')))  ), 'DD.MM.YY')
               AND
               to_date((to_char(t.updated_at + (7-to_char(t.updated_at,'D')))  ), 'DD.MM.YY') <=
               to_date((to_char(sysdate+ (7-to_char(sysdate,'D')))  ), 'DD.MM.YY')
          GROUP BY
                t.status_id;
end;

procedure sc_day(p_stat out ref_cursor)
is
begin
     open p_stat FOR
                 SELECT
                  t.status_id AS STATUS,
                  count(*)    AS MSGCNT
                FROM
                    messages t
                WHERE
                    EXTRACT( YEAR FROM t.updated_at) = EXTRACT(YEAR FROM sysdate)
                    AND
                    EXTRACT( MONTH FROM t.updated_at) = EXTRACT(MONTH FROM sysdate)
                    AND
                    EXTRACT( DAY FROM t.updated_at) = EXTRACT(DAY FROM sysdate)
                GROUP BY
                      t.status_id;
end;

procedure sc_queue(p_stat out ref_cursor)
is  
begin
     open p_stat FOR
                 SELECT count(*) AS QUEUE
                 FROM
                     messages t
                 WHERE
                      t.status_id = 1;

end;

end PKG_STAT;
/
