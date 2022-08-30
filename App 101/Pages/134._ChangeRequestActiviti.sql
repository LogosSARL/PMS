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

prompt --application/pages/delete_00134
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>134);
end;
/
prompt --application/pages/page_00134
begin
wwv_flow_api.create_page(
 p_id=>134
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'ChangeRequestActiviti'
,p_page_mode=>'NORMAL'
,p_step_title=>'ChangeRequestActiviti'
,p_step_sub_title=>'ChangeRequestActiviti'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#CR.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-md-4{',
'width:250%',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190102082623'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(837907074479978403)
,p_plug_name=>'All Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
' cursor c1 is SELECT clob001 ',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION'';',
'    BEGIN',
'    open c1;',
'    FETCH c1 INTO :P134_ALL_TASKS_JSON;',
'',
'   if c1%notfound then',
'      null;',
'   end if;',
'',
'   CLOSE c1;',
'      apex_json.parse(:P134_ALL_TASKS_JSON);',
'',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">owner</th>',
'            ',
'            <th class="t15header">assignee</th>',
'            <th class="t15header">name</th>',
'            <th class="t15header">description</th>',
'            <th class="t15header">createTime</th>',
'            <th class="t15header">dueDate</th>',
'            <th class="t15header"> </th>',
'            <th class="t15header"> </th>',
'            '');',
'     ',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'',
'      htp.p(''<tr>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].owner'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].assignee'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].description'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].createTime'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].dueDate'', p0 => i),''test'')||''</td>'');',
'                  htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':133''||'':''||V(''APP_SESSION'')||''::NO:RP:P134_TASK_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||''">TASK-INFO</a></td>'');',
'                   htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(837345186852875100)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_api.id(837907074479978403)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'temp_v varchar2(200);',
'',
'cursor c1(name_v varchar2) is ',
'select FILENAME',
' from wwv_flow_file_objects$ where NAME = name_v;',
' ',
'    BEGIN',
'      apex_json.parse(:P134_ALL_ATTACHED_FILES);',
'      htp.p(''<div><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">location</th>',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''attachedFiles'')',
'      LOOP',
'      name_V := apex_json.get_varchar2( p_path => ''attachedFiles[%d].name'', p0 => i);',
'',
'     open c1(name_v);',
'     fetch c1 into temp_v;',
'     close c1;',
'     -- select FILENAME into temp_v',
'',
'       --          from wwv_flow_file_objects$ where NAME = name_v;',
'      htp.p(''<tr>'');',
'          htp.p(''<td>''||temp_v||''</td>'');',
'        htp.p(''<td><a href="f?p=''||V(''APP_ID'')||'':135''||'':''||V(''APP_SESSION'')||''::::P135_FILE_NAME:''||name_V||''"> link </a><td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table> </div>'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(837345576854875104)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_api.id(837907074479978403)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P134_EXECUTION_ID||''/diagram'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    p_clob CLOB;',
'    l_raw            RAW(32767);',
'  begin',
'  DBMS_LOB.createtemporary(p_clob, FALSE);',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic YWxhYTphbGFh''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'      UTL_HTTP.read_raw(l_resp, l_raw, 12000);',
'      p_clob := p_clob || UTL_RAW.cast_to_varchar2(UTL_ENCODE.base64_encode(l_raw));',
'      -- utl_http.read_text(l_resp, l_text, 32766);',
'     -- APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'        htp.p(''<img src="data:image/png;base64,''||p_clob||''" alt="Site Logo"/>'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(849343310998749591)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_api.id(837907074479978403)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'    BEGIN',
'      apex_json.parse(:P134_TASK_INFO);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''formProperties''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            '');',
'      select apex_json.get_count(p_path   => ''formProperties'') into :P134_FORM_COUNT from dual;',
'      FOR i IN 1..apex_json.get_count(p_path   => ''formProperties'')',
'      LOOP',
'      name_V := apex_json.get_varchar2( p_path => ''formProperties[%d].id'', p0 => i);',
'      htp.p(''<tr>'');',
'          htp.p(''<td style="display:none">''||name_V||''</td>'');',
'          htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''formProperties[%d].name'', p0 => i),''test'')||''</td>'');',
'          type_v := apex_json.get_varchar2( p_path => ''formProperties[%d].type'', p0 => i);',
'        if type_v <> ''enum'' then htp.p(''<td> <input type="text" id="''||name_V||''" value="''||apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => i)||''"></input></td>'');',
'        else htp.p(''<td> <select id="''||name_V||''">'');',
'             FOR j IN 1..apex_json.get_count(p_path   => ''formProperties[%d].enumValues'',p0=>i)',
'                    LOOP',
'                     htp.p(''<option value="''||apex_json.get_varchar2( p_path => ''formProperties[%d].enumValues[%d].id'', p0 => i,p1=>j)||''">''||apex_json.get_varchar2( p_path => ''formProperties[%d].enumValues[%d].name'', p0 => i,p1=>j)||''</option>'');   '
||'     ',
'                  end loop;',
'        end if;',
'        htp.p(''<script>FormArray.push({"name":''||name_V||'',value:""});</script>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(849527194514125311)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_api.id(837907074479978403)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'htp.p(''<button onclick="apex.submit()">Attach Files</button>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(285187525774789219)
,p_button_sequence=>650
,p_button_plug_id=>wwv_flow_api.id(837907074479978403)
,p_button_name=>'Change_Request'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Change request'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279752867288526507)
,p_name=>'P134_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279752907680526508)
,p_name=>'P134_DATES_AND_RATES_EXPECTED_DELIVERY_NUMBER_OF_DAYS'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Expected Delivery Number of Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753168145526510)
,p_name=>'P134_DATES_AND_RATES_IN_HOUSE_RATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'In House Rate'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753299021526511)
,p_name=>'P134_DATES_AND_RATES_REFERENCE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Reference'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753384813526512)
,p_name=>'P134_DATES_AND_RATES_DESCRIPTION'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753480521526513)
,p_name=>'P134_DATES_AND_RATES_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Expected Delivery Date'
,p_format_mask=>'DD-MM-YY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753531378526514)
,p_name=>'P134_DATES_AND_RATES_DATE_RAISED'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Date Raised'
,p_format_mask=>'DD-MON-RR'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753674040526515)
,p_name=>'P134_ACCOUNT_MANAGER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753703586526516)
,p_name=>'P134_IS_INVOICED'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Is Invoiced'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753880675526517)
,p_name=>'P134_IN_SCOPE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'In Scope'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_INSCOPE_LOV'
,p_lov=>'.'||wwv_flow_api.id(1976550784535947)||'.'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279753977448526518)
,p_name=>'P134_APPROVAL_DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754014706526519)
,p_name=>'P134_LOGOS_BRANCHES'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Logos Branches'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOGOS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  LLB_DESC as d,',
'       LLB_ID as r',
'  from LGS_LOGOS_BRANCHES',
' order by 2'))
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754119003526520)
,p_name=>'P134_OFFER_STATUS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754252663526521)
,p_name=>'P134_INTERNAL_CLASSIFICATION'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Internal Classification'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pic_desc,pic_id',
'from prj_internal_classification',
'order by 2'))
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754360377526522)
,p_name=>'P134_PARENT_CONTRACT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Parent Contract'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where COMPANY_CODE = :P134_CLIENT',
'and usage_type = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P134_CLIENT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754476323526523)
,p_name=>'P134_PROJECT_NAME'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Project Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754505794526524)
,p_name=>'P134_DESCRIPTION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754618394526525)
,p_name=>'P134_WHO_CREATED'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Who Created'
,p_source=>'&APP_USER.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754787321526526)
,p_name=>'P134_CONTRACT_STAGE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279754824266526527)
,p_name=>'P134_CONTRACT_TYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Contract Type'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME,ID ||''-'' || NAME',
'from PRJ_CONTRACT_TYPES',
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
 p_id=>wwv_flow_api.id(279754956207526528)
