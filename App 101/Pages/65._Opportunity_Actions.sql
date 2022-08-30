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

prompt --application/pages/delete_00065
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>65);
end;
/
prompt --application/pages/page_00065
begin
wwv_flow_api.create_page(
 p_id=>65
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Opportunity Actions'
,p_page_mode=>'NORMAL'
,p_step_title=>'Opportunity Actions'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180402145521'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(183302860761994638)
,p_plug_name=>'Report 1'
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
'(select count(*)',
'from "#OWNER#"."OPP_ACTION_STAKEHOLDERS" ,PRJ_CONTACTS, PRJ_POSITIONS',
' where OAS_OAC_ID = :P71_OAC_ID',
'AND OAS_PRJ_CODE = TO_CHAR(PRJ_CONTACTS.CODE(+))',
'AND PRJ_CONTACTS.POSITION_CODE = PRJ_POSITIONS.CODE(+)) as STAKEHOLDER_CNT,',
'(select count(*)',
'from "#OWNER#"."OPP_ACTIONS_DOCS" ',
'where OAD_OAC_ID = :P81_OAC_ID) as DOCUMENTS_CNT,',
'"OAC_LOCATION",'''' as StakeHolders, '''' as Documents,',
'OPP_CUSTOMER',
'from "#OWNER#"."OPP_ACTIONS", OPPORTUNITIES ',
'where OAC_OPP_ID = :P65_OPP_ID',
'AND OAC_OPP_ID = OPP_ID',
'  ',
'ORDER BY OAC_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(183303293787994638)
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
,p_detail_link=>'f?p=&APP_ID.:66:&APP_SESSION.::::P66_OAC_ID:#OAC_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'ADMIN'
,p_internal_uid=>183303293787994638
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183303340667994639)
,p_db_column_name=>'OAC_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Oac Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183303759133994640)
,p_db_column_name=>'OAC_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183304161223994641)
,p_db_column_name=>'OAC_DESC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183304501475994642)
,p_db_column_name=>'OAC_DURATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Duration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183304900086994643)
,p_db_column_name=>'OAC_OUTPUTS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Outputs'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183305315922994644)
,p_db_column_name=>'OAC_NEXT_ACTION_DESC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Next Action Descriptions'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183305785891994645)
,p_db_column_name=>'OAC_NEXT_ACTION_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Next Action Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183306124953994646)
,p_db_column_name=>'OAC_REMARKS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183306545083994647)
,p_db_column_name=>'OAC_OPP_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Oac Opp Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183306981075994647)
,p_db_column_name=>'OAC_OPA_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Presale Activities'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(183460437274117376)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183307397051994648)
,p_db_column_name=>'OAC_TAKEN_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Taken By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183307768771994649)
,p_db_column_name=>'OAC_LOCATION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48424513020072113)
,p_db_column_name=>'STAKEHOLDERS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Stakeholders'
,p_column_link=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP:P71_OAC_ID,P71_CMP_ID:#OAC_ID#,#OPP_CUSTOMER#'
,p_column_linktext=>'Stakeholders (#STAKEHOLDER_CNT#)'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48424653501072114)
,p_db_column_name=>'DOCUMENTS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Documents'
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:RP:P81_OAC_ID:#OAC_ID#'
,p_column_linktext=>'Docs (#DOCUMENTS_CNT#)'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182440836141285613)
,p_db_column_name=>'OPP_CUSTOMER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Opp customer'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(156455419418521925)
,p_db_column_name=>'STAKEHOLDER_CNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Stakeholder cnt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(156455559705521926)
,p_db_column_name=>'DOCUMENTS_CNT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Documents cnt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(183310797268087887)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1833108'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OAC_ID:OAC_DATE:OAC_DESC:OAC_DURATION:OAC_OUTPUTS:OAC_NEXT_ACTION_DESC:OAC_NEXT_ACTION_DATE:OAC_REMARKS:OAC_OPP_ID:OAC_OPA_ID:OAC_TAKEN_BY:OAC_LOCATION:STAKEHOLDERS:DOCUMENTS:OPP_CUSTOMER:STAKEHOLDER_CNT:DOCUMENTS_CNT'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183308176979994650)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(183302860761994638)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:66'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48424454299072112)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(183302860761994638)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48424369501072111)
,p_name=>'P65_OPP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(183302860761994638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
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
