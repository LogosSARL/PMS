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

prompt --application/pages/delete_00041
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>41);
end;
/
prompt --application/pages/page_00041
begin
wwv_flow_api.create_page(
 p_id=>41
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Pipeline-Modules'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pipeline-Modules'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#APP_IMAGES#CR.js'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20211007122431'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2432274238423862)
,p_plug_name=>'Pipeline-Modules'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "PPM_ID", ',
'"PPM_CNT_ID",',
'"PPM_MODULE",',
'  to_date(PPM_START_DATE,''dd-mm-yyyy'')  "PPM_START_DATE",',
'to_date(PPM_END_DATE,''dd-mm-yyyy'')  "PPM_END_DATE",',
'"PPM_INT_CODE",',
'"PPM_NEW_IMPLEMENTATION",',
'"PPM_MAINTENANCE",',
' to_date(PPM_PRICING_DATE,''dd-mm-yyyy'')  "PPM_PRICING_DATE",',
'"PPM_HIGH_LEVEL_ESTIMATE",',
'"PPM_RFP_REF",',
' PRJ_MODULES.INT_CODE,',
' PRJ_MODULES.E_NAME',
'from "#OWNER#"."PRJ_PIPELINE_MODULES", PRJ_MODULES',
'  where PPM_CNT_ID = :P41_PIPELINE_ID',
'  AND PRJ_MODULES.CODE = PRJ_PIPELINE_MODULES.PPM_MODULE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2432686083423862)
,p_name=>'Pipeline-Modules'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:42:&APP_SESSION.::::P42_PPM_ID:#PPM_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'SERINE'
,p_internal_uid=>2432686083423862
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2432705871423863)
,p_db_column_name=>'PPM_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Ppm Id'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2433188024423864)
,p_db_column_name=>'PPM_CNT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ppm Cnt Id'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2433553299423865)
,p_db_column_name=>'PPM_MODULE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Ppm Module'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2433947141423866)
,p_db_column_name=>'PPM_START_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Ppm Start Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2434317500423867)
,p_db_column_name=>'PPM_END_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Ppm End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2434796761423868)
,p_db_column_name=>'PPM_INT_CODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Int Code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2435193724423869)
,p_db_column_name=>'PPM_NEW_IMPLEMENTATION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Ppm New Implementation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2435518370423870)
,p_db_column_name=>'PPM_MAINTENANCE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ppm Maintenance'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2435956690423871)
,p_db_column_name=>'PPM_PRICING_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Ppm Pricing Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2436384188423872)
,p_db_column_name=>'PPM_HIGH_LEVEL_ESTIMATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ppm High Level Estimate'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2436793616423873)
,p_db_column_name=>'PPM_RFP_REF'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Ppm Rfp Ref'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1834123382278024)
,p_db_column_name=>'INT_CODE'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Module Code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182439642123285601)
,p_db_column_name=>'E_NAME'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'E name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2437819954428688)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'24379'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'PPM_INT_CODE:E_NAME:PPM_START_DATE:PPM_END_DATE:PPM_MAINTENANCE:PPM_PRICING_DATE:PPM_HIGH_LEVEL_ESTIMATE:PPM_RFP_REF:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2437116128423873)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2432274238423862)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:42:P42_PPM_CNT_ID:&P41_PIPELINE_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2445569806869107)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2432274238423862)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RP:P79_ID:&P41_PIPELINE_ID.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2445065857869102)
,p_name=>'P41_PIPELINE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2722631921162046)
,p_name=>'P41_STDATE_VALIDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2722799866162047)
,p_name=>'P41_ENDDATE_VALIDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300943216391094402)
,p_name=>'P41_ROLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300943326119094403)
,p_name=>'P41_ACCOUNT_MANAGER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944315568094413)
,p_name=>'P41_ID'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944405421094414)
,p_name=>'P41_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944572331094415)
,p_name=>'P41_CLIENT_SIGNATURE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944616314094416)
,p_name=>'P41_PRODUCT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944774701094417)
,p_name=>'P41_SIGNED_BY'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944852310094418)
,p_name=>'P41_SIGNATURE_DATE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300944967615094419)
,p_name=>'P41_REMARKS'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945000254094420)
,p_name=>'P41_PAYMENT_TERM'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945130350094421)
,p_name=>'P41_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945254977094422)
,p_name=>'P41_DISCOUNT_IN_DAYS'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945338181094423)
,p_name=>'P41_INITIAL_AMOUNT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945499664094424)
,p_name=>'P41_APPLICENSE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945592105094425)
,p_name=>'P41_AS_INITIAL_AMOUNT'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945649060094426)
,p_name=>'P41_AS_INVOICED_DAYS'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945757154094427)
,p_name=>'P41_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945893997094428)
,p_name=>'P41_VALUE_IN_MAINTENANCE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300945952073094429)
,p_name=>'P41_WARRANTY_IN_MONTH'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946098855094430)
,p_name=>'P41_LL_VALUE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946106342094431)
,p_name=>'P41_USD_VALUE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946201466094432)
,p_name=>'P41_VAT_VALUE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946320754094433)
,p_name=>'P41_FINAL_AMOUNT'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946482864094434)
,p_name=>'P41_IH_INITIAL_AMOUNT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946531433094435)
,p_name=>'P41_IH_INVOICED_DAYS'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946619176094436)
,p_name=>'P41_ONSITE_RATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946756424094437)
,p_name=>'P41_INHOUSE_RATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946867058094438)
,p_name=>'P41_REFERENCE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300946995832094439)
,p_name=>'P41_DELIVERY_NUMODDAYS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947068388094440)
,p_name=>'P41_REF_PM'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947173738094441)
,p_name=>'P41_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947297957094442)
,p_name=>'P41_PRICING_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947329540094443)
,p_name=>'P41_IN_SCOPE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947421415094444)
,p_name=>'P41_LOGOS_BRANCHES'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947593047094445)
,p_name=>'P41_INTERNAL_CLASSIFICATION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947658294094446)
,p_name=>'P41_PARENT_CONTRACT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947743115094447)
,p_name=>'P41_PROJECT_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947806270094448)
,p_name=>'P41_DESCRIPTION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300947943119094449)
,p_name=>'P41_WHO_CREATED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(300948099544094450)
,p_name=>'P41_CONTRACT_TYPE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(301711869761365101)
,p_name=>'P41_DSP_CODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(301711987911365102)
,p_name=>'P41_COMPANY_CODE'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(301712043775365103)
,p_name=>'P41_TASK_ID'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(945212727209470025)
,p_name=>'P41_PAYMENT_METHOD'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(945212849765470026)
,p_name=>'P41_WORK_TO_BE_CONDUCTED'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(945212986949470027)
,p_name=>'P41_INHOUSE_O_RATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(945213050561470028)
,p_name=>'P41_ONSITE_O_RATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(945213399510470031)
,p_name=>'P41_SURCHARGE_FLG'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(2432274238423862)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(300950671721139587)
,p_name=>'CREATE_ACTIVITI_INSTANCE'
,p_event_sequence=>10
,p_bind_type=>'one'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P37_ID is not null '
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(300952058985139589)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     const URL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances'';',
'',
'	  ',
'const data = {',
'   "processDefinitionId":$v("P41_ROLE"),',
'   "variables": [',
'       {"name":"AccountManager",',
'        "value":$v("P41_ACCOUNT_MANAGER")},{',
'        "name":"Client",',
'        "value":$v("P41_COMPANY_CODE")},{',
'          "name":"Product",',
'        "value":$v("P41_PRODUCT")},{',
'          "name":"IntegrationCode",',
'        "value":$v("P41_DSP_CODE")},{',
'          "name":"ContractType",',
'        "value":$v("P41_CONTRACT_TYPE_ID")},{',
'          "name":"WhoCreated",',
'        "value":$v("P41_WHO_CREATED")},{',
'          "name":"Description",',
'        "value":$v("P41_DESCRIPTION")},{',
'          "name":"ProjectName",',
'        "value":$v("P41_PROJECT_NAME")},{',
'          "name":"ParentContract",',
'        "value":$v("P41_PARENT_CONTRACT")},{',
'          "name":"InternalClassification",',
'        "value":$v("P41_INTERNAL_CLASSIFICATION")},{',
'          "name":"LogosBranches",',
'        "value":$v("P41_LOGOS_BRANCHES")},{',
'          "name":"InScope",',
'        "value":$v("P41_IN_SCOPE")},{',
'          "name":"DatesAndRates_DateRaised",',
'        "value":$v("P41_PRICING_DATE")},{',
'          "name":"DatesAndRates_ExpectedDeliveryDate",',
'        "value":$v("P41_EXPECTED_DELIVERY_DATE")},{',
'          "name":"DatesAndRates_Description",',
'        "value":$v("P41_REF_PM")},{',
'          "name":"DatesAndRates_ExpectedDeliveryNumberOfDays",',
'        "value":$v("P41_DELIVERY_NUMODDAYS")},{',
'          "name":"DatesAndRates_Reference",',
'        "value":$v("P41_REFERENCE")},{',
'          "name":"DatesAndRates_InHouseRate",',
'        "value":$v("P41_INHOUSE_RATE")},{',
'          "name":"DatesAndRates_OnSiteRate",',
'        "value":$v("P41_ONSITE_RATE")},{',
'          "name":"DatesAndRates_InHouseORate",',
'        "value":$v("P41_INHOUSE_O_RATE")},{',
'          "name":"DatesAndRates_OnSiteORate",',
'        "value":$v("P41_ONSITE_O_RATE")},{',
'          "name":"FinancialOffer_InHouseInvoicedDays",',
'        "value":$v("P41_IH_INVOICED_DAYS")},{',
'          "name":"FinancialOffer_InHouseInitialAmount",',
'        "value":$v("P41_IH_INITIAL_AMOUNT")}',
'      ',
'   ]',
'};',
'//console.log(JSON.stringify(data));',
'    //console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {',
'       async: false,',
'      success: function (pData) {     ',
'		var obj = JSON.parse(pData);',
'		$s("P41_TASK_ID",obj.id);',
'		console.log(pData);',
'       //   alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'',
'',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(300952584327139589)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P41_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"FinancialOffer_FinalAmount",',
'      "type":"long",',
'      "value":parseInt($v("P41_FINAL_AMOUNT"))',
'   },{',
'      "name":"FinancialOffer_VATValue",',
'      "type":"long",',
'      "value":parseInt($v("P41_VAT_VALUE"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatUSD",',
'      "type":"long",',
'      "value":parseInt($v("P41_USD_VALUE"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatLL",',
'      "type":"long",',
'      "value":parseInt($v("P41_LL_VALUE"))',
'   },{',
'      "name":"FinancialOffer_WarrantyMonth",',
'      "type":"long",',
'      "value":parseInt($v("P41_WARRANTY_IN_MONTH"))',
'   },{',
'      "name":"FinancialOffer_ValueInMaintenance",',
'      "type":"long",',
'      "value":parseInt($v("P41_VALUE_IN_MAINTENANCE"))',
'   },{',
'      "name":"FinancialOffer_OtherExpensesOnClient",',
'      "type":"long",',
'      "value":parseInt($v("P41_OTHER_EXPENSES_ON_CLIENT"))',
'   }',
'];',
'//console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         // console.log(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(300953084128139589)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P41_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"usertask3_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask4_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask12_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"FinancialOffer_AtSiteInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($v("P41_AS_INVOICED_DAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P41_AS_INITIAL_AMOUNT"))',
'   },',
'   {',
'      "name":"FinancialOffer_AppLicense",',
'      "type":"long",',
'      "value":parseInt($v("P41_APPLICENSE"))',
'   }',
'];',
'//console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          alert(pData);',
'          //console.log(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(300951030192139588)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P41_TASK_ID")+''/variables'';',
'	   var testData = [',
'       ',
'    {',
'      "name":"FinancialOffer_InitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P41_INITIAL_AMOUNT"))',
'   },',
'   {',
'      "name":"FinancialOffer_DiscountInDays",',
'      "type":"long",',
'      "value":parseInt($v("P41_DISCOUNT_IN_DAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_DiscountInAmount",',
'      "type":"long",',
'      "value":parseInt($v("P41_DISCOUNT_IN_AMOUNT"))',
'   }, {',
'      "name":"FinancialOffer_SurchargeFlg",',
'      "value":$v("P41_SURCHARGE_FLG")',
'   }',
'];',
'//console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          //console.log(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(300951581697139589)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P41_TASK_ID")+''/variables'';',
'	   var testData = [',
'     {',
'      "name":"FinancialOffer_PaymentTerm",',
'      "type":"string",',
'      "value":$v("P41_PAYMENT_TERM")',
'   },',
'           {',
'      "name":"FinancialOffer_PaymentMethod",',
'      "type":"string",',
'      "value":$v("P41_PAYMENT_METHOD")',
'   },{',
'      "name":"FinancialOffer_Remarks",',
'      "type":"string",',
'      "value":$v("P41_REMARKS")',
'   },{',
'      "name":"FinancialOffer_WorkToBeConducted",',
'      "type":"string",',
'      "value":$v("P41_WORK_TO_BE_CONDUCTED")',
'   },{',
'      "name":"FinancialOffer_LogosSignature",',
'      "type":"string",',
'      "value":$v("P41_SIGNED_BY")',
'   },{',
'      "name":"FinancialOffer_LogosSignatureDate",',
'      "type":"string",',
'      "value":$v("P41_SIGNATURE_DATE")',
'   },{',
'      "name":"FinancialOffer_ClientSignature",',
'      "type":"string",',
'      "value":$v("P41_CLIENT_SIGNATURE")',
'   },{',
'      "name":"FinancialOffer_ClientSignatureDate",',
'      "type":"string",',
'      "value":$v("P41_CLIENT_SIGNATURE_DATE")',
'   },',
'    {',
'      "name":"pipelineID",',
'      "type":"long",',
'      "value":parseInt($v("P41_PIPELINE_ID"))',
'   },{',
'      "name":"FAIL_FLG",',
'      "type":"string",',
'      "value":null',
'   }',
'];',
'//console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          console.log(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1374091170678945217)
,p_event_id=>wwv_flow_api.id(300950671721139587)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//alert(''ok'');'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(929347233018608509)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'New'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'37'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(301712126485365104)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_WF_PROCESS_ID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :USER_ROLE like ''%ACCOUNT_MANAGER%'' then :P41_ROLE :=  ''AccountManager_ChangeRequest:19:35102''; ',
'elsif :USER_ROLE LIKE ''%PROJECT_MANAGER%'' then :P41_ROLE :=  ''AccountManager_ChangeRequest:19:35102'';',
'elsif :USER_ROLE LIKE ''%SOLUTION_MANAGER%'' then :P41_ROLE :=  ''SolutionManager_ChangeRequest:13:35114'';',
'elsif :USER_ROLE LIKE ''%TEAM_LEADER%'' then :P41_ROLE :=  ''ImplementerTeamLeader_ChanageRequest:18:35110'';',
'elsif :USER_ROLE LIKE ''%IMPLEMENTER%''  then :P41_ROLE :=  ''Implementer_ChangeRequest:17:35106'';',
'else return;',
'end if;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(881206753639680750)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_VARIABLES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P41_PIPELINE_ID := :P37_ID;',
':P41_CLIENT_SIGNATURE_DATE := :P37_CLIENT_SIGNATURE_DATE;',
':P41_CLIENT_SIGNATURE := :P37_CLIENT_SIGNATURE;',
':P41_SIGNATURE_DATE := :P37_SIGNATURE_DATE;',
':P41_SIGNED_BY := :P37_SIGNED_BY;',
':P41_REMARKS := :P37_REMARKS;',
':P41_PAYMENT_METHOD := :P37_PAYMENT_METHOD;',
':P41_WORK_TO_BE_CONDUCTED := :P37_WORK_TO_BE_CONDUCTED;',
':P41_PAYMENT_TERM := :P37_PAYMENT_TERM;',
':P41_DISCOUNT_IN_AMOUNT := :P37_DISCOUNT_IN_AMOUNT;',
':P41_DISCOUNT_IN_DAYS := :P37_DISCOUNT_IN_DAYS;',
':P41_INITIAL_AMOUNT := :P37_INITIAL_AMOUNT;',
':P41_APPLICENSE := :P37_APPLICENSE;',
':P41_AS_INITIAL_AMOUNT := :P37_AS_INITIAL_AMOUNT;',
':P41_AS_INVOICED_DAYS := :P37_AS_INVOICED_DAYS;',
':P41_OTHER_EXPENSES_ON_CLIENT := :P37_OTHER_EXPENSES_ON_CLIENT;',
':P41_VALUE_IN_MAINTENANCE := :P37_VALUE_IN_MAINTENANCE;',
':P41_WARRANTY_IN_MONTH := :P37_WARRANTY_IN_MONTH;',
':P41_LL_VALUE := :P37_LL_VALUE;',
':P41_USD_VALUE := :P37_USD_VALUE;',
':P41_FINAL_AMOUNT := :P37_FINAL_AMOUNT;',
':P41_IH_INITIAL_AMOUNT := :P37_IH_INITIAL_AMOUNT;',
':P41_IH_INVOICED_DAYS :=  :P37_IH_INVOICED_DAYS;',
':P41_ONSITE_RATE := :P37_ONSITE_RATE;',
':P41_INHOUSE_RATE := :P37_INHOUSE_RATE;',
':P41_ONSITE_O_RATE := :P37_ONSITE_O_RATE;',
':P41_INHOUSE_O_RATE := :P37_INHOUSE_O_RATE;',
':P41_REFERENCE := :P37_REFERENCE ;',
':P41_DELIVERY_NUMODDAYS := :P37_DELIVERY_NUMODDAYS ;--CHECK THIS',
':P41_REF_PM := :P37_REF_PM;',
':P41_EXPECTED_DELIVERY_DATE := :P37_EXPECTED_DELIVERY_DATE;',
':P41_PRICING_DATE := :P37_PRICING_DATE;',
':P41_IN_SCOPE := :P37_IN_SCOPE ;',
':P41_LOGOS_BRANCHES := :P37_LOGOS_BRANCHES;',
':P41_INTERNAL_CLASSIFICATION := :P37_INTERNAL_CLASSIFICATION;',
':P41_SURCHARGE_FLG := :P37_SURCHARGE_FLG;',
':P41_PARENT_CONTRACT := :P37_PARENT_CONTRACT;',
':P41_PROJECT_NAME := :P37_PROJECT_NAME;',
':P41_DESCRIPTION := :P37_DESCRIPTION;',
':P41_WHO_CREATED := :P37_WHO_CREATED;',
':P41_CONTRACT_TYPE_ID := :P37_CONTRACT_TYPE_ID;',
':P41_DSP_CODE := :P37_DSP_CODE;',
':P41_PRODUCT := :P37_PRODUCT;',
':P41_ACCOUNT_MANAGER := :P37_ACCOUNT_MANAGER;',
':P41_COMPANY_CODE := :P37_COMPANY_CODE;',
':P41_TASK_ID := :P37_TASK_ID;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
