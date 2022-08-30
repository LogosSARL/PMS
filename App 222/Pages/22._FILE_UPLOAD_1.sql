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
,p_default_application_id=>222
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   11:29 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 22
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00022
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>22);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_imp_page.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'FILE_UPLOAD'
,p_step_title=>'FILE_UPLOAD'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190204100256'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(267063147717837945)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    for c1 in (select WBC_DOC_MIMETYPE, WBC_DOC,WBC_DOC_FILENAME',
'',
'                 from PRJ_WBS_DOCS',
'',
'                where WBC_ID = :P22_WBC_ID) loop',
'',
'        --',
'',
'        sys.htp.init;',
'',
'        sys.owa_util.mime_header( c1.WBC_DOC_MIMETYPE, FALSE );',
'',
'        sys.htp.p(''Content-length: '' || sys.dbms_lob.getlength( c1.WBC_DOC));',
'',
'        sys.htp.p(''Content-Disposition: attachment; filename="'' || c1.WBC_DOC_FILENAME || ''"'' );',
'',
'        sys.htp.p(''Cache-Control: max-age=3600'');  -- tell the browser to cache for one hour, adjust as necessary',
'',
'        sys.owa_util.http_header_close;',
'',
'        sys.wpg_docload.download_file( c1.WBC_DOC );',
'',
'     ',
'',
'        apex_application.stop_apex_engine;',
'',
'    end loop;',
'',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267063525648837949)
,p_name=>'P22_WBC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(267063147717837945)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
