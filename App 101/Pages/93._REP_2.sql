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

prompt --application/pages/delete_00093
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>93);
end;
/
prompt --application/pages/page_00093
begin
wwv_flow_api.create_page(
 p_id=>93
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'REP 2'
,p_page_mode=>'NORMAL'
,p_step_title=>'REP 2'
,p_step_sub_title=>'REP 2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200713150925'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212981749274771465)
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
 p_id=>wwv_flow_api.id(212884878972946655)
,p_plug_name=>'Report'
,p_parent_plug_id=>wwv_flow_api.id(212981749274771465)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  --to_char(EXTRACT (MONTH FROM A.OPP_FORECAST_DATE),''mm/yyyy'') "Month",',
'        --to_char(EXTRACT (YEAR FROM A.OPP_FORECAST_DATE),''mm/yyyy'') "Year",',
'        A.OPP_ID ,',
'       --D.ORL_OPP_ID ,d.ORL_ROL_ID, ',
'       d.orl_employee,',
'       --d.orl_id,A.opp_id,b.EMP_CODE , b.EMP_NAME, c.ops_module module,',
'     SUM(E.current_price) Price',
'     ---,a.OPP_FORECAST_DATE ',
'FROM OPPORTUNITIES A,PRJ_EMPLOYEE_SALARY B,OPP_SCOPE C, OPP_ROLE D,PRJ_MODULES E',
'WHERE A.OPP_ID = C.OPS_OPP_ID ',
'AND   A.OPP_ID = D.ORL_OPP_ID',
'AND   b.EMP_CODE = D.ORL_EMPLOYEE',
'AND  E.CODE  = C.OPS_MODULE',
'AND  D.orl_rol_id = 1 ',
'and (UPPER(D.orl_employee) = UPPER(:P93_WHOCREATED)  or :P93_WHOCREATED is null)',
'AND (EXTRACT (MONTH FROM A.OPP_FORECAST_DATE) <= :P93_MONTH or :P93_MONTH is null)',
'AND (EXTRACT (YEAR FROM A.OPP_FORECAST_DATE) <=  :P93_YEAR or :P93_YEAR is null)',
'GROUP BY A.OPP_ID, d.orl_employee'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(212884944125946655)
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
,p_internal_uid=>212884944125946655
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110199452587479598)
,p_db_column_name=>'ORL_EMPLOYEE'
,p_display_order=>76
,p_column_identifier=>'AE'
,p_column_label=>'Orl employee'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110207476115479617)
,p_db_column_name=>'PRICE'
,p_display_order=>156
,p_column_identifier=>'AX'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102785959177291918)
,p_db_column_name=>'OPP_ID'
,p_display_order=>166
,p_column_identifier=>'BB'
,p_column_label=>'Opp id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(212997672460946132)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1102082'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OPP_ID:ORL_EMPLOYEE:PRICE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110197569782479575)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(212981749274771465)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102785616737291915)
,p_name=>'P93_YEAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(212981749274771465)
,p_prompt=>'Year'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110197912803479579)
,p_name=>'P93_WHOCREATED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(212981749274771465)
,p_prompt=>'Who created'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'36_ACCOUNT_MANAGER_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME,EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'where ACTIVE = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_new_grid=>true
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110198313015479581)
,p_name=>'P93_MONTH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(212981749274771465)
,p_prompt=>'Month'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
