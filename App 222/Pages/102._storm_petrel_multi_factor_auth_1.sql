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
,p_default_application_id=>222
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   11:30 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 102
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00102
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>102);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_imp_page.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'storm petrel multi factor auth'
,p_step_title=>'storm petrel multi factor auth'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20191031153112'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(592664798477281344)
,p_plug_name=>'test'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(608544033956121401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(608544172637121402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_button_name=>'VALIDATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Validate'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(608544510761121406)
,p_branch_action=>'f?p=&APP_ID.:102:&SESSION'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(608544172637121402)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592664895320281345)
,p_name=>'P102_LOGIN_ATTEMPTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592664939458281346)
,p_name=>'P102_USER_PK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592665044764281347)
,p_name=>'P102_SMS_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592665179073281348)
,p_name=>'P102_VALID_TIL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_prompt=>'Valid til'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592665222633281349)
,p_name=>'P102_MSG_TEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_prompt=>'Msg text'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592665335121281350)
,p_name=>'P102_MESSAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(592664798477281344)
,p_prompt=>'Message'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(608544335513121404)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_valid_text boolean;',
'begin',
'	l_valid_text := vlt_mfa_pkg.valid_mfa(',
'		:P102_MSG_TEXT',
'		);',
'	:P102_LOGIN_ATTEMPTS := :P102_LOGIN_ATTEMPTS + 1;',
'',
'return l_valid_text;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'validation message error'
,p_associated_item=>wwv_flow_imp.id(592665222633281349)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(608544462331121405)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>'return :P102_LOGIN_ATTEMPTS < 3 and :P102_SMS_NUMBER is not null;'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'validate button error'
,p_when_button_pressed=>wwv_flow_imp.id(608544172637121402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(608544292932121403)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- missing table vlt_user',
'DECLARE',
'	l_select_count		number;',
'	l_valid_date		date;',
'',
'BEGIN',
'select count(user_pk) into l_select_count',
'	from vlt_user ',
'	where upper(user_name) = upper(v(''APP_USER''));',
'if l_select_count = 1 then',
'	select',
'		user_pk,',
'		sms_number,',
'		sms_valid_date',
'	into ',
'		:P102_USER_PK,',
'		:P102_SMS_NUMBER,',
'		l_valid_date',
'	from vlt_user ',
'	where upper(user_name) = upper(v(''APP_USER''));',
'end if; -- select count = 1',
'',
'if l_valid_date is null then',
'	:P102_message := ''Mobile Number has never been validated. '';',
'end if;',
'if :P102_SMS_NUMBER is not null then',
'	vlt_mfa_pkg.generate_mfa_text(',
'		P_SMS_NUMBER	=> :P102_SMS_NUMBER',
'		);',
'	select to_char(localtimestamp + interval ''10'' minute, ''HH12:MI AM'') ',
'		into :P102_VALID_TIL',
'		from dual;		',
'else',
'	:P102_message := ''Mobile Number/SMS number does not exist'';',
'end if; -- sms not null',
'if :P102_LOGIN_ATTEMPTS is null then',
'	:P102_LOGIN_ATTEMPTS := 0;',
'end if; -- init login_attempt counter',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
