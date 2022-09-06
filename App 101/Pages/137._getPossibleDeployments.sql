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
--     PAGE: 137
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00137
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>137);
end;
/
prompt --application/pages/page_00137
begin
wwv_flow_imp_page.create_page(
 p_id=>137
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'getPossibleDeployments'
,p_step_title=>'getPossibleDeployments'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20181227103041'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(286092533667795704)
,p_plug_name=>'New'
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
'    BEGIN',
'      apex_json.parse(:P137_DEPLOYMENTS);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''data''));',
'      htp.p(''<div class="col-md-4"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">Description</th>',
'            <th class="t15header">Category</th>',
'             ',
'             ',
'         ',
'            ',
'            '');',
'      FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'      htp.p(''<tr>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].description'', p0 => i),''test'')||''</td>'');',
'             htp.p(''<td>''||nvl(apex_json.get_varchar2( p_path => ''data[%d].category'', p0 => i),''test'')||''</td>'');',
'              htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':134''||'':''||V(''APP_SESSION'')||''::NO:RP:P134_PROCESS_DEF_ID:''||replace(apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i),'':'',''-'')||''">TASK-INFO</a></td>'');',
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286092604973795705)
,p_name=>'P137_DEPLOYMENTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(286092533667795704)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286092810196795707)
,p_name=>'P137_PROCESS_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(286092533667795704)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(286092468300795703)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS_SETUP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''DEPLOYMENTS'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''DEPLOYMENTS'');',
'end if;',
'',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''DEPLOYMENTS'') then  APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''DEPLOYMENTS''); end if;                                 ',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(286092390463795702)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_DEPLOYMENTS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(1000) :=  ''http://128.128.5.166:8080/activiti-rest/service/repository/process-definitions?latest=true&categoryLike=ChangeRequest'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'   /* l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''DEPLOY MENTS'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;*/',
'  APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''DEPLOYMENTS'',p_clob001 => APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url =>''http://128.128.5.166:8080/activiti-rest/service/repository/process-definitions?latest=true&categoryLike=ChangeRequest'',p_http_me'
||'thod=>''GET''',
'                                                                                                                ,p_username => :APP_USER, p_password => :APP_USER));  ',
'    SELECT clob001 into :P137_DEPLOYMENTS FROM APEX_collections',
'WHERE collection_name = ''DEPLOYMENTS'';',
'  end;'))
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
