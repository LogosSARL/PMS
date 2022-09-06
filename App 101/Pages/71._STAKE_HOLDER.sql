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
--     PAGE: 71
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00071
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>71);
end;
/
prompt --application/pages/page_00071
begin
wwv_flow_imp_page.create_page(
 p_id=>71
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'STAKE HOLDER'
,p_step_title=>'STAKE HOLDER'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170410130338'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183359849768628190)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "OAS_ID", ',
'"OAS_OAC_ID",',
'"OAS_PRJ_CODE",',
'"OAS_EMPLOYEE",',
'FIRST_NAME || ''-'' || FAMILY_NAME AS DisplayVal,',
'DIRECT_TELEPHONE,',
'DIRECT_FAX,',
'EMAIL,',
'PRJ_POSITIONS.E_NAME',
'',
'from "#OWNER#"."OPP_ACTION_STAKEHOLDERS" ,PRJ_CONTACTS, PRJ_POSITIONS',
' where OAS_OAC_ID = :P71_OAC_ID',
'AND OAS_PRJ_CODE = TO_CHAR(PRJ_CONTACTS.CODE(+))',
'AND PRJ_CONTACTS.POSITION_CODE = PRJ_POSITIONS.CODE(+)',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(183360256857628190)
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
,p_detail_link=>'f?p=&APP_ID.:72:&APP_SESSION.::::P72_OAS_ID:#OAS_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>183360256857628190
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183360300277628191)
,p_db_column_name=>'OAS_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Oas Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183360733237628194)
,p_db_column_name=>'OAS_OAC_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Oas Oac Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183361594370628196)
,p_db_column_name=>'OAS_EMPLOYEE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'From Logos'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(183473607349839187)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182440993523285614)
,p_db_column_name=>'DISPLAYVAL'
,p_display_order=>24
,p_column_identifier=>'F'
,p_column_label=>'From Client'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182441268144285617)
,p_db_column_name=>'OAS_PRJ_CODE'
,p_display_order=>34
,p_column_identifier=>'G'
,p_column_label=>'Oas prj code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182441329608285618)
,p_db_column_name=>'DIRECT_TELEPHONE'
,p_display_order=>44
,p_column_identifier=>'H'
,p_column_label=>'Telephone'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182441483941285619)
,p_db_column_name=>'DIRECT_FAX'
,p_display_order=>54
,p_column_identifier=>'I'
,p_column_label=>'Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182441537459285620)
,p_db_column_name=>'EMAIL'
,p_display_order=>64
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182441693534285621)
,p_db_column_name=>'E_NAME'
,p_display_order=>74
,p_column_identifier=>'K'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(183362533088641659)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1833626'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OAS_EMPLOYEE:DISPLAYVAL:E_NAME:EMAIL:DIRECT_TELEPHONE:DIRECT_FAX:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183361984846628196)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(183359849768628190)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:72:P72_CMP_ID,P72_OAS_OAC_ID:&P71_CMP_ID.,&P71_OAC_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(48424878417072116)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(183359849768628190)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48424720961072115)
,p_name=>'P71_OAC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183359849768628190)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182440701416285612)
,p_name=>'P71_CMP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(183359849768628190)
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
