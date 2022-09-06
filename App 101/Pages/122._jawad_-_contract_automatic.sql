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
--     PAGE: 122
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00122
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>122);
end;
/
prompt --application/pages/page_00122
begin
wwv_flow_imp_page.create_page(
 p_id=>122
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'jawad - contract automatic'
,p_step_title=>'jawad - contract automatic'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ROUWAIDA'
,p_last_upd_yyyymmddhh24miss=>'20181105094427'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(262609870880219808)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID", ',
'"ID",',
'"CONTRACT",',
'"COMPANY",',
'"START_DATE",',
'"END_DATE",',
'"TYPE",',
'"STAGE",',
'"FINALISED",',
'"ESTIMATE",',
'"VALUE",',
'"EXPENCES",',
'"ENROLLMENT",',
'"NET"',
'from "#OWNER#"."CONTRACTS" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(262610259723219808)
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
,p_detail_link=>'f?p=&APP_ID.:123:&APP_SESSION.::::P123_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>262610259723219808
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262610382829219809)
,p_db_column_name=>'ROWID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262610738209219809)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262611138318219809)
,p_db_column_name=>'CONTRACT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Contract'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262611548371219809)
,p_db_column_name=>'COMPANY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262611924276219810)
,p_db_column_name=>'START_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262612317541219810)
,p_db_column_name=>'END_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262612720825219810)
,p_db_column_name=>'TYPE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262613156202219810)
,p_db_column_name=>'STAGE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262613578530219810)
,p_db_column_name=>'FINALISED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Finalised'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262613963889219810)
,p_db_column_name=>'ESTIMATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Estimate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262614332114219811)
,p_db_column_name=>'VALUE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262614734253219811)
,p_db_column_name=>'EXPENCES'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Expences'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262615128311219811)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Enrollment'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262615552263219811)
,p_db_column_name=>'NET'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(262616476370232525)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2626165'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:ID:CONTRACT:COMPANY:START_DATE:END_DATE:TYPE:STAGE:FINALISED:ESTIMATE:VALUE:EXPENCES:ENROLLMENT:NET'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(262615917693219811)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(262609870880219808)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:123'
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
