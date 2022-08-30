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
,p_default_application_id=>101
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 101 - Projects
--
-- Application Export:
--   Application:     101
--   Name:            Projects
--   Date and Time:   09:34 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00096
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>96);
end;
/
prompt --application/pages/page_00096
begin
wwv_flow_api.create_page(
 p_id=>96
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'rep4'
,p_page_mode=>'NORMAL'
,p_step_title=>'rep4'
,p_step_sub_title=>'rep4'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20171114105510'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(323686510857377803)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(323589640555552993)
,p_plug_name=>'Report'
,p_parent_plug_id=>wwv_flow_api.id(323686510857377803)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   SUM(nvl(E.current_price,0)) Price, EXTRACT (MONTH FROM A.OPP_FORECAST_DATE) "Month",',
'        A.OPP_CONTRACT_TYPE ContractType',
'FROM OPPORTUNITIES A,PRJ_EMPLOYEE_SALARY B,OPP_SCOPE C, OPP_ROLE D,PRJ_MODULES E',
'WHERE A.OPP_ID = C.OPS_OPP_ID ',
'AND   A.OPP_ID = D.ORL_OPP_ID',
'AND   b.EMP_CODE = D.ORL_EMPLOYEE',
'AND  E.CODE  = C.OPS_MODULE',
'AND  D.orl_rol_id = 1 ',
'--AND ( EXTRACT (MONTH FROM A.OPP_FORECAST_DATE) =  :P94_MONTH or :P94_MONTH is null)',
'GROUP BY  EXTRACT (MONTH FROM A.OPP_FORECAST_DATE), A.OPP_CONTRACT_TYPE '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(323589705708552993)
,p_name=>'Report'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SERINE'
,p_internal_uid=>323589705708552993
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110460310634185547)
,p_db_column_name=>'PRICE'
,p_display_order=>156
,p_column_identifier=>'AX'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110459532587185544)
,p_db_column_name=>'Month'
,p_display_order=>166
,p_column_identifier=>'AZ'
,p_column_label=>'Month'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(110429430893843991)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102786466093291923)
,p_db_column_name=>'CONTRACTTYPE'
,p_display_order=>176
,p_column_identifier=>'BA'
,p_column_label=>'Contracttype'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(183453440086042798)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(323702434043552470)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1104607'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OPP_STAGE_OPP_CRY:OPP_BUDGET_OPP_BUDGET_SOURCE:CURRENT_AAA:PRICE:CONTRACTTYPE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110458543890185520)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(323686510857377803)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110458974840185522)
,p_name=>'P96_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(323686510857377803)
,p_prompt=>'Month'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MONTH_LOV'
,p_lov=>'.'||wwv_flow_api.id(110429430893843991)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
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
