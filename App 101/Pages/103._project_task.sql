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
--     PAGE: 103
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00103
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>103);
end;
/
prompt --application/pages/page_00103
begin
wwv_flow_imp_page.create_page(
 p_id=>103
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'project task'
,p_step_title=>'project task'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180125111117'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(146500445665039705)
,p_name=>'Task Enrollment'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ppt.id, ppt.id task_Details,ppt.grade, ppt.estimated_days, ppt.enrolled_days, ppt.description, ppt.wrktyp_id, ppt.proj_id, ppt.qty, ',
'ppt.seq, ppt.id Est, ppt.id Work,',
'project_pck.get_project_work_estimate_num(ppt.id) Estimated,',
'project_pck.get_task_enrollment(ppt.id,''0'',''d'') Enrollment,',
'ppt.id Exp,',
'project_pck.get_project_task_expences(ppt.id) Expences,',
'project_pck.get_contract_id(ppt.proj_id) Contract,',
'project_pck.get_project_module(ppt.proj_id) Module,',
'PROJECT_PCK.get_project_desc(ppt.PROJ_ID) ||'' ''||',
'project_pck.get_work_type_desc(ppt.wrktyp_id) Project_description',
'from prj_projectwork_types ppt',
'where ppt.proj_id = :P103_CURRENT_PROJECT   ',
'/*and ( ppt.id in (select project_worktype_id from prj_estimated_dets)   ',
'      or ',
'      ppt.id in (select project_worktype_id from prj_enrolled_dets))*/',
'and  project_pck.get_if_prj_worktype_disp(ppt.id, :P103_ZERO) = 1',
'and ppt.seq not in (80,50,55,60,70,200,100,90)',
'order by ppt.seq',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146542967986042401)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543001026042402)
,p_query_column_id=>2
,p_column_alias=>'TASK_DETAILS'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543194135042403)
,p_query_column_id=>3
,p_column_alias=>'GRADE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543251605042404)
,p_query_column_id=>4
,p_column_alias=>'ESTIMATED_DAYS'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543391277042405)
,p_query_column_id=>5
,p_column_alias=>'ENROLLED_DAYS'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543439989042406)
,p_query_column_id=>6
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543532801042407)
,p_query_column_id=>7
,p_column_alias=>'WRKTYP_ID'
,p_column_display_sequence=>7
,p_column_heading=>'Work Type'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(15760494688455984)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543682309042408)
,p_query_column_id=>8
,p_column_alias=>'PROJ_ID'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543705756042409)
,p_query_column_id=>9
,p_column_alias=>'QTY'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543847939042410)
,p_query_column_id=>10
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146543981887042411)
,p_query_column_id=>11
,p_column_alias=>'EST'
,p_column_display_sequence=>11
,p_column_heading=>'Est.'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP:P14_PARENT_MODULE,P14_PROJECT_WORKTYPE_ID,P14_PROJECT_WORKTYPE_DESC:#MODULE#,#ID#,#PROJECT_DESCRIPTION#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544078634042412)
,p_query_column_id=>12
,p_column_alias=>'WORK'
,p_column_display_sequence=>12
,p_column_heading=>'Work'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:P13_PROJECT_WORKTYPE_DESC,P13_PROJECT_WORKTYPE_ID:#PROJECT_DESCRIPTION#,#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544168766042413)
,p_query_column_id=>13
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>13
,p_column_heading=>'Estimated(Days)'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544260064042414)
,p_query_column_id=>14
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>14
,p_column_heading=>'Enrollment(Days)'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544328433042415)
,p_query_column_id=>15
,p_column_alias=>'EXP'
,p_column_display_sequence=>15
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544429615042416)
,p_query_column_id=>16
,p_column_alias=>'EXPENCES'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544518051042417)
,p_query_column_id=>17
,p_column_alias=>'CONTRACT'
,p_column_display_sequence=>17
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544601478042418)
,p_query_column_id=>18
,p_column_alias=>'MODULE'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146544761843042419)
,p_query_column_id=>19
,p_column_alias=>'PROJECT_DESCRIPTION'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(146545673807042428)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(146500445665039705)
,p_button_name=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(146544836322042420)
,p_name=>'P103_ZERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(146500445665039705)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(146545227552042424)
,p_name=>'P103_CURRENT_PROJECT_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(146500445665039705)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(146545491598042426)
,p_name=>'P103_SHOW_WHAT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(146500445665039705)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(146545577500042427)
,p_name=>'P103_CURRENT_PROJECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(146500445665039705)
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
