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
--     PAGE: 31
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00031
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>31);
end;
/
prompt --application/pages/page_00031
begin
wwv_flow_imp_page.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Manage Project Coordinators'
,p_step_title=>'Manage Project Coordinators'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'01'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20141008111603'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3539117673388655)
,p_name=>'Manage Project Coordinators'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>15
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_TABFORM'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'"ID",',
'"ID" ID_DISPLAY,',
'"EMP_CODE",',
'"CONTRACT_ID",',
'"ACTIVE"',
'from "#OWNER#"."PRJ_USER_CONTRACTS"',
''))
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3541517765388681)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'Select Row'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3539403394388660)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'Id'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_USER_CONTRACTS'
,p_ref_column_name=>'ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3539531668388662)
,p_query_column_id=>3
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>3
,p_column_heading=>'Id'
,p_disable_sort_column=>'N'
,p_column_width=>16
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_USER_CONTRACTS'
,p_ref_column_name=>'ID_DISPLAY'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3539606210388662)
,p_query_column_id=>4
,p_column_alias=>'EMP_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Emp Code'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_USER_CONTRACTS'
,p_ref_column_name=>'EMP_CODE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3539718986388662)
,p_query_column_id=>5
,p_column_alias=>'CONTRACT_ID'
,p_column_display_sequence=>5
,p_column_heading=>'Contract Id'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_USER_CONTRACTS'
,p_ref_column_name=>'CONTRACT_ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3539804713388662)
,p_query_column_id=>6
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>6
,p_column_heading=>'Active'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>12
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_USER_CONTRACTS'
,p_ref_column_name=>'ACTIVE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3540213127388671)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(3539117673388655)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:apex.widget.tabular.addRow();'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3540004810388670)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(3539117673388655)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_position=>'CHANGE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3539932585388670)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3539117673388655)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3540108118388670)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3539117673388655)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3541612480388681)
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(3541021629388677)
,p_tabular_form_region_id=>wwv_flow_imp.id(3539117673388655)
,p_validation_name=>'CONTRACT_ID must be numeric'
,p_validation_sequence=>40
,p_validation=>'CONTRACT_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_when_button_pressed=>wwv_flow_imp.id(3540004810388670)
,p_associated_column=>'CONTRACT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3541107747388678)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(3539117673388655)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'PRJ_USER_CONTRACTS'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3540004810388670)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3541332154388680)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(3539117673388655)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'PRJ_USER_CONTRACTS'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
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
