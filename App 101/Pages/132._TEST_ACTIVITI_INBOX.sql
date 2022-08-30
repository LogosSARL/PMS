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

prompt --application/pages/delete_00132
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>132);
end;
/
prompt --application/pages/page_00132
begin
wwv_flow_api.create_page(
 p_id=>132
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'TEST_ACTIVITI_INBOX'
,p_page_mode=>'NORMAL'
,p_step_title=>'TEST_ACTIVITI_INBOX'
,p_step_sub_title=>'TEST_ACTIVITI_INBOX'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var FormArray = [];',
'function CollectFormData() {',
'    const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P132_TASK_ID");',
'const data = {',
'             "action" : "complete",',
'              "variables" : [',
'                          	',
'  ]',
'        };',
'    for(var i = 0 ; i < FormArray.length ; i++){',
'        FormArray[i].value = $("#"+FormArray[i].name.id).val();',
'        FormArray[i].name = FormArray[i].name.id;',
'        data.variables.push(FormArray[i]);',
'    }',
'    console.log(JSON.stringify(data));',
'    const otherParam ={',
'        headers: {',
'        //    ''Access-Control-Allow-Origin'':''*'',',
'      // ''Access-Control-Allow-Methods'': ''POST'',',
'     //  ''Access-Control-Max-Age'': ''1000'',',
'      ''Authorization'': ''Basic a2VybWl0Omtlcm1pdA=='',',
'       ''Content-Type'':''application/json''',
'        },',
'        body:data,',
'        method:''POST''',
'    };',
'    apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {',
'       async: false,',
'      success: function (pData) {             // Success Javascript',
'       alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'     $s(''P132_TASK_ID'','''');',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*function postFormData() { ',
'',
'}*/',
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
,p_last_upd_yyyymmddhh24miss=>'20190104093449'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(559483551786929941)
,p_plug_name=>'INBOX'
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
'    BEGIN',
'      apex_json.parse(:P132_ALL_TASKS_JSON);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''data''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Owner</th>',
'            ',
'            <th class="t15header">Assignee</th>',
'            <th class="t15header">Name</th>',
'             <th class="t15header">Description</th>',
'             <th class="t15header">Time Created</th>',
'             <th class="t15header">Due Date</th>',
'             <th class="t15header">Priority</th>',
'              ',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'      htp.p(''<tr>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].owner'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].assignee'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].description'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td id="date''||i||''"></td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].dueDate'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].priority'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':131''||'':''||V(''APP_SESSION'')||''::NO:RP:P132_TASK_ID,P132_EXECUTION_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'',''||apex_json.get_varchar2( p_path => ''data[%d].e'
||'xecutionId'', p0 => i)||''">DETAILS</a></td>'');',
'                  -- htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'             htp.p(''<td style="padding-left:10px"><a href="http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||apex_json.get_varchar2( p_path => ''data[%d].executionId'', p0 => i)||''/diagram" target="_BLANK">DIAGRAM</a></td>'');',
'             htp.p(''<script>var s = new Date("''||apex_json.get_varchar2( p_path => ''data[%d].createTime'', p0 => i)||''").toLocaleString("en-GB");',
'                   $("#date''||i||''").text(s);</script>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'exception when others then htp.p(''there are currently no tasks'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(558921664159826638)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_api.id(559483551786929941)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
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
'      apex_json.parse(:P132_ALL_ATTACHED_FILES);',
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
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_TASK_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(558922054161826642)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_api.id(559483551786929941)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P132_EXECUTION_ID||''/diagram'';',
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
 p_id=>wwv_flow_api.id(570919788305701129)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_api.id(559483551786929941)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'',
'    BEGIN',
'      apex_json.parse(:P132_TASK_INFO);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''formProperties''));',
'      htp.p(''<div class="col-md-2" style="float:left; margin-right:20px;"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            '');',
'     :P132_PRODUCT := apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 1);',
'      FOR i IN 1..apex_json.get_count(p_path   => ''formProperties'')',
'      LOOP',
'      if i = 22 then htp.p(''</table></div>''); htp.p(''<div class="col-md-2" style="float:left"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>'');end if;',
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
'--htp.p(''<button id="submitTaskForm" onclick="CollectFormData()">Submit Form</button>'');',
'htp.p(''<button id="submitTaskForm" onclick="return false;" >Submit Form</button>'');',
'exception when others then htp.p(''there are currently no tasks'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_TASK_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(571103671821076849)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_api.id(559483551786929941)
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
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_TASK_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583015727639648911)
,p_plug_name=>'Reassign Task'
,p_parent_plug_id=>wwv_flow_api.id(559483551786929941)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_TASK_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1130078365812155869)
,p_plug_name=>'QUEUE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>50
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
'WHERE collection_name = ''UNASSIGNED_INBOX_COLLECTION'';',
'    BEGIN',
'    open c1;',
'    FETCH c1 INTO :P132_ALL_TASKS_JSON_QUEUE;',
'',
'   if c1%notfound then',
'      return;',
'   end if;',
'',
'   CLOSE c1;',
'      apex_json.parse(:P132_ALL_TASKS_JSON_QUEUE);',
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
'                  htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':131''||'':''||V(''APP_SESSION'')||''::NO:RP:P132_TASK_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||''">TASK-INFO</a></td>'');',
'                   htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1129516478185052566)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_api.id(1130078365812155869)
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
'      apex_json.parse(:P132_QUEUE_ALL_ATTACHED_FILES);',
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
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_QUEUE_TASK_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1129516868187052570)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P132_EXECUTION_ID||''/diagram'';',
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
 p_id=>wwv_flow_api.id(1141514602330927057)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_api.id(1130078365812155869)
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
'      apex_json.parse(:P132_QUEUE_TASK_INFO);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''formProperties''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            '');',
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
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_QUEUE_TASK_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1141698485846302777)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_api.id(1130078365812155869)
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
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P132_QUEUE_TASK_ID'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(291870942385988726)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(583015727639648911)
,p_button_name=>'Reassign'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Reassign'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291859926434988714)
,p_name=>'P132_ALL_TASKS_JSON_QUEUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291860324452988716)
,p_name=>'P132_QUEUE_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291860708255988717)
,p_name=>'P132_QUEUE_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291861176207988717)
,p_name=>'P132_QUEUE_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291861588652988718)
,p_name=>'P132_QUEUE_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291861976084988718)
,p_name=>'P132_QUEUE_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291862384300988718)
,p_name=>'P132_QUEUE_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1130078365812155869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291863336902988720)
,p_name=>'P132_QUEUE_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1141698485846302777)
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
 p_id=>wwv_flow_api.id(291864325309988721)
,p_name=>'P132_DIAGRAM_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1129516868187052570)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291865009668988721)
,p_name=>'P132_ALL_TASKS_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291865452111988722)
,p_name=>'P132_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291865848336988722)
,p_name=>'P132_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291866264297988722)
,p_name=>'P132_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291866630654988722)
,p_name=>'P132_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291867068668988722)
,p_name=>'P132_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291867473944988722)
,p_name=>'P132_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291867895532988722)
,p_name=>'P132_TASKS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291868212500988722)
,p_name=>'P132_PRODUCT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(559483551786929941)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291869252677988724)
,p_name=>'P132_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(571103671821076849)
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
 p_id=>wwv_flow_api.id(291869940342988725)
,p_name=>'P132_DIAGRAM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(558922054161826642)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(291871391382988728)
,p_name=>'P132_NEW_ASSIGNEE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(583015727639648911)
,p_prompt=>'New assignee'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select EMP_NAME,emp_code from security_groups where pgr_code like :P132_PRODUCT'
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(291881519192988738)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P132_FILE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291882026681988738)
,p_event_id=>wwv_flow_api.id(291881519192988738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P132_TASK_ID")+''/attachments'';',
'const data = {',
'             "name" : $v("P132_FILE_NAME")',
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
'    $s("P132_FILE",'''');',
'$s("P132_FILE_NAME",'''');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(291877169829988734)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#submitTaskForm'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291878140589988735)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'   {',
'      "name":"Client",',
'      "type":"string",',
'      "value":$("#Client").val()',
'   },',
'           {',
'      "name":"IntegrationCode",',
'      "type":"string",',
'      "value":$("#IntegrationCode").val()',
'   },',
'           {',
'      "name":"StartDate",',
'      "type":"string",',
'      "value":$("#StartDate").val()',
'   },',
'           {',
'      "name":"EndDate",',
'      "type":"string",',
'      "value":$("#EndDate").val()',
'   },',
'   {',
'      "name":"ContractType",',
'      "type":"string",',
'      "value":$("#ContractType").val()',
'   },',
'   {',
'      "name":"WhoCreated",',
'      "type":"string",',
'      "value":$("#WhoCreated").val()',
'   },',
'   {',
'      "name":"Description",',
'      "type":"string",',
'      "value":$("#Description").val()',
'   },',
'           {',
'      "name":"ProjectName",',
'      "type":"string",',
'      "value":$("#ProjectName").val()',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291878667342988735)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'   {',
'      "name":"ParentContract",',
'      "type":"string",',
'      "value":$("#ParentContract").val()',
'   },',
'           {',
'      "name":"InternalClassification",',
'      "type":"string",',
'      "value":$("#InternalClassification").val()',
'   },',
'           {',
'      "name":"LogosBranches",',
'      "type":"string",',
'      "value":$("#LogosBranches").val()',
'   },',
'           {',
'      "name":"InScope",',
'      "type":"string",',
'      "value":$("#InScope").val()',
'   },',
'   {',
'      "name":"DatesAndRates_DateRaised",',
'      "type":"string",',
'      "value":$("#DatesAndRates_DateRaised").val()',
'   },',
'   {',
'      "name":"DatesAndRates_ExpectedDeliveryDate",',
'      "type":"string",',
'      "value":$("#DatesAndRates_ExpectedDeliveryDate").val()',
'   },',
'           {',
'      "name":"DatesAndRates_Description",',
'      "type":"string",',
'      "value":$("#DatesAndRates_Description").val()',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291879169883988736)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'   {',
'      "name":"DatesAndRates_ExpectedDeliveryNumberOfDays",',
'      "type":"string",',
'      "value":$("#DatesAndRates_ExpectedDeliveryNumberOfDays").val()',
'   },',
'           {',
'      "name":"DatesAndRates_Reference",',
'      "type":"string",',
'      "value":$("#DatesAndRates_Reference").val()',
'   },',
'           {',
'      "name":"DatesAndRates_InHouseRate",',
'      "type":"long",',
'      "value":parseInt($("#DatesAndRates_InHouseRate").val())',
'   },',
'           {',
'      "name":"DatesAndRates_OnSiteRate",',
'      "type":"long",',
'      "value":parseInt($("#DatesAndRates_OnSiteRate").val())',
'   },',
'   {',
'      "name":"FinancialOffer_InHouseInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InHouseInvoicedDays").val())',
'   },',
'   {',
'      "name":"FinancialOffer_InHouseInitialAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InHouseInitialAmount").val())',
'   },',
'           {',
'      "name":"FinancialOffer_InvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InvoicedDays").val())',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291880130262988737)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'   {',
'      "name":"FinancialOffer_InvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InvoicedDays").val())',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_AtSiteInvoicedDays").val())',
'   },',
'           {',
'      "name":"FinancialOffer_AtSiteInitialAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_AtSiteInitialAmount").val())',
'   },',
'           {',
'      "name":"FinancialOffer_OracleLicense",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_OracleLicense").val())',
'   },',
'   {',
'      "name":"FinancialOffer_AppLicense",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_AppLicense").val())',
'   },',
'   {',
'      "name":"FinancialOffer_InitialAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InitialAmount").val())',
'   },',
'   {',
'      "name":"FinancialOffer_DiscountInDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_DiscountInDays").val())',
'   },',
'           {',
'      "name":"FinancialOffer_DiscountInAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_DiscountInAmount").val())',
'   }',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291879621633988736)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'           {',
'      "name":"FinancialOffer_FinalAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_FinalAmount").val())',
'   },{',
'      "name":"FinancialOffer_VATValue",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_VATValue").val())',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatUSD",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_AmountIncludedVatUSD").val())',
'   },{',
'      "name":"FinancialOffer_AmountIncludedVatLL",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_AmountIncludedVatLL").val())',
'   },{',
'      "name":"FinancialOffer_WarrantyMonth",',
'      "type":"long",',
'      "value":parseInt($("#P134_FINANCIALOFFER_WARRANTYMONTH").val())',
'   },{',
'      "name":"FinancialOffer_ValueInMaintenance",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_ValueInMaintenance").val())',
'   },{',
'      "name":"FinancialOffer_OtherExpensesOnClient",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_OtherExpensesOnClient").val())',
'   },{',
'      "name":"FinancialOffer_PaymentTerm",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_PaymentTerm").val())',
'   },{',
'      "name":"FinancialOffer_Remarks",',
'      "type":"string",',
'      "value":$("#FinancialOffer_Remarks").val()',
'   },{',
'      "name":"FinancialOffer_LogosSignature",',
'      "type":"string",',
'      "value":$("#FinancialOffer_LogosSignature").val()',
'   },{',
'      "name":"FinancialOffer_LogosSignatureDate",',
'      "type":"string",',
'      "value":$("#FinancialOffer_LogosSignatureDate").val()',
'   },{',
'      "name":"FinancialOffer_ClientSignature",',
'      "type":"string",',
'      "value":$("#FinancialOffer_ClientSignature").val()',
'   },{',
'      "name":"FinancialOffer_ClientSignatureDate",',
'      "type":"string",',
'      "value":$("#FinancialOffer_ClientSignatureDate").val()',
'   }',
'   ',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'        ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291881113419988738)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''+$v("P132_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'            {',
'      "name":"usertask3_approved",',
'      "type":"string",',
'      "value":$("#usertask3_approved").val()',
'   },{',
'      "name":"usertask4_approved",',
'      "type":"string",',
'      "value":$("#usertask4_approved").val()',
'   },{',
'      "name":"usertask12_approved",',
'      "type":"string",',
'      "value":$("#usertask12_approved").val()',
'   }',
'   ',
'];',
'console.log(JSON.stringify(testData));',
'	   apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'        ',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291877603294988735)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P132_TASK_ID");',
'	   var testData ={  "action" : "complete"};',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         // $s("P132_TASK_ID","");',
'         // apex.submit()',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291880665971988737)
,p_event_id=>wwv_flow_api.id(291877169829988734)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var testData = {',
'    "data":',
'        {',
'             "pipelineID":$("#pipelineID").val(),',
'             "IntegrationCode":$("#IntegrationCode").val(),',
'             "FinancialOffer_AmountIncludedVatUSD":$("#FinancialOffer_AmountIncludedVatUSD").val(),',
'             "FinancialOffer_AmountIncludedVatLL":$("#FinancialOffer_AmountIncludedVatLL").val(),',
'             "DatesAndRates_DateRaised":$("#DatesAndRates_DateRaised").val(),',
'             "DatesAndRates_Description":$("#DatesAndRates_Description").val(),',
'             "DatesAndRates_InHouseRate":$("#DatesAndRates_InHouseRate").val(),',
'             "DatesAndRates_OnSiteRate":$("#DatesAndRates_OnSiteRate").val(),',
'             "InScope":$("#InScope").val(),',
'             "FinancialOffer_InvoicedDays":$("#FinancialOffer_InvoicedDays").val(),',
'             "FinancialOffer_InitialAmount":$("#FinancialOffer_InitialAmount").val(),',
'             "FinancialOffer_DiscountInDays":$("#FinancialOffer_DiscountInDays").val(),',
'             "FinancialOffer_DiscountInAmount":$("#FinancialOffer_DiscountInAmount").val(),',
'             "FinancialOffer_VATValue":$("#FinancialOffer_VATValue").val(),',
'             "FinancialOffer_FinalAmount":$("#FinancialOffer_FinalAmount").val(),',
'             "DatesAndRates_ExpectedDeliveryDate":$("#DatesAndRates_ExpectedDeliveryDate").val(),',
'             "FinancialOffer_WarrantyMonth":$("#FinancialOffer_WarrantyMonth").val(),',
'             "FinancialOffer_ValueInMaintenance":$("#FinancialOffer_ValueInMaintenance").val(),',
'             "FinancialOffer_LogosSignature":$("#FinancialOffer_LogosSignature").val(),',
'             "FinancialOffer_LogosSignatureDate":$("#FinancialOffer_LogosSignatureDate").val(),',
'             "FinancialOffer_PaymentTerm":$("#FinancialOffer_PaymentTerm").val(),',
'             "FinancialOffer_Remarks":$("#FinancialOffer_Remarks").val(),',
'             "FinancialOffer_OtherExpensesOnClient":$("#FinancialOffer_OtherExpensesOnClient").val(),',
'             "FinancialOffer_ClientSignature":$("#FinancialOffer_ClientSignature").val(),',
'             "FinancialOffer_ClientSignatureDate":$("#FinancialOffer_ClientSignatureDate").val(),',
'             "DatesAndRates_ExpectedDeliveryNumberOfDays":$("#DatesAndRates_ExpectedDeliveryNumberOfDays").val(),',
'             "FinancialOffer_AppLicense":$("#FinancialOffer_AppLicense").val(),',
'             "FinancialOffer_OracleLicense":$("#FinancialOffer_OracleLicense").val()',
'        }};  //',
'console.log(JSON.stringify(testData));',
'     apex.server.process(',
'    ''SYNC_LGS_CONTRACTS_ACTIVITI'',                             // Process or AJAX Callback name',
'    {x01:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          $s("P132_TASK_ID","");',
'          alert(pData);',
'        //  apex.submit();',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(291875740955988733)
,p_name=>'REASSIGN_EMP'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(291870942385988726)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291876242909988733)
,p_event_id=>wwv_flow_api.id(291875740955988733)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P132_TASK_ID");',
'const data = {',
'             "assignee" : $v("P132_NEW_ASSIGNEE")',
'        };',
'console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {async: false,',
'      success: function (pData) {             // Success Javascript',
'          // alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(291876745308988734)
,p_event_id=>wwv_flow_api.id(291875740955988733)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291871776175988730)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P132_FILE := '''';',
':P132_FILE_NAME := '''';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291873764298988731)
,p_process_sequence=>10
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
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''UNASSIGNED_INBOX_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''UNASSIGNED_INBOX_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TEST_TASK_INFO_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TEST_TASK_INFO_COLLECTION'');',
'end if;',
'     IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TEST_TASK_INFO_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TEST_TASK_INFO_COLLECTION''); end if;                                 ',
'                                      ',
'     IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''INBOX_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''INBOX_COLLECTION''); end if;                                 ',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_INFO_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_INFO_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''ATTACHED_FILES_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''ATTACHED_FILES_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''UNASSIGNED_INBOX_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''UNASSIGNED_INBOX_COLLECTION''); end if;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291874913199988731)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CLAIM_UNASSIGNED_TASKS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'Type task_id_array is ',
'    table of varchar2(20);',
'Type TASK_NAME_ARRAY is ',
'    table of varchar2(100);',
'Type EXEC_ID_ARRAY is ',
'    table of varchar2(100);',
'    task_id_array_v task_id_array;',
'    EXEC_ID_ARRAY_V EXEC_ID_ARRAY;',
'    index_v number := 0;',
'    TASK_NAME_ARRAY_V TASK_NAME_ARRAY;',
'    count_v number:= 0;',
'    k number:=1;',
'    resp_array_length number := 0;',
'cursor code is',
'    select emp_title from security_groups where emp_code = :APP_USER;',
'cursor prj is',
'    select LISTAGG(pgr_code,'', '') within group (order by 1)  from security_groups where emp_code = :APP_USER;',
'    content varchar2(3000);',
'l_url    varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/tasks?candidateGroups='';',
'l_req   utl_http.req;',
'l_resp  utl_http.resp;',
'l_text           varchar2(32767);',
'prjs_v varchar2(1000);',
'req_out clob;',
'task_req_out clob;',
'TASK_ID_V varchar2(10);',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'begin',
'TASK_NAME_ARRAY_v := TASK_NAME_ARRAY(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''9'',''0'',''11'',''12'',''13'',''14'',''15'',''15'',''17'',''18'',''1'',''9'',''1'',''2'',''3'',''1'',''2'',''4'',''1'',''2'',''3'',''4'',''6'',''7'',''7'');',
'task_id_array_v := task_id_array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''9'',''0'',''11'',''12'',''13'',''14'',''15'',''15'',''17'',''18'',''1'',''9'',''1'',''2'',''3'',''1'',''2'',''4'',''1'',''2'',''3'',''4'',''6'',''7'',''7'');',
'EXEC_ID_ARRAY_V :=EXEC_ID_ARRAY(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''9'',''0'',''11'',''12'',''13'',''14'',''15'',''15'',''17'',''18'',''1'',''9'',''1'',''2'',''3'',''1'',''2'',''4'',''1'',''2'',''3'',''4'',''6'',''7'',''7'');',
'    open code ;',
'        fetch code into :USER_ROLE;',
'        l_url := l_url || :USER_ROLE;',
'    close code;',
'   ',
'    open prj;',
'       fetch prj into prjs_v;',
'     close prj;',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        req_out := req_out || l_text;',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    apex_json.parse(req_out);',
'    count_v := apex_json.get_count(p_path   => ''data'');',
'     FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'       TASK_ID_V := apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i);',
'       TASK_NAME_ARRAY_v(i) := apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i);',
'       EXEC_ID_ARRAY_V(i) := apex_json.get_varchar2( p_path => ''data[%d].executionId'', p0 => i);',
'       task_id_array_v(i) := TASK_ID_V; ',
'       ',
'      END LOOP;',
'    ',
'      for i in 1..count_v',
'      loop',
'      insert into tareif (c1) values(task_id_array_v(i));commit;',
'          l_url := ''128.128.5.166:8080/activiti-rest/service/form/form-data?taskId=''||task_id_array_v(i);',
'          ',
'          l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'    task_req_out :='''';',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        task_req_out := task_req_out || l_text;',
'     end loop;',
'      ',
' ',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    apex_json.close_all;',
'      apex_json.parse(task_req_out);',
'      insert into tareif(c1) values(nvl(apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 3),''this''));commit;',
'      if instr(prjs_v,apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 1)) > 0 then',
'          ',
'          l_url := ''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''||task_id_array_v(i);',
'          ',
'          content := '' {',
'             "action" : "claim",',
'              "assignee" : "''||:APP_USER||''"',
'        }'';',
'        ',
'            l_req := utl_http.begin_request(l_url,  ''POST'','' HTTP/1.1'');',
'            utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); ',
'            utl_http.set_header(l_req, ''content-type'', ''application/json''); ',
'            utl_http.set_header(l_req, ''Content-Length'', length(content));',
'',
'            utl_http.write_text(l_req, content);',
'',
'            l_resp := utl_http.get_response(l_req);',
'              utl_http.end_response(l_resp);',
'            ',
'            update lgs_contracts set step = step||''-''||TASK_NAME_ARRAY_v(i), ACTIVITI_TASK_ID = EXEC_ID_ARRAY_V(i) where ID= apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 2);commit;',
'            if nvl(apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 3),'''') is not null then',
'                k := PROJECT_PCK.change_contact_approved_status(apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 2));',
'            end if;',
'       ',
' ',
'            end if;',
'      end loop;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291874575230988731)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TASK_INBOX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/tasks?assignee=''||:APP_USER;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    l_clob clob;',
'    Type TASK_ID_ARRAY is ',
'    table of varchar2(100);',
'    TASK_ID_ARRAY_V TASK_ID_ARRAY;',
'    l_count number := 0;',
'    TASK_ID_V varchar2(100);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'    TASK_ID_ARRAY_V := task_id_array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''9'',''0'',''11'',''12'',''13'',''14'',''15'',''15'',''17'',''18'',''1'',''9'',''1'',''2'',''3'',''1'',''2'',''4'',''1'',''2'',''3'',''4'',''6'',''7'',''7'');',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'       l_clob := l_clob ||l_text;',
'        ',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''INBOX_COLLECTION'',p_clob001 => l_clob);',
'    SELECT clob001 into :P132_ALL_TASKS_JSON',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION'';',
'apex_json.close_all;',
'apex_json.parse(:P132_ALL_TASKS_JSON);',
'      ',
'    ',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'           l_count := l_count + 1;',
'          TASK_ID_ARRAY_V(i) := apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i);',
'      END LOOP;',
' apex_json.close_all;     ',
'      FOR i in 1..l_count ',
'      loop',
'      begin',
'      l_url := ''128.128.5.166:8080/activiti-rest/service/form/form-data?taskId=''||TASK_ID_ARRAY_V(i);',
'      ',
'              l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'    ',
'       utl_http.read_text(l_resp, l_text, 32766);',
'       utl_http.end_response(l_resp);',
'       apex_json.parse(l_text);',
'       TASK_ID_V:= TASK_ID_ARRAY_V(i);',
'        FOR i IN 1..apex_json.get_count(p_path   => ''formProperties'')',
'      LOOP',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TEST_TASK_INFO_COLLECTION'',p_c001=>to_char(TASK_ID_V),p_c002 =>apex_json.get_varchar2( p_path => ''formProperties[%d].name'', p0 => i),p_c003 =>apex_json.get_varchar2( p_path => ''formProperties['
||'%d].value'', p0 => i));',
'       end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    end loop;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291875309196988732)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getAllUnassignedUserTasksPerRole'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks?candidateGroup=''||:USER_ROLE;',
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
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''UNASSIGNED_INBOX_COLLECTION'',p_clob001 => l_text);',
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
 p_id=>wwv_flow_api.id(291873392473988731)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_INFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/form/form-data?taskId=''||:P132_TASK_ID;',
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
'    SELECT clob001 into :P132_TASK_INFO',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_INFO_COLLECTION'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P132_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291872947016988730)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT clob001 into :P132_ALL_TASKS_JSON',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION'';',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291872185733988730)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_ALL_ATTACHED_FILES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/tasks/''||:P132_TASK_ID||''/attachments'';',
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
'    SELECT clob001 into :P132_ALL_ATTACHED_FILES',
'FROM APEX_collections',
'WHERE collection_name = ''ATTACHED_FILES_COLLECTION'';',
'',
':P132_ALL_ATTACHED_FILES := ''{ "attachedFiles" :''||:P132_ALL_ATTACHED_FILES||''}'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P132_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(291872549690988730)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROCESS_DIAGRAM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P132_EXECUTION_ID||''/diagram'';',
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
'        :P132_DIAGRAM := l_text;-- APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
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
 p_id=>wwv_flow_api.id(291874195320988731)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'cursor c1 is select * from wwv_flow_file_objects$ where NAME = :P132_FILE_NAME;',
'row_v wwv_flow_file_objects$%ROWTYPE;',
'begin',
'open c1;',
'fetch c1 into row_v;',
'insert into X_FILES (ID,FLOW_ID,NAME,FILENAME,TITLE,MIME_TYPE,DOC_SIZE,DAD_CHARSET,CREATED_BY,CREATED_ON,UPDATED_BY,UPDATED_ON,LAST_UPDATED,CONTENT_TYPE,BLOB_CONTENT,LANGUAGE,DESCRIPTION,FILE_CHARSET) VALUES',
'(row_v.ID,row_v.FLOW_ID,row_v.NAME,row_v.FILENAME,row_v.TITLE,row_v.MIME_TYPE,row_v.DOC_SIZE,row_v.DAD_CHARSET,row_v.CREATED_BY,row_v.CREATED_ON,row_v.UPDATED_BY,row_v.UPDATED_ON,row_v.LAST_UPDATED,row_v.CONTENT_TYPE,row_v.BLOB_CONTENT,row_v.LANGUAGE'
||',row_v.DESCRIPTION,row_v.FILE_CHARSET); commit;',
'close c1;',
':P132_FILE_NAME := :P132_FILE;',
'end;'))
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
