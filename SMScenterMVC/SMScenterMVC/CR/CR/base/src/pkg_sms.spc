create or replace package pkg_sms is

  -- Author  : H02-TURUSHEVNA
  -- Created : 15.02.2012 14:23:27
  -- Purpose : API для сторонних разработчиков

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations

--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations

---------------------------------------------------------------------------
  --Функция вставки sms на отправку
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            -- priority_ - приоритет для сообщений
            --возвращает иденитификатор sms
  function add(phone_ varchar2,text_ varchar2, priority_ number := 9) return number;
---------------------------------------------------------------------------
  --Функция проверки статуса sms
    --параметры:
            --sms_id_ идентификатор sms
            --возвращает статус смс в текстовом виде:
              --Создана, Выполняется, Завершена, Ошибка
  function chk(sms_id_ number) return varchar2;
---------------------------------------------------------------------------
  --Функция создания задачи
    --параметры:
            --name_ имя задачи
            --type_ тип задачи:
              --1-Служебная,2-Рекламная,3-Сервисная
            --Возвращает идентификатор задачи.
  function add_task(name_ varchar2, type_ number) return number;
---------------------------------------------------------------------------
  --Функция вставки sms на отправку, в рамках определённой задачи
    --параметры:
            --phone_ -  11-ти знчный номер сотового телефона с кодом страны.
            --text_ - текст сообщения максимум 255 символов.
            --task_id - идентификатор задачи
            -- priority_ - приоритет для сообщений
            --возвращает иденитификатор sms
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number, priority_ number := 999) return number;
---------------------------------------------------------------------------
  --Функция возвращает идентификатор текущего пользователя
  function get_user return number;

end pkg_sms;
/

