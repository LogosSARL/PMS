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
--   Date and Time:   09:34 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00098
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>98);
end;
/
prompt --application/pages/page_00098
begin
wwv_flow_api.create_page(
 p_id=>98
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'CSS_Modules'
,p_page_mode=>'NORMAL'
,p_step_title=>'CSS_Modules'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180130152811'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142099275594684369)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID", ',
'"CODE",',
'"E_NAME",',
'"A_NAME",',
'"DISPLAY",',
'"SORTORDER",',
'"PARENT_CODE",',
'"CURRENT_PRICE",',
'"CURRENCY",',
'"SUPPORT_FEE",',
'"FORSALE",',
'"SUPPLIER",',
'"DEFAULT_QTY",',
'"DISPLAY_FOR_SUPPORT",',
'"DISPLAY_FOR_CUSTOMERS",',
'"DISPLAY_IN_SERVERICES",',
'"BUTTON_COLUMN",',
'"CODE2",',
'"DELETED",',
'"SALES_MODULE_CODE",',
'"ESUPPORT_MODULE_CODE",',
'"PRJ_MODULE_CODE",',
'"TOBECHECKED",',
'"INT_CODE"',
'from "LOGOS"."LGS_MODULES" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(142099696934684370)
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
,p_detail_link=>'f?p=&APP_ID.:99:&APP_SESSION.::::P99_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>142099696934684370
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142099709135684392)
,p_db_column_name=>'ROWID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142100171749684400)
,p_db_column_name=>'CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142100546593684402)
,p_db_column_name=>'E_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'E Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142100967078684403)
,p_db_column_name=>'A_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'A Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142101338228684404)
,p_db_column_name=>'DISPLAY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Display'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142101759699684405)
,p_db_column_name=>'SORTORDER'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Sortorder'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142102133698684406)
,p_db_column_name=>'PARENT_CODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Parent Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142102536684684407)
,p_db_column_name=>'CURRENT_PRICE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Current Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142102927750684408)
,p_db_column_name=>'CURRENCY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Currency'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142103300944684409)
,p_db_column_name=>'SUPPORT_FEE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Support Fee'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142103775406684409)
,p_db_column_name=>'FORSALE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Forsale'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142104102147684410)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142104564662684411)
,p_db_column_name=>'DEFAULT_QTY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Default Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142104886574684412)
,p_db_column_name=>'DISPLAY_FOR_SUPPORT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Display For Support'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142105211259684412)
,p_db_column_name=>'DISPLAY_FOR_CUSTOMERS'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Display For Customers'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142105682874684413)
,p_db_column_name=>'DISPLAY_IN_SERVERICES'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Display In Serverices'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142106035235684414)
,p_db_column_name=>'BUTTON_COLUMN'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Button Column'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142106434589684415)
,p_db_column_name=>'CODE2'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Code2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142106821311684416)
,p_db_column_name=>'DELETED'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Deleted'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142107232323684416)
,p_db_column_name=>'SALES_MODULE_CODE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Sales Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142107686767684417)
,p_db_column_name=>'ESUPPORT_MODULE_CODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Esupport Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142108004980684419)
,p_db_column_name=>'PRJ_MODULE_CODE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Prj Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142108409485684420)
,p_db_column_name=>'TOBECHECKED'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Tobechecked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142108874197684421)
,p_db_column_name=>'INT_CODE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Int Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(142109915502688605)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1421100'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'INT_CODE:E_NAME:CODE:A_NAME:DISPLAY:SORTORDER:PARENT_CODE:CURRENT_PRICE:CURRENCY:SUPPORT_FEE:FORSALE:SUPPLIER:DEFAULT_QTY:DISPLAY_FOR_SUPPORT:DISPLAY_FOR_CUSTOMERS:DISPLAY_IN_SERVERICES:BUTTON_COLUMN:CODE2:DELETED:SALES_MODULE_CODE:ESUPPORT_MODULE_CO'
||'DE:PRJ_MODULE_CODE:TOBECHECKED:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(142118765979614902)
,p_report_id=>wwv_flow_api.id(142109915502688605)
,p_name=>'Row text contains ''LN'''
,p_condition_type=>'SEARCH'
,p_allow_delete=>'Y'
,p_expr=>'LN'
,p_enabled=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142109287978684423)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(142099275594684369)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:99'
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
