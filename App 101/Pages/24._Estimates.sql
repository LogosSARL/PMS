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
--   Date and Time:   09:32 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00024
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>24);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Estimates'
,p_page_mode=>'NORMAL'
,p_step_title=>'Estimates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Estimates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20120727202459'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13048167564082873)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
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
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(13048265292082873)
,p_name=>'Report 1'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_owner=>'ADMIN'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048462307082975)
,p_db_column_name=>'CONTRACT'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Contract'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CONTRACT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048566538082996)
,p_db_column_name=>'PROJECT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'PROJECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048683885082997)
,p_db_column_name=>'MODULE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Module'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MODULE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048758979082997)
,p_db_column_name=>'WORK_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Work Type'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'WORK_TYPE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048867058082997)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Estimated'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ESTIMATED'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13048983596082997)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Enrollment'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ENROLLMENT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13049070103082997)
,p_db_column_name=>'NET'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Net'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NET'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13049984300153382)
,p_db_column_name=>'SCALE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Scale'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCALE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13050083354153382)
,p_db_column_name=>'EST'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Est'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'EST'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13049170569083244)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'40651'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CONTRACT:PROJECT:MODULE:WORK_TYPE:ESTIMATED:ENROLLMENT:NET'
,p_flashback_enabled=>'N'
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
