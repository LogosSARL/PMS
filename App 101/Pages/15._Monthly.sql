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
--   Date and Time:   09:31 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00015
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>15);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Monthly'
,p_page_mode=>'NORMAL'
,p_step_title=>'Monthly'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Monthly'
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
,p_last_upd_yyyymmddhh24miss=>'20170614130315'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15775302955282749)
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
'select ',
'      distinct to_char(FROM_DATE,''YYYY'') Yr, to_char(from_date,''MM-YYYY'') Mnth, module, employee, sum(no_of_hours) Office_Hrs, ',
'sum(on_site_days) OnSite ',
'from PRJ_ENROLLED_DETS',
'WHERE PROJECT_WORKTYPE_ID = :P13_PROJECT_WORKTYPE_ID',
'group by to_char(FROM_DATE,''YYYY''), to_char(from_date,''MM-YYYY''), module, employee'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(15775405594282749)
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
 p_id=>wwv_flow_api.id(15775602621282777)
,p_db_column_name=>'YR'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Yr'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'YR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15775717444282785)
,p_db_column_name=>'MNTH'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Mnth'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MNTH'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15775803195282785)
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
 p_id=>wwv_flow_api.id(15775915303282785)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Employee'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'EMPLOYEE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15776002968282785)
,p_db_column_name=>'OFFICE_HRS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Office Hrs'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'OFFICE_HRS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15776114956282785)
,p_db_column_name=>'ONSITE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Onsite'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ONSITE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(15776199615282983)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13624'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'YR:MNTH:MODULE:EMPLOYEE:OFFICE_HRS:ONSITE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19053956699394705)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19054091975394706)
,p_event_id=>wwv_flow_api.id(19053956699394705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19054139541394707)
,p_event_id=>wwv_flow_api.id(19053956699394705)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_MODULES'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19054296543394708)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_MODULES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19054374254394709)
,p_event_id=>wwv_flow_api.id(19054296543394708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
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
