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
,p_default_application_id=>222
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:54 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00014
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>14);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'geolocation api'
,p_page_mode=>'NORMAL'
,p_step_title=>'geolocation api'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190822103636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(482049842634110201)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'!DOCTYPE html>',
'<html>',
'',
'<head>',
' <title>Simple Map</title>',
' <meta name="viewport" content="initial-scale=1.0">',
' <meta charset="utf-8">',
' <style>',
' /* Always set the map height explicitly to define the size of the div * element that contains the map. */',
' ',
' #map {',
' height: 100%;',
' }',
' /* Optional: Makes the sample page fill the window. */',
' ',
' html,',
' body {',
' height: 100%;',
' margin: 0;',
' padding: 0;',
' }',
' ',
' #mapp .t-Region-body {',
' height: 600px !important;',
' }',
' </style>',
'</head>',
'',
'<body>',
' <div id="map"></div>',
' <script>',
' var map;',
'',
' function initMap() {',
' map = new google.maps.Map(document.getElementById(''map''), {',
' center: {',
' lat: -34.397,',
' lng: 150.644',
' },',
' zoom: 8',
' });',
' }',
' </script>',
' <script src="https://maps.googleapis.com/maps/api/js?key=MY_GOOGLE_APP_KEY&callback=initMap" async defer></script>',
'</body>',
'',
'</html>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(482050161707110204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(482049842634110201)
,p_button_name=>'findlocation'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Find Location'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482049901471110202)
,p_name=>'P14_LATITUDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(482049842634110201)
,p_prompt=>'Latitude'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(482050046846110203)
,p_name=>'P14_LONGTTUDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(482049842634110201)
,p_prompt=>'Longttude'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(482050289223110205)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(482050161707110204)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(482050358421110206)
,p_event_id=>wwv_flow_api.id(482050289223110205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var map = new google.maps.Map(document.getElementById(''map''), {',
' center: {lat: -34.397, lng: 150.644},',
' zoom: 15',
'});',
'var infoWindow = new google.maps.InfoWindow({map: map});',
'',
'// Try HTML5 geolocation.',
'if (navigator.geolocation) {',
' navigator.geolocation.getCurrentPosition(function(position) {',
' var pos = {',
' lat: position.coords.latitude,',
' lng: position.coords.longitude',
' };',
' $(''#P14_LATITUDE'').val(position.coords.latitude);',
' $(''#P14_LONGTTUDE'').val(position.coords.longitude);',
'',
' infoWindow.setPosition(pos);',
' infoWindow.setContent(''Location found.'');',
' map.setCenter(pos);',
' }, function() {',
' handleLocationError(true, infoWindow, map.getCenter());',
' });',
'} else {',
' // Browser doesn''t support Geolocation',
' handleLocationError(false, infoWindow, map.getCenter());',
'}',
'',
'function handleLocationError(browserHasGeolocation, infoWindow, pos) {',
' infoWindow.setPosition(pos);',
' infoWindow.setContent(browserHasGeolocation ?',
' ''Error: The Geolocation service failed.'' :',
' ''Error: Your browser doesn\''t support geolocation.'');',
'}'))
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
