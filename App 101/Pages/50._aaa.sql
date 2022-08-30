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

prompt --application/pages/delete_00050
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>50);
end;
/
prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'aaa'
,p_page_mode=>'NORMAL'
,p_step_title=>'aaa'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170614131134'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19042509745300873)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID", ',
'"L_DESCRIPTION",',
'"DSP_CODE",',
'"END_DATE",',
'"START_DATE",',
'"CONTRACT_ID",',
'"INT_CODE",',
'"MODULE",',
'"NEW_IMPLEMENTATION",',
'"MAINTENANCE",',
'"PRICING_DATE",',
'"ACTIVE",',
'"SEQ",',
'"HIGH_LEVEL_ESTIMATE",',
'"HIGH_LEVEL_REMAINING",',
'"STATUS",',
'"IS_INVOICED_FLG",',
'"APPROVAL_DATE"',
'from "#OWNER#"."LGS_PROJECTS" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19042953512300874)
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
,p_detail_link=>'f?p=&APP_ID.:57:&APP_SESSION.::::P57_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'ADMIN'
,p_internal_uid=>19042953512300874
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19043067771300883)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'L Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19043443273300890)
,p_db_column_name=>'L_DESCRIPTION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19043834547300891)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dsp Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19044204088300892)
,p_db_column_name=>'END_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19044668432300893)
,p_db_column_name=>'START_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19045009972300894)
,p_db_column_name=>'CONTRACT_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Contract Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19045465031300895)
,p_db_column_name=>'INT_CODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Int Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19045864720300896)
,p_db_column_name=>'MODULE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19046258461300897)
,p_db_column_name=>'NEW_IMPLEMENTATION'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'New Implementation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19046660396300898)
,p_db_column_name=>'MAINTENANCE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Maintenance'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19047019735300899)
,p_db_column_name=>'PRICING_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Pricing Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19047453337300900)
,p_db_column_name=>'ACTIVE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19047835394300901)
,p_db_column_name=>'SEQ'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19048216306300902)
,p_db_column_name=>'HIGH_LEVEL_ESTIMATE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'High Level Estimate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19048667833300903)
,p_db_column_name=>'HIGH_LEVEL_REMAINING'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'High Level Remaining'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19049051744300903)
,p_db_column_name=>'STATUS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19049486282300904)
,p_db_column_name=>'IS_INVOICED_FLG'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Is Invoiced Flg'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19049863660300905)
,p_db_column_name=>'APPROVAL_DATE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Approval Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19050892689310990)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'190509'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID:L_DESCRIPTION:DSP_CODE:END_DATE:START_DATE:CONTRACT_ID:INT_CODE:MODULE:NEW_IMPLEMENTATION:MAINTENANCE:PRICING_DATE:ACTIVE:SEQ:HIGH_LEVEL_ESTIMATE:HIGH_LEVEL_REMAINING:STATUS:IS_INVOICED_FLG:APPROVAL_DATE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19050267932300906)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19042509745300873)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:57'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19054464706394710)
,p_name=>'P50_CNTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19042509745300873)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19054532651394711)
,p_name=>'P50_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19042509745300873)
,p_prompt=>'SearchModule Text'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19054688377394712)
,p_name=>'P50_DSPCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19042509745300873)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19054714923394713)
,p_name=>'P50_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19042509745300873)
,p_prompt=>'Modules'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select e_name d, code r',
'From   prj_modules',
'where instr(LOWER(E_NAME),LOWER(:P12_SEARCH))>0',
'--CONNECT BY PRIOR CODE = PARENT_CODE',
'---START WITH CODE = :P14_PARENT_MODULE'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19054867841394714)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19054937418394715)
,p_event_id=>wwv_flow_api.id(19054867841394714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19055089160394716)
,p_event_id=>wwv_flow_api.id(19054867841394714)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P50_MODULE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19055141754394717)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_MODULE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19055221945394718)
,p_event_id=>wwv_flow_api.id(19055141754394717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P12_INT_CODE'').val($v(''P12_CONTRACT_DESC'') + $( "#P12_MODULE option:selected" ).text());'
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
