set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.1.00.08'
,p_default_workspace_id=>1680420756714069
,p_default_application_id=>222
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:55 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00079
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>79);
end;
/
prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'Pipeline - Edit'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pipeline - Edit'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Pipeline - Edit'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function calculateAmounts(){',
'    ',
'$(''#P79_IH_INITIAL_AMOUNT'').val( $(''#P79_INHOUSE_RATE'').val() * $( "#P79_IH_INVOICED_DAYS" ).val());',
'',
'$(''#P79_AS_INITIAL_AMOUNT'').val( $(''#P79_ONSITE_RATE'').val() * $( "#P79_AS_INVOICED_DAYS" ).val());',
'$(''#P79_INITIAL_AMOUNT'').val( Number($(''#P79_IH_INITIAL_AMOUNT'').val() )+ Number($( "#P79_AS_INITIAL_AMOUNT" ).val())+ Number($( "#P79_ORACLELICENSE" ).val())+ Number($( "#P79_APPLICENSE" ).val()));',
'$(''#P79_FINAL_AMOUNT'').val( Number($(''#P79_INITIAL_AMOUNT'').val() ) - Number($( "#P79_DISCOUNT_IN_AMOUNT" ).val()));',
'$(''#P79_USD_VALUE'').val( Number($(''#P79_FINAL_AMOUNT'').val() )+(Number($(''#P79_FINAL_AMOUNT'').val()) * (Number($( "#P79_VAT_VALUE" ).val()) /100)));',
'    ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180201124634'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(219113695813930967)
,p_plug_name=>'Financial Offer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148708275315243384)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220156677345759433)
,p_plug_name=>'General Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220156775756759434)
,p_plug_name=>'Dates and Rates'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(269267194903007038)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid=>true
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(149001088635435878)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(269267194903007038)
,p_button_name=>'Upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Upload RFP FILE'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(149001462173435879)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(269267194903007038)
,p_button_name=>'upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Upload Response File'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148989233205435859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'RejectContract'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_image_alt=>'Reject Contract'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>':P79_ID IS NOT NULL AND :P79_OFFER_STATUS = 1'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148989613373435859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'ApproveContract'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_image_alt=>'Approve Contract'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>':P79_ID IS NOT NULL AND :P79_OFFER_STATUS = 1'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148990005350435860)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'Modules'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_image_alt=>'Modules'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID:&P79_ID.'
,p_button_condition=>':P79_ID is not null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148990421790435860)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148990879404435861)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>':P79_ID IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148991255310435861)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P79_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(148991692953435861)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(220156677345759433)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742723647243655)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P79_ID IS NOT NULL AND :P79_OFFER_STATUS = 1'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(149022250603435900)
,p_branch_name=>'To Page 41'
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_PIPELINE_ID:&P79_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(148991255310435861)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(149021873519435899)
,p_branch_name=>'Go To Page 36'
,p_branch_action=>'f?p=&APP_ID.:36:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>'1=0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148972956936435838)
,p_name=>'P79_REF_TO_CONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148973319638435838)
,p_name=>'P79_USAGE_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source=>'USAGE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148973743519435839)
,p_name=>'P79_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148974161490435839)
,p_name=>'P79_IH_INVOICED_DAYS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House Invoiced Days'
,p_source=>'IH_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148974552216435839)
,p_name=>'P79_IH_INITIAL_AMOUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148974939176435839)
,p_name=>'P79_INVOICED_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Invoiced Days'
,p_source=>'INVOICED_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148975335845435840)
,p_name=>'P79_AS_INVOICED_DAYS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INVOICED DAYS'
,p_source=>'AS_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148975731400435840)
,p_name=>'P79_AS_INITIAL_AMOUNT'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148976117059435840)
,p_name=>'P79_ORACLELICENSE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oracle License'
,p_source=>'ORACLE_LICENSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148976582546435841)
,p_name=>'P79_APPLICENSE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'App License'
,p_source=>'APP_LICENSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148976981105435841)
,p_name=>'P79_INITIAL_AMOUNT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Initial Amount'
,p_source=>'INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148977388611435841)
,p_name=>'P79_DISCOUNT_IN_DAYS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Days'
,p_source=>'DISCOUNT_IN_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148977797159435842)
,p_name=>'P79_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148978150676435842)
,p_name=>'P79_FINAL_AMOUNT'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Final Amount'
,p_source=>'FINAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148978526794435842)
,p_name=>'P79_VAT_VALUE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_item_default=>'11'
,p_prompt=>'Vat Value'
,p_source=>'VAT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148978955511435842)
,p_name=>'P79_USD_VALUE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148979325347435843)
,p_name=>'P79_LL_VALUE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (L.L)'
,p_source=>'LL_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148979793280435843)
,p_name=>'P79_WARRANTY_IN_MONTH'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warranty In Month'
,p_source=>'WARRANTY_IN_MONTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148980102946435843)
,p_name=>'P79_VALUE_IN_MAINTENANCE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Value In Maintenance'
,p_source=>'VALUE_IN_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148980516424435844)
,p_name=>'P79_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Expenses On Client'
,p_source=>'OTHER_EXPENSES_ON_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148980914179435844)
,p_name=>'P79_PERDIUM'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Perdium'
,p_source=>'PERDIUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148981348686435844)
,p_name=>'P79_TICKET_VALUE'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ticket Value'
,p_source=>'TICKET_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148981700276435844)
,p_name=>'P79_HOTEL_RATE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hotel Rate'
,p_source=>'HOTEL_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148982137160435845)
,p_name=>'P79_CAR_RENTAL_PER_DAY'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Car Rental Per Day'
,p_source=>'CAR_RENTAL_PER_DAY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148982503088435845)
,p_name=>'P79_INTERNATIONAL'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'International'
,p_source=>'INTERNATIONAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148982995801435845)
,p_name=>'P79_DAYS_PER_TICKET'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Days Per Ticket'
,p_source=>'DAYS_PER_TICKET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148983374898435845)
,p_name=>'P79_PAYMENT_TERM'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148983743101435846)
,p_name=>'P79_REMARKS'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148984141966435846)
,p_name=>'P79_SIGNED_BY'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature'
,p_source=>'SIGNED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>1000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148984544733435846)
,p_name=>'P79_SIGNATURE_DATE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148984912184435846)
,p_name=>'P79_CLIENT_SIGNATURE'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature'
,p_source=>'CLIENT_SIGNATURE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148985326036435847)
,p_name=>'P79_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148985751627435847)
,p_name=>'P79_SETTLED'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'SETTLED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148986120804435854)
,p_name=>'P79_START_DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148986585100435854)
,p_name=>'P79_STATUS'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148986941704435855)
,p_name=>'P79_END_DATE'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148987378261435856)
,p_name=>'P79_FINALIZED'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'FINALIZED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148987701986435856)
,p_name=>'P79_CONTRACT_STAGE_ID'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'CONTRACT_STAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148988133724435857)
,p_name=>'P79_DISPLAY_IN_CONTRACTS'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'DISPLAY_IN_CONTRACTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148988597118435857)
,p_name=>'P79_REF_TO_PIPELINE'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(219113695813930967)
,p_use_cache_before_default=>'NO'
,p_source=>'REF_TO_PIPELINE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148992094071435862)
,p_name=>'P79_ACCOUNT_MANAGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148992414296435863)
,p_name=>'P79_DSP_CODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148992859961435864)
,p_name=>'P79_COMPANY_CODE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742599916243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148993263159435864)
,p_name=>'P79_CONTRACT_TYPE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148993698558435865)
,p_name=>'P79_REF_INTERNAL'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Reference'
,p_source=>'REF_INTERNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742599916243641)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148994024723435865)
,p_name=>'P79_PROJECT_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project Name'
,p_source=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148994451489435866)
,p_name=>'P79_DESCRIPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148994850600435866)
,p_name=>'P79_PARENT_CONTRACT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where COMPANY_CODE = :P79_COMPANY_CODE',
'and usage_type = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P79_COMPANY_CODE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148995224918435868)
,p_name=>'P79_WHO_CREATED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_item_default=>'V(''APP_USER'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Initiator'
,p_source=>'WHO_CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>75
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148995621848435868)
,p_name=>'P79_OFFER_STATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148996059636435869)
,p_name=>'P79_INTERNAL_CLASSIFICATION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148996447573435869)
,p_name=>'P79_LOGOS_BRANCHES'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
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
,p_field_template=>wwv_flow_api.id(148742599916243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148996888916435870)
,p_name=>'P79_APPROVAL_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Approval date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'APPROVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148997271726435871)
,p_name=>'P79_IN_SCOPE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(220156677345759433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Within Scope'
,p_source=>'IN_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_INSCOPE_LOV'
,p_lov=>'.'||wwv_flow_api.id(148754386301244016)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148997996404435872)
,p_name=>'P79_PRICING_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Raised'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148998342277435873)
,p_name=>'P79_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148998734945435873)
,p_name=>'P79_REF_PM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148999107150435874)
,p_name=>'P79_DELIVERY_NUMODDAYS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected delivery <br>Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148999533942435875)
,p_name=>'P79_REFERENCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148999982661435875)
,p_name=>'P79_INHOUSE_RATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149000305561435876)
,p_name=>'P79_ONSITE_RATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(220156775756759434)
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
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149001865532435879)
,p_name=>'P79_RFP_FILES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(269267194903007038)
,p_prompt=>'RFP FILES'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149002216969435880)
,p_name=>'P79_RFPFILES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(269267194903007038)
,p_use_cache_before_default=>'NO'
,p_source=>'RFP_FILES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149002659747435880)
,p_name=>'P79_RESPONSE_TO_RFP_FILES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(269267194903007038)
,p_prompt=>'RESPONSE TO RFP FILES'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149003054017435881)
,p_name=>'P79_RESPTORFP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(269267194903007038)
,p_use_cache_before_default=>'NO'
,p_source=>'RESPONSE_TO_RFP_FILES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(149003547006435882)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (to_date(:P79_EXPECTED_DELIVERY_DATE) >= to_char(:P79_PRICING_DATE)) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR ; INVALID DATE'
,p_always_execute=>'N'
,p_validation_condition=>'1=0'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(148998342277435873)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(149003941395435882)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF ( to_date(:P79_SIGNATURE_DATE) >= to_date(:P79_PRICING_DATE)  AND  to_date(:P79_SIGNATURE_DATE) <= to_date(:P79_EXPECTED_DELIVERY_DATE )) THEN',
'RETURN  TRUE;',
'ELSE RETURN FALSE;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'INVALID DATE;MUST BE A VALID DATE BETWEEN RAISED AND EXPECTED DELIVERY DATE.'
,p_always_execute=>'N'
,p_validation_condition=>'1=0;'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(148984544733435846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(149004304214435882)
,p_validation_name=>'New_2'
,p_validation_sequence=>30
,p_validation=>'P79_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Approval Date should not be null'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1987116098255413)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(149004737492435883)
,p_validation_name=>'APPROVAL DATE VAL'
,p_validation_sequence=>30
,p_validation=>'P79_APPROVAL_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'APPROVAL_DATE MUST NOT BE NULL'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1987116098255413)
,p_associated_item=>wwv_flow_api.id(148996888916435870)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149009069474435887)
,p_name=>'ChangeIHDays'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_IH_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149009505733435888)
,p_event_id=>wwv_flow_api.id(149009069474435887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149009946026435888)
,p_name=>'ChangeOSDays'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_AS_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149010474905435888)
,p_event_id=>wwv_flow_api.id(149009946026435888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149010839669435889)
,p_name=>'ChangeIHRate'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_INHOUSE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149011360848435890)
,p_event_id=>wwv_flow_api.id(149010839669435889)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149011763132435891)
,p_name=>'ChangeONRate'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_ONSITE_RATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149012261419435891)
,p_event_id=>wwv_flow_api.id(149011763132435891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149012679500435891)
,p_name=>'ChangeInternalRef'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_REF_INTERNAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149013145411435892)
,p_event_id=>wwv_flow_api.id(149012679500435891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P79_DSP_CODE").val($("#P79_REF_INTERNAL").val());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149013505889435892)
,p_name=>'ValueChanged'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_PARENT_CONTRACT'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149014029930435892)
,p_event_id=>wwv_flow_api.id(149013505889435892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P79_PARENT_CONTRACT'
,p_attribute_03=>'P79_PARENT_CONTRACT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149014551933435893)
,p_event_id=>wwv_flow_api.id(149013505889435892)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select INHOUSE_RATE,ONSITE_RATE',
'into :P79_INHOUSE_RATE,:P79_ONSITE_RATE',
'FROM LGS_CONTRACTS',
'WHERE ID= :P79_PARENT_CONTRACT;',
'',
'',
'end;'))
,p_attribute_02=>'P79_INHOUSE_RATE,P79_ONSITE_RATE'
,p_attribute_03=>'P79_INHOUSE_RATE,P79_ONSITE_RATE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149015093066435893)
,p_event_id=>wwv_flow_api.id(149013505889435892)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(219113695813930967)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149015448156435893)
,p_name=>'New'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_INITIAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149015956627435894)
,p_event_id=>wwv_flow_api.id(149015448156435893)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149016384971435894)
,p_name=>'New_1'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_DISCOUNT_IN_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149016839888435894)
,p_event_id=>wwv_flow_api.id(149016384971435894)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149017262338435895)
,p_name=>'New_2'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_FINAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149017753667435895)
,p_event_id=>wwv_flow_api.id(149017262338435895)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P79_FINAL_AMOUNT'
,p_attribute_01=>'$(''#P79_USD_VALUE'').val( Number($(''#P79_FINAL_AMOUNT'').val() )+(Number($(''#P79_FINAL_AMOUNT'').val()) * (Number($( "#P79_VAT_VALUE" ).val()) /100)));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149018198532435896)
,p_name=>'New_3'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_VAT_VALUE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149018646647435896)
,p_event_id=>wwv_flow_api.id(149018198532435896)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P79_VAT_VALUE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149019025046435897)
,p_name=>'New_4'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(68339493942640572)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149019593431435897)
,p_event_id=>wwv_flow_api.id(149019025046435897)
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
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149020835968435898)
,p_name=>'AL-CHANGE'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_APPLICENSE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149021307008435899)
,p_event_id=>wwv_flow_api.id(149020835968435898)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149019913115435897)
,p_name=>'OL-CHANGE'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_ORACLELICENSE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149020463237435898)
,p_event_id=>wwv_flow_api.id(149019913115435897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149005027239435883)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P79_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149007825000435886)
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
'  arr2 := apex_util.string_to_table(:P79_RFP_FILES);',
'  for i in 1..arr2.count loop',
'    select blob_content into v_blob_data',
'from wwv_flow_files where UPPER(name )= UPPER(:P79_RESPONSE_TO_RFP_FILES);',
'  end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'1=0;'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149005434801435884)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get PK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P79_ID is null then',
'        select "#OWNER#"."LGS_CONTRACTS_SEQ".nextval',
'          into :P79_ID',
'          from sys.dual;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(148991255310435861)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149005810967435884)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P79_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149006283616435884)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(148991692953435861)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149006686294435885)
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
'     v := PROJECT_PCK.change_contact_approved_status(:P79_ID);',
'     ind := 1;',
'     ',
'         l_body := ''Contract Change Approved status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || :P79_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
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
'       WHERE UPPER(USER_NAME) = UPPER(:P79_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        ',
'        if :P79_CONTRACT_TYPE_ID <> 6 then',
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
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68339493942640572)
,p_process_success_message=>'Once approved, you cannot revert nor edit, make sure all entried are correct'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149007064071435885)
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
'         v := PROJECT_PCK.change_contact_rejected_status(:P79_ID);',
'         i := 1;',
'          l_body := ''Contract Change Rejected status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf; Open C1(v);',
'          l_body := l_body || ''Contract Integration Code: '' || :P79_DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
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
'      WHERE UPPER(USER_NAME) = UPPER(:P79_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'        if :P79_CONTRACT_TYPE_ID <> 6 then',
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
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1987206013255414)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149008209073435886)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UpdateRFPFileName'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RFP_FILES = :P79_RFP_FILES',
'    ',
'WHERE ID = :P79_ID;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(149001088635435878)
,p_process_when=>':P79_RFP_FILES IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149008608529435887)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update lgs_contracts',
'set RESPONSE_TO_RFP_FILES = :P79_RESPONSE_TO_RFP_FILES',
'    ',
'WHERE ID = :P79_ID;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(149001462173435879)
,p_process_when=>':P79_RESPONSE_TO_RFP_FILES is not null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149007460819435886)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_updateee'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'UPDATE_PIP_CONT',
'( :P79_ID  ,--3086',
':P79_DSP_CODE	, --20170505_CDS_NR_TRN_00',
':P79_COMPANY_CODE	,--12843',
' null,',
' null,',
':P79_USD_VALUE, --1265',
' null,',
':P79_CONTRACT_TYPE_ID,	--1',
' null,',
' null,',
' to_date(:P79_PRICING_DATE,''dd/MM/yyyy'')	,--03/08/2017	',
':P79_PERDIUM	,',
':P79_DAYS_PER_TICKET,',
':P79_TICKET_VALUE	,',
':P79_HOTEL_RATE	,',
':P79_CAR_RENTAL_PER_DAY	,',
':P79_INTERNATIONAL,',
':P79_WHO_CREATED,--TARIF',
':P79_ACCOUNT_MANAGER		,--TARIF',
' :P79_PARENT_CONTRACT	,',
':P79_PROJECT_NAME	, --final test	',
':P79_REF_PM	, --g fevjveh	',
' :P79_REF_INTERNAL ,--20170505_CDS_NR_TRN_00',
':P79_INHOUSE_RATE	,',
':P79_ONSITE_RATE	,--575.00	',
':P79_IN_SCOPE,',
':P79_INVOICED_DAYS	,',
'to_number(:P79_INITIAL_AMOUNT)	,--1,150.00',
':P79_DISCOUNT_IN_DAYS,',
':P79_DISCOUNT_IN_AMOUNT	,',
':P79_VAT_VALUE,--10',
':P79_FINAL_AMOUNT, --1150',
' to_date(:P79_EXPECTED_DELIVERY_DATE,''dd/MM/yyyy''),',
':P79_WARRANTY_IN_MONTH,',
':P79_VALUE_IN_MAINTENANCE	,',
' to_date(:P79_SIGNATURE_DATE,''dd/MM/yyyy''),',
' :P79_SIGNED_BY,	',
' :P79_PAYMENT_TERM,',
':P79_REMARKS	,--ybilon bdddd e e e	',
'v(''P79_OTHER_EXPENSES_ON_CLIENT'')	,',
' null		,',
':P79_IH_INVOICED_DAYS	,',
':P79_AS_INVOICED_DAYS	, --2',
':P79_IH_INITIAL_AMOUNT,',
' :P79_AS_INITIAL_AMOUNT	,',
' :P79_INTERNAL_CLASSIFICATION,',
'to_date(:P79_APPROVAL_DATE,''dd/MM/yyyy''),',
':P79_LOGOS_BRANCHES	,',
':P79_RFPFILES	,',
':P79_RESPTORFP	,',
' :P79_DESCRIPTION , --bujhnwh,bcfe,w	',
':P79_REFERENCE ,',
':P79_CLIENT_SIGNATURE , 	',
'to_date(:P79_CLIENT_SIGNATURE_DATE,''dd/MM/yyyy''),',
':P79_DELIVERY_NUMODDAYS, ',
' :P79_LL_VALUE  ,',
' null ,',
' null,',
':P79_APPLICENSE,',
' :P79_ORACLELICENSE);',
'---ACCEPTANCE_DATE	DATE,	DELIVERY_DATE	DATE )',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(148990879404435861)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
