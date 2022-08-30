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
--   Date and Time:   11:25 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00084
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84);
end;
/
prompt --application/pages/page_00084
begin
wwv_flow_imp_page.create_page(
 p_id=>84
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'LGS_CONTRACTS  DOCUMENTS'
,p_step_title=>'LGS_CONTRACTS  DOCUMENTS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function calculateAmounts(){',
'    ',
'$(''#P37_IH_INITIAL_AMOUNT'').val( $(''#P37_INHOUSE_RATE'').val() * $( "#P37_IH_INVOICED_DAYS" ).val());',
'',
'$(''#P37_AS_INITIAL_AMOUNT'').val( $(''#P37_ONSITE_RATE'').val() * $( "#P37_AS_INVOICED_DAYS" ).val());',
'$(''#P37_INITIAL_AMOUNT'').val( Number($(''#P37_IH_INITIAL_AMOUNT'').val() )+ Number($( "#P37_AS_INITIAL_AMOUNT" ).val()));',
'$(''#P37_FINAL_AMOUNT'').val( Number($(''#P37_INITIAL_AMOUNT'').val() ) - Number($( "#P37_DISCOUNT_IN_AMOUNT" ).val()));',
'$(''#P37_USD_VALUE'').val( Number($(''#P37_FINAL_AMOUNT'').val() )+(Number($(''#P37_FINAL_AMOUNT'').val()) * (Number($( "#P37_VAT_VALUE" ).val()) /100)));',
'    ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200713150925'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29352230301830825)
,p_plug_name=>'Financial Offer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_2'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30395211833659291)
,p_plug_name=>'General Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30395310244659292)
,p_plug_name=>'Dates and Rates'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY_2'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(79505729390906896)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid=>true
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27561619526976288)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_button_name=>'Upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Upload RFP FILE'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27562074663976289)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_button_name=>'upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Upload Response File'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27549845867976256)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'RejectContract'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Reject Contract'
,p_button_position=>'CHANGE'
,p_button_condition=>':P84_ID IS NOT NULL AND :P84_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27550275826976259)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'ApproveContract'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Approve Contract'
,p_button_position=>'CHANGE'
,p_button_condition=>':P84_ID IS NOT NULL AND :P84_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27550655159976260)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'Modules'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Modules'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID:&P84_ID.'
,p_button_condition=>':P84_ID is not null'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27551039297976261)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27551432407976261)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_condition=>':P84_ID IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27551814972976262)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P84_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27552204552976262)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P84_ID IS NOT NULL AND :P84_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(27580509120976372)
,p_branch_name=>'To Page 41'
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID:&P84_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(27551814972976262)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(27580168160976371)
,p_branch_name=>'Go To Page 36'
,p_branch_action=>'f?p=&APP_ID.:36:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'1=0'
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27534440667976219)
,p_name=>'P84_REF_TO_CONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27534879392976227)
,p_name=>'P84_USAGE_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source=>'USAGE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27535102820976228)
,p_name=>'P84_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27535572525976228)
,p_name=>'P84_INVOICED_DAYS'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'INVOICED_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27535916819976229)
,p_name=>'P84_IH_INVOICED_DAYS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House Invoiced Days'
,p_source=>'IH_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27536316319976229)
,p_name=>'P84_IH_INITIAL_AMOUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House INITIAL AMOUNT'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'IH_INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27536723470976230)
,p_name=>'P84_AS_INVOICED_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INVOICED DAYS'
,p_source=>'AS_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27537174606976231)
,p_name=>'P84_AS_INITIAL_AMOUNT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INITIAL AMOUNT'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'AS_INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27537553536976231)
,p_name=>'P84_INITIAL_AMOUNT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Initial Amount'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27537943506976232)
,p_name=>'P84_DISCOUNT_IN_DAYS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Days'
,p_source=>'DISCOUNT_IN_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27538398298976232)
,p_name=>'P84_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Amount'
,p_source=>'DISCOUNT_IN_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27538731512976233)
,p_name=>'P84_FINAL_AMOUNT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Final Amount'
,p_source=>'FINAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27539134307976234)
,p_name=>'P84_VAT_VALUE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_item_default=>'10'
,p_prompt=>'Vat Value'
,p_source=>'VAT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27539545066976234)
,p_name=>'P84_USD_VALUE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (USD)'
,p_source=>'USD_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27539937391976235)
,p_name=>'P84_LL_VALUE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (L.L)'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'LL_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27540348242976236)
,p_name=>'P84_WARRANTY_IN_MONTH'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warranty In Month'
,p_source=>'WARRANTY_IN_MONTH'
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
 p_id=>wwv_flow_imp.id(27540798707976236)
