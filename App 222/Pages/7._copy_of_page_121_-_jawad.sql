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
,p_default_application_id=>222
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:35 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 7
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00007
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>7);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'copy of page 121 - jawad'
,p_page_mode=>'MODAL'
,p_step_title=>'copy of page 121 - jawad'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20181107094414'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(263032879638349301)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(790500485009472793)
,p_plug_name=>'Employee Enrollment &P121_CURRENT_PROJECT_DESC.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select es.emp_name, ',
'sum(ed.no_of_hours/project_param.get_hours_per_day) InHouse, ',
'sum(on_site_days/project_param.get_hours_per_day) OnSite,',
'sum(ed.no_of_hours/project_param.get_hours_per_day) ',
'+ sum(on_site_days/project_param.get_hours_per_day) Total,',
'sum((project_pck.get_emp_salary_to(ed.employee, ed.from_date)/project_param.get_months_per_day)*',
'(ed.no_of_hours+nvl(ed.on_site_days,0)*project_param.get_on_site_factor)/project_param.get_hours_per_day) Sal',
'from    PRJ_EMPLOYEE_SALARY es, prj_enrolled_dets ed',
'where es.emp_code = ed.employee',
'and   ed.PROJECT_WORKTYPE_ID in (select id from prj_projectwork_types',
'                               where proj_id = :P7_CURRENT_PROJECT)',
'group by es.emp_name'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_SHOW_WHAT'
,p_plug_display_when_cond2=>'1'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(788511930554461019)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>788511930554461019
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263009698994113057)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263010053895113057)
,p_db_column_name=>'INHOUSE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Inhouse'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263010497641113058)
,p_db_column_name=>'ONSITE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Onsite'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263010889438113058)
,p_db_column_name=>'TOTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263011255549113058)
,p_db_column_name=>'SAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(788694948114324191)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2630116'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMP_NAME:INHOUSE:ONSITE:TOTAL:SAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(790506206871520192)
,p_plug_name=>'Task Enrollment in &P121_CURRENT_PROJECT_DESC.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'where ppt.proj_id = :P7_current_project   ',
'/*and ( ppt.id in (select project_worktype_id from prj_estimated_dets)   ',
'      or ',
'      ppt.id in (select project_worktype_id from prj_enrolled_dets))*/',
'and  project_pck.get_if_prj_worktype_disp(ppt.id, :P7_ZERO) = 1',
'and ppt.seq not in (80,50,55,60,70,200,100,90)',
'order by ppt.seq',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_SHOW_WHAT'
,p_plug_display_when_cond2=>'2'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(788515797270508419)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>788515797270508419
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263012797002113059)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263016323369113061)
,p_db_column_name=>'SEQ'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263013101690113059)
,p_db_column_name=>'TASK_DETAILS'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Task details'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263013529309113060)
,p_db_column_name=>'GRADE'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Grade'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263013983205113060)
,p_db_column_name=>'ESTIMATED_DAYS'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Estimated days'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263014351983113060)
,p_db_column_name=>'ENROLLED_DAYS'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Enrolled days'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263014757848113060)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263015111566113060)
,p_db_column_name=>'WRKTYP_ID'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Wrktyp id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(15760494688455984)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263015529954113060)
,p_db_column_name=>'PROJ_ID'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Proj id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263015996347113060)
,p_db_column_name=>'QTY'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263016778717113061)
,p_db_column_name=>'EST'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Est'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP:P14_PROJECT_WORKTYPE_ID,P14_PROJECT_WORKTYPE_DESC,P14_PARENT_MODULE:#ID#,#PROJECT_DESCRIPTION#,#MODULE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="Register / View Estimates">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263017184552113061)
,p_db_column_name=>'WORK'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Work'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:P13_PROJECT_WORKTYPE_ID,P13_PROJECT_WORKTYPE_DESC:#ID#,#PROJECT_DESCRIPTION#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263017538459113061)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Estimated'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263017992029113061)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Enrollment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263018342555113061)
,p_db_column_name=>'EXP'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Exp'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263018716954113061)
,p_db_column_name=>'EXPENCES'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Expences'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263019177788113061)
,p_db_column_name=>'CONTRACT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Contract'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263019597642113062)
,p_db_column_name=>'MODULE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263019946985113062)
,p_db_column_name=>'PROJECT_DESCRIPTION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Project description'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(788698837533371585)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2630203'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:TASK_DETAILS:GRADE:ESTIMATED_DAYS:ENROLLED_DAYS:DESCRIPTION:WRKTYP_ID:PROJ_ID:QTY:SEQ:EST:WORK:ESTIMATED:ENROLLMENT:EXP:EXPENCES:CONTRACT:MODULE:PROJECT_DESCRIPTION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(790509048289460364)
,p_plug_name=>'Module WorkType of Contract &P121_CONTRACT_DESC.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.e_name module, wt.e_name Work_type, ',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Net',
'from prj_projectwork_types ppt, prj_work_types wt, prj_modules m',
'where  ppt.wrktyp_id  =wt.id',
'and  m.code   = project_pck.get_project_module(ppt.proj_id)',
'and      ppt.proj_id in (select id from lgs_projects where contract_id = :P7_CONTRACT_ID)',
'group by m.e_name, wt.e_name',
'having sum(project_pck.get_project_work_estimate_num(ppt.id)) +',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) <> 0',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_SHOW_WHAT'
,p_plug_display_when_cond2=>'4'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(788509744714448589)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>788509744714448589
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263006502411113056)
,p_db_column_name=>'MODULE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263006955787113056)
,p_db_column_name=>'WORK_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Work type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263007319968113056)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estimated'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263007794600113056)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Enrollment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263008154552113057)
,p_db_column_name=>'NET'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(788691284756311730)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2630085'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULE:WORK_TYPE:ESTIMATED:ENROLLMENT:NET'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(790509410246465073)
,p_plug_name=>'Staff enrolled in &P121_CONTRACT_DESC.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select es.emp_name,',
'sum(ed.no_of_hours/project_param.get_hours_per_day) InHouse,',
'sum(on_site_days/project_param.get_hours_per_day) OnSite,',
'sum(ed.no_of_hours/project_param.get_hours_per_day)',
'+ sum(on_site_days/project_param.get_hours_per_day) Total,',
'sum((project_pck.get_emp_salary_to(ed.employee, ed.from_date)/project_param.get_months_per_day)*',
'(ed.no_of_hours+nvl(ed.on_site_days,0)*project_param.get_on_site_factor)/project_param.get_hours_per_day) Sal',
'from    PRJ_EMPLOYEE_SALARY es, prj_enrolled_dets ed',
'where es.emp_code = ed.employee',
'and   ed.PROJECT_WORKTYPE_ID in (select id from prj_projectwork_types',
'                               where proj_id in (select id from lgs_projects where contract_id=:P7_CONTRACT_ID))',
'group by es.emp_name'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_SHOW_WHAT'
,p_plug_display_when_cond2=>'3'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(788511782463453298)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>788511782463453298
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263003478204113051)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263003881989113052)
,p_db_column_name=>'INHOUSE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Inhouse'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263004227242113053)
,p_db_column_name=>'ONSITE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Onsite'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263004613305113053)
,p_db_column_name=>'TOTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(263005042320113054)
,p_db_column_name=>'SAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(788693375977316444)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2630054'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMP_NAME:INHOUSE:ONSITE:TOTAL:SAL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263005815942113054)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(790509410246465073)
,p_button_name=>'back3'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263008919927113057)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(790509048289460364)
,p_button_name=>'back4'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263012041116113059)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(790500485009472793)
,p_button_name=>'back1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263032989245349302)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(263032879638349301)
,p_button_name=>'testbutton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Testbutton'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263021168573113062)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(790506206871520192)
,p_button_name=>'back2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263021579895113062)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(790506206871520192)
,p_button_name=>'SHOWZEROS'
,p_button_static_id=>'SHOWZEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742723647243655)
,p_button_image_alt=>'Show Un-Used Items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_ZERO:1'
,p_button_condition=>'P7_ZERO'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263020761941113062)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(790506206871520192)
,p_button_name=>'DONOTSHOWSEROS'
,p_button_static_id=>'DONOTSHOWSEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742723647243655)
,p_button_image_alt=>'Hide Unused items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_ZERO:0'
,p_button_condition=>'P7_ZERO'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(263021974026113063)
,p_name=>'P7_ZERO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(790506206871520192)
,p_item_default=>'0'
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
