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
--   Date and Time:   09:33 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00053
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>53);
end;
/
prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Operation Action'
,p_page_mode=>'NORMAL'
,p_step_title=>'Operation Action'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20170406153628'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182656029039720346)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "OAC_ID", ',
'"OAC_DATE",',
'"OAC_DESC",',
'"OAC_DURATION",',
'"OAC_OUTPUTS",',
'"OAC_NEXT_ACTION_DESC",',
'"OAC_NEXT_ACTION_DATE",',
'"OAC_REMARKS",',
'"OAC_OPP_ID",',
'"OAC_OPA_ID",',
'"OAC_TAKEN_BY",',
'"OAC_LOCATION"',
'from "#OWNER#"."OPP_ACTIONS" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(182656414944720347)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:54:&APP_SESSION.::::P54_OAC_ID:#OAC_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>182656414944720347
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182656539157720355)
,p_db_column_name=>'OAC_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Oac Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182656982535720357)
,p_db_column_name=>'OAC_DATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Oac Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182657320772720358)
,p_db_column_name=>'OAC_DESC'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Oac Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182657707144720359)
,p_db_column_name=>'OAC_DURATION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Oac Duration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182658198135720360)
,p_db_column_name=>'OAC_OUTPUTS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Oac Outputs'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182658563372720361)
,p_db_column_name=>'OAC_NEXT_ACTION_DESC'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Oac Next Action Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182658913581720362)
,p_db_column_name=>'OAC_NEXT_ACTION_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Oac Next Action Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182659327942720364)
,p_db_column_name=>'OAC_REMARKS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Oac Remarks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182659724699720365)
,p_db_column_name=>'OAC_OPP_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Oac Opp Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182660189238720366)
,p_db_column_name=>'OAC_OPA_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Oac Opa Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182660590739720367)
,p_db_column_name=>'OAC_TAKEN_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Oac Taken By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182660933907720368)
,p_db_column_name=>'OAC_LOCATION'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Oac Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(182661315004720369)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(182656029039720346)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:54'
,p_grid_new_grid=>false
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