,p_name=>'P134_FINALIZED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755043912526529)
,p_name=>'P134_END_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'End Date'
,p_format_mask=>'DD-MM-YY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755184014526530)
,p_name=>'P134_START_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Start Date'
,p_format_mask=>'DD-MM-YY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755286379526531)
,p_name=>'P134_CLIENT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'CLIENT'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code||''-''|| e_name  r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
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
 p_id=>wwv_flow_api.id(279755374650526532)
,p_name=>'P134_INTEGRATION_CODE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Integration Code'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755480253526533)
,p_name=>'P134_PRODUCT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'PRODUCT'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select pgr_code, pgr_code from prj_groups order by 1'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755588728526534)
,p_name=>'P134_FINANCIALOFFER_DAYSPERTICKET'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755618390526535)
,p_name=>'P134_DATES_AND_RATES_ON_SITE_RATE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'On Site Rate'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755772655526536)
,p_name=>'P134_FINANCIALOFFER_INTERNATIONAL'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755832609526537)
,p_name=>'P134_FINANCIALOFFER_CARRENTALPERDAY'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279755970905526538)
,p_name=>'P134_FINANCIALOFFER_HOTELRATE'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756076631526539)
,p_name=>'P134_FINANCIALOFFER_TICKETVALUE'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756139393526540)
,p_name=>'P134_FINANCIALOFFER_PERDIUM'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756291304526541)
,p_name=>'P134_FINANCIALOFFER_OTHEREXPENSESONCLIENT'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Other Expenses on Client'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756370167526542)
,p_name=>'P134_FINANCIALOFFER_WARRANTYMONTH'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Warranty Month'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756445290526543)
,p_name=>'P134_FINANCIALOFFER_VALUEINMAINTENANCE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Value In Maintenance'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756500955526544)
,p_name=>'P134_FINANCIALOFFER_AMOUNTINCLUDEDVATLL'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Amount Included VAT (LBP)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756634766526545)
,p_name=>'P134_FINANCIALOFFER_AMOUNTINCLUDEDVATUSD'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Amount Included VAT (USD)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756785546526546)
,p_name=>'P134_FINANCIALOFFER_VATVALUE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'VAT Value'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756861860526547)
,p_name=>'P134_FINANCIALOFFER_FINALAMOUNT'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Final Amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279756976183526548)
,p_name=>'P134_FINANCIALOFFER_DISCOUNTINAMOUNT'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Discount In Amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279757085122526549)
,p_name=>'P134_FINANCIALOFFER_DISCOUNTINDAYS'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Discount In Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279757103783526550)
,p_name=>'P134_FINANCIALOFFER_INITIALAMOUNT'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Initial Amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285167387648574787)
,p_name=>'P134_ALL_TASKS_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285167785443574788)
,p_name=>'P134_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285168127145574788)
,p_name=>'P134_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285168553962574789)
,p_name=>'P134_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285168981641574789)
,p_name=>'P134_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285169306879574789)
,p_name=>'P134_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285169703235574789)
,p_name=>'P134_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285170710867574792)
,p_name=>'P134_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(849527194514125311)
,p_prompt=>'Attach File To Task'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285171414151574792)
,p_name=>'P134_DIAGRAM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(837345576854875104)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285185795528789201)
,p_name=>'P134_FINANCIALOFFER_APPLICENSE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'App License'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285185844582789202)
,p_name=>'P134_FINANCIALOFFER_ORACLELICENSE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Oracle License'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285185937573789203)
,p_name=>'P134_FINANCIALOFFER_ATSITEINITIALAMOUNT'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'At Site Initial Amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186073769789204)
,p_name=>'P134_FINANCIALOFFER_ATSITEINVOICEDDAYS'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'At Site Invoiced Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186131223789205)
,p_name=>'P134_FINANCIALOFFER_INVOICEDDAYS'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Invoiced Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186253502789206)
,p_name=>'P134_FINANCIALOFFER_IN_HOUSE_INITIAL_AMOUNT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'In House Initial Amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186369713789207)
,p_name=>'P134_FINANCIALOFFER_INHOUSEINVOICEDDAYS'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'In House Invoiced Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186425314789208)
,p_name=>'P134_FINANCIALOFFER_CLIENTSIGNATUREDATE'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Client Signature Date'
,p_format_mask=>'DD-MM-YY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186532587789209)
,p_name=>'P134_FINANCIALOFFER_CLIENTSIGNATURE'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Client Signature'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186676018789210)
,p_name=>'P134_FINANCIALOFFER_LOGOSSIGNATUREDATE'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Logos Signature Date'
,p_format_mask=>'DD-MM-YY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186780025789211)
,p_name=>'P134_FINANCIALOFFER_LOGOSSIGNATURE'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Logos Signature'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186842666789212)
,p_name=>'P134_FINANCIALOFFER_REMARKS'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Remarks'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285186949093789213)
,p_name=>'P134_FINANCIALOFFER_PAYMENTTERM'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Payment Term'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(285187452734789218)
,p_name=>'P134_PROJECT_MANAGER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_prompt=>'Project Manager'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select emp_name,EMP_CODE from SECURITY_GROUPS where PGR_CODE=:P134_PRODUCT',
'and emp_title like ''%PROJECT_MANAGER%'''))
,p_lov_cascade_parent_items=>'P134_PRODUCT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286092976211795708)
,p_name=>'P134_PROCESS_DEF_ID'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286096777231795746)
,p_name=>'P134_USER_ROLE'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_api.id(837907074479978403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(285174953219574805)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P134_FILE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285175436723574806)
,p_event_id=>wwv_flow_api.id(285174953219574805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P134_TASK_ID")+''/attachments'';',
'const data = {',
'             "name" : $v("P134_FILE_NAME")',
'        };',
'console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {async: false,',
'      success: function (pData) {             // Success Javascript',
'           alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'    $s("P134_FILE",'''');',
'$s("P134_FILE_NAME",'''');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(285187056101789214)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P134_PARENT_CONTRACT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285187102092789215)
,p_event_id=>wwv_flow_api.id(285187056101789214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P134_PARENT_CONTRACT'
,p_attribute_03=>'P134_PARENT_CONTRACT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(285187251733789216)
,p_name=>'New_2'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P134_LOGOS_BRANCHES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285187353196789217)
,p_event_id=>wwv_flow_api.id(285187251733789216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' if ($(''#P134_LOGOS_BRANCHES'').val() == 1){',
'   $(''#P134_VAT_VALUE'').val(11);',
'}',
'if ($(''#P134_LOGOS_BRANCHES'').val() == 2){',
'   $(''#P134_VAT_VALUE'').val(0);',
'}',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(285188017769789224)
,p_name=>'New_3'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(285187525774789219)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285188199912789225)
,p_event_id=>wwv_flow_api.id(285188017769789224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'initiateInstance($v("P134_USER_ROLE"));'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(285188288099789226)
,p_name=>'New_4'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P134_TASK_ID'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285188345074789227)
,p_event_id=>wwv_flow_api.id(285188288099789226)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P134_TASK_ID")+''/variables'';',
'	   var testData = [',
'   {',
'      "name":"FinancialOffer_InvoicedDays",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_INVOICEDDAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_ATSITEINVOICEDDAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_ATSITEINITIALAMOUNT"))',
'   },',
'           {',
'      "name":"FinancialOffer_OracleLicense",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_ORACLELICENSE"))',
'   },',
'   {',
'      "name":"FinancialOffer_AppLicense",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_APPLICENSE"))',
'   },',
'   {',
'      "name":"FinancialOffer_InitialAmount",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_INITIALAMOUNT"))',
'   },',
'   {',
'      "name":"FinancialOffer_DiscountInDays",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_DISCOUNTINDAYS"))',
'   },',
'           {',
'      "name":"FinancialOffer_DiscountInAmount",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_DISCOUNTINAMOUNT"))',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'      success: function (pData) { ',
'        alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285188464431789228)
,p_event_id=>wwv_flow_api.id(285188288099789226)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P134_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"FinancialOffer_FinalAmount",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_FINALAMOUNT"))',
'   },{',
'      "name":"FinancialOffer_VATValue",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_VATVALUE"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatUSD",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_AMOUNTINCLUDEDVATUSD"))',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatLL",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_AMOUNTINCLUDEDVATLL"))',
'   },{',
'      "name":"FinancialOffer_WarrantyMonth",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_WARRANTYMONTH"))',
'   },{',
'      "name":"FinancialOffer_ValueInMaintenance",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_VALUEINMAINTENANCE"))',
'   },{',
'      "name":"FinancialOffer_OtherExpensesOnClient",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_OTHEREXPENSESONCLIENT"))',
'   },{',
'      "name":"FinancialOffer_PaymentTerm",',
'      "type":"long",',
'      "value":parseInt($v("P134_FINANCIALOFFER_PAYMENTTERM"))',
'   },{',
'      "name":"FinancialOffer_Remarks",',
'      "type":"string",',
'      "value":$v("P134_FINANCIALOFFER_REMARKS")',
'   },{',
'      "name":"FinancialOffer_LogosSignature",',
'      "type":"string",',
'      "value":$v("P134_FINANCIALOFFER_LOGOSSIGNATURE")',
'   },{',
'      "name":"FinancialOffer_LogosSignatureDate",',
'      "type":"string",',
'      "value":$v("P134_FINANCIALOFFER_LOGOSSIGNATUREDATE")',
'   },{',
'      "name":"FinancialOffer_ClientSignature",',
'      "type":"string",',
'      "value":$v("P134_FINANCIALOFFER_CLIENTSIGNATURE")',
'   },{',
'      "name":"FinancialOffer_ClientSignatureDate",',
'      "type":"string",',
'      "value":$v("P134_FINANCIALOFFER_CLIENTSIGNATUREDATE")',
'   }',
'   ',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'      success: function (pData) { ',
'            alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(285190326087789247)
,p_event_id=>wwv_flow_api.id(285188288099789226)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P134_TASK_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"usertask3_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask4_approved",',
'      "type":"string",',
'      "value":null',
'   },{',
'      "name":"usertask12_approved",',
'      "type":"string",',
'      "value":null',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'      success: function (pData) { ',
'             alert(pData);',
'          $s("P134_TASK_ID","");',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285172536646574804)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P134_FILE := '''';',
':P134_FILE_NAME := '''';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286096825746795747)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_USER_ROLE'
,p_process_sql_clob=>':P134_USER_ROLE := nvl(:P134_USER_ROLE,:USER_ROLE);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285174158441574805)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_INFO_COLLECTION'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TASK_INFO_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''ATTACHED_FILES_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''ATTACHED_FILES_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''INBOX_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''INBOX_COLLECTION'');',
'end if;',
'         ',
'                                      ',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''INBOX_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''INBOX_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_INFO_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_INFO_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''ATTACHED_FILES_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''ATTACHED_FILES_COLLECTION''); end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285172147953574803)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getAllUnassignedUserTasksPerRole'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks?unassigned=true&candidateGroup=sales'';--||:P0_USER_ROLE;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'   ',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''INBOX_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    ',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285173737897574804)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_INFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/form/form-data?taskId=''||:P134_TASK_ID;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic YWxhYTphbGFh''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TASK_INFO_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    SELECT clob001 into :P134_TASK_INFO',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_INFO_COLLECTION'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P134_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285172972157574804)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_ALL_ATTACHED_FILES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/tasks/''||:P134_TASK_ID||''/attachments'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic YWxhYTphbGFh''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    SELECT clob001 into :P134_ALL_ATTACHED_FILES',
'FROM APEX_collections',
'WHERE collection_name = ''ATTACHED_FILES_COLLECTION'';',
'',
':P134_ALL_ATTACHED_FILES := ''{ "attachedFiles" :''||:P134_ALL_ATTACHED_FILES||''}'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P134_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285173331037574804)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROCESS_DIAGRAM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P134_EXECUTION_ID||''/diagram'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic YWxhYTphbGFh''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        :P134_DIAGRAM := l_text;-- APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(285174536173574805)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>':P134_FILE_NAME := :P134_FILE;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
