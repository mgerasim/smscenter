create or replace procedure kill_double_phones is
cursor phone is select phone from abonents t
                group by phone
                having count(*)>1
                order by phone;
max_id number;
begin
  --Функция созданна для исправления "кривости" возникшей из-за кривой структуры предъидущей БД.
  --Далее должен быть смайл palm face или wall, но к сожалению в pl/sql не предусмотренно отображение смайлов.
  dbms_output.enable;
  --Цикл пробегает по всем дублям телефонов и меняет приязку пользователя к группе, затем грохает дубли в abonents
  for j in phone
  loop
    --Ситаем актуальной самую последнюю запись.
    select max(id)into max_id from abonents where phone=j.phone;
    --Подменяем и удаляем не актуальные записи
    for l in (select id from abonents where phone=j.phone and id<>max_id)
      loop
        update abonent_group_link gl set gl.abonent_id=max_id where gl.abonent_id=l.id;
        delete from abonents where id=l.id;
       --  dbms_output.put_line('max_id='||max_id||' id='||l.id||' phone='||l.phone);
      end loop;
--  dbms_output.put_line(j.phone);
  end loop;
  commit;
end kill_double_phones;
/

