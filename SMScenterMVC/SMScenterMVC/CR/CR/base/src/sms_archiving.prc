create or replace procedure SMS_ARCHIVING is
 i integer;
begin
--   Архивирование записей в таблице MESSAGES (по умолч старше 1 мес.)
     INSERT INTO archive_message SELECT * FROM messages t WHERE t.created_at < sysdate-30;
     DELETE FROM messages t WHERE t.created_at < sysdate-30;
--   Чистка архива (по умолчанию старше 1 год)
     DELETE FROM archive_message t WHERE t.created_at < sysdate-356;
     i := PKG_SMS.add(phone_ => '79241086744',text_ => 'SMS архивирование завершено');
end SMS_ARCHIVING;
/

