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

prompt --application/pages/delete_00139
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>139);
end;
/
prompt --application/pages/page_00139
begin
wwv_flow_api.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'LEBANON MAP WITH MY LOCATION'
,p_page_mode=>'NORMAL'
,p_step_title=>'LEBANON MAP WITH MY LOCATION'
,p_step_sub_title=>'LEBANON MAP WITH MY LOCATION'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
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
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190822152111'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(482167595628757327)
,p_plug_name=>'LEBANON MAP WITH MY LOCATION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902053146019133)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_MAP'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(482167923650757328)
,p_default_chart_type=>'Map'
,p_chart_title=>'LEBANON'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_482167923650757328'
,p_chart_width=>700
,p_chart_height=>500
,p_chart_animation=>'N'
,p_display_attr=>':H:N:V:X:N:N:::Y:None:::N:::Default:::S'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:Y:Y:::::Y:N'
,p_map_source=>'asia/lebanon.amap'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_bgtype=>'Solid'
,p_grid_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'7'
,p_map_undef_color_scheme=>'1'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'Tahoma:10:#000000'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(482168375717757330)
,p_chart_id=>wwv_flow_api.id(482167923650757328)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL LINK, COUNTRY LABEL, PEOPLE Populations',
'FROM (',
'SELECT ''LEBANON'' country, 6000000 people',
'FROM dual',
')'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>300
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482050834805110211)
,p_name=>'P139_LATITUDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(482167595628757327)
,p_prompt=>'Latitude'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482050957518110212)
,p_name=>'P139_LONGITUDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(482167595628757327)
,p_prompt=>'LONGITUDE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482051069051110213)
,p_name=>'P139_ACCURACY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(482167595628757327)
,p_prompt=>'ACCURACY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482051161775110214)
,p_name=>'P139_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(482167595628757327)
,p_prompt=>'ERROR'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
