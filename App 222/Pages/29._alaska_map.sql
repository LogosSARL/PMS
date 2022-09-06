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
--   Date and Time:   10:35 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 29
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00029
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>29);
end;
/
prompt --application/pages/page_00029
begin
wwv_flow_imp_page.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'alaska map'
,p_step_title=>'alaska map'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190816161538'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(478256733839529461)
,p_plug_name=>'alaska map'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL LINK, COUNTRY LABEL, PEOPLE Populations',
'FROM (',
'SELECT ''Ireland'' country, 4203200 people',
'FROM dual',
'UNION ALL',
'SELECT ''United States'' country, 307896743 people',
'FROM dual',
'UNION ALL',
'SELECT ''United Kingdom'' country, 61113205 people',
'FROM dual',
'UNION ALL',
'SELECT ''Austria'' country, 8210281 people',
'FROM dual)',
''))
,p_plug_display_condition_type=>'NEVER'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
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
