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

prompt --application/pages/delete_00018
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>18);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'Lebanon Map Automatic page'
,p_page_mode=>'NORMAL'
,p_step_title=>'Lebanon Map Automatic page'
,p_step_sub_title=>'Lebanon Map Automatic page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.js'
,p_javascript_code=>'var map, drivebc_events;'
,p_css_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.css'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190816144439'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(478236110842879630)
,p_plug_name=>'Lebanon Map Automatic page'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_MAP'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(478236520035879631)
,p_default_chart_type=>'Map'
,p_chart_title=>'Lebanon'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_478236520035879631'
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
 p_id=>wwv_flow_api.id(478236921215879632)
,p_chart_id=>wwv_flow_api.id(478236520035879631)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT null link, region label, value Populations',
'FROM (',
'SELECT ''Beirut'' region, 18328340 value FROM dual',
'UNION ALL',
'SELECT ''Aley'' region, 686293 value FROM dual)'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>300
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(478246250638973301)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(478246380069973302)
,p_event_id=>wwv_flow_api.id(478246250638973301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Create the map and set the initial location to the City of Vancouver.',
'map = L.map(this.affectedElements.attr(''id'')).setView([49.246292, -123.116226], 12);',
'',
'// Add a feature group to manage markers by event types.',
'drivebc_events = L.featureGroup();',
'',
'// Add the map tiles',
'L.tileLayer(',
'  ''https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'',',
'  {',
'    maxZoom: 18,',
'    minZoom: 8,',
'    attribution: ''Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors''',
' }).addTo(map);',
'',
'// Add the markers',
'map.addLayer(drivebc_events);',
'',
'// AJAX call to load events based on the historical event source',
'apex.server.process(',
'  ''LOAD_DRIVEBC_EVENTS'',',
'  {',
'    x01: map.getCenter().lng,',
'    x02: map.getCenter().lat',
'  },',
'  {',
'    success: function(pData) {',
'      var events = pData.events;',
'      for (var i = 0; i < events.length; i++) {',
'        var event = events[i];',
'        L.marker([event.latitude, event.longitude], { title: event.event_name })',
'          .bindPopup(''<p>'' + (event.description !== undefined ? event.description : ''No advisory message'') + ''</p>'')',
'          .addTo(drivebc_events);',
'      }',
'    }',
'  }',
');'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(478246500146973304)
,p_name=>'New_1'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(478246619245973305)
,p_event_id=>wwv_flow_api.id(478246500146973304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Set the map''s width and height',
'this.affectedElements.height($(window).height() - $(''#t_Header'').height());',
'',
'// Invalidating the map will force it to redraw.',
'map.invalidateSize();'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(478246445978973303)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  type t_events is table of eventshist%rowtype;',
'  l_events t_events;',
'  l_center_lng number := apex_application.g_x01;',
'  l_center_lat number := apex_application.g_x02;',
'begin',
'  select * ',
'  bulk collect into l_events',
'  from eventshist',
'  where 1 = 1',
'    and l_center_lng is not null ',
'    and l_center_lat is not null ',
'    and sdo_within_distance(',
'      geom',
'      , sdo_geometry(2001, 8307, sdo_point_type(l_center_lng, l_center_lat, null), null, null)',
'      , ''distance=100 unit=km''',
'    ) = ''TRUE'');',
' ',
'  apex_json.open_object; ',
'  apex_json.open_array(''events'');',
' ',
'  for i in 1..l_events.count loop',
'    apex_json.open_object;',
'    apex_json.write(''event_id'', l_events(i).id);',
'    apex_json.write(''event_name'', l_events(i).cause);',
'    apex_json.write(''description'', l_events(i).advisorymessage);',
'    apex_json.write(''longitude'', l_events(i).geom.sdo_point.x);',
'    apex_json.write(''latitude'', l_events(i).geom.sdo_point.y);',
'    apex_json.close_object;',
'  end loop;',
' ',
'  apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
