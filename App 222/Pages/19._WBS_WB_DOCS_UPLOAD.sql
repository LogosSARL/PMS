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
,p_default_application_id=>222
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:35 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 19
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00019
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>19);
end;
/
prompt --application/pages/page_00019
begin
wwv_flow_imp_page.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'WBS_WB_DOCS_UPLOAD'
,p_step_title=>'WBS_WB_DOCS_UPLOAD'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190204152506'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(313923084543313675)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "WBC_ID", ',
'"PRJ_WB_ID",',
'"ROW_KEY",',
'"WBC_NAME",',
'"WBC_DESC",',
'"WBC_PATH",',
'dbms_lob.getlength("WBC_DOC") "WBC_DOC",',
'"WBC_DOC_FILENAME",',
'"WBC_DOC_MIMETYPE",',
'"WBC_DOC_CHARSET",',
'"WBC_DOC_LASTUPD",',
'"WBC_WBS_ID",',
'"CREATED",',
'"CREATED_BY",',
'"UPDATED",',
'"UPDATED_BY"',
'from "#OWNER#"."PRJ_WBS_DOCS" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(313923405115313675)
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
,p_detail_link=>'f?p=&APP_ID.:20:&APP_SESSION.::::P20_WBC_ID:#WBC_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>313923405115313675
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313923525175313676)
,p_db_column_name=>'WBC_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Prj Wb Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313923964093313676)
,p_db_column_name=>'PRJ_WB_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313924376706313676)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313924781830313676)
,p_db_column_name=>'WBC_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313925188022313677)
,p_db_column_name=>'WBC_DESC'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313925564596313677)
,p_db_column_name=>'WBC_PATH'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Path'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313925963912313677)
,p_db_column_name=>'WBC_DOC'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Doc'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DOWNLOAD:PRJ_WBS_DOCS:WBC_DOC:WBC_ID::::::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313926335011313677)
,p_db_column_name=>'WBC_DOC_FILENAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313926759952313678)
,p_db_column_name=>'WBC_DOC_MIMETYPE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313927166045313678)
,p_db_column_name=>'WBC_DOC_CHARSET'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Charset'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313927530101313679)
,p_db_column_name=>'WBC_DOC_LASTUPD'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Doc Lastupd'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313927991619313679)
,p_db_column_name=>'WBC_WBS_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Task Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313928322004313680)
,p_db_column_name=>'CREATED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313928776193313680)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313929177549313680)
,p_db_column_name=>'UPDATED'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(313929430304313681)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(313933665089378569)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3139337'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WBC_ID:PRJ_WB_ID:ROW_KEY:WBC_NAME:WBC_DESC:WBC_PATH:WBC_DOC:WBC_DOC_FILENAME:WBC_DOC_MIMETYPE:WBC_DOC_CHARSET:WBC_DOC_LASTUPD:WBC_WBS_ID:CREATED:CREATED_BY:UPDATED:UPDATED_BY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313929853102313681)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(313923084543313675)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20'
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
