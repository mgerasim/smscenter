--------------------------------------------------------
-- Export file for user SMSCENTER                     --
-- Created by h02-GerasimovMN on 13.06.2012, 15:22:39 --
--------------------------------------------------------

spool smscenter.log

prompt
prompt Creating table BRANCHES
prompt =======================
prompt
@@branches.tab
prompt
prompt Creating table USER_ROLES
prompt =========================
prompt
@@user_roles.tab
prompt
prompt Creating table USERS
prompt ====================
prompt
@@users.tab
prompt
prompt Creating table ABONENTS
prompt =======================
prompt
@@abonents.tab
prompt
prompt Creating table GROUPS
prompt =====================
prompt
@@groups.tab
prompt
prompt Creating table ABONENT_GROUP_LINK
prompt =================================
prompt
@@abonent_group_link.tab
prompt
prompt Creating table ARCHIVE_MESSAGE
prompt ==============================
prompt
@@archive_message.tab
prompt
prompt Creating table ERRORS
prompt =====================
prompt
@@errors.tab
prompt
prompt Creating table LOG
prompt ==================
prompt
@@log.tab
prompt
prompt Creating table STATUS_MSG
prompt =========================
prompt
@@status_msg.tab
prompt
prompt Creating table TYPE_TASK
prompt ========================
prompt
@@type_task.tab
prompt
prompt Creating table TASKS
prompt ====================
prompt
@@tasks.tab
prompt
prompt Creating table MESSAGES
prompt =======================
prompt
@@messages.tab
prompt
prompt Creating table USER_ACTIONS
prompt ===========================
prompt
@@user_actions.tab
prompt
prompt Creating table ROLE_ACTION_LINK
prompt ===============================
prompt
@@role_action_link.tab
prompt
prompt Creating table SUPPORT
prompt ======================
prompt
@@support.tab
prompt
prompt Creating table TEMPLATES
prompt ========================
prompt
@@templates.tab
prompt
prompt Creating table USER_ACTION_LINK
prompt ===============================
prompt
@@user_action_link.tab
prompt
prompt Creating table USER_BRANCHE_LINK
prompt ================================
prompt
@@user_branche_link.tab
prompt
prompt Creating table USER_TYPE_LINK
prompt =============================
prompt
@@user_type_link.tab
prompt
prompt Creating table USER_WISHES
prompt ==========================
prompt
@@user_wishes.tab
prompt
prompt Creating sequence S_ABONENTS
prompt ============================
prompt
@@s_abonents.seq
prompt
prompt Creating sequence S_ABONENT_GROUP_LINK
prompt ======================================
prompt
@@s_abonent_group_link.seq
prompt
prompt Creating sequence S_ACTIONS
prompt ===========================
prompt
@@s_actions.seq
prompt
prompt Creating sequence S_BRANCHES
prompt ============================
prompt
@@s_branches.seq
prompt
prompt Creating sequence S_ERRROR
prompt ==========================
prompt
@@s_errror.seq
prompt
prompt Creating sequence S_GROUPS
prompt ==========================
prompt
@@s_groups.seq
prompt
prompt Creating sequence S_MESSAGES
prompt ============================
prompt
@@s_messages.seq
prompt
prompt Creating sequence S_ROLE_ACTION_LINK
prompt ====================================
prompt
@@s_role_action_link.seq
prompt
prompt Creating sequence S_STATUS_MSG
prompt ==============================
prompt
@@s_status_msg.seq
prompt
prompt Creating sequence S_SUPPORT
prompt ===========================
prompt
@@s_support.seq
prompt
prompt Creating sequence S_TASKS
prompt =========================
prompt
@@s_tasks.seq
prompt
prompt Creating sequence S_TYPE_TASK
prompt =============================
prompt
@@s_type_task.seq
prompt
prompt Creating sequence S_USERS
prompt =========================
prompt
@@s_users.seq
prompt
prompt Creating sequence S_USER_ACTION_LINK
prompt ====================================
prompt
@@s_user_action_link.seq
prompt
prompt Creating sequence S_USER_BRANCHE_LINK
prompt =====================================
prompt
@@s_user_branche_link.seq
prompt
prompt Creating sequence S_USER_ROLES
prompt ==============================
prompt
@@s_user_roles.seq
prompt
prompt Creating sequence S_USER_TYPE_LINK
prompt ==================================
prompt
@@s_user_type_link.seq
prompt
prompt Creating sequence S_USER_WISHES
prompt ===============================
prompt
@@s_user_wishes.seq
prompt
prompt Creating view UTV_RESULT_FULL
prompt =============================
prompt
@@utv_result_full.vw
prompt
prompt Creating view UTV_LAST_RUN
prompt ==========================
prompt
@@utv_last_run.vw
prompt
prompt Creating view VI_TASKS
prompt ======================
prompt
@@vi_tasks.vw
prompt
prompt Creating view V_ABONENTS
prompt ========================
prompt
@@v_abonents.vw
prompt
prompt Creating view V_MESSAGES
prompt ========================
prompt
@@v_messages.vw
prompt
prompt Creating view V_ROLES
prompt =====================
prompt
@@v_roles.vw
prompt
prompt Creating view V_ROLE_ACTIONS
prompt ============================
prompt
@@v_role_actions.vw
prompt
prompt Creating view V_USERS
prompt =====================
prompt
@@v_users.vw
prompt
prompt Creating view V_USER_ACTIONS
prompt ============================
prompt
@@v_user_actions.vw
prompt
prompt Creating view V_USER_BRANCHES
prompt =============================
prompt
@@v_user_branches.vw
prompt
prompt Creating view V_USER_TYPES
prompt ==========================
prompt
@@v_user_types.vw
prompt
prompt Creating view V_USER_WISHES
prompt ===========================
prompt
@@v_user_wishes.vw
prompt
prompt Creating package PKG_ERROR
prompt ==========================
prompt
@@pkg_error.spc
prompt
prompt Creating package PKG_GATE
prompt =========================
prompt
@@pkg_gate.spc
prompt
prompt Creating package PKG_SMS
prompt ========================
prompt
@@pkg_sms.spc
prompt
prompt Creating package PKG_WEB
prompt ========================
prompt
@@pkg_web.spc
prompt
prompt Creating package UT_PKG_GATE
prompt ============================
prompt
@@ut_pkg_gate.spc
prompt
prompt Creating procedure KILL_DOUBLE_PHONES
prompt =====================================
prompt
@@kill_double_phones.prc
prompt
prompt Creating procedure SMS_ARCHIVING
prompt ================================
prompt
@@sms_archiving.prc
prompt
prompt Creating procedure TMP
prompt ======================
prompt
@@tmp.prc
prompt
prompt Creating package body PKG_ERROR
prompt ===============================
prompt
@@pkg_error.bdy
prompt
prompt Creating package body PKG_GATE
prompt ==============================
prompt
@@pkg_gate.bdy
prompt
prompt Creating package body PKG_SMS
prompt =============================
prompt
@@pkg_sms.bdy
prompt
prompt Creating package body PKG_WEB
prompt =============================
prompt
@@pkg_web.bdy
prompt
prompt Creating package body UT_PKG_GATE
prompt =================================
prompt
@@ut_pkg_gate.bdy

spool off
