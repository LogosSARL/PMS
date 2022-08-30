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
--   Date and Time:   11:27 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 139
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00139
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>139);
end;
/
prompt --application/pages/page_00139
begin
wwv_flow_imp_page.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'LEBANON MAP WITH MY LOCATION'
,p_step_title=>'LEBANON MAP WITH MY LOCATION'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Geolocation: update the cookie with current coordinates',
'function geo_success(position) {',
'    var geo_latitude  = position.coords.latitude;',
'    var geo_longitude = position.coords.longitude;',
'    document.cookie = "geo_latitude=" + geo_latitude;',
'    document.cookie = "geo_longitude="+ geo_longitude;',
'    document.cookie = "geo_error=";',
'    document.getElementById(''P139_LATITUDE'' ).value = geo_latitude;',
'    document.getElementById(''P139_LONGITUDE'').value = geo_longitude;',
'    document.getElementById(''P139_ERROR''    ).value = '''';',
'}',
'',
'// Geolocation: handle errors',
'function geo_error(err) {',
'    console.warn(''GEO_ERROR('' + err.code + ''): '' + err.message);',
'    document.cookie = "geo_error=" + "(" + err.code + "): " + err.message;',
'    $s(''P139_ERROR'', err.code + '': '' + err.message);',
'    document.getElementById(''P139_ERROR'').value = err.code + '': '' + err.message;',
'};',
'',
'// Geolocation: options (high accuracy)',
'var geo_options_high = {',
'    enableHighAccuracy: true,',
'    /* Is a Boolean that indicates the application would like to receive the best possible results. ',
'       If true and if the device is able to provide a more accurate position, it will do so. ',
'       Note that this can result in slower response times or increased power consumption (with a GPS chip on a mobile device for example). ',
'       On the other hand, if false, the device can take the liberty to save resources by responding more quickly and/or using less power. ',
'       Default: false.',
'    */',
'    timeout: 20000,',
'    /* Is a positive long value representing the maximum length of time (in milliseconds) the device is allowed to take in order to return a position. ',
'       The default value is Infinity, meaning that getCurrentPosition() won''t return until the position is available.',
'    */',
'    maximumAge: 0',
'    /* Is a positive long value indicating the maximum age in milliseconds of a possible cached position that is acceptable to return. ',
'       If set to 0, it means that the device cannot use a cached position and must attempt to retrieve the real current position. ',
'       If set to Infinity the device must return a cached position regardless of its age.',
'    */',
'};',
'',
'// Geolocation: run getCurrentPosition (high accuracy)',
'function geo_location_int_high() {',
'    navigator.geolocation.getCurrentPosition(geo_success, geo_error, geo_options_high);',
'    document.getElementById(''P139_ACCURACY'').value = ''HIGH'';',
'}',
'',
'// Geolocation: options (low accuracy)',
'var geo_options_low = {',
'    enableHighAccuracy: false,',
'    timeout: 20000,',
'    maximumAge: 60000',
'};',
'',
'// Geolocation: run getCurrentPosition (low accuracy)',
'function geo_location_int_low() {',
'    navigator.geolocation.getCurrentPosition(geo_success, geo_error, geo_options_low);',
'    document.getElementById(''P139_ACCURACY'').value = ''LOW'';',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Geolocation: update the coordinates once with low accuracy, then once with high accuracy, and then repeat every X milliseconds with high accuracy',
'geo_location_int_low();',
'geo_location_int_high();',
'setInterval("geo_location_int_high()", 30000);'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190822152111'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(482167595628757327)
,p_plug_name=>'LEBANON MAP WITH MY LOCATION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902053146019133)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL LINK, COUNTRY LABEL, PEOPLE Populations',
'FROM (',
'SELECT ''LEBANON'' country, 6000000 people',
'FROM dual',
')'))
,p_plug_display_condition_type=>'NEVER'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482050834805110211)
,p_name=>'P139_LATITUDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(482167595628757327)
,p_prompt=>'Latitude'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482050957518110212)
,p_name=>'P139_LONGITUDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(482167595628757327)
,p_prompt=>'LONGITUDE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482051069051110213)
,p_name=>'P139_ACCURACY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(482167595628757327)
,p_prompt=>'ACCURACY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482051161775110214)
,p_name=>'P139_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(482167595628757327)
,p_prompt=>'ERROR'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
