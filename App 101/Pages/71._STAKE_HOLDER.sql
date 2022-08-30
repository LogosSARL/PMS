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

prompt --application/pages/delete_00071
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>71);
end;
/
prompt --application/pages/page_00071
begin
wwv_flow_api.create_page(
 p_id=>71
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'STAKE HOLDER'
,p_page_mode=>'NORMAL'
,p_step_title=>'STAKE HOLDER'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170410130338'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(183359849768628190)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
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
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(183360256857628190)
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
,p_detail_link=>'f?p=&APP_ID.:72:&APP_SESSION.::::P72_OAS_ID:#OAS_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>183360256857628190
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183360300277628191)
,p_db_column_name=>'OAS_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Oas Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183360733237628194)
,p_db_column_name=>'OAS_OAC_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Oas Oac Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183361594370628196)
,p_db_column_name=>'OAS_EMPLOYEE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'From Logos'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(183473607349839187)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182440993523285614)
,p_db_column_name=>'DISPLAYVAL'
,p_display_order=>24
,p_column_identifier=>'F'
,p_column_label=>'From Client'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182441268144285617)
,p_db_column_name=>'OAS_PRJ_CODE'
,p_display_order=>34
,p_column_identifier=>'G'
,p_column_label=>'Oas prj code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182441329608285618)
,p_db_column_name=>'DIRECT_TELEPHONE'
,p_display_order=>44
,p_column_identifier=>'H'
,p_column_label=>'Telephone'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182441483941285619)
,p_db_column_name=>'DIRECT_FAX'
,p_display_order=>54
,p_column_identifier=>'I'
,p_column_label=>'Fax'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182441537459285620)
,p_db_column_name=>'EMAIL'
,p_display_order=>64
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182441693534285621)
,p_db_column_name=>'E_NAME'
,p_display_order=>74
,p_column_identifier=>'K'
,p_column_label=>'Position'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(183362533088641659)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1833626'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OAS_EMPLOYEE:DISPLAYVAL:E_NAME:EMAIL:DIRECT_TELEPHONE:DIRECT_FAX:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183361984846628196)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(183359849768628190)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:72:P72_CMP_ID,P72_OAS_OAC_ID:&P71_CMP_ID.,&P71_OAC_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48424878417072116)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(183359849768628190)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48424720961072115)
,p_name=>'P71_OAC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(183359849768628190)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182440701416285612)
,p_name=>'P71_CMP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(183359849768628190)
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
