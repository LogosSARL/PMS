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
--   Date and Time:   11:24 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 55
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00055
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>55);
end;
/
prompt --application/pages/page_00055
begin
wwv_flow_imp_page.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Opportunity'
,p_step_title=>'Opportunity'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20170407173018'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(182675260931030601)
,p_plug_name=>'Opportunity'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '''' as Roles ,OPP_ID,',
'       OPP_INIT_DATE,',
'       OPP_DESC,',
'       OPP_HOW_HEARD_ABOUT,',
'       OPP_WHY_ITS_IMP_FOR_LOGOS,',
'       OPP_REMARKS,',
'       OPP_CONTRACT_TYPE,',
'       OPP_CUSTOMER,',
'       OPP_ESTIMATED_TIME,',
'       OPP_ESTIMATED_COST, '''' as Actions',
'  from OPPORTUNITIES'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(182687324729078201)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SERINE'
,p_internal_uid=>182687324729078201
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687442015078202)
,p_db_column_name=>'OPP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Opp id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687553052078203)
,p_db_column_name=>'OPP_INIT_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Opp init date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687689876078204)
,p_db_column_name=>'OPP_DESC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Opp desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687766135078205)
,p_db_column_name=>'OPP_HOW_HEARD_ABOUT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Opp how heard about'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687823698078206)
,p_db_column_name=>'OPP_WHY_ITS_IMP_FOR_LOGOS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Opp why its imp for logos'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182687934421078207)
,p_db_column_name=>'OPP_REMARKS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Opp remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182688004822078208)
,p_db_column_name=>'OPP_CONTRACT_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Opp contract type'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182688199422078209)
,p_db_column_name=>'OPP_CUSTOMER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Opp customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182688226603078210)
,p_db_column_name=>'OPP_ESTIMATED_TIME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Opp estimated time'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182688357235078211)
,p_db_column_name=>'OPP_ESTIMATED_COST'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Opp estimated cost'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183238236613880601)
,p_db_column_name=>'ROLES'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Roles'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(48424220895072110)
,p_db_column_name=>'ACTIONS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Actions'
,p_column_link=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:RP:P65_OPP_ID:#OPP_ID#'
,p_column_linktext=>'Actions'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(182701699920079018)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1827017'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OPP_ID:OPP_INIT_DATE:OPP_DESC:OPP_HOW_HEARD_ABOUT:OPP_WHY_ITS_IMP_FOR_LOGOS:OPP_REMARKS:OPP_CONTRACT_TYPE:OPP_CUSTOMER:OPP_ESTIMATED_TIME:OPP_ESTIMATED_COST:ROLES:ACTIONS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182688532259078213)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(182675260931030601)
,p_button_name=>'CreateOpportunity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Createopportunity'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP:P56_ID:&P55_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182688414955078212)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(182675260931030601)
,p_button_name=>'AddModules'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'AddModules'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183238319352880602)
,p_name=>'P55_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(182675260931030601)
,p_source=>'OPP_SEQ.NEXTVAL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(182684005908030638)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(182675260931030601)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