,p_name=>'P84_VALUE_IN_MAINTENANCE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Value In Maintenance'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'VALUE_IN_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27541181432976237)
,p_name=>'P84_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Expenses On Client'
,p_source=>'OTHER_EXPENSES_ON_CLIENT'
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
 p_id=>wwv_flow_imp.id(27541503876976237)
,p_name=>'P84_PERDIUM'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Perdium'
,p_source=>'PERDIUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27541979412976238)
,p_name=>'P84_TICKET_VALUE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ticket Value'
,p_source=>'TICKET_VALUE'
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
 p_id=>wwv_flow_imp.id(27542330276976239)
,p_name=>'P84_HOTEL_RATE'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hotel Rate'
,p_source=>'HOTEL_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27542707873976240)
,p_name=>'P84_CAR_RENTAL_PER_DAY'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Car Rental Per Day'
,p_source=>'CAR_RENTAL_PER_DAY'
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
 p_id=>wwv_flow_imp.id(27543117444976241)
,p_name=>'P84_INTERNATIONAL'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'International'
,p_source=>'INTERNATIONAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(27543511724976242)
,p_name=>'P84_DAYS_PER_TICKET'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Days Per Ticket'
,p_source=>'DAYS_PER_TICKET'
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
 p_id=>wwv_flow_imp.id(27543981976976242)
,p_name=>'P84_PAYMENT_TERM'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Payment Term'
,p_source=>'PAYMENT_TERM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>5
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(27544316179976243)
,p_name=>'P84_REMARKS'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remarks'
,p_source=>'REMARKS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>4000
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27544731846976243)
,p_name=>'P84_SIGNED_BY'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature'
,p_source=>'SIGNED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>1000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27545127775976244)
,p_name=>'P84_SIGNATURE_DATE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'SIGNATURE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>28
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27545531995976245)
,p_name=>'P84_CLIENT_SIGNATURE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature'
,p_source=>'CLIENT_SIGNATURE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27545900359976245)
,p_name=>'P84_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'CLIENT_SIGNATURE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27546358539976246)
,p_name=>'P84_SETTLED'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'SETTLED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27546798568976250)
,p_name=>'P84_START_DATE'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27547150710976250)
,p_name=>'P84_STATUS'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27547586466976251)
,p_name=>'P84_END_DATE'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27547991079976251)
,p_name=>'P84_FINALIZED'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'FINALIZED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27548333368976252)
,p_name=>'P84_CONTRACT_STAGE_ID'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'CONTRACT_STAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27548727898976253)
,p_name=>'P84_DISPLAY_IN_CONTRACTS'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'DISPLAY_IN_CONTRACTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27549132495976253)
,p_name=>'P84_REF_TO_PIPELINE'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(29352230301830825)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_PIPELINE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27552604807976263)
,p_name=>'P84_ACCOUNT_MANAGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&APP_USER.'
,p_prompt=>'Account Manager'
,p_source=>'ACCOUNT_MANAGER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_ACCOUNT_MANAGER_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME,EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'where ACTIVE = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27553065430976266)
,p_name=>'P84_DSP_CODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contract Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --L_DESCRIPTION,',
'DSP_CODE',
'from LGS_PROJECTS',
'order by 1'))
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27553492531976266)
,p_name=>'P84_COMPANY_CODE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client'
,p_source=>'COMPANY_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'COMPANIES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>5
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27553836173976267)
,p_name=>'P84_CONTRACT_TYPE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Type'
,p_source=>'CONTRACT_TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'36_PROPOSAL_TYPE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME,ID',
'from PRJ_CONTRACT_TYPES',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27554232156976267)
,p_name=>'P84_REF_INTERNAL'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Reference'
,p_source=>'REF_INTERNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906334867019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27554652865976268)
,p_name=>'P84_PROJECT_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Name'
,p_source=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27555036470976268)
,p_name=>'P84_DESCRIPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27555452042976269)
,p_name=>'P84_PARENT_CONTRACT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where COMPANY_CODE = :P84_COMPANY_CODE',
'and usage_type = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84_COMPANY_CODE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27555803657976270)
,p_name=>'P84_WHO_CREATED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'V(''APP_USER'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Initiator'
,p_source=>'WHO_CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>75
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
 p_id=>wwv_flow_imp.id(27556274071976274)
,p_name=>'P84_OFFER_STATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Status'
,p_source=>'OFFER_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT POS_DESC,POS_ID',
'FROM PRJ_OFFER_STATUS',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-TOP'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27556643651976275)
,p_name=>'P84_INTERNAL_CLASSIFICATION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Internal Classification'
,p_source=>'INTERNAL_CLASSIFICATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pic_desc,pic_id',
'from prj_internal_classification',
'order by 2'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27557054563976276)
,p_name=>'P84_LOGOS_BRANCHES'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Branches'
,p_source=>'BRANCH_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOGOS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  LLB_DESC as d,',
'       LLB_ID as r',
'  from LGS_LOGOS_BRANCHES',
' order by 2'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906334867019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27557451069976276)
,p_name=>'P84_APPROVAL_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Approval date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'APPROVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27557851123976279)
,p_name=>'P84_IN_SCOPE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(30395211833659291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Within Scope'
,p_source=>'IN_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_INSCOPE_LOV'
,p_lov=>'.'||wwv_flow_imp.id(1976550784535947)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27558534759976280)
,p_name=>'P84_PRICING_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Raised'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'PRICING_DATE'
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
 p_id=>wwv_flow_imp.id(27558948105976281)
