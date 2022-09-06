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
--     PAGE: 105
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00105
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>105);
end;
/
prompt --application/pages/page_00105
begin
wwv_flow_imp_page.create_page(
 p_id=>105
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Client-Contracts'
,p_step_title=>'Client-Contracts'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'20'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180307133546'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(153958711888450469)
,p_plug_name=>'Client-Contracts'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level, ',
'       "DSP_CODE" as title, ',
'       null as icon, ',
'       "ID" as value, ',
'       null as tooltip, ',
'       null as link ',
'from "#OWNER#"."LGS_CONTRACTS"',
'start with "ID" is null',
'connect by prior "ID" = "REF_TO_CONTRACT"',
'order siblings by "DSP_CODE"',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No data found.'
,p_attribute_02=>'S'
,p_attribute_04=>'N'
,p_attribute_07=>'APEX_TREE'
,p_attribute_10=>'"3"'
,p_attribute_11=>'"2"'
,p_attribute_12=>'"4"'
,p_attribute_15=>'"1"'
,p_attribute_20=>'"5"'
,p_attribute_22=>'"6"'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'"7"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153959126033450473)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(153958711888450469)
,p_button_name=>'CONTRACT_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153960434701450482)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(153958711888450469)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Expand All'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153959592063450477)
,p_name=>'CONTRACT_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(153959126033450473)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153960098395450479)
,p_event_id=>wwv_flow_imp.id(153959592063450477)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(153958711888450469)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153960861129450484)
,p_name=>'EXPAND_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(153960434701450482)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153961361006450484)
,p_event_id=>wwv_flow_imp.id(153960861129450484)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(153958711888450469)
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
