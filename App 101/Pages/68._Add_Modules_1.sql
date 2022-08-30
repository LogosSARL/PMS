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
--   Date and Time:   11:24 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 68
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00068
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>68);
end;
/
prompt --application/pages/page_00068
begin
wwv_flow_imp_page.create_page(
 p_id=>68
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Add Modules'
,p_step_title=>'Add Modules'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180202091919'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183328881417284414)
,p_plug_name=>'Form on OPP_SCOPE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183329374364284414)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P68_OPS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183329585419284414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183329255889284414)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P68_OPS_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183329481705284414)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P68_OPS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(183331125947284416)
,p_branch_action=>'f?p=&APP_ID.:61:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182440274411285607)
,p_name=>'P68_MODULE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source=>'OPS_MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'where e_name IN (select unique module_name from css_project_tasks)'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P68_OPS_ID IS NOT NULL'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183331551159284417)
,p_name=>'P68_OPS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ops Id'
,p_source=>'OPS_ID'
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
 p_id=>wwv_flow_imp.id(183331967280284418)
,p_name=>'P68_OPS_OPP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_use_cache_before_default=>'NO'
,p_source=>'OPS_OPP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183488272093448020)
,p_name=>'P68_SEARCH_MODULE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_prompt=>'Search Module'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'MODULE_LEVEL2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'where level = 2 and int_code in (',
'',
'  select module_code from css_project_tasks)',
'connect by prior code = parent_code',
'start with code=''ALL''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P68_OPS_ID IS NULL'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183488859917463361)
,p_name=>'P68_MODULES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(183328881417284414)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source=>'OPS_MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'',
'connect by prior code = parent_code',
'start with code=:P68_SEARCH_MODULE',
'order by 1'))
,p_lov_cascade_parent_items=>'P68_SEARCH_MODULE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P68_OPS_ID IS NULL'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(20906334867019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183239498753880613)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_MODULES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183239565802880614)
,p_event_id=>wwv_flow_imp.id(183239498753880613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_OPS_MODULE'
,p_attribute_01=>'$(''#P68_OPS_MODULE'').val($( "#P68_SEARCH_MODULE OPTION:SELECTED" ).text());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183333169308284419)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from OPP_SCOPE'
,p_attribute_02=>'OPP_SCOPE'
,p_attribute_03=>'P68_OPS_ID'
,p_attribute_04=>'OPS_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183238668052880605)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PRIMARY KEY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
':P68_OPS_ID := OPP_OPS_SEQ.NEXTVAL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P68_OPS_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(182440094192285605)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InsertModulesIntoScope'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_idx    pls_integer;',
'    l_list    varchar2(32767) := :P68_MODULES;',
'    l_value    varchar2(32767) := '''';',
'   ',
'    MODULE_CODE_V VARCHAR2(200);',
'begin',
'   ',
'    loop',
'        ',
'        l_idx := instr(l_list,'':'');',
'        if l_idx > 0 then',
'           ',
'			insert into OPP_SCOPE(OPS_ID,OPS_OPP_ID,OPS_MODULE)',
'',
'			values (OPP_OPS_SEQ.NEXTVAL,:P68_OPS_OPP_ID, substr(l_list,1,l_idx-1));',
'',
'             ',
'            l_list := substr(l_list,l_idx+length('':''));',
'       ',
'	 else',
'     	insert into OPP_SCOPE(OPS_ID,OPS_OPP_ID,OPS_MODULE)',
'',
'			values (OPP_OPS_SEQ.NEXTVAL,:P68_OPS_OPP_ID, l_list);',
'',
'       exit;',
'        end if;',
'    end loop;',
'   END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183329255889284414)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183333584157284420)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of OPP_SCOPE'
,p_attribute_02=>'OPP_SCOPE'
,p_attribute_03=>'P68_OPS_ID'
,p_attribute_04=>'OPS_ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183329374364284414)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(182440112467285606)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'DeleteModuleFromScope'
,p_attribute_02=>'OPP_SCOPE'
,p_attribute_03=>'P68_OPS_ID'
,p_attribute_04=>'OPS_ID'
,p_attribute_11=>'D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183329481705284414)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183333935277284420)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183329481705284414)
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
