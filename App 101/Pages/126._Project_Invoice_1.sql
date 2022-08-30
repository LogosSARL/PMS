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
--   Date and Time:   11:26 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 126
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00126
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>126);
end;
/
prompt --application/pages/page_00126
begin
wwv_flow_imp_page.create_page(
 p_id=>126
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Project Invoice'
,p_step_title=>'Project Invoice'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20181206095739'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(271150718184282015)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "INV_ID", ',
'"INV_PROJECT_ID",',
'"INV_PERCENTAGE",',
'"INV_DATE",',
'"INV_INVOICE_NUMBER",',
'"INV_REMAINING_AMOUNT",',
'"INV_NOTE"',
'from "#OWNER#"."PRJ_INVOICES" ',
'  where inv_project_id = nvl(:P126_INV_PROJECT_ID,:INV_PROJECT_ID)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(271151158103282015)
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
,p_detail_link=>'f?p=&APP_ID.:130:&APP_SESSION.::::P130_INV_ID:#INV_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>271151158103282015
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271151275230282018)
,p_db_column_name=>'INV_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Inv Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271151605805282019)
,p_db_column_name=>'INV_PROJECT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Inv Project Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271152062734282019)
,p_db_column_name=>'INV_PERCENTAGE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Percentage'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271152436616282020)
,p_db_column_name=>'INV_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271152823415282020)
,p_db_column_name=>'INV_INVOICE_NUMBER'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Invoice Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271153213072282021)
,p_db_column_name=>'INV_REMAINING_AMOUNT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Remaining Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(271153602449282021)
,p_db_column_name=>'INV_NOTE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Note'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(271172309065293016)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2711724'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'INV_ID:INV_PROJECT_ID:INV_PERCENTAGE:INV_DATE:INV_INVOICE_NUMBER:INV_REMAINING_AMOUNT:INV_NOTE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(271154041721282021)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(271150718184282015)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:130'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(271182975029315308)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(271150718184282015)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(271182227062315301)
,p_name=>'P126_INV_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(271150718184282015)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(271182541109315304)
,p_name=>'P126_AMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(271150718184282015)
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
