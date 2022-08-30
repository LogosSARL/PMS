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

prompt --application/pages/delete_00135
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>135);
end;
/
prompt --application/pages/page_00135
begin
wwv_flow_api.create_page(
 p_id=>135
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Download BLOB FILE_NOT_FROM_X_FILE'
,p_page_mode=>'NORMAL'
,p_step_title=>'Download BLOB FILE_NOT_FROM_X_FILE'
,p_step_sub_title=>'Download BLOB FILE_NOT_FROM_X_FILE'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200627204158'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(369937304327906357)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    for c1 in (select MIME_TYPE, BLOB_CONTENT',
'',
'                 from LGS_PIP_WF_DOCS ',
'',
'                where NAME = :P135_FILE_NAME) loop',
'',
'        --',
'',
'        sys.htp.init;',
'',
'        sys.owa_util.mime_header( c1.MIME_TYPE, FALSE );',
'',
'        sys.htp.p(''Content-length: '' || sys.dbms_lob.getlength( c1.BLOB_CONTENT));',
'',
'        sys.htp.p(''Content-Disposition: attachment; filename="'' || :P135_FILE_NAME || ''"'' );',
'',
'        sys.htp.p(''Cache-Control: max-age=3600'');  -- tell the browser to cache for one hour, adjust as necessary',
'',
'        sys.owa_util.http_header_close;',
'',
'        sys.wpg_docload.download_file( c1.blob_content );',
'',
'     ',
'',
'        apex_application.stop_apex_engine;',
'',
'    end loop;',
'',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(279799438913255756)
,p_name=>'P135_FILE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(369937304327906357)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
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
