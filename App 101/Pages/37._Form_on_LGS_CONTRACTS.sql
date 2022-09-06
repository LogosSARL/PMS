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
--     PAGE: 37
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00037
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>37);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_imp_page.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Form on LGS_CONTRACTS'
,p_step_title=>'Form on LGS_CONTRACTS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#APP_IMAGES#CR.js'
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
,p_last_upd_yyyymmddhh24miss=>'20220511140612'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(51972004410930722)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid=>true
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51972396802930725)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(51972004410930722)
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
 p_id=>wwv_flow_imp.id(90138985765650608)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(51972004410930722)
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
 p_id=>wwv_flow_imp.id(1987206013255414)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'RejectContract'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Reject Contract'
,p_button_position=>'CHANGE'
,p_button_condition=>':P37_ID IS NOT NULL AND :P37_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1987116098255413)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'ApproveContract'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Approve Contract'
,p_button_position=>'CHANGE'
,p_button_condition=>':P37_ID IS NOT NULL AND :P37_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2444914622869101)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'Modules'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Modules'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID:&P37_ID.'
,p_button_condition=>':P37_ID is not null'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1819294587854652)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1819008867854652)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_condition=>':P37_ID IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1818920783854652)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P37_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1819185867854652)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P37_ID IS NOT NULL AND :P37_OFFER_STATUS = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2722276740162042)
,p_branch_name=>'To Page 41'
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID,P41_CONTRACT_TYPE_ID:&P37_ID.,&P37_CONTRACT_TYPE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(1818920783854652)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1820849881854656)
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
 p_id=>wwv_flow_imp.id(1821221790854659)
,p_name=>'P37_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1821692335854661)
,p_name=>'P37_DSP_CODE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
,p_field_template=>wwv_flow_imp.id(20906436051019158)
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
 p_id=>wwv_flow_imp.id(1822095847854662)
,p_name=>'P37_COMPANY_CODE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1822486606854662)
,p_name=>'P37_START_DATE'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1822850007854663)
,p_name=>'P37_END_DATE'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1823262177854664)
,p_name=>'P37_USD_VALUE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (USD)'
,p_source=>'USD_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1823626165854664)
,p_name=>'P37_FINALIZED'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'FINALIZED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1824098362854665)
,p_name=>'P37_CONTRACT_TYPE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1824483537854666)
,p_name=>'P37_CONTRACT_STAGE_ID'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'CONTRACT_STAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1824873550854666)
,p_name=>'P37_DISPLAY_IN_CONTRACTS'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'DISPLAY_IN_CONTRACTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1825276680854667)
,p_name=>'P37_PRICING_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(1825657276854667)
,p_name=>'P37_PERDIUM'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1826062274854668)
,p_name=>'P37_DAYS_PER_TICKET'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1826422346854668)
,p_name=>'P37_TICKET_VALUE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1826827224854669)
,p_name=>'P37_HOTEL_RATE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1827269264854670)
,p_name=>'P37_CAR_RENTAL_PER_DAY'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1827607517854670)
,p_name=>'P37_INTERNATIONAL'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1828097092854671)
,p_name=>'P37_WHO_CREATED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1828486050854671)
,p_name=>'P37_ACCOUNT_MANAGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1828855641854672)
,p_name=>'P37_USAGE_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source=>'USAGE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1829280729854672)
,p_name=>'P37_PARENT_CONTRACT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where COMPANY_CODE = :P37_COMPANY_CODE',
'and usage_type = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P37_COMPANY_CODE'
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
 p_id=>wwv_flow_imp.id(1829615749854673)
