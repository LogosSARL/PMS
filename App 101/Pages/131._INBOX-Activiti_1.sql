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
--   Date and Time:   11:26 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 131
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00131
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>131);
end;
/
prompt --application/pages/page_00131
begin
wwv_flow_imp_page.create_page(
 p_id=>131
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'INBOX-Activiti'
,p_step_title=>'INBOX-Activiti'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var FormArray = [];',
'function CollectFormData() {',
'    const URL =''http://192.168.3.193:8080/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID");',
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
,p_page_component_map=>'03'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20220829140321'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(267624272131941240)
,p_plug_name=>'INBOX'
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
'clob_v clob;',
'    BEGIN',
'    SELECT clob001 into clob_v',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION'';',
'',
'',
'      apex_json.parse(clob_v);',
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
'             htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':131''||'':''||V(''APP_SESSION'')||''::NO:RP:P131_TASK_ID,P131_EXECUTION_ID,P131_TASK_NAME,P131_INT_CODE:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'',''||apex_json.get_va'
||'rchar2( p_path => ''data[%d].executionId'', p0 => i)||'',''||replace(nvl(apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i),''test''),''&'','''')||'',''||nvl(apex_json.get_varchar2( p_path => ''data[%d].description'', p0 => i),''test'')||''">DETAILS</a></td>'
||''');',
'                  -- htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'             htp.p(''<td style="padding-left:10px"><a href="http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''||apex_json.get_varchar2( p_path => ''data[%d].executionId'', p0 => i)||''/diagram" target="_BLANK">DIAGRAM</a></td>'');',
'             htp.p(''<script>var s = new Date("''||apex_json.get_varchar2( p_path => ''data[%d].createTime'', p0 => i)||''").toLocaleString("en-GB");',
'                   $("#date''||i||''").text(s);</script>'');',
'                   if NOT apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i) like ''%Implementer Fills Required Fields%''',
'                       OR NOT apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i) like ''%Implementation Team Leader to Approve the CR Information%''',
'                       then ',
'                          if :P131_BRANCH_P = 1 then htp.p(''<td><a href="http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i) || ''&_xpt=1&_'
||'xt=Logos_SARL_Offer_Tmp&_xmode=4&_xf=rtf&_xautorun=true"> Template </a></td>'');',
'                            elsif :P131_BRANCH_P = 2 then htp.p(''<td><a href="http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)|| ''&_xpt'
||'=1&_xt=Logos_Off_Offer&_xmode=4&_xf=rtf&_xautorun=true">  Template</a></td>'');                                                              ',
'                             end if;',
'                end if;',
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
 p_id=>wwv_flow_imp.id(267062384504837937)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
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
' from LGS_PIP_WF_DOCS where NAME = name_v;',
' ',
'    BEGIN',
'      apex_json.parse(:P131_ALL_ATTACHED_FILES);',
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
'         fetch c1 into temp_v;',
'             if c1%notFound then',
'                 temp_v := null; ',
'             end if;',
'     close c1;',
'     -- select FILENAME into temp_v',
'',
'       --          from wwv_flow_file_objects$ where NAME = name_v;',
'       if temp_v is not null then',
'              htp.p(''<tr>'');',
'                  htp.p(''<td>''||temp_v||''</td>'');',
'                htp.p(''<td><a href="f?p=''||V(''APP_ID'')||'':135''||'':''||V(''APP_SESSION'')||''::::P135_FILE_NAME:''||name_V||''"> link </a><td>'');',
'                  htp.p(''</tr>'');',
'        ',
'          end if;',
'      END LOOP;',
'htp.p(''</table> </div>'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(267062774506837941)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.243:8080/activiti-rest/service/runtime/process-instances/''||:P131_EXECUTION_ID||''/diagram'';',
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
 p_id=>wwv_flow_imp.id(279060508650712428)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>12
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'',
'    BEGIN',
'      apex_json.parse(:P131_TASK_INFO);',
'      dbms_output.put_line(apex_json.get_count(p_path =>''formProperties''));',
'      htp.p(''<div class="col-md-2" style="float:left; margin-right:20px;"><table class="t15standard"> ',
'            <th class="t15header">Name</th>',
'            ',
'            <th class="t15header">value</th>',
'            '');',
'     :P131_PRODUCT := apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 1);',
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
'       ',
'        if type_v <> ''enum'' then ',
'            if type_V = ''string'' then',
'                htp.p(''<td> <input type="text" id="''||name_V||''" value="''||apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => i)||''"></input></td>'');',
'            elsif type_v = ''long'' then',
'                          htp.p(''<td> <input type="number" id="''||name_V||''" value="''||apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => i)||''"></input></td>'');',
'            else null;',
'            end if;',
'        else htp.p(''<td> <select id="''||name_V||''">'');',
'               htp.p(''<option value=""></option>'');        ',
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
'',
'--htp.p(''<button id="submitTaskForm" onclick="CollectFormData()">Submit Form</button>'');',
'htp.p(''<button id="submitTaskForm" onclick="return false;" >Submit Form</button>'');',
'exception when others then htp.p(''there are currently no tasks'');',
'  end; '))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P131_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(279244392166088148)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<a href="#"> <span onclick="apex.submit()"> Upload Attachment </span> </a>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P131_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(291156447984660210)
,p_plug_name=>'Reassign Task'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P131_TASK_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(929347392151608510)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'     j apex_json.t_values;',
'     l_path  VARCHAR2(100);',
'name_V varchar2(200);',
'type_v varchar2(200);',
'    l_paths apex_t_varchar2;',
'    pip_path apex_t_varchar2;',
'    pip_id varchar2(100);',
'template_v varchar2(100);',
'url_v varchar2(1000);',
'',
'    BEGIN',
'      apex_json.parse(j,:P131_TASK_INFO);',
'      htp.p(''<div class="col-md-2" style="float:left; margin-right:20px;"><table class="t15standard"> ',
'           ',
'            <th class="t15header">Template</th>',
'          ',
'            '');',
'     l_paths := apex_json.find_paths_like (',
'        p_values         => j,',
'        p_return_path => ''formProperties[%]'',',
'        p_subpath       => ''.id'',',
'        p_value           => ''LogosBranches'' );',
'                   for i in 1 .. l_paths.count loop',
' template_v := apex_json.get_varchar2(p_values => j, p_path => l_paths(i)||''.value'');',
' end loop;',
'         pip_path := apex_json.find_paths_like (',
'            p_values         => j,',
'            p_return_path => ''formProperties[%]'',',
'            p_subpath       => ''.id'',',
'            p_value           => ''pipelineID'' );',
'         pip_id := apex_json.get_varchar2(p_values => j, p_path => pip_path(1)||''.value'');',
'',
'        if template_v = 1 then url_v :=''http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' ||pip_id || ''&_xpt=1&_xt=Logos_SARL_Offer_Tmp&_xmode=4&_xf=rtf&_xautorun=true'';',
'          else  url_v :=''http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || pip_id || ''&_xpt=1&_xt=Logos_Off_Offer&_xmode=4&_xf=rtf&_xautorun=true'';',
'          end if;',
'          htp.p(''<tr>'');',
'          htp.p(''<td><a href="''||url_v||''"> <span> Template </span</a></td>'');',
'          htp.p(''</tr>'');',
'',
'htp.p(''</table></div>'');',
'',
'exception when others then htp.p(''there are currently no tasks'');',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P131_TASK_ID'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(945210301379470001)
,p_name=>'Attached_files'
,p_parent_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'select FileNAme, name, '''' from lgs_pip_wf_docs where ACTIVITI_INSTANCE_ID = :P131_EXECUTION_ID'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P131_EXECUTION_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
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
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(945210577308470003)
,p_query_column_id=>1
,p_column_alias=>'FILENAME'
,p_column_display_sequence=>1
,p_column_heading=>'Filename'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(945210673118470004)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>2
,p_column_heading=>'#'
,p_column_link=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,135:P135_FILE_NAME:#NAME#'
,p_column_linktext=>'download'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(945210732298470005)
,p_query_column_id=>3
,p_column_alias=>''''''
,p_column_display_sequence=>3
,p_column_heading=>'#'
,p_column_link=>'javascript:apex.event.trigger(document,''DELETE_DOC'',[{DOC_ID:''#NAME#''}])'
,p_column_linktext=>'x'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(838219086157167168)
,p_plug_name=>'QUEUE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>50
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
'WHERE collection_name = ''UNASSIGNED_INBOX_COLLECTION'';',
'clob_v clob;',
'    BEGIN',
'    open c1;',
'   -- FETCH c1 INTO :P131_ALL_TASKS_JSON_QUEUE;',
'FETCH c1 INTO clob_v;',
'   if c1%notfound then',
'      return;',
'   end if;',
'',
'--CLOSE c1;',
'     -- apex_json.parse(:P131_ALL_TASKS_JSON_QUEUE);',
'apex_json.parse(clob_v);',
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
'                  htp.p(''<td><a class="claim" href="f?p=''||V(''APP_ID'')||'':131''||'':''||V(''APP_SESSION'')||''::NO:RP:P131_TASK_ID:''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||''">TASK-INFO</a></td>'');',
'                   htp.p(''<td><a class="claim" onclick="CollectFormData(''||apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i)||'')">TASK-INFO</a></td>'');',
'          htp.p(''</tr>'');',
'      END LOOP;',
'htp.p(''</table></div>'');',
'close c1;',
'  end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(837657198530063865)
,p_plug_name=>'Attached Files'
,p_parent_plug_id=>wwv_flow_imp.id(838219086157167168)
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
'      apex_json.parse(:P131_QUEUE_ALL_ATTACHED_FILES);',
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
,p_plug_display_when_condition=>'P131_QUEUE_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(837657588532063869)
,p_plug_name=>'Diagram'
,p_parent_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := ''128.128.5.243:8080/activiti-rest/service/runtime/process-instances/''||:P131_EXECUTION_ID||''/diagram'';',
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
 p_id=>wwv_flow_imp.id(849655322675938356)
,p_plug_name=>'Task Info'
,p_parent_plug_id=>wwv_flow_imp.id(838219086157167168)
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
'      apex_json.parse(:P131_QUEUE_TASK_INFO);',
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
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P131_QUEUE_TASK_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(849839206191314076)
,p_plug_name=>'Add Files'
,p_parent_plug_id=>wwv_flow_imp.id(838219086157167168)
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
,p_plug_display_when_condition=>'P131_QUEUE_TASK_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(291156694818660212)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(291156447984660210)
,p_button_name=>'Reassign'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Reassign'
,p_button_alignment=>'LEFT-CENTER'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5417960610386014)
,p_name=>'P131_TASK_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5418117086386016)
,p_name=>'P131_INT_CODE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5420456399386039)
,p_name=>'P131_PROJECT_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5420503089386040)
,p_name=>'P131_REMARK'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5420675730386041)
,p_name=>'P131_CUST_CODE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5420786121386042)
,p_name=>'P131_APPROVAL_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5420861888386043)
,p_name=>'P131_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267061287206837926)
,p_name=>'P131_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267062160030837935)
,p_name=>'P131_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267062223987837936)
,p_name=>'P131_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267062649623837940)
,p_name=>'P131_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267062874601837942)
,p_name=>'P131_DIAGRAM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(267062774506837941)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'URL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279059725446712420)
,p_name=>'P131_ALL_TASKS_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279060601601712429)
,p_name=>'P131_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279244184774088146)
,p_name=>'P131_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285188744943789231)
,p_name=>'P131_TASKS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285478940902763542)
,p_name=>'P131_ALL_TASKS_JSON_QUEUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285479316673763542)
,p_name=>'P131_QUEUE_TASK_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285479778834763542)
,p_name=>'P131_QUEUE_TASK_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285480199556763542)
,p_name=>'P131_QUEUE_FORM_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285480581277763543)
,p_name=>'P131_QUEUE_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285480940271763543)
,p_name=>'P131_QUEUE_ALL_ATTACHED_FILES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285481383825763543)
,p_name=>'P131_QUEUE_EXECUTION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(838219086157167168)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285482332465763544)
,p_name=>'P131_QUEUE_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(849839206191314076)
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
 p_id=>wwv_flow_imp.id(285483043766763544)
,p_name=>'P131_DIAGRAM_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(837657588532063869)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'URL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(291156556768660211)
,p_name=>'P131_NEW_ASSIGNEE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(291156447984660210)
,p_prompt=>'New assignee'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select ge.PGE_EMPLOYEE,ge.PGE_EMPLOYEE id from prj_group_employees ge, prj_groups g where ge.pge_pgr_id = g.pgr_id and g.pgr_code = :P131_PRODUCT;'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(291157276837660218)
,p_name=>'P131_PRODUCT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301712415510365107)
,p_name=>'P131_BRANCH_P'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(267624272131941240)
,p_prompt=>'Desired Branch'
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
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881206504509680748)
,p_name=>'P131_FILE1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(279244392166088148)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Attach File To Task'
,p_source=>'BLOB_CONTENT'
,p_source_type=>'DB_COLUMN'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(279752205473526501)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P131_FILE_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279752306641526502)
,p_event_id=>wwv_flow_imp.id(279752205473526501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://192.168.3.193:8999/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID")+''/attachments'';',
'const data = {',
'             "name" : $v("P131_FILE_NAME")',
'        };',
'console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {async: false,',
'      success: function (pData) {             // Success Javascript',
'           //alert(pData);',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'    $s("P131_FILE1",'''');',
'$s("P131_FILE_NAME",'''');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(285188880589789232)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#submitTaskForm'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5420380131386038)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#submitTaskForm'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285189267202789236)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285189359316789237)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285189499369789238)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417386914386008)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
' {',
'      "name":"DatesAndRates_InHouseORate",',
'      "type":"long",',
'      "value":parseInt($("#DatesAndRates_InHouseORate").val())',
'   },',
'           {',
'      "name":"DatesAndRates_OnSiteORate",',
'      "type":"long",',
'      "value":parseInt($("#DatesAndRates_OnSiteORate").val())',
'   },',
'   {',
'      "name":"FinancialOffer_InHouseInvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InHouseInvoicedDays").val())',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417424447386009)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'',
'   {',
'      "name":"FinancialOffer_InHouseInitialAmount",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InHouseInitialAmount").val())',
'   },',
'           {',
'      "name":"FinancialOffer_InvoicedDays",',
'      "type":"long",',
'      "value":parseInt($("#FinancialOffer_InvoicedDays").val())',
'   },{',
'      "name":"FinancialOffer_SurchargeFlg",',
'      "type":"long",',
'      "value":$("#FinancialOffer_SurchargeFlg").val()',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285188969403789233)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417548717386010)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'     {',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285189152848789235)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417660382386011)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'          {',
'      "name":"FinancialOffer_WarrantyMonth",',
'      "type":"long",',
'      "value":parseInt($("FinancialOffer_WarrantyMonth").val())',
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
'      "type":"string",',
'      "value":$("#FinancialOffer_PaymentTerm").val()',
'   }',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417763694386012)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'               {',
'      "name":"FinancialOffer_PaymentMethod",',
'      "type":"string",',
'      "value":$("#FinancialOffer_PaymentMethod").val()',
'   },{',
'      "name":"FinancialOffer_Remarks",',
'      "type":"string",',
'      "value":$("#FinancialOffer_Remarks").val()',
'   },{',
'      "name":"FinancialOffer_WorkToBeConducted",',
'      "type":"string",',
'      "value":$("#FinancialOffer_WorkToBeConducted").val()',
'   },{',
'      "name":"FinancialOffer_LogosSignature",',
'      "type":"string",',
'      "value":$("#FinancialOffer_LogosSignature").val()',
'   }',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5417897337386013)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
'	   var testData = [',
'             {',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285190431185789248)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL = ''http://192.168.3.193:8999/activiti-rest/service/runtime/process-instances/''+$v("P131_EXECUTION_ID")+''/variables'';',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285190042473789244)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	   var testURL =''http://192.168.3.193:8999/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID");',
'	   var testData ={  "action" : "complete"};',
'	   apex.server.process(',
'    ''SubmitTaskForm'',                             // Process or AJAX Callback name',
'    {x01: testURL,x02:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'         // $s("P131_TASK_ID","");',
'         // apex.submit()',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291157480296660220)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>150
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
'             "DatesAndRates_InHouseORate":$("#DatesAndRates_InHouseORate").val(),',
'             "DatesAndRates_OnSiteRate":$("#DatesAndRates_OnSiteRate").val(),',
'             "DatesAndRates_OnSiteORate":$("#DatesAndRates_OnSiteORate").val(),',
'             "InScope":$("#InScope").val(),',
'             "FinancialOffer_SurchargeFlg":$("#FinancialOffer_SurchargeFlg").val(),',
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
'             "FinancialOffer_OracleLicense":$("#FinancialOffer_OracleLicense").val(),',
'             "FinancialOffer_InHouseInvoicedDays":$("#FinancialOffer_InHouseInvoicedDays").val(),',
'             "FinancialOffer_AtSiteInvoicedDays":$("#FinancialOffer_AtSiteInvoicedDays").val(),',
'             "DatesAndRates_Reference":$("#DatesAndRates_Reference").val(),',
'             "FinancialOffer_InHouseInitialAmount":$("#FinancialOffer_InHouseInitialAmount").val(),',
'             "FinancialOffer_AtSiteInitialAmount":$("#FinancialOffer_AtSiteInitialAmount").val()',
'            ',
'             ',
'        }};  //',
'console.log(JSON.stringify(testData));',
'     apex.server.process(',
'    ''SYNC_LGS_CONTRACTS_ACTIVITI'',                             // Process or AJAX Callback name',
'    {x01:JSON.stringify(testData)},  // Parameter "x01"',
'    {',
'        async: false,',
'      success: function (pData) { ',
'          $s("P131_TASK_ID","");',
'         // alert(pData);',
'          apex.submit();',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
''))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5418013196386015)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'id_v number := 0;',
'ref_v number := 0;',
'Project_Name_v varchar2(200);',
'start_date_v varchar2(200);',
'end_date_v varchar2(200);',
'remarks_v varchar2(1000);',
'company_code_v varchar2(100);',
'result_v number;',
'err_code varchar2(10);',
'    err_msg varchar2(300);',
'CURSOR Sel_Cnt is',
'select id,ref_to_contract,start_DATE, end_DATE, REMARKS, COMPANY_CODE',
' from lgs_contracts where dsp_code = :p131_int_code and ref_to_contract is null;',
' v_response CLOB;',
'    l_body      CLOB;',
'    v         number;',
'    TO_EMAIL_V VARCHAR2(100);',
'    FROM_EMAIL_V VARCHAR2(100);',
'    ',
'    ind         NUMBER;',
'   ',
'Begin',
'',
'    if (:P131_TASK_NAME = ''AM to Send Signed CR to Administration'') THEN',
'    for c in Sel_Cnt loop',
'     id_v := c.id;',
'     ref_v := nvl(c.ref_to_contract,0);',
'    ',
'     remarks_v := c.remarks;',
'     start_date_v := to_char(c.start_DATE,''DD/MM/YYYY'');',
'     end_date_v := to_char(c.end_DATE,''DD/MM/YYYY'');',
'     company_code_v := c.company_code;',
'    end loop;',
'    if id_v <> 0 and ref_v = 0 then ',
'    begin',
'       result_v := PROJECT_PCK.change_contact_approved_status(id_v);',
'        apex_web_service.g_request_headers.delete();',
'    apex_web_service.g_request_headers(1).name := ''p_code'';',
'    apex_web_service.g_request_headers(1).value := :P131_INT_CODE ;',
'        apex_web_service.g_request_headers(2).name := ''p_name'';',
'    apex_web_service.g_request_headers(2).value := :P131_INT_CODE ;',
'        apex_web_service.g_request_headers(3).name := ''p_personnel_code'';',
'    apex_web_service.g_request_headers(3).value := :APP_USER;',
'        apex_web_service.g_request_headers(4).name := ''p_category'';',
'    apex_web_service.g_request_headers(4).value :=''T'';',
'        apex_web_service.g_request_headers(5).name := ''p_remarks'';',
'    apex_web_service.g_request_headers(5).value := remarks_v;',
'        apex_web_service.g_request_headers(6).name := ''p_cust_cust_code'';',
'    apex_web_service.g_request_headers(6).value := company_code_v;',
'        apex_web_service.g_request_headers(7).name := ''p_starting_date'';',
'    apex_web_service.g_request_headers(7).value := start_date_v;--,''DD/MM/YYYY'');',
'        apex_web_service.g_request_headers(8).name := ''p_ending_date'';',
'    apex_web_service.g_request_headers(8).value := end_date_v;--,''DD/MM/YYYY'');',
'    v_response := apex_web_service.make_rest_request(',
'        p_url           => ''http://192.168.3.226:8080/ords/pms/interface/css/create/'',',
'        p_http_method   => ''POST''--,',
'        --p_username      => ''your_username'',',
'        --p_password      => ''your_password'',',
'        --p_body          => ''{"field":"value"}'' -- Your JSON.',
'	 ---p_parm_name => apex_string.string_to_table(''p_cust_cust_code:p_starting_date:p_ending_date''),',
'	--p_parm_value => apex_string.string_to_table(''xyz:12-DEC-2021:12-DEC-2022'')',
'	',
'    );',
'    ',
'   ',
'exception when others then',
'        err_code := SQLCODE;',
'        err_msg := SUBSTR(SQLERRM, 1, 1000);',
'          insert into css_api_logs(c1) values(''An error was encountered - ''||err_code||'' -ERROR- ''||err_msg);',
'          commit;  ',
'          raise_application_error(-20001,''An error was encountered - ''||SQLCODE||'' -ERROR- ''||SQLERRM); ',
'    end;',
'        ',
'    :131_TASK_NAME := '''';',
'    end if;',
'    END if;',
'',
'End;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5420939039386044)
,p_event_id=>wwv_flow_imp.id(285188880589789232)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#submitTaskForm'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(291156775609660213)
,p_name=>'REASSIGN_EMP'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(291156694818660212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291156809658660214)
,p_event_id=>wwv_flow_imp.id(291156775609660213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://192.168.3.193:8080/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID");',
'const data = {',
'             "assignee" : $v("P131_NEW_ASSIGNEE")',
'        };',
'console.log(JSON.stringify(data));',
'    apex.server.process(',
'    ''PutTaskVariables'',                             // Process or AJAX Callback name',
'    {x01: URL,x02:JSON.stringify(data)},  // Parameter "x01"',
'    {async: false,',
'      success: function (pData) {             // Success Javascript',
'          // alert(pData);',
'          $s("P131_TASK_ID","");',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291157101771660217)
,p_event_id=>wwv_flow_imp.id(291156775609660213)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301712570248365108)
,p_name=>'New_2'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P131_BRANCH_P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301712671693365109)
,p_event_id=>wwv_flow_imp.id(301712570248365108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P131_BRANCH_P'
,p_attribute_03=>'P131_BRANCH_P'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301712701999365110)
,p_event_id=>wwv_flow_imp.id(301712570248365108)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(945210834589470006)
,p_name=>'DELETE_DOC'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DELETE_DOC'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(945210949028470007)
,p_event_id=>wwv_flow_imp.id(945210834589470006)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URL =''http://192.168.3.193:8080/activiti-rest/service/runtime/tasks/''+$v("P131_TASK_ID")+''/attachments/''+ this.data.DOC_ID;',
'',
'console.log(URL);',
'    apex.server.process(',
'    ''DELETE_DOC'',                             // Process or AJAX Callback name',
'    {x01: URL, x02:  this.data.DOC_ID},  // Parameter "x01"',
'    {async: false,',
'      success: function (pData) {             // Success Javascript',
'      },',
'      dataType: "text"                        // Response type (here: plain text)',
'    }',
'  );',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(945211113708470009)
,p_event_id=>wwv_flow_imp.id(945210834589470006)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(945210301379470001)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(267062464902837938)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P131_FILE := '''';',
':P131_FILE_NAME := '''';',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279752530785526504)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'cursor c1 is select * from wwv_flow_file_objects$ where NAME = :P131_FILE1;',
'row_v wwv_flow_file_objects$%ROWTYPE;',
'begin',
'open c1;',
'fetch c1 into row_v;',
'insert into LGS_PIP_WF_DOCS (ID,NAME,FILENAME,TITLE,MIME_TYPE,DOC_SIZE,DAD_CHARSET,CREATED_BY,CREATED_ON,UPDATED_BY,UPDATED_ON,LAST_UPDATE,CONTENT_TYPE,BLOB_CONTENT,LANGUAGE,DESCRIPTION,FILE_CHARSET,ACTIVITI_INSTANCE_ID) VALUES',
'(row_v.ID,row_v.NAME,row_v.FILENAME,row_v.TITLE,row_v.MIME_TYPE,row_v.DOC_SIZE,row_v.DAD_CHARSET,row_v.CREATED_BY,row_v.CREATED_ON,row_v.UPDATED_BY,row_v.UPDATED_ON,row_v.LAST_UPDATED,row_v.CONTENT_TYPE,row_v.BLOB_CONTENT,row_v.LANGUAGE,row_v.DESCRIP'
||'TION,row_v.FILE_CHARSET,:P131_EXECUTION_ID); commit;',
'',
'--insert into tareif(c1,c2) values (row_v.NAME,row_v.FILENAME); commit;',
'close c1;',
':P131_FILE_NAME := :P131_FILE1;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P131_FILE1'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279060499116712427)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P131_ALL_ATTACHED_FILES:= '''';',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_INFO_COLLECTION'') then ',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TASK_INFO_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''ATTACHED_FILES_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''ATTACHED_FILES_COLLECTION'');',
'end if;',
'if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_ATTACHMENTS_COLLECTION'') then',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''TASK_HISTORY_ATTACHMENTS_COLLECTION'');',
'end if;',
' ',
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
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''TASK_HISTORY_ATTACHMENTS_COLLECTION'') then APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''TASK_HISTORY_ATTACHMENTS_COLLECTION''); end if;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285188686544789230)
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
'    select LISTAGG( pge_emp_title,'','') within group (order by 1)  from prj_group_employees where pge_employee = :APP_USER;',
'cursor prj is',
'    select LISTAGG(pgr_code,'','') within group (order by 1)  from security_groups where emp_code = :APP_USER;',
'    content varchar2(3000);',
'l_url    varchar2(2000) := :ACT_REST_URL||''/service/runtime/tasks?size=100&candidateGroups='';',
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
'     close prj; ',
'',
'        insert into tareif(c1) values(l_url);commit;',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'            ',
'',
'    l_resp := utl_http.get_response(l_req);',
'',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'        req_out := req_out || l_text;',
'',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'',
'    apex_json.parse(req_out);',
'    count_v := apex_json.get_count(p_path   => ''data'');',
'',
'     FOR i IN 1..apex_json.get_count(p_path   => ''data'')',
'      LOOP',
'       TASK_ID_V := apex_json.get_varchar2( p_path => ''data[%d].id'', p0 => i);',
'       TASK_NAME_ARRAY_v(i) := apex_json.get_varchar2( p_path => ''data[%d].name'', p0 => i);',
'       EXEC_ID_ARRAY_V(i) := apex_json.get_varchar2( p_path => ''data[%d].executionId'', p0 => i);',
'       task_id_array_v(i) := TASK_ID_V; ',
'      insert into tareif(c1,c2) values(task_id_v,''1'');commit;',
'',
'      END LOOP;',
'    ',
'      for i in 1..count_v',
'      loop',
'      ',
'          l_url := :ACT_REST_URL||''/service/form/form-data?size=100&taskId=''||task_id_array_v(i);',
'          l_req  := utl_http.begin_request(l_url);',
'          ',
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
'      if instr(prjs_v,apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 1)) > 0 then',
'          ',
'          l_url := :ACT_REST_URL||''/service/runtime/tasks/''||task_id_array_v(i);',
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
'            insert into tareif(C1,c2,c3 ) values (''checking form value to approve contract'', apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 3),l_url); commit;',
'',
'            update lgs_contracts set step = TASK_NAME_ARRAY_v(i), ACTIVITI_TASK_ID = EXEC_ID_ARRAY_V(i) where ID= apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 2);commit;',
'',
'            if nvl(apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 3),'''') is not null then',
'               -- k := PROJECT_PCK.change_contact_approved_status(apex_json.get_varchar2( p_path => ''formProperties[%d].value'', p0 => 2));',
'               null;',
'            end if;',
'       ',
' ',
'            end if;',
'      end loop;',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285188534992789229)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TASK_INBOX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := :ACT_REST_URL||''/service/runtime/tasks?size=100&assignee=''||:APP_USER;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    l_clob clob;',
'    Type TASK_ID_ARRAY is ',
'    table of varchar2(100);',
'    TASK_ID_ARRAY_V TASK_ID_ARRAY;',
'    l_count number := 0;',
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
'    SELECT clob001 into :P131_ALL_TASKS_JSON',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION''',
'and rownum = 1;',
'--select l_clob into :P131_ALL_TASKS_JSON from dual;',
'apex_json.close_all;',
'',
'  end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285489644668776394)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getAllUnassignedUserTasksPerRole'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(1000) := :ACT_REST_URL||''/service/runtime/tasks?size=25&candidateGroup=''||:USER_ROLE;',
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
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279060135325712424)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_TASK_INFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := :ACT_REST_URL||''/service/form/form-data?taskId=''||:P131_TASK_ID;',
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
'        APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TASK_INFO_COLLECTION'',p_clob001 => l_text);',
'     end loop;',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    SELECT clob001 into :P131_TASK_INFO',
'FROM APEX_collections',
'WHERE collection_name = ''TASK_INFO_COLLECTION'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P131_TASK_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279059876708712421)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'cursor sel_clob is',
'SELECT clob001 ',
'FROM APEX_collections',
'WHERE collection_name = ''INBOX_COLLECTION'';',
'begin',
'',
'open sel_clob;',
'    fetch sel_clob into :P131_ALL_TASKS_JSON;',
'close sel_clob ;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(267062594171837939)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_ALL_ATTACHED_FILES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := :ACT_REST_URL||''/service/runtime/tasks/''||:P131_TASK_ID||''/attachments'';',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'  begin',
'  insert into tareif(c1) values(l_url);commit;',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
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
'    SELECT clob001 into :P131_ALL_ATTACHED_FILES',
'FROM APEX_collections',
'WHERE collection_name = ''ATTACHED_FILES_COLLECTION'';',
'',
':P131_ALL_ATTACHED_FILES := ''{ "attachedFiles" :''||:P131_ALL_ATTACHED_FILES||''}'';',
'  end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(267062971027837943)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROCESS_DIAGRAM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(100) := :ACT_REST_URL||''/service/runtime/process-instances/''||:P131_EXECUTION_ID||''/diagram'';',
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
'        :P131_DIAGRAM := l_text;-- APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''ATTACHED_FILES_COLLECTION'',p_clob001 => l_text);',
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
 p_id=>wwv_flow_imp.id(929346663924608503)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROCESS_ATTACHMENTS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url            varchar2(250) := ''http://192.168.3.193:8999/activiti-rest/service/history/historic-activity-instances?activityType=userTask&executionId=''||:P131_EXECUTION_ID;',
'  l_req   utl_http.req;',
'   l_resp  utl_http.resp;',
'    l_text           varchar2(32767);',
'    count_v number;',
'task_req_out CLOB;',
'    l_result CLOB;',
'    ',
'    cursor sel_attached_files is',
'    SELECT clob001',
'            FROM APEX_collections',
'            WHERE collection_name = ''TASK_HISTORY_ATTACHMENTS_COLLECTION'';',
'    ',
'    file_rec CLOB;',
'  begin ',
'  insert into tareif(C1,c2) values (''test initial url'', l_url); commit;',
'    l_req  := utl_http.begin_request(l_url);',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'    -- loop through the data coming back',
'    begin',
'      loop',
'       utl_http.read_text(l_resp, l_text, 32766);',
'       l_result:= l_result||l_text;',
'     ',
'     end loop;',
'     ',
'    exception',
'     when utl_http.end_of_body then',
'         utl_http.end_response(l_resp);',
'    end;',
'    APEX_JSON.parse(l_result);',
'     count_v := apex_json.get_count(p_path   => ''data'');',
'    ',
'      for i in 1..count_v',
'      loop',
'      ',
'          l_url := :ACT_REST_URL||''/service/runtime/tasks/''||apex_json.get_varchar2( p_path => ''data[%d].taskId'', p0 => i)||''/attachments'';',
'            insert into tareif(C1,c2) values (''test parsed IDs from initial url'', l_url); commit;',
'',
'          l_req  := utl_http.begin_request(l_url);',
'          ',
'  utl_http.set_header(l_req, ''Authorization'', ''Basic a2VybWl0Omtlcm1pdA==''); --It Uses Basic Authorization',
'    l_resp := utl_http.get_response(l_req);',
'       ',
'       begin',
'          loop',
'           utl_http.read_text(l_resp, l_text, 32766);',
'            APEX_COLLECTION.ADD_MEMBER (p_collection_name => ''TASK_HISTORY_ATTACHMENTS_COLLECTION'',p_clob001 => substr(l_text,2,length(l_text) -2));',
'         end loop;',
'        exception',
'         when utl_http.end_of_body then',
'             utl_http.end_response(l_resp);',
'        end;',
'        ',
'    end loop;',
'   apex_json.close_all;',
'',
'    open sel_attached_files;',
'    loop',
'        fetch sel_attached_files into file_rec;',
'        EXIT WHEN sel_attached_files%NOTFOUND;',
'        apex_json.parse(file_rec);',
'        if file_rec is not null then',
'            :P131_ALL_ATTACHED_FILES := :P131_ALL_ATTACHED_FILES||file_rec||'','' ;',
'        end if;',
'    end loop;',
'    close sel_attached_files;',
'    ',
'',
'    :P131_ALL_ATTACHED_FILES := ''{ "attachedFiles" :[''||substr(:P131_ALL_ATTACHED_FILES,1,length(:P131_ALL_ATTACHED_FILES) -1)||'']}'';',
' end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P131_TASK_ID'
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
