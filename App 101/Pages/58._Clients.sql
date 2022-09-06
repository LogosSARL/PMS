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
--     PAGE: 58
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00058
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>58);
end;
/
prompt --application/pages/page_00058
begin
wwv_flow_imp_page.create_page(
 p_id=>58
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Clients'
,p_step_title=>'Clients'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180312104613'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27089844052379545)
,p_plug_name=>'CLIENTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60758388300044945)
,p_plug_name=>'CLIENTS'
,p_parent_plug_id=>wwv_flow_imp.id(27089844052379545)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''''AS LINK,',
'b."CODE",',
'"DSP_CODE",',
'a.E_NAME, b.e_name as sss,',
'b."A_NAME",',
'"COUNTRY",',
'"AREA_CODE",',
'"MAIN_TELEPHONE",',
'"HOME_PAGE",',
'"MAIN_FAX",',
'"POBOX",',
'"PRIMARY_PERSON",',
'"HOMEPAGE",',
'"OWNER_COMPANY",',
'"COMPANY_DESC",',
'"CUSTOMER",',
'"BUS_TYPE",',
'"PARENT_COMPANY",',
'"PARTNER",',
'"CHECKED",',
'"MOBILE",',
'"EMAIL",',
'"COMPETITOR",',
'b."DELETED",',
'b."SALES_CODE",',
'b."PRJ_CODE", b."ESUPPORT_CODE"',
'from PRJ_COMPANIES b , logos.lgs_areas a',
'where upper(nvl(b.deleted,''N'')) <> ''Y''',
' AND a.parent_code(+) = b.country ',
'and a.code(+) = b.area_code',
'order by sss  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(60758779779044946)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.::P76_CODE:#CODE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'ADMIN'
,p_internal_uid=>60758779779044946
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60759202916044963)
,p_db_column_name=>'CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60759660457044964)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dsp Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60760029806044965)
,p_db_column_name=>'E_NAME'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27089663107379543)
,p_db_column_name=>'LINK'
,p_display_order=>33
,p_column_identifier=>'AB'
,p_column_label=>'Link'
,p_column_link=>'f?p=&APP_ID.:91:&SESSION.::&DEBUG.:RP:P91_COMPCODE:#CODE#'
,p_column_linktext=>'CONTACTS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60760439623044966)
,p_db_column_name=>'A_NAME'
,p_display_order=>43
,p_column_identifier=>'E'
,p_column_label=>'A Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60760841652044967)
,p_db_column_name=>'COUNTRY'
,p_display_order=>53
,p_column_identifier=>'F'
,p_column_label=>'Country'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(60855921895332239)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60761274880044967)
,p_db_column_name=>'AREA_CODE'
,p_display_order=>63
,p_column_identifier=>'G'
,p_column_label=>'Area Code'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(60856154281346012)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60761676677044968)
,p_db_column_name=>'MAIN_TELEPHONE'
,p_display_order=>73
,p_column_identifier=>'H'
,p_column_label=>'Main Telephone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60762051915044969)
,p_db_column_name=>'HOME_PAGE'
,p_display_order=>83
,p_column_identifier=>'I'
,p_column_label=>'Home Page'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60762423039044971)
,p_db_column_name=>'MAIN_FAX'
,p_display_order=>93
,p_column_identifier=>'J'
,p_column_label=>'Main Fax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60762811452044972)
,p_db_column_name=>'POBOX'
,p_display_order=>103
,p_column_identifier=>'K'
,p_column_label=>'Pobox'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60763222065044973)
,p_db_column_name=>'PRIMARY_PERSON'
,p_display_order=>113
,p_column_identifier=>'L'
,p_column_label=>'Primary Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60763603725044975)
,p_db_column_name=>'HOMEPAGE'
,p_display_order=>123
,p_column_identifier=>'M'
,p_column_label=>'Homepage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60764074554044976)
,p_db_column_name=>'OWNER_COMPANY'
,p_display_order=>133
,p_column_identifier=>'N'
,p_column_label=>'Owner Company'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60764475620044977)
,p_db_column_name=>'COMPANY_DESC'
,p_display_order=>143
,p_column_identifier=>'O'
,p_column_label=>'Company Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60764805987044978)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>153
,p_column_identifier=>'P'
,p_column_label=>'Customer'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60765235631044978)
,p_db_column_name=>'BUS_TYPE'
,p_display_order=>163
,p_column_identifier=>'Q'
,p_column_label=>'Bus Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(70413518877642854)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60765697383044981)
,p_db_column_name=>'PARENT_COMPANY'
,p_display_order=>173
,p_column_identifier=>'R'
,p_column_label=>'Parent Company'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(60855921895332239)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60766077526044982)
,p_db_column_name=>'PARTNER'
,p_display_order=>183
,p_column_identifier=>'S'
,p_column_label=>'Partner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60766438646044983)
,p_db_column_name=>'CHECKED'
,p_display_order=>193
,p_column_identifier=>'T'
,p_column_label=>'Checked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60766885904044984)
,p_db_column_name=>'MOBILE'
,p_display_order=>203
,p_column_identifier=>'U'
,p_column_label=>'Mobile'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60767247378044984)
,p_db_column_name=>'EMAIL'
,p_display_order=>213
,p_column_identifier=>'V'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60767624997044985)
,p_db_column_name=>'COMPETITOR'
,p_display_order=>223
,p_column_identifier=>'W'
,p_column_label=>'Competitor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60768024224044986)
,p_db_column_name=>'DELETED'
,p_display_order=>233
,p_column_identifier=>'X'
,p_column_label=>'Deleted'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60768436340044987)
,p_db_column_name=>'SALES_CODE'
,p_display_order=>243
,p_column_identifier=>'Y'
,p_column_label=>'Sales Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60768832198044988)
,p_db_column_name=>'PRJ_CODE'
,p_display_order=>253
,p_column_identifier=>'Z'
,p_column_label=>'Prj Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60769237225044988)
,p_db_column_name=>'ESUPPORT_CODE'
,p_display_order=>263
,p_column_identifier=>'AA'
,p_column_label=>'Esupport Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27089997213379546)
,p_db_column_name=>'SSS'
,p_display_order=>273
,p_column_identifier=>'AC'
,p_column_label=>'Client_Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(60810982987055234)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'608110'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSP_CODE:SSS:COUNTRY:E_NAME:BUS_TYPE:LINK:A_NAME:PRIMARY_PERSON:MOBILE:EMAIL:MAIN_TELEPHONE:MAIN_FAX:HOMEPAGE:POBOX:OWNER_COMPANY:COMPANY_DESC:CUSTOMER:PARTNER:CHECKED:COMPETITOR:SALES_CODE:ESUPPORT_CODE:'
,p_sort_column_1=>'DSP_CODE'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(60769629291044989)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(60758388300044945)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:76'
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
