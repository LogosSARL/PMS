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

prompt --application/pages/delete_00059
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>59);
end;
/
prompt --application/pages/page_00059
begin
wwv_flow_api.create_page(
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Opportunities'
,p_page_mode=>'NORMAL'
,p_step_title=>'Opportunities'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190515120440'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(183271200834931647)
,p_plug_name=>'Opportunities'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '''' AS ROLES,',
'(select count(e.ops_id) from opp_scope e',
'where e.ops_opp_id = opp_id) as MODULE_CNT,',
'(select count(r.orl_opp_id) from opp_role r',
'where r.orl_opp_id = opp_id) as ROLE_CNT,',
'(select count(*)',
'from OPP_ACTIONS p ',
'where p.OAC_OPP_ID = opp_id) as ACTION_CNT,',
'(select max(p.oac_date)',
'from OPP_ACTIONS p ',
'where p.OAC_OPP_ID = opp_id) as ACTION_DATE,',
''''' as MODULES ,"OPP_ID", emp_name,',
'OPP_PROJECT_NAME,',
'OPP_CODE, ',
'"OPP_INIT_DATE",OPP_STAGE_STATUS,OPP_STAGE,OPP_BUDGET_AMOUNT,',
'OPP_BUDGET_STATUS,OPP_BUDGET_SOURCE,OPP_BUYER_NAME,OPP_OWNER_NAME,',
'OPP_IT_NAME,OPP_CHAMPION_NAME,OPP_CONSULTANT_NAME,OPP_CRY as Currencies,',
'"OPP_DESC",',
'"OPP_HOW_HEARD_ABOUT",',
'"OPP_WHY_ITS_IMP_FOR_LOGOS",',
'"OPP_REMARKS",',
'"OPP_CONTRACT_TYPE",',
'"OPP_CUSTOMER",',
'"OPP_ESTIMATED_TIME",',
'"OPP_ESTIMATED_COST",',
'''-'' as link,'''' AS PIPELINE,OPP_REFERENCE_TO_PIPELINE',
'from "#OWNER#"."OPPORTUNITIES", OPP_Role, prj_employee_salary',
'where GET_OPP_ASSIGNED_ROLE_FOR_EMP(opp_id, V(''APP_USER'')) > 0 ',
'and opp_id > 161',
'and orl_opp_id = opp_id',
'and orl_employee = emp_code',
'AND ORL_ROL_ID = 1',
'order by opp_init_date desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(183271659045931647)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:60:&APP_SESSION.::::P60_OPP_ID:#OPP_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>183271659045931647
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183271756453931648)
,p_db_column_name=>'OPP_ID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Opp Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183239105187880610)
,p_db_column_name=>'ROLES'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Roles'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP:P73_OPPID:#OPP_ID#'
,p_column_linktext=>'ROLES (#ROLE_CNT#)'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182541957565767117)
,p_db_column_name=>'PIPELINE'
,p_display_order=>40
,p_column_identifier=>'P'
,p_column_label=>'Pipeline'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_REFPIPELINE:#OPP_REFERENCE_TO_PIPELINE#'
,p_column_linktext=>'PIPELINE'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183272180249931649)
,p_db_column_name=>'OPP_INIT_DATE'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Initial Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183272939085931650)
,p_db_column_name=>'OPP_HOW_HEARD_ABOUT'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'How Heard About'
,p_column_html_expression=>'<span style="display:inline-block;width:200px">#OPP_HOW_HEARD_ABOUT#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183273385815931651)
,p_db_column_name=>'OPP_WHY_ITS_IMP_FOR_LOGOS'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Why Its Imp For Logos'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183272523072931650)
,p_db_column_name=>'OPP_DESC'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_html_expression=>'<span style="display:inline-block;width:400px">#OPP_DESC#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183273716850931652)
,p_db_column_name=>'OPP_REMARKS'
,p_display_order=>100
,p_column_identifier=>'F'
,p_column_label=>'Remarks'
,p_column_html_expression=>'<span style="display:inline-block;width:400px">#OPP_REMARKS#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183274158511931652)
,p_db_column_name=>'OPP_CONTRACT_TYPE'
,p_display_order=>110
,p_column_identifier=>'G'
,p_column_label=>'Contract Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(183453440086042798)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183274540614931653)
,p_db_column_name=>'OPP_CUSTOMER'
,p_display_order=>120
,p_column_identifier=>'H'
,p_column_label=>'Client'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183274999952931654)
,p_db_column_name=>'OPP_ESTIMATED_TIME'
,p_display_order=>130
,p_column_identifier=>'I'
,p_column_label=>'Estimated Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(183239296561880611)
,p_db_column_name=>'MODULES'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Modules'
,p_column_link=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP:P61_OPP_ID:#OPP_ID#'
,p_column_linktext=>'MODULES (#MODULE_CNT#)'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182440404056285609)
,p_db_column_name=>'LINK'
,p_display_order=>160
,p_column_identifier=>'M'
,p_column_label=>'Actions'
,p_column_link=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:RP:P65_OPP_ID:#OPP_ID#'
,p_column_linktext=>'Actions (#ACTION_CNT#)'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182442178871285626)
,p_db_column_name=>'OPP_PROJECT_NAME'
,p_display_order=>170
,p_column_identifier=>'N'
,p_column_label=>'Opp project name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182442280327285627)
,p_db_column_name=>'OPP_CODE'
,p_display_order=>180
,p_column_identifier=>'O'
,p_column_label=>'Opp code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182542000659767118)
,p_db_column_name=>'OPP_REFERENCE_TO_PIPELINE'
,p_display_order=>190
,p_column_identifier=>'Q'
,p_column_label=>'Opp reference to pipeline'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92408500174496506)
,p_db_column_name=>'OPP_STAGE_STATUS'
,p_display_order=>200
,p_column_identifier=>'R'
,p_column_label=>'Opp stage status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(100643766550364365)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92408626623496507)
,p_db_column_name=>'OPP_STAGE'
,p_display_order=>210
,p_column_identifier=>'S'
,p_column_label=>'Opp stage'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(100642610544354149)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92408739085496508)
,p_db_column_name=>'OPP_BUDGET_AMOUNT'
,p_display_order=>220
,p_column_identifier=>'T'
,p_column_label=>'Opp budget amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92408853472496509)
,p_db_column_name=>'OPP_BUDGET_STATUS'
,p_display_order=>230
,p_column_identifier=>'U'
,p_column_label=>'Opp budget status'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(100644655786379139)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92408965332496510)
,p_db_column_name=>'OPP_BUDGET_SOURCE'
,p_display_order=>240
,p_column_identifier=>'V'
,p_column_label=>'Opp budget source'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(100646588668388825)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409067147496511)
,p_db_column_name=>'OPP_BUYER_NAME'
,p_display_order=>250
,p_column_identifier=>'W'
,p_column_label=>'Opp buyer name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409100173496512)
,p_db_column_name=>'OPP_OWNER_NAME'
,p_display_order=>260
,p_column_identifier=>'X'
,p_column_label=>'Opp owner name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409267849496513)
,p_db_column_name=>'OPP_IT_NAME'
,p_display_order=>270
,p_column_identifier=>'Y'
,p_column_label=>'Opp it name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409341880496514)
,p_db_column_name=>'OPP_CHAMPION_NAME'
,p_display_order=>280
,p_column_identifier=>'Z'
,p_column_label=>'Opp champion name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409488245496515)
,p_db_column_name=>'OPP_CONSULTANT_NAME'
,p_display_order=>290
,p_column_identifier=>'AA'
,p_column_label=>'Opp consultant name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92409559085496516)
,p_db_column_name=>'OPP_ESTIMATED_COST'
,p_display_order=>300
,p_column_identifier=>'AB'
,p_column_label=>'Opp estimated cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92411406458496535)
,p_db_column_name=>'CURRENCIES'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Currencies'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110525950721614501)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Emp name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(156453217968521903)
,p_db_column_name=>'MODULE_CNT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Module cnt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(156453392194521904)
,p_db_column_name=>'ROLE_CNT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Role cnt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(156453484755521905)
,p_db_column_name=>'ACTION_CNT'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Action cnt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216083035720588218)
,p_db_column_name=>'ACTION_DATE'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Action date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(183292340403957323)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1832924'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OPP_DESC:OPP_CUSTOMER:OPP_STAGE:OPP_INIT_DATE:EMP_NAME:OPP_ESTIMATED_COST:MODULES:ROLES:PIPELINE:LINK:ACTION_DATE:OPP_REMARKS:OPP_HOW_HEARD_ABOUT:OPP_CONTRACT_TYPE:OPP_ESTIMATED_TIME:OPP_PROJECT_NAME:OPP_CODE:OPP_REFERENCE_TO_PIPELINE:OPP_BUDGET_AMOU'
||'NT:OPP_BUDGET_STATUS:OPP_BUDGET_SOURCE:OPP_BUYER_NAME:OPP_OWNER_NAME:OPP_IT_NAME:OPP_CHAMPION_NAME:OPP_CONSULTANT_NAME:MODULE_CNT:'
,p_sort_column_1=>'OPP_INIT_DATE'
,p_sort_direction_1=>'DESC NULLS LAST'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183275796681931655)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(183271200834931647)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:60'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183238770822880606)
,p_name=>'P59_OPP_OPS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(183271200834931647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(156455033242521921)
,p_name=>'Row_color'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(156455193782521922)
,p_event_id=>wwv_flow_api.id(156455033242521921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function(){',
'    var opp_ref_arr = $(''td[headers="C182542000659767118"]'');',
'    var pipeline_arr = $(''td[headers="C182541957565767117"]'');',
'    for(var i = 0 ; i < opp_ref_arr.length ; i ++) {',
'        if(opp_ref_arr[i].innerHTML != ''-'')',
'            $(pipeline_arr[i]).find(''a'').css(''color'', ''green'');',
'    }',
'});'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(156455673690521927)
,p_name=>'New'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(156455720302521928)
,p_event_id=>wwv_flow_api.id(156455673690521927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.widget.waitPopup();',
''))
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
