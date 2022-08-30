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
--   Date and Time:   11:23 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 33
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00033
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>33);
end;
/
prompt --application/pages/page_00033
begin
wwv_flow_imp_page.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'JasperReport'
,p_step_title=>'JasperReport'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'10'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20161227102230'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1715961256273828)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
