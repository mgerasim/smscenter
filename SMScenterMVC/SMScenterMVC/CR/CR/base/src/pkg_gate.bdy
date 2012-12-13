create or replace package body PKG_GATE is
/*******************************************************************************
  -- Автор  : H02-GERASIMOVMN
  -- Дата создания : 17.02.2012 14:22:47
  -- ОПИСАНИЕ:  Пакет для работы с заданиями на отправку SMS

  Дата:       Задача:  Автор:            Описание:
----------  -------  ----------------  ------------------------------------
2012-02-17             Михаил Герасимов  Создание этого пакета
2012-03-29             Михаил Герасимов  Правка функции get_message
2012-03-30             Михаил Герасимов  Правка функции update_status. Обновление даты update_at
2012-03-30             Михаил Герасимов  Правка функции update_status. Добавления параметра p_statuscode
2012-05-16             Михаил Герасимов  Правка функции update_status. Добавление параметра p_smpp_sequence - идентификатор запроса на отправку по SMPP - для последующего получения статуса отправки сообщения
2012-05-17             Михаил Герасимов  Правка функции update_status. Добавление параметра p_smpp_message_id - идентификатор сообщения на сервер SMSC
2012-05-17             Михаил Герасимов  Добавление функции delivery_receipt
2012-06-04             Михаил Герасимов  Правка функции get_message. ROWNUM
2012-06-09  R0041      Михаил Герасимов  Приоритет сообщений
******************************************************************************/

PROCEDURE get_messages(p_limit IN PLS_INTEGER, p_msgs OUT MSG_CURSOR)
IS
BEGIN
     OPEN p_msgs FOR SELECT * FROM (SELECT * FROM MESSAGES WHERE status_id=1 ORDER BY priority ASC, CREATED_AT DESC) WHERE rownum  < p_limit+1 ;
END;

PROCEDURE update_status(p_message_id IN PLS_INTEGER, p_status_new IN PLS_INTEGER, p_statuscode IN PLS_INTEGER, p_smpp_message_id IN VARCHAR2)
IS
    err_message_no_found EXCEPTION;
    err_status_no_found EXCEPTION;
    mess_id number;
--    CURSOR message_cur IS SELECT ID FROM MESSAGES WHERE ID = p_message_id;
--    message_row messages%ROWTYPE;
    CURSOR status_cur IS SELECT * FROM STATUS_MSG WHERE ID = p_status_new;
    status_row status_msg%ROWTYPE;
BEGIN
     -- проверка на корректность указания сообщения
     select id into mess_id from messages where id=p_message_id;
     if mess_id<>p_message_id then
     raise err_message_no_found;
     end if;

/*     OPEN message_cur;
          FETCH  message_cur INTO message_row;
          IF message_cur%NOTFOUND THEN
             RAISE err_message_no_found;
          END IF;
     CLOSE message_cur;*/

     -- проверка на корректность указания статуса для сообщения
     OPEN status_cur;
          FETCH  status_cur INTO status_row;
          IF status_cur%NOTFOUND THEN
             RAISE err_status_no_found;
          END IF;
     CLOSE status_cur;

     UPDATE messages t SET t.status_id = p_status_new, t.updated_at=sysdate, t.error_id=p_statuscode, t.smpp_message_id = p_smpp_message_id WHERE t.id = p_message_id;

     EXCEPTION
     when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'Нет такого сообщения!');
     WHEN err_message_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_MESSAGE_NO_FOUND,'Сообщение с кодом '||p_message_id||' не найдено для обновления');
     WHEN err_status_no_found THEN
          RAISE_APPLICATION_ERROR(-PKG_ERROR.ERROR_STATUS_NO_FOUND, 'Статус сообщения '||p_status_new||' отсутствует');
END;

PROCEDURE delivery_receipt(p_smpp_message_id IN VARCHAR2)
IS
BEGIN
     UPDATE messages SET status_id = 5 WHERE smpp_message_id = p_smpp_message_id;
END;

end PKG_GATE;
/

