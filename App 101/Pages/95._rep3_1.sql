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
--     PAGE: 95
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00095
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>95);
end;
/
prompt --application/pages/page_00095
begin
wwv_flow_imp_page.create_page(
 p_id=>95
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'rep3'
,p_step_title=>'rep3'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20171114105630'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(213228687384192285)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(213131817082367475)
,p_plug_name=>'Report'
,p_parent_plug_id=>wwv_flow_imp.id(213228687384192285)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   SUM(nvl(E.current_price,0)) Price, EXTRACT (MONTH FROM A.OPP_FORECAST_DATE) "Month",',
'          c.ops_module module ',
'FROM OPPORTUNITIES A,PRJ_EMPLOYEE_SALARY B,OPP_SCOPE C, OPP_ROLE D,PRJ_MODULES E',
'WHERE A.OPP_ID = C.OPS_OPP_ID ',
'AND   A.OPP_ID = D.ORL_OPP_ID',
'AND   b.EMP_CODE = D.ORL_EMPLOYEE',
'AND  E.CODE  = C.OPS_MODULE',
'AND  D.orl_rol_id = 1 ',
'AND ( EXTRACT (MONTH FROM A.OPP_FORECAST_DATE) =  :P94_MONTH or :P94_MONTH is null)',
'GROUP BY  EXTRACT (MONTH FROM A.OPP_FORECAST_DATE), c.ops_module '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(213131882235367475)
,p_name=>'Report'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SERINE'
,p_internal_uid=>213131882235367475
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(110447472616900446)
,p_db_column_name=>'MODULE'
,p_display_order=>146
,p_column_identifier=>'AW'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(110447877987900447)
,p_db_column_name=>'PRICE'
,p_display_order=>156
,p_column_identifier=>'AX'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102786301459291922)
,p_db_column_name=>'Month'
,p_display_order=>166
,p_column_identifier=>'AZ'
,p_column_label=>'Month'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(110429430893843991)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(213244610570366952)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1104482'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OPP_STAGE_OPP_CRY:OPP_BUDGET_OPP_BUDGET_SOURCE:CURRENT_AAA:MODULE:PRICE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(110444441453900421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(213228687384192285)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(110445251929900432)
,p_name=>'P95_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(213228687384192285)
,p_prompt=>'Month'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MONTH_LOV'
,p_lov=>'.'||wwv_flow_imp.id(110429430893843991)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
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
