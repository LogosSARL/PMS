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
--   Date and Time:   09:35 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00144
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>144);
end;
/
prompt --application/pages/page_00144
begin
wwv_flow_api.create_page(
 p_id=>144
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'EST_DIRECTORY'
,p_page_mode=>'NORMAL'
,p_step_title=>'EST_DIRECTORY'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200828131314'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1161784825053796175)
,p_plug_name=>'Search estimations'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(974490132011028616)
,p_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct ',
'comp.e_name customer,',
'c.dsp_code contract ,',
' transfer_data.get_module_desc(p.module) module,',
' c_type.name type,',
' off_sts.POS_DESC status,',
' c.account_manager account_manager,',
' listagg(det.employee,''/'') within group (order by det.employee ) as emp_list,',
'-- project_pck.get_project_days(p.ID,''e'') tot_est,',
' max(get_rem_est(p.id,wrk_types.id,''DOC'',nvl(:p144_date,sysdate))) as est_doc,',
' max(project_pck.get_project_work_sys_rem_num(wrk_types.id, ''DOC'')) as sys_rem_doc,',
' max(get_rem_est(p.id,wrk_types.id,''ANL'',nvl(:p144_date,sysdate))) as est_anl,',
'  max(project_pck.get_project_work_sys_rem_num(wrk_types.id, ''ANL'')) as sys_rem_anl,',
' max(get_rem_est(p.id,wrk_types.id,''INST'',nvl(:p144_date,sysdate))) as est_inst,',
' max(project_pck.get_project_work_sys_rem_num(wrk_types.id, ''INST'')) as sys_rem_inst,',
' max(get_rem_est(p.id,wrk_types.id,''IMP'',nvl(:p144_date,sysdate))) as est_imp,',
' max(project_pck.get_project_work_sys_rem_num(wrk_types.id, ''IMP'')) as sys_rem_imp,',
' sum(project_pck.get_project_wrktype_os_days(p.id,wrk_types.id,''ANL'',nvl(:p144_date,sysdate))) as est_os_anl,',
' sum(project_pck.get_project_wrktype_os_days(p.id,wrk_types.id,''TST'',nvl(:p144_date,sysdate))) as est_os_tst,',
' sum(project_pck.get_project_wrktype_os_days(p.id,wrk_types.id,''IMP'',nvl(:p144_date,sysdate))) as est_os_imp,',
'sum(project_pck.get_project_wrktype_os_days(p.id,wrk_types.id,''DEV'',nvl(:p144_date,sysdate))) as est_os_dev',
'--,',
'--project_pck.get_project_remaining(p.id) as tot_rem,',
'--project_pck.get_project_management_est(p.id) as tot_man,',
'--project_pck.get_project_management_est(p.id) + project_pck.get_project_days(p.ID,''e'') as tot_all',
' from ',
'lgs_contracts c,',
'prj_companies comp,',
'lgs_projects p,',
'prj_contract_types c_type,',
'prj_projectwork_Types wrk_types,',
'prj_work_types prj_work_types,',
'est_types t,',
'PRJ_OFFER_STATUS off_sts,',
'prj_estimated_dets det inner join  (',
'            select ppt.id , max(project_pck.get_project_work_remaining_num( ppt.id)) ',
'                from  prj.prj_projectwork_types ppt ,prj_estimated_dets d',
'                where d.PROJECT_WORKTYPE_ID = ppt.id',
'                and d.est_date <= nvl(:P144_DATE,d.est_date)',
'                group by ppt.id',
'        ) max_ppt on det.PROJECT_WORKTYPE_ID = max_ppt.id',
'where c.company_code = comp.code ',
'and  p.id = wrk_types.proj_id',
'and  p.contract_id = c.id',
'and c_type.id = c.contract_Type_id',
'and det.project_worktype_id = wrk_types.id',
'and t.id = det.est_type',
'and prj_work_types.id = wrk_types.wrktyp_id',
'and off_sts.pos_id = c.offer_status',
'and det.employee = nvl(:P144_EMP, det.employee) ',
'and c.id = nvl(:P144_INTEGRATIONCODE, c.id)',
'and  det.est_type = nvl(:P144_EST_TYPE, det.est_type)',
'and c.company_code = nvl(:P144_COMPANY_CODE,c.company_code)',
'group by',
'comp.e_name,',
'c.dsp_code ,',
' transfer_data.get_module_desc(p.module),',
' c_type.name,',
' off_sts.POS_DESC,',
' c.account_manager',
' --,',
' --project_pck.get_project_days(p.ID,''e''),',
' --project_pck.get_project_remaining(p.id),',
' --project_pck.get_project_management_est(p.id)',
'',
'  order by 2',
'',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490380092028618)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>1
,p_column_heading=>'Customer'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490454219028619)
,p_query_column_id=>2
,p_column_alias=>'CONTRACT'
,p_column_display_sequence=>2
,p_column_heading=>'Contract'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490507236028620)
,p_query_column_id=>3
,p_column_alias=>'MODULE'
,p_column_display_sequence=>3
,p_column_heading=>'Module'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490687771028621)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490735288028622)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>5
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490826788028623)
,p_query_column_id=>6
,p_column_alias=>'ACCOUNT_MANAGER'
,p_column_display_sequence=>6
,p_column_heading=>'Account manager'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492297195028637)
,p_query_column_id=>7
,p_column_alias=>'EMP_LIST'
,p_column_display_sequence=>7
,p_column_heading=>'Emp list'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492338809028638)
,p_query_column_id=>8
,p_column_alias=>'EST_DOC'
,p_column_display_sequence=>8
,p_column_heading=>'Est doc'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974493349037028648)
,p_query_column_id=>9
,p_column_alias=>'SYS_REM_DOC'
,p_column_display_sequence=>9
,p_column_heading=>'Sys rem doc'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492496329028639)
,p_query_column_id=>10
,p_column_alias=>'EST_ANL'
,p_column_display_sequence=>10
,p_column_heading=>'Est anl'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974493487768028649)
,p_query_column_id=>11
,p_column_alias=>'SYS_REM_ANL'
,p_column_display_sequence=>11
,p_column_heading=>'Sys rem anl'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492540318028640)
,p_query_column_id=>12
,p_column_alias=>'EST_INST'
,p_column_display_sequence=>12
,p_column_heading=>'Est inst'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974493587966028650)
,p_query_column_id=>13
,p_column_alias=>'SYS_REM_INST'
,p_column_display_sequence=>13
,p_column_heading=>'Sys rem inst'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492632030028641)
,p_query_column_id=>14
,p_column_alias=>'EST_IMP'
,p_column_display_sequence=>14
,p_column_heading=>'Est imp'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(978862255951405401)
,p_query_column_id=>15
,p_column_alias=>'SYS_REM_IMP'
,p_column_display_sequence=>15
,p_column_heading=>'Sys rem imp'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492709306028642)
,p_query_column_id=>16
,p_column_alias=>'EST_OS_ANL'
,p_column_display_sequence=>16
,p_column_heading=>'Est os anl'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492888856028643)
,p_query_column_id=>17
,p_column_alias=>'EST_OS_TST'
,p_column_display_sequence=>17
,p_column_heading=>'Est os tst'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974492973088028644)
,p_query_column_id=>18
,p_column_alias=>'EST_OS_IMP'
,p_column_display_sequence=>18
,p_column_heading=>'Est os imp'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974493048952028645)
,p_query_column_id=>19
,p_column_alias=>'EST_OS_DEV'
,p_column_display_sequence=>19
,p_column_heading=>'Est os dev'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(976490543698814429)
,p_name=>'estimations'
,p_parent_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_template=>wwv_flow_api.id(20903138185019134)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid=>true
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        select ',
'         det.id,',
'            p.dsp_code,',
'            c.company_code,',
'            transfer_data.get_top_level_module_desc(det.module) AS "TOP LEVEL MODULE",',
'            transfer_data.get_module_desc(det.module) module,',
'            det.employee,',
'            t.name as "Type",',
'            wrk_types.estimated_days,',
'            det.who_entered,',
'            det.on_site_days,',
'            det.no_of_days,',
'            det.est_date,',
'            det.ft_date',
'        from ',
'        lgs_projects p, lgs_contracts c , prj_projectwork_Types wrk_types, est_types t ,prj_estimated_dets det',
'        inner join  (',
'            select ppt.id , max(project_pck.get_project_work_remaining_num( ppt.id)) ',
'                from  prj.prj_projectwork_types ppt ,prj_estimated_dets d',
'                where d.PROJECT_WORKTYPE_ID = ppt.id',
'                and d.est_date <= nvl(:P144_DATE,d.est_date)',
'                group by ppt.id',
'        ) max_ppt on det.PROJECT_WORKTYPE_ID = max_ppt.id',
'        where p.id = wrk_types.proj_id',
'        and p.contract_id = c.id',
'        and det.project_worktype_id = wrk_types.id',
'        and t.id = det.est_type',
'        and  det.employee = nvl(:P144_EMP, det.employee)',
'        and c.id = nvl(:P144_INTEGRATIONCODE, c.id)',
'        and  det.est_type = nvl(:P144_EST_TYPE, det.est_type)',
'        and c.company_code = nvl(:P144_COMPANY_CODE,c.company_code)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_exp_filename=>'List of Contracts'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974455319488612765)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Edit'
,p_column_link=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974458105357612767)
,p_query_column_id=>2
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Integration Code'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SELECTED_INT_CODE,P40_CID,P40_INTCODE_SELECTED:#ID#,#CONTRACT_DESC#,#DSP_CODE#,#CHILD#,#ID#'
,p_column_linktext=>'#DSP_CODE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'DSP_CODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489667656028611)
,p_query_column_id=>3
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'Company code'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945215191824470049)
,p_query_column_id=>4
,p_column_alias=>'TOP LEVEL MODULE'
,p_column_display_sequence=>4
,p_column_heading=>'Top level module'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945215202187470050)
,p_query_column_id=>5
,p_column_alias=>'MODULE'
,p_column_display_sequence=>5
,p_column_heading=>'Module'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974488686532028601)
,p_query_column_id=>6
,p_column_alias=>'EMPLOYEE'
,p_column_display_sequence=>6
,p_column_heading=>'Employee'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489463097028609)
,p_query_column_id=>7
,p_column_alias=>'Type'
,p_column_display_sequence=>13
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974488861147028603)
,p_query_column_id=>8
,p_column_alias=>'ESTIMATED_DAYS'
,p_column_display_sequence=>7
,p_column_heading=>'Estimated days'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974488944429028604)
,p_query_column_id=>9
,p_column_alias=>'WHO_ENTERED'
,p_column_display_sequence=>8
,p_column_heading=>'Who entered'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489020906028605)
,p_query_column_id=>10
,p_column_alias=>'ON_SITE_DAYS'
,p_column_display_sequence=>9
,p_column_heading=>'On site days'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489198261028606)
,p_query_column_id=>11
,p_column_alias=>'NO_OF_DAYS'
,p_column_display_sequence=>10
,p_column_heading=>'No of days'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489293634028607)
,p_query_column_id=>12
,p_column_alias=>'EST_DATE'
,p_column_display_sequence=>11
,p_column_heading=>'Est date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974489389738028608)
,p_query_column_id=>13
,p_column_alias=>'FT_DATE'
,p_column_display_sequence=>12
,p_column_heading=>'Ft date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(974449863753612758)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974450243693612760)
,p_name=>'P144_EMP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_prompt=>'Employee'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select emp_name d, emp_code r',
'from   prj_employee_salary',
'where ACTIVE = ''Y''',
'order by 1'))
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974450614195612762)
,p_name=>'P144_EST_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_prompt=>'Est type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   est_types',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974451072507612762)
,p_name=>'P144_INTEGRATIONCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_prompt=>'int code'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CONTRACT_CODE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE d, ID r',
'from   LGS_CONTRACTS',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974451416398612762)
,p_name=>'P144_VIEW_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_item_default=>'non'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974451814585612763)
,p_name=>'P144_CNTIDD_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974452252446612763)
,p_name=>'P144_PCI_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974452626714612763)
,p_name=>'P144_CID_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974453087956612763)
,p_name=>'P144_INTCODE_SELECTED_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974453476925612763)
,p_name=>'P144_CID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974453837887612763)
,p_name=>'P144_INTCODE_SELECTED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974454237004612763)
,p_name=>'P144_CNTIDD'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974454606857612764)
,p_name=>'P144_PCI'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974469324505612772)
,p_name=>'P144_CONTRACT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974469731465612772)
,p_name=>'P144_CONTRACT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974470106502612773)
,p_name=>'P144_SELECTED_INT_CODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974470542558612773)
,p_name=>'P144_START_DATETOVALID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974470938080612773)
,p_name=>'P144_END_DATETOVALID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974471324170612773)
,p_name=>'P144_LCDID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974471760937612773)
,p_name=>'P144_INTEGRATION_FLG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974472185755612773)
,p_name=>'P144_VIEW'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(976490543698814429)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974489563743028610)
,p_name=>'P144_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_prompt=>'Date'
,p_source=>'&SYSDATE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(974489794406028612)
,p_name=>'P144_COMPANY_CODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1161784825053796175)
,p_prompt=>'Company code'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COMPANIES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
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
