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
--   Date and Time:   09:32 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00033
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>33);
end;
/
prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'JasperReport'
,p_page_mode=>'NORMAL'
,p_step_title=>'JasperReport'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20161227102230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1715961256273828)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'l_http_req UTL_HTTP.req;',
' l_http_resp UTL_HTTP.resp;',
'l_web_serv_end_pt_url VARCHAR2 (2000) :=''http://128.128.5.244:8081/jasperserver/olap/viewOlap.html?name=/reports/PMS_OV_1&new=true&parentFlow=searchFlow&ParentFolderUri=/reports''; -- ''http://128.128.5.244:8081/jasperserver/rest_v2/reports/reports/Acc'
||'-Trx.html?page=1''; --',
'l_blob BLOB; l_raw RAW(32767);',
'BEGIN',
'l_http_req := UTL_HTTP.begin_request (l_web_serv_end_pt_url,''GET'', ''HTTP/1.1'');',
'DBMS_LOB.createtemporary(l_blob, FALSE);',
'utl_http.set_authentication(r => l_http_req, username =>''jasperadmin'', password => ''jasperadmin'', scheme => ''Basic'',for_proxy => FALSE);',
'l_http_resp := UTL_HTTP.get_response (l_http_req);',
'BEGIN',
'LOOP',
'UTL_HTTP.read_raw(l_http_resp, l_raw, 32767);',
'DBMS_LOB.writeappend (l_blob, UTL_RAW.length(l_raw), l_raw);',
'END LOOP;',
'EXCEPTION',
'WHEN UTL_HTTP.end_of_body THEN',
'UTL_HTTP.end_response(l_http_resp);',
'END;',
'owa_util.mime_header(''text/html'',false);',
' htp.p(''Contentlength:'' || dbms_lob.getlength(l_blob));',
'owa_util.http_header_close;',
' wpg_docload.download_file(l_blob);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
