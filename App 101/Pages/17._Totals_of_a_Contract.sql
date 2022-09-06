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
--     PAGE: 17
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00017
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>17);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_imp_page.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Totals of a Contract'
,p_step_title=>'Totals of a Contract'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'03'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20121016092217'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1670010423315334)
,p_name=>'Report 1'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID", ',
'"DSP_CODE",',
'"COMPANY_CODE",',
'"FINALIZED",',
'project_pck.get_contract_desc (id) Contract_desc,',
'project_pck.get_task_contract_enrollment (id,''0'',''d'') Enr,',
'project_pck.get_contract_estimate(id) Est,',
'project_pck.get_contract_estimate(id) - project_pck.get_task_contract_enrollment (id,''0'',''d'') Net,',
'project_pck.get_contract_enrollment(id) EnrUnits,',
'project_pck.get_contract_estimate(id) EstUnits,',
'project_pck.get_contract_estimate(id) - project_pck.get_contract_enrollment(id) NetUnits',
'from "#OWNER#"."LGS_CONTRACTS" ',
'WHERE project_pck.get_if_contract_disp (id, ''&USER.'') = 1',
'and   id = :P17_SELECTED_CONTRACT_ID'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670306613315346)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670425708315350)
,p_query_column_id=>2
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'DSP_CODE'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670524668315350)
,p_query_column_id=>3
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'COMPANY_CODE'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670603124315350)
,p_query_column_id=>4
,p_column_alias=>'FINALIZED'
,p_column_display_sequence=>4
,p_column_heading=>'FINALIZED'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670709281315350)
,p_query_column_id=>5
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>5
,p_column_heading=>'Customer'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670815616315350)
,p_query_column_id=>6
,p_column_alias=>'ENR'
,p_column_display_sequence=>7
,p_column_heading=>'Enr.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1670900301315350)
,p_query_column_id=>7
,p_column_alias=>'EST'
,p_column_display_sequence=>6
,p_column_heading=>'Est'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1671032365315350)
,p_query_column_id=>8
,p_column_alias=>'NET'
,p_column_display_sequence=>8
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00MI'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1671118287315350)
,p_query_column_id=>9
,p_column_alias=>'ENRUNITS'
,p_column_display_sequence=>10
,p_column_heading=>'Units Enrl.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1671206400315350)
,p_query_column_id=>10
,p_column_alias=>'ESTUNITS'
,p_column_display_sequence=>9
,p_column_heading=>'Units Est'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1672524525401670)
,p_query_column_id=>11
,p_column_alias=>'NETUNITS'
,p_column_display_sequence=>11
,p_column_heading=>'Net Units'
,p_use_as_row_header=>'N'
,p_column_format=>'S999G999G999G999G990D00'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1672226294354906)
,p_name=>'P17_SELECTED_CONTRACT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1670010423315334)
,p_prompt=>'Selected Contract Id'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
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
