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
--   Date and Time:   11:23 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 30
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00030
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>30);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_imp_page.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Efforts Still Needed'
,p_step_title=>'Efforts Still Needed'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'03'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20210426144214'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3076822716270612)
,p_name=>'Efforts Still Needed'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'wtg.name Work_Type, ',
'wtg.id,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_remaining_num(ppt.id)) Remaining,',
'CAST (',
'	--case ',
'	--when	sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'--		sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) < 0 ',
'--	Then 0',
'--	else 	',
'    sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'			sum(project_pck.get_task_enrollment(ppt.id,''0'',''d''))',
'	--end ',
'    as number) as WorkNeeded,',
'sum(project_pck.Get_work_still_needed(ppt.id)) wn,',
'round(sum(project_pck.get_project_work_sys_rem_num(ppt.id) ),2) System_Remaining',
'from prj_projectwork_types ppt, prj_work_types pwt, work_type_groups wtg, lgs_projects p, lgs_contracts c, prj_companies co',
'where p.id =ppt.proj_id',
'and   p.contract_id = c.id',
'and project_pck.get_if_contract_disp (c.id, :APP_USER) = 1',
'and   ppt.wrktyp_id = pwt.id',
'and   pwt.work_type_group = wtg.id',
'and   c.company_code = co.code',
'--and  project_pck.get_if_prj_worktype_disp(ppt.id, :P5_ZERO) = 1',
'and   nvl(c.FINALIZED,''N'') = ''N''',
'--and c.company_code = nvl(:P30_CLIENT,c.company_code)',
'and UPPER(c.dsp_code) like ''%''|| UPPER(nvl(:P30_CNT, c.dsp_code)) || ''%''',
'group by wtg.name, wtg.id'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3077102718270614)
,p_query_column_id=>1
,p_column_alias=>'WORK_TYPE'
,p_column_display_sequence=>1
,p_column_heading=>'Effort'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3079125438362915)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>5
,p_column_heading=>'Sel'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::P30_SELECTED_ID,P30_SELECTED_GROUP:#ID#,#WORK_TYPE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="">'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3077216414270614)
,p_query_column_id=>3
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>2
,p_column_heading=>'Estimated Days'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3077315775270614)
,p_query_column_id=>4
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>3
,p_column_heading=>'Enrollment'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(442951354654314208)
,p_query_column_id=>5
,p_column_alias=>'REMAINING'
,p_column_display_sequence=>7
,p_column_heading=>'Remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3077422619270614)
,p_query_column_id=>6
,p_column_alias=>'WORKNEEDED'
,p_column_display_sequence=>4
,p_column_heading=>'Still Needed'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3543213411831270)
,p_query_column_id=>7
,p_column_alias=>'WN'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(881287837747881729)
,p_query_column_id=>8
,p_column_alias=>'SYSTEM_REMAINING'
,p_column_display_sequence=>8
,p_column_heading=>'System remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3084424027052895)
,p_name=>'Contracts  for  &P30_SELECTED_GROUP.'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'c.dsp_code, c.company_code, c.id,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) WorkNeeded,',
'sum(project_pck.Get_work_still_needed(ppt.id)) Work_Needed,',
'round(sum(project_pck.get_project_work_sys_rem_num(ppt.id) ),2) System_Remaining',
'from prj_projectwork_types ppt, prj_work_types pwt, work_type_groups wtg, lgs_projects p, lgs_contracts c, prj_companies co',
'where p.id =ppt.proj_id',
'and   p.contract_id = c.id',
'and   ppt.wrktyp_id = pwt.id',
'and   pwt.work_type_group = wtg.id',
'and   c.company_code = co.code',
'--and  project_pck.get_if_prj_worktype_disp(ppt.id, :P5_ZERO) = 1',
'and project_pck.get_if_contract_disp (c.id, ''&USER.'') = 1',
'and   NVL(c.finalized,''N'') = ''N''',
'and   wtg.id = :P30_SELECTED_ID',
'--and c.company_code = nvl(:P30_CLIENT,c.company_code)',
'and UPPER(c.dsp_code) like ''%'' || UPPER(nvl(:P30_CNT, c.dsp_code))|| ''%''',
'group by c.dsp_code, c.company_code, c.id'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'1:2:3'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3084709632052963)
,p_query_column_id=>1
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>1
,p_column_heading=>'Contract'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3084816698052974)
,p_query_column_id=>2
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'Company'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(15612817231694462)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3084917167052974)
,p_query_column_id=>3
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_column_heading=>'ID'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3085011489052975)
,p_query_column_id=>4
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>4
,p_column_heading=>'Estimated'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3085103918052975)
,p_query_column_id=>5
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>5
,p_column_heading=>'Enrollment'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3085217244052975)
,p_query_column_id=>6
,p_column_alias=>'WORKNEEDED'
,p_column_display_sequence=>6
,p_column_heading=>'Still Needed'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3578422337500725)
,p_query_column_id=>7
,p_column_alias=>'WORK_NEEDED'
,p_column_display_sequence=>7
,p_column_heading=>'Work Needed'
,p_use_as_row_header=>'N'
,p_column_format=>'99,999,999,999.99'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(881287915276881730)
,p_query_column_id=>8
,p_column_alias=>'SYSTEM_REMAINING'
,p_column_display_sequence=>8
,p_column_heading=>'System remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(881287223583881723)
,p_plug_name=>'Criteria'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902846851019133)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(724553182241242830)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(881287223583881723)
,p_button_name=>'Efforts'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Efforts'
,p_button_alignment=>'LEFT-CENTER'
,p_button_redirect_url=>'f?p=222:47:&SESSION.::&DEBUG.:RP::'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(724553227653242831)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(881287223583881723)
,p_button_name=>'Remaining'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Remaining'
,p_button_alignment=>'LEFT-CENTER'
,p_button_redirect_url=>'f?p=222:48:&SESSION.::&DEBUG.:RP::'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(881287798578881728)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(881287223583881723)
,p_button_name=>'Go'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3085607950068248)
,p_name=>'P30_SELECTED_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3076822716270612)
,p_prompt=>'Selected Id'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3086319356093368)
,p_name=>'P30_SELECTED_GROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3076822716270612)
,p_prompt=>'Selected Group'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>300
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881287344568881724)
,p_name=>'P30_CNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(881287223583881723)
,p_prompt=>'Contract'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(297762976357042902)
,p_name=>'On Chage Client'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CLIENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(297763170218042904)
,p_event_id=>wwv_flow_imp.id(297762976357042902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P30_CLIENT'
,p_attribute_03=>'P30_CLIENT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(297763035522042903)
,p_event_id=>wwv_flow_imp.id(297762976357042902)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3076822716270612)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(297763316167042906)
,p_name=>'On Change Client'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CLIENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(297763411711042907)
,p_event_id=>wwv_flow_imp.id(297763316167042906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P30_CLIENT'
,p_attribute_03=>'P30_CLIENT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(297763564805042908)
,p_event_id=>wwv_flow_imp.id(297763316167042906)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3076822716270612)
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
