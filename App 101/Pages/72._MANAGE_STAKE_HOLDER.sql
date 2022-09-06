prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.0'
,p_default_workspace_id=>1680420756714069
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 101 - Projects
--
-- Application Export:
--   Application:     101
--   Name:            Projects
--   Date and Time:   10:34 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 72
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00072
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>72);
end;
/
prompt --application/pages/page_00072
begin
wwv_flow_imp_page.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'MANAGE STAKE HOLDER'
,p_step_title=>'MANAGE STAKE HOLDER'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170410130544'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183353686231628176)
,p_plug_name=>'Form on OPP_ACTION_STAKEHOLDERS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183354190696628177)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'1=0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183354312563628177)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183354045335628177)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P72_OAS_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183354208104628177)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P72_OAS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(183355947762628181)
,p_branch_action=>'f?p=&APP_ID.:71:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182440631883285611)
,p_name=>'P72_CMP_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183356393233628182)
,p_name=>'P72_OAS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oas Id'
,p_source=>'OAS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183356712611628184)
,p_name=>'P72_OAS_OAC_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_use_cache_before_default=>'NO'
,p_item_default=>':P71_OAC_ID'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'OAS_OAC_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183357197784628185)
,p_name=>'P72_OAS_PRJ_CODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Opp contacts'
,p_source=>'OAS_PRJ_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT FIRST_NAME || ''-'' || FAMILY_NAME AS DisplayVal, CODE as ResultVal',
'from PRJ_CONTACTS',
'WHERE COMPANY = :P72_CMP_ID'))
,p_cHeight=>5
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183357569507628186)
,p_name=>'P72_OAS_EMPLOYEE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(183353686231628176)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Employee'
,p_source=>'OAS_EMPLOYEE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'EMPLOYEE LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME, EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'order by 1'))
,p_cHeight=>5
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183358339369628187)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from OPP_ACTION_STAKEHOLDERS'
,p_attribute_02=>'OPP_ACTION_STAKEHOLDERS'
,p_attribute_03=>'P72_OAS_ID'
,p_attribute_04=>'OAS_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(182441166921285616)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InsertStakeholders'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_idx    pls_integer;',
'    l_list    varchar2(32767) := :P72_OAS_EMPLOYEE;',
'    l_value    varchar2(32767) := '''';',
'     l_list_stk    varchar2(32767) := :P72_OAS_PRJ_CODE;',
'   ',
'    ',
'begin',
'   ',
'   if l_list is not null then',
'    loop',
'        ',
'        l_idx := instr(l_list,'':'');',
'        if l_idx > 0 then',
'           ',
'			insert into OPP_ACTION_STAKEHOLDERS(OAS_ID,OAS_OAC_ID,OAS_PRJ_CODE, OAS_EMPLOYEE)',
'',
'			values (OPP_OAS_SEQ.NEXTVAL,:P72_OAS_OAC_ID, NULL,substr(l_list,1,l_idx-1));',
'',
'             ',
'            l_list := substr(l_list,l_idx+length('':''));',
'       ',
'	 else',
'     	insert into OPP_ACTION_STAKEHOLDERS(OAS_ID,OAS_OAC_ID,OAS_PRJ_CODE, OAS_EMPLOYEE)',
'',
'			values (OPP_OAS_SEQ.NEXTVAL,:P72_OAS_OAC_ID, NULL,l_list);',
'',
'       exit;',
'        end if;',
'    end loop;',
'    end if;',
'    if l_list_stk is not null then',
'     loop',
'        ',
'        l_idx := instr(l_list_stk,'':'');',
'        if l_idx > 0 then',
'           ',
'			insert into OPP_ACTION_STAKEHOLDERS(OAS_ID,OAS_OAC_ID,OAS_PRJ_CODE, OAS_EMPLOYEE)',
'',
'			values (OPP_OAS_SEQ.NEXTVAL,:P72_OAS_OAC_ID, substr(l_list_stk,1,l_idx-1),null);',
'',
'             ',
'            l_list := substr(l_list,l_idx+length('':''));',
'       ',
'	 else',
'     	insert into OPP_ACTION_STAKEHOLDERS(OAS_ID,OAS_OAC_ID,OAS_PRJ_CODE, OAS_EMPLOYEE)',
'',
'			values (OPP_OAS_SEQ.NEXTVAL,:P72_OAS_OAC_ID,l_list_stk, NULL);',
'',
'       exit;',
'        end if;',
'    end loop;',
'    end if;',
'   END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183354045335628177)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183358753134628188)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of OPP_ACTION_STAKEHOLDERS'
,p_attribute_02=>'OPP_ACTION_STAKEHOLDERS'
,p_attribute_03=>'P72_OAS_ID'
,p_attribute_04=>'OAS_ID'
,p_attribute_11=>'D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183354208104628177)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183359143907628188)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183354208104628177)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
