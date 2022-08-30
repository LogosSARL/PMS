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
--   Date and Time:   11:23 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 42
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00042
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>42);
end;
/
prompt --application/pages/page_00042
begin
wwv_flow_imp_page.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Form on PRJ_PIPELINE_MODULES'
,p_step_title=>'Form on PRJ_PIPELINE_MODULES'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20181107090812'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2422819226423834)
,p_plug_name=>'Form on PRJ_PIPELINE_MODULES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2423306485423835)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P42_PPM_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2423521495423835)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2423249300423835)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P42_PPM_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2423405726423835)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P42_PPM_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2425145826423839)
,p_branch_name=>'Go To Page 41'
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1833735735278020)
,p_name=>'P42_MODULE_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source=>'PPM_MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules'))
,p_lov_display_null=>'YES'
,p_cSize=>60
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P42_PPM_ID is not null'
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
 p_id=>wwv_flow_imp.id(2425517540423843)
,p_name=>'P42_PPM_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_source=>'PPM_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2425900041423847)
,p_name=>'P42_PPM_CNT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_source=>'PPM_CNT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2426729268423848)
,p_name=>'P42_PPM_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm Start Date'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'PPM_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2427115559423849)
,p_name=>'P42_PPM_END_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm End Date'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'PPM_END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2427575381423849)
,p_name=>'P42_PPM_INT_CODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Int Code'
,p_source=>'PPM_INT_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P42_PPM_ID is not null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2427944811423850)
,p_name=>'P42_PPM_NEW_IMPLEMENTATION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm New Implementation'
,p_source=>'PPM_NEW_IMPLEMENTATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2428390651423850)
,p_name=>'P42_PPM_MAINTENANCE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm Maintenance'
,p_source=>'PPM_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2428796078423851)
,p_name=>'P42_PPM_PRICING_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm Pricing Date'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'PPM_PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2429113217423851)
,p_name=>'P42_PPM_HIGH_LEVEL_ESTIMATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm High Level Estimate'
,p_source=>'PPM_HIGH_LEVEL_ESTIMATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2429595399423856)
,p_name=>'P42_PPM_RFP_REF'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm Rfp Ref'
,p_source=>'PPM_RFP_REF'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2447859561869130)
,p_name=>'P42_SEARCHMODULE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_prompt=>'Search Module'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'where level = 2 and int_code in (',
'select module_code from css_project_tasks)',
'connect by prior code = parent_code',
'start with code=''ALL''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P42_PPM_ID is null'
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
 p_id=>wwv_flow_imp.id(2447955304869131)
,p_name=>'P42_PPM_MODULE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2422819226423834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ppm Module'
,p_source=>'PPM_MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'--where e_name IN (select unique module_name from css_project_tasks)',
'where int_code is not null',
'connect by prior code = parent_code',
'start with code=:P42_SEARCHMODULE',
'order by 1'))
,p_lov_cascade_parent_items=>'P42_SEARCHMODULE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>':P42_PPM_ID is null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(20906334867019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2722888621162048)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' IF :P42_PPM_START_DATE >= :P37_PRICING_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'INVALID START DATE'
,p_validation_condition=>'1=0;'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(2426729268423848)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2722954818162049)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' IF :P42_PPM_END_DATE <= :P37_EXPECTED_DELIVERY_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'INVALID END DATE'
,p_validation_condition=>'1=0;'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(2427115559423849)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2082594657538744)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_SEARCHFORMODULE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2082605179538745)
,p_event_id=>wwv_flow_imp.id(2082594657538744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2082709024538746)
,p_event_id=>wwv_flow_imp.id(2082594657538744)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_PPM_MODULE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2083080967538749)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_PPM_MODULE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2083148688538750)
,p_event_id=>wwv_flow_imp.id(2083080967538749)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P42_PPM_INT_CODE'').val($( "#P42_SEARCHMODULE OPTION:SELECTED" ).text());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2430333885423858)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PRJ_PIPELINE_MODULES'
,p_attribute_02=>'PRJ_PIPELINE_MODULES'
,p_attribute_03=>'P42_PPM_ID'
,p_attribute_04=>'PPM_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2430798290423859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get PK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P42_PPM_ID is null then',
'        select "#OWNER#"."PRJ_PPM_SEQ".nextval',
'          into :P42_PPM_ID',
'          from sys.dual;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2423249300423835)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2448081823869132)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InsertProcess'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_idx    pls_integer;',
'    l_list    varchar2(32767) := :P42_PPM_MODULE;',
'    l_value    varchar2(32767) := '''';',
'    CONTRACT_REF_V VARCHAR2(200);',
'    MODULE_CODE_V VARCHAR2(200);',
'begin',
'    SELECT DSP_CODE INTO CONTRACT_REF_V FROM LGS_CONTRACTS WHERE ID = :P42_PPM_CNT_ID;',
'    loop',
'        ',
'        l_idx := instr(l_list,'':'');',
'        if l_idx > 0 then',
'            SELECT INT_CODE INTO MODULE_CODE_V FROM PRJ_MODULES WHERE UPPER(CODE) = UPPER(substr(l_list,1,l_idx-1));',
'			insert into PRJ_PIPELINE_MODULES(PPM_ID,PPM_CNT_ID,PPM_MODULE,PPM_START_DATE, PPM_END_DATE, PPM_INT_CODE, 			PPM_NEW_IMPLEMENTATION, PPM_MAINTENANCE, PPM_PRICING_DATE, PPM_HIGH_LEVEL_ESTIMATE, PPM_RFP_REF)',
'',
'			values (PRJ_PPM_SEQ.NEXTVAL,:P42_PPM_CNT_ID,substr(l_list,1,l_idx-1),to_date(:P42_PPM_START_DATE,''yyyy-mm-dd''),to_date(:P42_PPM_START_DATE,''yyyy-mm-dd''), ',
'                    --project_pck.get_contract_desc (:P42_PPM_CNT_ID) ',
'                    CONTRACT_REF_V,-- || ''-'' || MODULE_CODE_V, --substr(l_list,1,l_idx-1),',
'                    :P42_PPM_NEW_IMPLEMENTATION,',
'                    :P42_PPM_MAINTENANCE,:P42_PPM_PRICING_DATE,',
':P42_PPM_HIGH_LEVEL_ESTIMATE,:P42_PPM_RFP_REF);',
'',
'             ',
'            l_list := substr(l_list,l_idx+length('':''));',
'       ',
'	 else',
'      SELECT INT_CODE INTO MODULE_CODE_V FROM PRJ_MODULES WHERE UPPER(CODE) = UPPER(l_list);',
'		insert into PRJ_PIPELINE_MODULES(PPM_ID,PPM_CNT_ID,PPM_MODULE,PPM_START_DATE, PPM_END_DATE, PPM_INT_CODE, 			PPM_NEW_IMPLEMENTATION, PPM_MAINTENANCE, PPM_PRICING_DATE, PPM_HIGH_LEVEL_ESTIMATE, PPM_RFP_REF)',
'			values (PRJ_PPM_SEQ.NEXTVAL,:P42_PPM_CNT_ID,l_list,to_date(:P42_PPM_START_DATE,''yyyy-mm-dd''),to_date(:P42_PPM_START_DATE,''yyyy-mm-dd''),',
'                    --project_pck.get_contract_desc (:P42_PPM_CNT_ID)',
'                    CONTRACT_REF_V,-- || ''-'' || MODULE_CODE_V,--l_list,',
'                    :P42_PPM_NEW_IMPLEMENTATION,:P42_PPM_MAINTENANCE,:P42_PPM_PRICING_DATE,:P42_PPM_HIGH_LEVEL_ESTIMATE,:P42_PPM_RFP_REF);',
'         exit;',
'        end if;',
'    end loop;',
'   END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2423249300423835)
,p_process_success_message=>'ACTION PROCESSED.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2431100439423860)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PRJ_PIPELINE_MODULES'
,p_attribute_02=>'PRJ_PIPELINE_MODULES'
,p_attribute_03=>'P42_PPM_ID'
,p_attribute_04=>'PPM_ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2423306485423835)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2448160737869133)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'New'
,p_attribute_02=>'PRJ_PIPELINE_MODULES'
,p_attribute_03=>'P42_PPM_ID'
,p_attribute_04=>'PPM_ID'
,p_attribute_11=>'D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2423405726423835)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2431504944423860)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2423405726423835)
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
