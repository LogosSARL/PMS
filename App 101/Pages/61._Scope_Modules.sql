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
--     PAGE: 61
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00061
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>61);
end;
/
prompt --application/pages/page_00061
begin
wwv_flow_imp_page.create_page(
 p_id=>61
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Opportunity Scope'
,p_step_title=>'Scope Modules'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170407183311'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183334627136284421)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "OPS_ID", ',
'"OPS_OPP_ID",',
'"OPS_MODULE"',
'from "#OWNER#"."OPP_SCOPE" ',
'where :P61_OPP_ID IS NULL OR OPS_OPP_ID = :P61_OPP_ID',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(183335061833284422)
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
,p_detail_link=>'f?p=&APP_ID.:68:&APP_SESSION.::::P68_OPS_ID:#OPS_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>183335061833284422
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183335120808284423)
,p_db_column_name=>'OPS_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Ops Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183335563034284424)
,p_db_column_name=>'OPS_OPP_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ops Opp Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183335974765284425)
,p_db_column_name=>'OPS_MODULE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Ops Module'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(20927250648083995)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(183337993899295779)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1833380'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OPS_ID:OPS_OPP_ID:OPS_MODULE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183336394085284427)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(183334627136284421)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:68:P68_OPS_OPP_ID:&P61_OPP_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182440371157285608)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(183334627136284421)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183239623306880615)
,p_name=>'P61_OPP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183334627136284421)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