,p_name=>'P84_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected Delivery Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'EXPECTED_DELIVERY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>28
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27559374315976282)
,p_name=>'P84_REF_PM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'REF_PM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27559753958976282)
,p_name=>'P84_EXPECTED_DELIVERY_NUMODDAYS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected delivery <br>Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27560163284976284)
,p_name=>'P84_REFERENCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reference'
,p_source=>'REFERENCES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>2000
,p_cHeight=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27560599882976285)
,p_name=>'P84_INHOUSE_RATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Inhouse Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INHOUSE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27560989543976287)
,p_name=>'P84_ONSITE_RATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(30395310244659292)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Onsite Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'ONSITE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27562474565976290)
,p_name=>'P84_RFP_FILES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_prompt=>'RFP FILES'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27562840590976291)
,p_name=>'P84_RFPFILES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_use_cache_before_default=>'NO'
,p_source=>'RFP_FILES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27563247835976291)
,p_name=>'P84_RESPONSE_TO_RFP_FILES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_prompt=>'RESPONSE TO RFP FILES'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27563683431976292)
,p_name=>'P84_RESPTORFP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(79505729390906896)
,p_use_cache_before_default=>'NO'
,p_source=>'RESPONSE_TO_RFP_FILES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27564173639976333)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (to_date(:P84_EXPECTED_DELIVERY_DATE) >= to_char(:P84_PRICING_DATE)) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR ; INVALID DATE'
,p_validation_condition=>'1=0'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(27558948105976281)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27564445859976337)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF ( to_date(:P84_SIGNATURE_DATE) >= to_date(:P84_PRICING_DATE)  AND  to_date(:P84_SIGNATURE_DATE) <= to_date(:P84_EXPECTED_DELIVERY_DATE )) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'INVALID DATE;MUST BE A VALID DATE BETWEEN RAISED AND EXPECTED DELIVERY DATE.'
,p_validation_condition=>'1=0;'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(27545127775976244)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27564868031976337)
,p_validation_name=>'New_2'
,p_validation_sequence=>30
,p_validation=>'P84_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Approval Date should not be null'
,p_when_button_pressed=>wwv_flow_imp.id(1987116098255413)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27565285913976338)
,p_validation_name=>'APPROVAL DATE VAL'
,p_validation_sequence=>30
,p_validation=>'P84_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'APPROVAL_DATE MUST NOT BE NULL'
,p_when_button_pressed=>wwv_flow_imp.id(1987116098255413)
,p_associated_item=>wwv_flow_imp.id(27557451069976276)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27569136407976346)
,p_name=>'ChangeIHDays'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_IH_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27569629502976349)
,p_event_id=>wwv_flow_imp.id(27569136407976346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27570001921976352)
,p_name=>'ChangeOSDays'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_AS_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27570529652976353)
,p_event_id=>wwv_flow_imp.id(27570001921976352)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27570993133976354)
,p_name=>'ChangeIHRate'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_INHOUSE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27571445777976354)
,p_event_id=>wwv_flow_imp.id(27570993133976354)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27571893759976355)
,p_name=>'ChangeONRate'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_ONSITE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27572398589976355)
,p_event_id=>wwv_flow_imp.id(27571893759976355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27572768686976356)
,p_name=>'ChangeInternalRef'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_REF_INTERNAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27573283457976357)
,p_event_id=>wwv_flow_imp.id(27572768686976356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P84_DSP_CODE").val($("#P84_REF_INTERNAL").val());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27573630641976357)
,p_name=>'ValueChanged'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_PARENT_CONTRACT'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27574157784976358)
,p_event_id=>wwv_flow_imp.id(27573630641976357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P84_PARENT_CONTRACT'
,p_attribute_03=>'P84_PARENT_CONTRACT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27574661387976359)
,p_event_id=>wwv_flow_imp.id(27573630641976357)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select INHOUSE_RATE,ONSITE_RATE',
'into :P84_INHOUSE_RATE,:P84_ONSITE_RATE',
'FROM LGS_CONTRACTS',
'WHERE ID= :P84_PARENT_CONTRACT;',
'',
'',
'end;'))
,p_attribute_02=>'P84_INHOUSE_RATE,P84_ONSITE_RATE'
,p_attribute_03=>'P84_INHOUSE_RATE,P84_ONSITE_RATE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27575149400976360)
,p_event_id=>wwv_flow_imp.id(27573630641976357)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(29352230301830825)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27575582394976362)
,p_name=>'New'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_INITIAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27576052439976362)
,p_event_id=>wwv_flow_imp.id(27575582394976362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27576444895976363)
,p_name=>'New_1'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_DISCOUNT_IN_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27576908764976363)
,p_event_id=>wwv_flow_imp.id(27576444895976363)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27577344783976364)
,p_name=>'New_2'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_FINAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27577891518976364)
,p_event_id=>wwv_flow_imp.id(27577344783976364)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FINAL_AMOUNT'
,p_attribute_01=>'$(''#P84_USD_VALUE'').val( Number($(''#P84_FINAL_AMOUNT'').val() )+(Number($(''#P84_FINAL_AMOUNT'').val()) * (Number($( "#P84_VAT_VALUE" ).val()) /100)));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27578264589976365)
,p_name=>'New_3'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_VAT_VALUE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27578701621976366)
,p_event_id=>wwv_flow_imp.id(27578264589976365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_VAT_VALUE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27579154348976369)
,p_name=>'New_4'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1987116098255413)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27579677149976369)
,p_event_id=>wwv_flow_imp.id(27579154348976369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
' var r = confirm("Once approved, you cannot revert nor edit, make sure all entries are correct?");',
'',
'       //cancel clicked : stop button default action ',
'       if (r === false) {',
'          ',
'           return false;',
'        }',
'        else{',
'            ',
'            apex.submit({  request:"ApproveContract"});',
'        }',
'',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27565543867976338)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P84_ID'
,p_attribute_04=>'ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27567930981976343)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  arr2 varchar2(1000);',
' ',
'  v_blob_data       BLOB;',
'begin',
'  arr2 := apex_util.string_to_table(:P84_RFP_FILES);',
'  for i in 1..arr2.count loop',
'    select blob_content into v_blob_data',
'from wwv_flow_files where UPPER(name )= UPPER(:P84_RESPONSE_TO_RFP_FILES);',
'  end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'1=0;'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27565913331976340)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get PK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P84_ID is null then',
'        select "#OWNER#"."LGS_CONTRACTS_SEQ".nextval',
'          into :P84_ID',
'          from sys.dual;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27551814972976262)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27566340630976341)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P84_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27566761810976341)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27552204552976262)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27567191637976342)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ApproveContract'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Example One: Plain Text only message',
'DECLARE',
'    l_body      CLOB;',
'    v         number;',
'    TO_EMAIL_V VARCHAR2(100);',
'    FROM_EMAIL_V VARCHAR2(100);',
'    ind         NUMBER;',
'    Cursor C1(ContractID number)',
'    is select INT_CODE, MODULE, start_date, End_Date from lgs_projects where contract_id = contractID;',
'    C1R C1%ROWTYPE;',
'BEGIN',
'     v := PROJECT_PCK.change_contact_approved_status(:P84_ID);',
'     ind := 1;',
'     ',
'         l_body := ''Contract Change Approved status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || :P84_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
'         ',
'  Open C1(v);',
'  loop',
' Fetch C1 into C1R;',
'     if C1%notfound then',
'       close C1;',
'        exit;      end if;',
'        ',
'         l_body := l_body || ''Module:#'' || ind ||utl_tcp.crlf;',
'        l_body := l_body || ''Name: '' || C1R.MODULE || '' ........... '' || ''INT_CODE: '' || C1R.INT_CODE || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'  End loop;',
'  ',
'        l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'       ',
'       SELECT EMP_EMAIL INTO FROM_EMAIL_V',
'       FROM PRJ_EMPLOYEE_SALARY',
'       WHERE UPPER(USER_NAME) = UPPER(:P84_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        ',
'        if :P84_CONTRACT_TYPE_ID <> 6 then',
'          apex_mail.send(',
'                         p_to  => ''tareif.kh@gmail.com'',-- TO_EMAIL_V,   -- change to your email address',
'                          p_from =>  FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc => FROM_EMAIL_V,',
'                          p_body     => l_body,',
'                         p_subj => ''Contract Approved - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE;',
'                         ',
'        end if;',
'   ',
'      ',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1987116098255413)
,p_process_success_message=>'Once approved, you cannot revert nor edit, make sure all entried are correct'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27567511271976343)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RejectContract'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Example One: Plain Text only message',
'DECLARE',
'    l_body      CLOB;',
'    v         number;',
'    TO_EMAIL_V VARCHAR2(100);',
'    FROM_EMAIL_V VARCHAR2(100);',
'   ',
'   Cursor C1(ContractID number)',
'       is  ',
'         select INT_CODE, MODULE, start_date, End_Date from lgs_projects where contract_id = contractID;',
'   C1R C1%ROWTYPE; ',
'BEGIN',
'  ',
'         v := PROJECT_PCK.change_contact_rejected_status(:P84_ID);',
'         i := 1;',
'          l_body := ''Contract Change Rejected status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf; Open C1(v);',
'          l_body := l_body || ''Contract Integration Code: '' || :P84_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
'  loop',
' Fetch C1 into C1R',
'     if C1%notfound then',
'       close c_worker;',
'        exit;      end if;',
'        ',
'         l_body := l_body || ''Module:#'' || ind ||utl_tcp.crlf;',
'        l_body := l_body || ''Name: '' || C1R.MODULE || '' ......... '' || ''INT_CODE: '' || C1R.INT_CODE || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'  End loop;',
'           ',
'         l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'      ',
'       SELECT EMP_EMAIL INTO FROM_EMAIL_V',
'       FROM PRJ_EMPLOYEE_SALARY',
'      WHERE UPPER(USER_NAME) = UPPER(:P84_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        if :P84_CONTRACT_TYPE_ID <> 6 then',
'        apex_mail.send(',
'                         p_to  => TO_EMAIL_V,   -- change to your email address',
'                          p_from   => FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc => FROM_EMAIL_V,',
'                          p_body     => l_body,',
'                         p_subj => ''Contract Rejected - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE;',
'        end if;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1987206013255414)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27568307014976344)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UpdateRFPFileName'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RFP_FILES = :P84_RFP_FILES',
'    ',
'WHERE ID = :P84_ID;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27561619526976288)
,p_process_when=>':P84_RFP_FILES IS NOT NULL'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27568736938976345)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RESPONSE_TO_RFP_FILES = :P84_RESPONSE_TO_RFP_FILES',
'    ',
'WHERE ID = :P84_ID;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(27562074663976289)
,p_process_when=>':P84_RESPONSE_TO_RFP_FILES is not null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
null;
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
