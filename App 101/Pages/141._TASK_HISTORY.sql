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
--     PAGE: 141
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00141
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>141);
end;
/
prompt --application/pages/page_00141
begin
wwv_flow_imp_page.create_page(
 p_id=>141
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'TASK_HISTORY'
,p_step_title=>'TASK_HISTORY'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20220829095926'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(291155702703660203)
,p_plug_name=>'Process Instance History'
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
'l_clob clob;',
'    BEGIN',
'    SELECT clob001 into l_clob',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_HISTORY_COLLECTION'';',
'      apex_json.parse(l_clob);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''data''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            ',
'            ',
'            <th class="t15header">name</th>',
'            <th class="t15header">Assignee</th>',
'             <th class="t15header">Start Time</th>',
'             <th class="t15header">End Time</th>',
'             <th class="t15header">Duration</th>',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'      htp.p(''<tr>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].activityName'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].assignee'', p0 => i),''Unclaimed'')||''</td>'');',
'             htp.p(''<td id="start''||i||''"></td>'');',
'             htp.p(''<td id="end''||i||''"></td>'');',
'             htp.p(''<td id="duration''||i||''" ></td>'');',
'              htp.p(''<script>var start = new Date("''||apex_json.get_varchar2( p_path => ''data[%d].startTime'', p0 => i)||''").toLocaleString("en-GB");',
'                     var end = new Date("''||apex_json.get_varchar2( p_path => ''data[%d].endTime'', p0 => i)||''").toLocaleString("en-GB"); ',
'                    if (end == "Invalid Date") end = "In Progress";',
'                    var duration = ''||nvl(apex_json.get_varchar2( p_path => ''data[%d].durationInMillis'', p0 => i),''""'')||'';',
'                  if (duration != ""){  duration = Math.round(duration * 100) / 100;',
'                    duration /=60000;',
'                    $("#duration''||i||''").text(duration.toFixed(2));} else { $("#duration''||i||''").text("Not Finished Yet"); }',
'                   $("#start''||i||''").text(start);',
'                    $("#end''||i||''").text(end);</script>'');',
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(291156205394660208)
,p_plug_name=>'Process Variables'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'l_clob clob;',
'    BEGIN',
'    SELECT clob001 into l_clob',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_HISTORY_VARIABLES_COLLECTION'';',
'      apex_json.parse(l_clob);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''data''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            ',
'            ',
'            <th class="t15header">Name</th>',
'            <th class="t15header">Value</th>',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'      htp.p(''<tr>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].variable.name'', p0 => i),'''')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].variable.value'', p0 => i),'''')||''</td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'',
'exception when others then htp.p(''there are currently no tasks'');',
'',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P141_HISTORY_TASK_ID'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(291156034103660206)
,p_name=>'P141_HISTORY_TASK_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(291155702703660203)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(291155600589660202)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_UP_COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_COLLECTION'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TASK_HISTORY_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_VARIABLES_COLLECTION'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TASK_HISTORY_VARIABLES_COLLECTION'');',
'end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_VARIABLES_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_HISTORY_VARIABLES_COLLECTION''); end if;',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_HISTORY_COLLECTION''); end if;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(291155991037660205)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_HISTORY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(250) := ''http://192.168.3.193:8999/activiti-rest/service/history/historic-activity-instances?executionId=''||:P141_HISTORY_TASK_ID;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    l_result CLOB;',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'       l_result:= l_result||l_text;',
'       ',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'     APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TASK_HISTORY_COLLECTION'',p_clob001 => l_result);',
'   -- SELECT clob001 into :P141_TASK_HISTORY',
'--FROM APEX_collections',
'--WHERE collection_name = ''TASK_HISTORY_COLLECTION'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P141_HISTORY_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(291156364570660209)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_VARIABLES_HISTORY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(250) := ''http://192.168.3.193:8999/activiti-rest/service/history/historic-variable-instances?size=100&processInstanceId=''||:P141_HISTORY_TASK_ID;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    l_result CLOB;',
'  begin',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'       l_result:= l_result||l_text;',
'       ',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'     APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TASK_HISTORY_VARIABLES_COLLECTION'',p_clob001 => l_result);',
'   -- SELECT clob001 into :P141_TASK_HISTORY',
'--FROM APEX_collections',
'--WHERE collection_name = ''TASK_HISTORY_COLLECTION'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P141_HISTORY_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
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