,p_name=>'P37_REF_TO_PIPELINE'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_PIPELINE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1830016543854674)
,p_name=>'P37_REF_TO_CONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1830437640854674)
,p_name=>'P37_PROJECT_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1830811074854675)
,p_name=>'P37_REF_PM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(1831235756854675)
,p_name=>'P37_REF_INTERNAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1831610408854676)
,p_name=>'P37_INHOUSE_RATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(1832040446854677)
,p_name=>'P37_ONSITE_RATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(1832433007854677)
,p_name=>'P37_IN_SCOPE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1832831741854678)
,p_name=>'P37_INTERNAL_CLASSIFICATION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(1833208054854678)
,p_name=>'P37_INVOICED_DAYS'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'INVOICED_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1833641439854679)
,p_name=>'P37_INITIAL_AMOUNT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1834081513854679)
,p_name=>'P37_DISCOUNT_IN_DAYS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1834452662854680)
,p_name=>'P37_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1834840373854680)
,p_name=>'P37_VAT_VALUE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vat Value'
,p_source=>'VAT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1835222133854681)
,p_name=>'P37_FINAL_AMOUNT'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Final Amount'
,p_source=>'FINAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1835652071854681)
,p_name=>'P37_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(1836053979854681)
,p_name=>'P37_WARRANTY_IN_MONTH'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1836426439854682)
,p_name=>'P37_VALUE_IN_MAINTENANCE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1836865086854682)
,p_name=>'P37_SIGNATURE_DATE'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1837270825854682)
,p_name=>'P37_SIGNED_BY'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1837680986854683)
,p_name=>'P37_OFFER_STATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1838083929854683)
,p_name=>'P37_PAYMENT_TERM'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1838474846854684)
,p_name=>'P37_REMARKS'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1838835951854684)
,p_name=>'P37_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(1839218069854684)
,p_name=>'P37_SETTLED'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'SETTLED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1839624348854685)
,p_name=>'P37_STATUS'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2445696293869108)
,p_name=>'P37_IH_INVOICED_DAYS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(2445716683869109)
,p_name=>'P37_IH_INITIAL_AMOUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2445896849869110)
,p_name=>'P37_AS_INVOICED_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(2445967839869111)
,p_name=>'P37_AS_INITIAL_AMOUNT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51971712320930719)
,p_name=>'P37_LOGOS_BRANCHES'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(51972127917930723)
,p_name=>'P37_RFP_FILES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51972004410930722)
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
 p_id=>wwv_flow_imp.id(51972293561930724)
,p_name=>'P37_RESPONSE_TO_RFP_FILES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51972004410930722)
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
 p_id=>wwv_flow_imp.id(51974384885930745)
,p_name=>'P37_DESCRIPTION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(51974405214930746)
,p_name=>'P37_CLIENT_SIGNATURE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(51974606239930748)
,p_name=>'P37_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
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
 p_id=>wwv_flow_imp.id(51974734639930749)
,p_name=>'P37_REFERENCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
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
 p_id=>wwv_flow_imp.id(51974899100930750)
,p_name=>'P37_DELIVERY_NUMODDAYS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected delivery <br>Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65980605841483005)
,p_name=>'P37_APPROVAL_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
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
 p_id=>wwv_flow_imp.id(82032738014387701)
,p_name=>'P37_APPLICENSE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Applicense'
,p_source=>'APP_LICENSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(82032838034387702)
,p_name=>'P37_ORACLELICENSE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New'
,p_source=>'ORACLE_LICENSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(90139273831650611)
,p_name=>'P37_RFPFILES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51972004410930722)
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
 p_id=>wwv_flow_imp.id(90139371647650612)
,p_name=>'P37_RESPTORFP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51972004410930722)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182544325294767141)
,p_name=>'P37_LL_VALUE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (L.L)'
,p_source=>'LL_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286094592511795724)
,p_name=>'P37_PRODUCT'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select pgr_code id, pgr_code name from prj_groups order by 2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286094646562795725)
,p_name=>'P37_PROCESS_DEF'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286095240063795731)
,p_name=>'P37_TASK_ID'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286096533959795744)
,p_name=>'P37_ROLE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(2861486853683117)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(945211965577470017)
,p_name=>'P37_INHOUSE_O_RATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Off hours In-House Rate'
,p_source=>'INHOUSE_O_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(945212088845470018)
,p_name=>'P37_ONSITE_O_RATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(2861585264683118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Off hours onsite rate'
,p_source=>'ONSITE_O_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(945212136477470019)
,p_name=>'P37_PAYMENT_METHOD'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Payment method'
,p_source=>'PAYMENT_METHOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cash;CASH,Money transfer;MONEY_TRANSFER'
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
 p_id=>wwv_flow_imp.id(945212280905470020)
