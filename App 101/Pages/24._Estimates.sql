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
--     PAGE: 24
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00024
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>24);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_imp_page.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Estimates'
,p_step_title=>'Estimates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20120727202459'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13048167564082873)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project_pck.get_contract_desc(c.id) Contract, project_pck.get_project_desc(p.id) Project,m.e_name module, wt.e_name Work_type,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Net,',
'pd.scale , nvl(no_of_days,0)+nvl(on_site_days,0) Est',
'from prj_projectwork_types ppt, prj_work_types wt, prj_modules m, lgs_projects p, lgs_contracts c, prj_estimated_dets pd',
'where  ppt.wrktyp_id  =wt.id',
'and  m.code   = project_pck.get_project_module(ppt.proj_id)',
'and      ppt.proj_id = p.id',
'and      p.contract_id = c.id',
'and      pd.PROJECT_WORKTYPE_ID = ppt.id',
'group by project_pck.get_contract_desc(c.id), project_pck.get_project_desc(p.id) ,m.e_name, wt.e_name, pd.scale , nvl(no_of_days,0)+nvl(on_site_days,0)',
'having sum(project_pck.get_project_work_estimate_num(ppt.id)) +',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) <> 0',
'and',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) >0'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(13048265292082873)
,p_name=>'Report 1'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>1
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048462307082975)
,p_db_column_name=>'CONTRACT'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Contract'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CONTRACT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048566538082996)
,p_db_column_name=>'PROJECT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'PROJECT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048683885082997)
,p_db_column_name=>'MODULE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Module'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MODULE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048758979082997)
,p_db_column_name=>'WORK_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Work Type'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'WORK_TYPE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048867058082997)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Estimated'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ESTIMATED'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13048983596082997)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Enrollment'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ENROLLMENT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13049070103082997)
,p_db_column_name=>'NET'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Net'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NET'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13049984300153382)
,p_db_column_name=>'SCALE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Scale'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCALE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13050083354153382)
,p_db_column_name=>'EST'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Est'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'EST'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13049170569083244)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'40651'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CONTRACT:PROJECT:MODULE:WORK_TYPE:ESTIMATED:ENROLLMENT:NET'
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
