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
--   Date and Time:   11:28 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 11
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00011
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>11);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_imp_page.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'CREATE_TASK'
,p_step_title=>'CREATE_TASK'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190205165458'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(313711810588818394)
,p_plug_name=>'Form on PRJ_WBS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313712375180818395)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P11_WBS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313712580234818395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313712279422818395)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P11_WBS_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313712403831818395)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P11_WBS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(313714415798818398)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313714825851818398)
,p_name=>'P11_WBS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wbs Id'
,p_source=>'WBS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313715613032818454)
,p_name=>'P11_WBS_PRJ_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_source=>'WBS_PRJ_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313716014150818454)
,p_name=>'P11_WBS_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Desc'
,p_source=>'WBS_DESC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313716442811818455)
,p_name=>'P11_WBS_START_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date'
,p_source=>'WBS_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313716840497818455)
,p_name=>'P11_WBS_END_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'End Date'
,p_source=>'WBS_END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313717241052818455)
,p_name=>'P11_WBS_DURATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Duration'
,p_source=>'WBS_DURATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313717699876818455)
,p_name=>'P11_WBS_COMMENTS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Comments'
,p_source=>'WBS_COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313718021284818455)
,p_name=>'P11_WBS_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'WBS_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT PST_DESC, PST_ID FROM PRJ_STATUS ORDER BY 1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313718447464818455)
,p_name=>'P11_WBS_COMPLETION_PERCENTAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Completion Percentage'
,p_placeholder=>'%'
,p_source=>'WBS_COMPLETION_PERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313718869274818455)
,p_name=>'P11_WBS_SCOPE_OF_WORK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Scope Of Work'
,p_source=>'WBS_SCOPE_OF_WORK'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313719201388818456)
,p_name=>'P11_WBS_LESSONS_LEARNED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lessons Learned'
,p_source=>'WBS_LESSONS_LEARNED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313719630583818456)
,p_name=>'P11_WBS_RISK'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Risk'
,p_source=>'WBS_RISK'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313720004555818456)
,p_name=>'P11_WBS_CONCERNS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concerns'
,p_source=>'WBS_CONCERNS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313720416940818456)
,p_name=>'P11_WBS_ASSUMPTIONS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assumptions'
,p_source=>'WBS_ASSUMPTIONS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313720811662818456)
,p_name=>'P11_WBS_ACCEPTANCE_CRITERIA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Acceptance Criteria'
,p_source=>'WBS_ACCEPTANCE_CRITERIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313721242269818456)
,p_name=>'P11_CREATED'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313721613952818456)
,p_name=>'P11_CREATED_BY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313722093703818456)
,p_name=>'P11_UPDATED'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(313722426896818457)
,p_name=>'P11_UPDATED_BY'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318499493319007129)
,p_name=>'P11_WBS_SCALE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Scale'
,p_source=>'WBS_SCALE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LEVEL_OF_EFFORTS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   PRJ_SALARY_GRADES ',
'order by name'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318499557566007130)
,p_name=>'P11_NUMBER_OF_DAYS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Number Of Days'
,p_source=>'WBS_NUMBER_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318499682503007131)
,p_name=>'P11_WBS_ONSITE_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'On Site Days'
,p_source=>'WBS_ONSITE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318499721125007132)
,p_name=>'P11_WBS_EST_TYPE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estimation Type'
,p_source=>'WBS_EST_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EST_TYPES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   est_types',
'order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318500036593007135)
,p_name=>'P11_PRJ_WORK_TYPES'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_prompt=>'Prj work types'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT e_name,id FROM PRJ_WORK_TYPES'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(318511793369150806)
,p_name=>'P11_WORK_GROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(313711810588818394)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work group'
,p_source=>'WBS_WORK_TYPE_GROUP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT g.NAME, g.ID FRom WORK_TYPE_groups g ',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(313723503899818457)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PRJ_WBS'
,p_attribute_02=>'PRJ_WBS'
,p_attribute_03=>'P11_WBS_ID'
,p_attribute_04=>'WBS_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(313723938696818458)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PRJ_WBS'
,p_attribute_02=>'PRJ_WBS'
,p_attribute_03=>'P11_WBS_ID'
,p_attribute_04=>'WBS_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(318499882898007133)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'insert into prj_estimated_dets (PROJECT_WORKTYPE_ID,NO_OF_DAYS,SCALE,ON_SITE_DAYS,EST_TYPE) values(:P11_PRJ_WORK_TYPES,',
'                                                                                                   :P11_NUMBER_OF_DAYS,',
'                                                                             :P11_WBS_SCALE,',
'                                                                             :P11_WBS_ONSITE_DAYS,',
'                                                                             :P11_WBS_EST_TYPE) ; commit;',
'                                                                             end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(313724304792818458)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(313712403831818395)
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