,p_name=>'P37_WORK_TO_BE_CONDUCTED'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work to be conducted'
,p_source=>'WORK_TO_BE_CONDUCTED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(945213158458470029)
,p_name=>'P37_SURCHARGE_FLG'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(1818505321854651)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surcharge flag'
,p_source=>'SURCHARGE_FLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;1'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2720248268162022)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (to_date(:P37_EXPECTED_DELIVERY_DATE) >= to_char(:P37_PRICING_DATE)) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR ; INVALID DATE'
,p_validation_condition=>'1=0'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(1835652071854681)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2720336048162023)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF ( to_date(:P37_SIGNATURE_DATE) >= to_date(:P37_PRICING_DATE)  AND  to_date(:P37_SIGNATURE_DATE) <= to_date(:P37_EXPECTED_DELIVERY_DATE )) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'INVALID DATE;MUST BE A VALID DATE BETWEEN RAISED AND EXPECTED DELIVERY DATE.'
,p_validation_condition=>'1=0;'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(1836865086854682)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(65980547212483004)
,p_validation_name=>'New_2'
,p_validation_sequence=>30
,p_validation=>'P37_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Approval Date should not be null'
,p_when_button_pressed=>wwv_flow_imp.id(1987116098255413)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(65980721097483006)
,p_validation_name=>'APPROVAL DATE VAL'
,p_validation_sequence=>30
,p_validation=>'P37_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'APPROVAL_DATE MUST NOT BE NULL'
,p_when_button_pressed=>wwv_flow_imp.id(1987116098255413)
,p_associated_item=>wwv_flow_imp.id(65980605841483005)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2447479862869126)
,p_name=>'ChangeIHDays'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_IH_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2447501755869127)
,p_event_id=>wwv_flow_imp.id(2447479862869126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2447627198869128)
,p_name=>'ChangeOSDays'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_AS_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2447783978869129)
,p_event_id=>wwv_flow_imp.id(2447627198869128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1716148376273830)
,p_name=>'ChangeIHRate'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_INHOUSE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1716270075273831)
,p_event_id=>wwv_flow_imp.id(1716148376273830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1716311228273832)
,p_name=>'ChangeONRate'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_ONSITE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1716415662273833)
,p_event_id=>wwv_flow_imp.id(1716311228273832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2723012971162050)
,p_name=>'ValueChanged'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_PARENT_CONTRACT'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2859875077683101)
,p_event_id=>wwv_flow_imp.id(2723012971162050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P37_PARENT_CONTRACT'
,p_attribute_03=>'P37_PARENT_CONTRACT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2860067873683103)
,p_event_id=>wwv_flow_imp.id(2723012971162050)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select INHOUSE_RATE,ONSITE_RATE',
'into :P37_INHOUSE_RATE,:P37_ONSITE_RATE',
'FROM LGS_CONTRACTS',
'WHERE ID= :P37_PARENT_CONTRACT;',
'',
'',
'end;'))
,p_attribute_02=>'P37_INHOUSE_RATE,P37_ONSITE_RATE'
,p_attribute_03=>'P37_INHOUSE_RATE,P37_ONSITE_RATE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2860122292683104)
,p_event_id=>wwv_flow_imp.id(2723012971162050)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1818505321854651)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2860606235683109)
,p_name=>'New'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_INITIAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2860702298683110)
,p_event_id=>wwv_flow_imp.id(2860606235683109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2860883288683111)
,p_name=>'New_1'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_DISCOUNT_IN_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2860963796683112)
,p_event_id=>wwv_flow_imp.id(2860883288683111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2861048206683113)
,p_name=>'New_2'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_FINAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2861154255683114)
,p_event_id=>wwv_flow_imp.id(2861048206683113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_FINAL_AMOUNT'
,p_attribute_01=>'$(''#P37_USD_VALUE'').val( Number($(''#P37_FINAL_AMOUNT'').val() )+(Number($(''#P37_FINAL_AMOUNT'').val()) * (Number($( "#P37_VAT_VALUE" ).val()) /100)));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2861270427683115)
,p_name=>'New_3'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_VAT_VALUE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2861309065683116)
,p_event_id=>wwv_flow_imp.id(2861270427683115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_VAT_VALUE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2863751598683140)
,p_name=>'New_4'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1987116098255413)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2863824963683141)
,p_event_id=>wwv_flow_imp.id(2863751598683140)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(144496939050894235)
,p_name=>'BranchesValueChanged'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_LOGOS_BRANCHES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(144497017522894236)
,p_event_id=>wwv_flow_imp.id(144496939050894235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_VAT_VALUE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' if ($(''#P37_LOGOS_BRANCHES'').val() == 1){',
'   $(''#P37_VAT_VALUE'').val(11);',
'}',
'if ($(''#P37_LOGOS_BRANCHES'').val() == 2){',
'   $(''#P37_VAT_VALUE'').val(0);',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(290639593631323345)
,p_name=>'CREATE_ACTIVITI_INSTANCE'
,p_event_sequence=>130
,p_bind_type=>'one'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286095623771795735)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     const URL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances'';',
'',
'	   ',
'const data = {',
'   "processDefinitionId":$v("P37_ROLE"),',
'   "variables": [',
'       {"name":"AccountManager",',
'        "value":$v("P37_ACCOUNT_MANAGER")},{',
'        "name":"Client",',
'        "value":$("#P37_COMPANY_CODE").val()},{',
'          "name":"Product",',
'        "value":$("#P37_PRODUCT option:selected").text()},{',
'          "name":"IntegrationCode",',
'        "value":$v("P37_DSP_CODE")},{',
'          "name":"ContractType",',
'        "value":$("#P37_CONTRACT_TYPE_ID").val()},{',
'          "name":"WhoCreated",',
'        "value":$v("P37_WHO_CREATED")},{',
'          "name":"Description",',
'        "value":$v("P37_DESCRIPTION")},{',
'          "name":"ProjectName",',
'        "value":$v("P37_PROJECT_NAME")},{',
'          "name":"ParentContract",',
'        "value":$("#P37_PARENT_CONTRACT option:selected").text()},{',
'          "name":"InternalClassification",',
'        "value":$("#P37_INTERNAL_CLASSIFICATION").val()},{',
'          "name":"LogosBranches",',
'        "value":$v("P37_LOGOS_BRANCHES")},{',
'          "name":"InScope",',
'        "value":$v("P37_IN_SCOPE")},{',
'          "name":"DatesAndRates_DateRaised",',
'        "value":$v("P37_PRICING_DATE")},{',
'          "name":"DatesAndRates_ExpectedDeliveryDate",',
'        "value":$v("P37_EXPECTED_DELIVERY_DATE")},{',
'          "name":"DatesAndRates_Description",',
'        "value":$v("P37_REF_PM")},{',
'          "name":"DatesAndRates_ExpectedDeliveryNumberOfDays",',
'        "value":$v("P37_DELIVERY_NUMODDAYS")},{',
'          "name":"DatesAndRates_Reference",',
'        "value":$v("P37_REFERENCE")},{',
'          "name":"DatesAndRates_InHouseRate",',
'        "value":$v("P37_INHOUSE_RATE")},{',
'          "name":"DatesAndRates_OnSiteRate",',
'        "value":$v("P37_ONSITE_RATE")},{',
'          "name":"FinancialOffer_InHouseInvoicedDays",',
'        "value":$v("P37_IH_INVOICED_DAYS")},{',
'          "name":"FinancialOffer_InHouseInitialAmount",',
'        "value":$v("P37_IH_INITIAL_AMOUNT")}',
'      ',
'   ]',
'};',
'console.log(JSON.stringify(data));',
'    //console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {',
'       async: false,',
'      success: function (pData) {     ',
'		var obj = JSON.parse(pData);',
'		$s("P37_TASK_ID",obj.id);',
'		//alert(obj.id);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'',
'console.log(''Activiti Task ID'' + $v("P37_TASK_ID"));',
'',
'',
''))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286095870469795737)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P37_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"FinancialOffer_FinalAmount",',
'      "type":"long",',
'      "value":parseInt($v("P37_FINAL_AMOUNT"))',
'   },{',
'      "name":"FinancialOffer_VATValue",',
'      "type":"long",',
'      "value":parseInt($v("P37_VAT_VALUE"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatUSD",',
'      "type":"long",',
'      "value":parseInt($v("P37_USD_VALUE"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatLL",',
'      "type":"long",',
'      "value":parseInt($v("P37_LL_VALUE"))',
'   },{',
'      "name":"FinancialOffer_WarrantyMonth",',
'      "type":"long",',
'      "value":parseInt($v("P37_WARRANTY_IN_MONTH"))',
'   },{',
'      "name":"FinancialOffer_ValueInMaintenance",',
'      "type":"long",',
'      "value":parseInt($v("P37_VALUE_IN_MAINTENANCE"))',
'   },{',
'      "name":"FinancialOffer_OtherExpensesOnClient",',
'      "type":"long",',
'      "value":parseInt($v("P37_OTHER_EXPENSES_ON_CLIENT"))',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286095900086795738)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P37_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"usertask3_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask4_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask12_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"FinancialOffer_AtSiteInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($v("P37_AS_INVOICED_DAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P37_AS_INITIAL_AMOUNT"))',
'   },',
'   {',
'      "name":"FinancialOffer_AppLicense",',
'      "type":"long",',
'      "value":parseInt($v("P37_APPLICENSE"))',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         // alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286096025430795739)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P37_TASK_ID")+''/variables'';',
'	   var testData = [',
'       ',
'    {',
'      "name":"FinancialOffer_InitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P37_INITIAL_AMOUNT"))',
'   },',
'   {',
'      "name":"FinancialOffer_DiscountInDays",',
'      "type":"long",',
'      "value":parseInt($v("P37_DISCOUNT_IN_DAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_DiscountInAmount",',
'      "type":"long",',
'      "value":parseInt($v("P37_DISCOUNT_IN_AMOUNT"))',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286096159939795740)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P37_TASK_ID")+''/variables'';',
'	   var testData = [',
'     {',
'      "name":"FinancialOffer_PaymentTerm",',
'      "type":"string",',
'      "value":$v("P37_PAYMENT_TERM")',
'   },{',
'      "name":"FinancialOffer_Remarks",',
'      "type":"string",',
'      "value":$v("P37_REMARKS")',
'   },{',
'      "name":"FinancialOffer_LogosSignature",',
'      "type":"string",',
'      "value":$v("P37_SIGNED_BY")',
'   },{',
'      "name":"FinancialOffer_LogosSignatureDate",',
'      "type":"string",',
'      "value":$v("P37_SIGNATURE_DATE")',
'   },{',
'      "name":"FinancialOffer_ClientSignature",',
'      "type":"string",',
'      "value":$v("P37_CLIENT_SIGNATURE")',
'   },{',
'      "name":"FinancialOffer_ClientSignatureDate",',
'      "type":"string",',
'      "value":$v("P37_CLIENT_SIGNATURE_DATE")',
'   },',
'    {',
'      "name":"pipelineID",',
'      "type":"long",',
'      "value":parseInt($v("P37_ID"))',
'   },{',
'      "name":"FAIL_FLG",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"OfferStatus",',
'      "type":"string",',
'      "value":$v("P37_OFFER_STATUS")',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(300943188653094401)
,p_event_id=>wwv_flow_imp.id(290639593631323345)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(881206354940680746)
,p_name=>'SET_USER_ROLE'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_PRODUCT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(881206445645680747)
,p_event_id=>wwv_flow_imp.id(881206354940680746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'USER_ROLE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'cursor sel_role is ',
'select LISTAGG( pge_emp_title,'','') within group (order by 1)  from prj_group_employees pge, prj_groups pg',
'where pge.pge_employee = :APP_USER ',
'and pg.PGR_ID = pge.pge_pgr_id',
'and pg.pgr_code = :P37_PRODUCT;',
'begin ',
'',
'open sel_role;',
'    fetch sel_role into :USER_ROLE;',
'CLOSE SEL_ROLE;',
'',
'end ;'))
,p_attribute_07=>'P37_PRODUCT'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(929346979230608506)
,p_name=>'CREATE_CLICKED'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1818920783854652)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(929347071295608507)
,p_event_id=>wwv_flow_imp.id(929346979230608506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_HR.BILOG.MGORICKI.ADDSPINNER'
,p_attribute_01=>'.t-Region'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(929347109035608508)
,p_event_id=>wwv_flow_imp.id(929346979230608506)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CREATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1840485502854686)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P37_ID'
,p_attribute_04=>'ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51972448502930726)
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
'  arr2 := apex_util.string_to_table(:P37_RFP_FILES);',
'  for i in 1..arr2.count loop',
'    select blob_content into v_blob_data',
'from wwv_flow_files where UPPER(name )= UPPER(:P37_RESPONSE_TO_RFP_FILES);',
'  end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'1=0;'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1840869094854688)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get PK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P37_ID is null then',
'        select "#OWNER#"."LGS_CONTRACTS_SEQ".nextval',
'          into :P37_ID',
'          from sys.dual;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1818920783854652)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1841253985854688)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P37_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1841672316854688)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1819185867854652)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1987416681255416)
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
'     v := PROJECT_PCK.change_contact_approved_status(:P37_ID);',
'     ind := 1;',
'     ',
'         l_body := ''Contract Change Approved status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || :P37_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
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
'       WHERE UPPER(USER_NAME) = UPPER(:P37_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        ',
'        if :P37_CONTRACT_TYPE_ID <> 6 then',
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
 p_id=>wwv_flow_imp.id(1987521977255417)
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
'         v := PROJECT_PCK.change_contact_rejected_status(:P37_ID);',
'         i := 1;',
'          l_body := ''Contract Change Rejected status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf; Open C1(v);',
'          l_body := l_body || ''Contract Integration Code: '' || :P37_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
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
'      WHERE UPPER(USER_NAME) = UPPER(:P37_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        if :P37_CONTRACT_TYPE_ID <> 6 then',
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
 p_id=>wwv_flow_imp.id(90138226301650601)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UpdateRFPFileName'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RFP_FILES = :P37_RFP_FILES',
