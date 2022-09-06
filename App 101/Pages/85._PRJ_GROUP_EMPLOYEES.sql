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
--     PAGE: 85
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00085
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>85);
end;
/
prompt --application/pages/page_00085
begin
wwv_flow_imp_page.create_page(
 p_id=>85
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'PRJ_GROUP_EMPLOYEES'
,p_step_title=>'PRJ_GROUP_EMPLOYEES'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20220903141650'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(58520942171201923)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    prj_groups.pgr_id,',
'    prj_groups.pgr_code,',
'    prj_group_employees.pge_id,',
'    prj_employee_salary.emp_code,',
'    prj_employee_salary.emp_name,',
'    prj_employee_salary.emp_title,',
'    roles.rol_desc',
'FROM',
'    prj_groups,',
'    prj_group_employees,',
'    prj_employee_salary,',
'    roles',
'WHERE',
'        prj_groups.pgr_id = prj_group_employees.pge_pgr_id',
'    AND prj_employee_salary.emp_code = prj_group_employees.pge_employee',
'    AND prj_group_employees.pge_pgr_id = prj_groups.pgr_id',
'    AND prj_group_employees.pge_employee = prj_employee_salary.emp_code',
'    AND prj_group_employees.pge_emp_title = roles.rol_desc',
'ORDER BY',
'    2,',
'    5',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(58521287107201923)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:88:&APP_SESSION.::::P88_PGE_ID:#PGE_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>58521287107201923
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(58521393248201929)
,p_db_column_name=>'PGE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Pge Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5421425225386049)
,p_db_column_name=>'PGR_ID'
,p_display_order=>11
,p_column_identifier=>'D'
,p_column_label=>'Pgr Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5421588559386050)
,p_db_column_name=>'PGR_CODE'
,p_display_order=>21
,p_column_identifier=>'E'
,p_column_label=>'Pgr Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6414242244920301)
,p_db_column_name=>'EMP_CODE'
,p_display_order=>31
,p_column_identifier=>'F'
,p_column_label=>'Emp Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6414386958920302)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>41
,p_column_identifier=>'G'
,p_column_label=>'Emp Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6414474376920303)
,p_db_column_name=>'EMP_TITLE'
,p_display_order=>51
,p_column_identifier=>'H'
,p_column_label=>'Emp Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6414512447920304)
,p_db_column_name=>'ROL_DESC'
,p_display_order=>61
,p_column_identifier=>'I'
,p_column_label=>'Rol Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(58536687663401466)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'585367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PGR_CODE:EMP_CODE:EMP_NAME:ROL_DESC:'
,p_break_on=>'PGR_CODE:0:0:0:0:0'
,p_break_enabled_on=>'PGR_CODE:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58522521532201933)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(58520942171201923)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:88'
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
