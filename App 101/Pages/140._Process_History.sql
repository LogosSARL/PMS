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

prompt --application/pages/delete_00140
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>140);
end;
/
prompt --application/pages/page_00140
begin
wwv_flow_api.create_page(
 p_id=>140
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Process History'
,p_page_mode=>'NORMAL'
,p_step_title=>'Process History'
,p_step_sub_title=>'Process History'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var FormArray = [];',
'function CollectFormData() {',
'    const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID");',
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
'     $s(''P131_TASK_ID'','''');',
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
,p_last_upd_yyyymmddhh24miss=>'20181227164025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286093119769795710)
,p_plug_name=>'New'
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
'      apex_json.parse(:P140_HISTORY);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''data''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">processDefinitionId</th>',
'            ',
'            <th class="t15header">startTime</th>',
'            <th class="t15header">endTime</th>',
'             <th class="t15header">durationInMillis</th>',
'             <th class="t15header">startUserId</th>',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'      ',
'      htp.p(''<tr>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].processDefinitionId'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].startTime'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].endTime'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].durationInMillis'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].startUserId'', p0 => i),''test'')||''</td>'');',
'            ',
'              htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':140''||'':''||V(''APP_SESSION'')||''::NO:RP:P140_PROCESS_INSTANCE_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||''">TASK-INFO</a></td>'');',
'                  -- htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'exception when others then htp.p(''there are currently no tasks'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286093876869795717)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
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
'      apex_json.parse(:P140_PROCESS);',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            ',
'            <th class="t15header">Type</th>',
'            '');',
'     htp.p(''<h1>Variable count : ''||apex_json.get_count(p_path   => ''data[1].variables'')||''</h1>'');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data[1].variables'')',
'      LOOP',
'      htp.p(''<tr>'');',
'          htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[1].variables[%d].name'', p0 => i),'' '')||''</td>'');',
'          htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[1].variables[%d].value'', p0 => i),'' '')||''</td>'');',
'       htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[1].variables[%d].type'', p0 => i),'' '')||''</td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'--htp.p(''<button id="submitTaskForm" onclick="CollectFormData()">Submit Form</button>'');',
'exception when others then htp.p(''there are currently no tasks'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P140_PROCESS_INSTANCE_ID'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286093220798795711)
,p_name=>'P140_HISTORY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(286093119769795710)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286093396041795712)
,p_name=>'P140_PROCESS_INSTANCE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(286093119769795710)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286093733954795716)
,p_name=>'P140_PROCESS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(286093119769795710)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(290387389067914957)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P140_FILE := '''';',
':P140_FILE_NAME := '''';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(290389373201914958)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTION_SETUP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''HISTORY_COLLECTION'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''HISTORY_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''PROCESS_HISTORY'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''PROCESS_HISTORY'');',
'end if;',
'                                    ',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''HISTORY_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''HISTORY_COLLECTION''); end if;  ',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''PROCESS_HISTORY'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''PROCESS_HISTORY''); end if;                                 '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286093082930795709)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_HISTORY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'l_url            varchar2(1001) := ''http://128.128.5.166:8080/activiti-rest/service/history/historic-process-instances?involvedUser=''||:APP_USER||''&finished=true'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''HISTORY_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    SELECT clob001 into :P140_HISTORY',
'FROM APEX_collections',
'WHERE collection_name = ''HISTORY_COLLECTION'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286093678736795715)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESS_HISTORY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(1001) := ''http://128.128.5.166:8080/activiti-rest/service/history/historic-process-instances?includeProcessVariables=true&involvedUser=''||:APP_USER||''&finished=true&processInstanceId=''||:P140_PROCESS_INSTANCE_ID;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''PROCESS_HISTORY'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    SELECT clob001 into :P140_PROCESS',
'FROM APEX_collections',
'WHERE collection_name = ''PROCESS_HISTORY'';',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P140_PROCESS_INSTANCE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(290389763921914958)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>':P140_FILE_NAME := :P140_FILE;'
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
