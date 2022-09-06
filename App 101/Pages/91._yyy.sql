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
--     PAGE: 91
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00091
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>91);
end;
/
prompt --application/pages/page_00091
begin
wwv_flow_imp_page.create_page(
 p_id=>91
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'yyy'
,p_step_title=>'yyy'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170807091553'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27089276878379539)
,p_plug_name=>'CONTACTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(68593675735773461)
,p_plug_name=>'Report 1'
,p_parent_plug_id=>wwv_flow_imp.id(27089276878379539)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "CODE", ',
'"COMPANY",',
'"FIRST_NAME",',
'"FATHER_NAME",',
'"FAMILY_NAME",',
'"A_FIRST_NAME",',
'"A_FATHER_NAME",',
'"A_FAMILY_NAME",',
'"GENDER",',
'"NATIONALITY",',
'"POSITION_CODE",',
'"POSITION_DESC",',
'"DIRECT_TELEPHONE",',
'"DIRECT_FAX",',
'"EMAIL",',
'"MAIL_POST_ADDRESS",',
'"MAILINGLIST_GROUP",',
'"PORTAL_USER_NAME",',
'"PASSWD",',
'"USER_ROLE",',
'"INT_CODE",',
'"TOBECHECKED",',
'"WHO_ENTERED",',
'"DATE_ENTERED",',
'"APEX_USER",',
'"MAKE_PUBLIC",',
'"MODULE_CODE",',
'"COMMENTS",',
'"PRJ_CODE",',
'"ESUPPORT_CODE",',
'"SALES_PERSON_CODE",',
'"SALES_USERS_CODE"',
'from "#OWNER#"."PRJ_CLIENT_CONTACTS" ',
'  ',
'where company= :P91_COMPCODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(68594077446773462)
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
,p_detail_link=>'f?p=&APP_ID.:92:&APP_SESSION.::::P92_CODE:#CODE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>68594077446773462
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68594131286773471)
,p_db_column_name=>'CODE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Code'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68594583728773477)
,p_db_column_name=>'COMPANY'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68594977169773478)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68595310380773479)
,p_db_column_name=>'FATHER_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Father Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68595772295773480)
,p_db_column_name=>'FAMILY_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Family Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68596156678773481)
,p_db_column_name=>'A_FIRST_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'A First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68596540642773484)
,p_db_column_name=>'A_FATHER_NAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'A Father Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68596980328773485)
,p_db_column_name=>'A_FAMILY_NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'A Family Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68597371884773488)
,p_db_column_name=>'GENDER'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68597790602773489)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68598106386773490)
,p_db_column_name=>'POSITION_CODE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Position Code'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(68609628277945244)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68598500306773491)
,p_db_column_name=>'POSITION_DESC'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Position Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68598977219773492)
,p_db_column_name=>'DIRECT_TELEPHONE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Direct Telephone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68599328541773493)
,p_db_column_name=>'DIRECT_FAX'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Direct Fax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68599764988773494)
,p_db_column_name=>'EMAIL'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68600139883773495)
,p_db_column_name=>'MAIL_POST_ADDRESS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Mail Post Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68600509810773496)
,p_db_column_name=>'MAILINGLIST_GROUP'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Mailinglist Group'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(68610602430007959)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68600952744773497)
,p_db_column_name=>'PORTAL_USER_NAME'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Portal User Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68601385665773498)
,p_db_column_name=>'PASSWD'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Passwd'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68601724182773499)
,p_db_column_name=>'USER_ROLE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'User Role'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68602192984773500)
,p_db_column_name=>'INT_CODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Int Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68602501601773501)
,p_db_column_name=>'TOBECHECKED'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Tobechecked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68602988235773502)
,p_db_column_name=>'WHO_ENTERED'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Who Entered'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68603345931773503)
,p_db_column_name=>'DATE_ENTERED'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Date Entered'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68603791957773504)
,p_db_column_name=>'APEX_USER'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Apex User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68604193828773505)
,p_db_column_name=>'MAKE_PUBLIC'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Make Public'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68604579218773506)
,p_db_column_name=>'MODULE_CODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68604949837773507)
,p_db_column_name=>'COMMENTS'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68605337524773508)
,p_db_column_name=>'PRJ_CODE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Prj Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68605769053773509)
,p_db_column_name=>'ESUPPORT_CODE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Esupport Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68606122763773509)
,p_db_column_name=>'SALES_PERSON_CODE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Sales Person Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68606591784773510)
,p_db_column_name=>'SALES_USERS_CODE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Sales Users Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(68607685922800479)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'686077'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CODE:COMPANY:FIRST_NAME:FATHER_NAME:FAMILY_NAME:A_FIRST_NAME:A_FATHER_NAME:A_FAMILY_NAME:GENDER:NATIONALITY:POSITION_CODE:POSITION_DESC:DIRECT_TELEPHONE:DIRECT_FAX:EMAIL:MAIL_POST_ADDRESS:MAILINGLIST_GROUP:PORTAL_USER_NAME:PASSWD:USER_ROLE:INT_CODE:T'
||'OBECHECKED:WHO_ENTERED:DATE_ENTERED:APEX_USER:MAKE_PUBLIC:MODULE_CODE:COMMENTS:PRJ_CODE:ESUPPORT_CODE:SALES_PERSON_CODE:SALES_USERS_CODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(68606901157773511)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(68593675735773461)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:92:P92_COMPANY:&P91_COMPCODE.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27089743443379544)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(68593675735773461)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27089367832379540)
,p_name=>'P91_COMPCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27089276878379539)
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
