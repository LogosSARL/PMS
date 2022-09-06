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
--     PAGE: 133
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00133
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>133);
end;
/
prompt --application/pages/page_00133
begin
wwv_flow_imp_page.create_page(
 p_id=>133
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Inbox-by-Role'
,p_step_title=>'Inbox-by-Role'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var FormArray = [];',
'function CollectFormData(taskId) {',
'    const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+taskId;',
'const data = {',
'             "action" : "claim",',
'              "assignee" : "kermit"',
'        };',
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
'     $s(''P133_TASK_ID'','''');',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-md-4{',
'width:250%',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20181221105147'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(552740453247403627)
,p_plug_name=>'All Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
'    FETCH c1 INTO :P133_ALL_TASKS_JSON;',
'',
'   if c1%notfound then',
'      null;',
'   end if;',
'',
'   CLOSE c1;',
'      apex_json.parse(:P133_ALL_TASKS_JSON);',
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
'                  htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':133''||'':''||V(''APP_SESSION'')||''::NO:RP:P133_TASK_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||''">TASK-INFO</a></td>'');',
'                   htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(552178565620300324)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
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
'      apex_json.parse(:P133_ALL_ATTACHED_FILES);',
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
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P133_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(552178955622300328)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P133_EXECUTION_ID||''/diagram'';',
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
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564176689766174815)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'    BEGIN',
'      apex_json.parse(:P133_TASK_INFO);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''formProperties''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            '');',
'      select apex_json.get_count(p_path   => ''formProperties'') into :P133_FORM_COUNT from dual;',
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
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P133_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564360573281550535)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'htp.p(''<button onclick="apex.submit()">Attach Files</button>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P133_TASK_ID'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285126858514462394)
,p_name=>'P133_ALL_TASKS_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285127265160462394)
,p_name=>'P133_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285127648195462394)
,p_name=>'P133_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285128012596462395)
,p_name=>'P133_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285128411272462395)
,p_name=>'P133_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285128842630462395)
,p_name=>'P133_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285129232134462395)
,p_name=>'P133_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(552740453247403627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285130292373462396)
,p_name=>'P133_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(564360573281550535)
,p_prompt=>'Attach File To Task'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285130942573462396)
,p_name=>'P133_DIAGRAM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(552178955622300328)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'URL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(285135530597462400)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P133_FILE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285136045889462400)
,p_event_id=>wwv_flow_imp.id(285135530597462400)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks/''+$v("P133_TASK_ID")+''/attachments'';',
'const data = {',
'             "name" : $v("P133_FILE_NAME")',
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
'    $s("P133_FILE",'''');',
'$s("P133_FILE_NAME",'''');',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285131691234462398)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P133_FILE := '''';',
':P133_FILE_NAME := '''';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285134704424462399)
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
'         ',
'                                      ',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''INBOX_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''INBOX_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_INFO_COLLECTION'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_INFO_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''ATTACHED_FILES_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''ATTACHED_FILES_COLLECTION''); end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279752719153526506)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getAllUnassignedUserTasksPerRole'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''http://128.128.5.166:8080/activiti-rest/service/runtime/tasks?unassigned=true&candidateGroup=''||:P0_USER_ROLE;',
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
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285134346121462399)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_INFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/form/form-data?taskId=''||:P133_TASK_ID;',
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
'    SELECT clob001 into :P133_TASK_INFO',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_INFO_COLLECTION'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P133_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285131948299462398)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_ALL_ATTACHED_FILES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/tasks/''||:P133_TASK_ID||''/attachments'';',
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
'    SELECT clob001 into :P133_ALL_ATTACHED_FILES',
'FROM APEX_collections',
'WHERE collection_name = ''ATTACHED_FILES_COLLECTION'';',
'',
':P133_ALL_ATTACHED_FILES := ''{ "attachedFiles" :''||:P133_ALL_ATTACHED_FILES||''}'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P133_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285132391361462398)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROCESS_DIAGRAM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.166:8080/activiti-rest/service/runtime/process-instances/''||:P133_EXECUTION_ID||''/diagram'';',
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
'        :P133_DIAGRAM := l_text;-- APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285135188505462399)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>':P133_FILE_NAME := :P133_FILE;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
