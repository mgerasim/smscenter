create or replace package body UT_PKG_GATE is
/*******************************************************************************
  ????:       ??????:  ?????:            ????????:
----------  -------  ----------------  ------------------------------------
2012-02-21           ?????? ?????????  ???????? ????? ??????

******************************************************************************/

PROCEDURE ut_setup
IS
BEGIN
      NULL;
END;

PROCEDURE ut_teardown
IS
BEGIN
      ROLLBACK;
END;


PROCEDURE ut_update_status
IS
BEGIN
     -- ????????? ? ????? 999 - ?? ?????? ????????????
     Utassert.throws(msg_in => '??????? ?????? ???????? ?????????? 20003 ??? ???????? ?????????????? ?????????:',
                            check_call_in => 'DECLARE i number; BEGIN PKG_GATE.update_status(999,1); END;',
                            against_exc_in => -PKG_ERROR.ERROR_MESSAGE_NO_FOUND);

     -- ?????? ? ????? 999 (STATUS_MSG) ?? ?????? ????????????
     -- ????????? ? ????? 0 ?????? ???? ? ??
     Utassert.throws(msg_in => '??????? ?????? ???????? ?????????? 20004 ??? ???????? ??????? ?????????:',
                            check_call_in => 'DECLARE i number; BEGIN PKG_GATE.update_status(10157,999); END;',
                            against_exc_in => -PKG_ERROR.ERROR_STATUS_NO_FOUND);
END;

end UT_PKG_GATE;
/