'    ',
'WHERE ID = :P37_ID;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(51972396802930725)
,p_process_when=>':P37_RFP_FILES IS NOT NULL'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90139022366650609)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RESPONSE_TO_RFP_FILES = :P37_RESPONSE_TO_RFP_FILES',
'    ',
'WHERE ID = :P37_ID;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(90138985765650608)
,p_process_when=>':P37_RESPONSE_TO_RFP_FILES is not null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27088015194379527)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_updateee'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'UPDATE_PIP_CONT',
'( :P37_ID  ,',
':P37_DSP_CODE	, ',
':P37_COMPANY_CODE	,',
' null,',
' null,',
':P37_USD_VALUE, ',
' null,',
':P37_CONTRACT_TYPE_ID,	',
' null,',
' null,',
' to_date(:P37_PRICING_DATE,''dd/MM/yyyy'')	,',
':P37_PERDIUM	,',
':P37_DAYS_PER_TICKET,',
':P37_TICKET_VALUE	,',
':P37_HOTEL_RATE	,',
':P37_CAR_RENTAL_PER_DAY	,',
':P37_INTERNATIONAL,',
':P37_WHO_CREATED,',
':P37_ACCOUNT_MANAGER		,',
' :P37_PARENT_CONTRACT	,',
':P37_PROJECT_NAME	,',
':P37_REF_PM	,',
' :P37_REF_INTERNAL ,',
':P37_INHOUSE_RATE	,',
':P37_ONSITE_RATE	,',
':P37_IN_SCOPE,',
':P37_INVOICED_DAYS	,',
':P37_INITIAL_AMOUNT	,',
':P37_DISCOUNT_IN_DAYS,',
':P37_DISCOUNT_IN_AMOUNT	,',
':P37_VAT_VALUE,',
':P37_FINAL_AMOUNT, ',
' to_date(:P37_EXPECTED_DELIVERY_DATE,''dd/MM/yyyy''),',
':P37_WARRANTY_IN_MONTH,',
':P37_VALUE_IN_MAINTENANCE	,',
' to_date(:P37_SIGNATURE_DATE,''dd/MM/yyyy''),',
' :P37_SIGNED_BY,	',
' :P37_PAYMENT_TERM,',
':P37_REMARKS	,',
'v(''P37_OTHER_EXPENSES_ON_CLIENT'')	,',
' null		,',
':P37_IH_INVOICED_DAYS	,',
':P37_AS_INVOICED_DAYS	,',
':P37_IH_INITIAL_AMOUNT,',
' :P37_AS_INITIAL_AMOUNT	,',
' :P37_INTERNAL_CLASSIFICATION,',
'to_date(:P37_APPROVAL_DATE,''dd/MM/yyyy''),',
':P37_LOGOS_BRANCHES	,',
':P37_RFPFILES	,',
':P37_RESPTORFP	,',
' :P37_DESCRIPTION , ',
':P37_REFERENCE ,',
':P37_CLIENT_SIGNATURE , 	',
'to_date(:P37_CLIENT_SIGNATURE_DATE,''dd/MM/yyyy''),',
':P37_DELIVERY_NUMODDAYS, ',
' :P37_LL_VALUE  ,null ,null);',
'---ACCEPTANCE_DATE	DATE,	DELIVERY_DATE	DATE )',
'',
'EXCEPTION ',
'   WHEN others THEN ',
'   null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1819008867854652)
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
