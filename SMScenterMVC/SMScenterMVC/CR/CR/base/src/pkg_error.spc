create or replace package PKG_ERROR is
/******************************************************************************
  -- Author  : H02-GERASIMOVMN
  -- Created : 16.02.2012 13:50:47
  -- Purpose : Пакет содержит коды возвращаемых ошибок

  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-02-16           Михаил Герасимов  Создание этого пакета
2012-02-21           Михаил Герасимов  Добавление ERROR_MESSAGE_NO_FOUND, ERROR_STATUS_NO_FOUND
2012-06-05           Толшин Кирилл     Добавление ERROR_SOME_PARAM_EMPTY

******************************************************************************/

-- список ошибок
  ERROR_TASK_NAME_EMPTY                constant INTEGER := 20001; -- для задания должно указываться наименование
  ERROR_TYPE_NO_FOUND                  constant INTEGER := 20002; -- должен быть указан существующий тип задания
  ERROR_MESSAGE_NO_FOUND               constant INTEGER := 20003; -- нет такого сообщения
  ERROR_STATUS_NO_FOUND                constant INTEGER := 20004; -- нет такого статуса сообщения
  ERROR_MESSAGE_TEXT                   constant INTEGER := 20005; -- отсутствует текст сообщения
  ERROR_PHONE_NUMBER                   constant INTEGER := 20006; -- не корректный номер телефона
  ERROR_USER_LOGIN                     constant INTEGER := 20007; -- не найден пользователь с таким логином
  ERROR_DATE_PERIOD                    constant INTEGER := 20008; -- не указан диапазон дат
  ERROR_SOME_PARAM_EMPTY               constant INTEGER := 20009; -- указаны не все параметры

end PKG_ERROR;
/

