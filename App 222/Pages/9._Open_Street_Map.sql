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
--     PAGE: 9
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00009
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>9);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'Open Street Map'
,p_step_title=>'Open Street Map'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//unpkg.com/leaflet@1.0.1/dist/leaflet.js',
'',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'var map, drivebc_events, live_events;',
'',
'var pinkMarker = L.icon({',
'  iconUrl: ''#APP_IMAGES#img/map-marker-icon-pink.png'',',
'  iconSize: [32, 32],',
'  iconAnchor: [16, 32],',
'  popupAnchor: [0, -28]',
'});'))
,p_css_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.css'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190816134956'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(478094169066530601)
,p_plug_name=>'New'
,p_region_name=>'openstreetmap'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(478230537785631401)
,p_name=>'P9_REPORT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(478094169066530601)
,p_prompt=>'Report url'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(478208919513166001)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(478209064108166002)
,p_event_id=>wwv_flow_imp.id(478208919513166001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Create the map and set the initial location to the City of Vancouver.',
'map = L.map(this.affectedElements.prop(''id'')).setView([49.246292, -123.116226], 12);',
'',
'// Add a feature group to manage markers by event types.',
'drivebc_events = L.featureGroup();',
'live_events = L.featureGroup();',
'',
'// Add the map tiles',
'L.tileLayer(',
'  ''https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'',',
'  {',
'    maxZoom: 18,',
'    minZoom: 8,',
unistr('    attribution: ''Map data \00A9 <a href="http://openstreetmap.org">OpenStreetMap</a> contributors'''),
'  }).addTo(map);',
'',
'// Add the markers',
'map.addLayer(drivebc_events);',
'map.addLayer(live_events);',
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
');',
'',
'// AJAX call to load live events from DriveBC Open511 API',
'apex.server.process(',
'  ''LOAD_LIVE_EVENTS'',',
'  {',
'    x01: 100,',
'    x02: map.getBounds().getWest(),',
'    x03: map.getBounds().getSouth(),',
'    x04: map.getBounds().getEast(),',
'    x05: map.getBounds().getNorth()',
'  },',
'  {',
'    success: function(pData) {',
'      var events = pData.events;',
'      for (var i = 0; i < events.length; i++) {',
'        var event = events[i];',
'        L.marker([event.latitude, event.longitude], { icon: pinkMarker, title: event.event_name })',
'          .bindPopup(''<p>'' + (event.description !== undefined ? event.description : ''No advisory message'') + ''</p>'')',
'          .addTo(live_events);',
'      }',
'    }',
'  }',
');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(478215734437313101)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_DRIVEBC_EVENTS'
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
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(478216001679313104)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_LIVE_EVENTS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result clob;',
'  l_values apex_json.t_values;',
'  l_limit number := apex_application.g_x01;',
'  l_xmin number := apex_application.g_x02;',
'  l_ymin number := apex_application.g_x03;',
'  l_xmax number := apex_application.g_x04;',
'  l_ymax number := apex_application.g_x05;',
'begin',
'  l_result := apex_web_service.make_rest_request(',
'    p_url => ''http://api.open511.gov.bc.ca/events''',
'    , p_http_method => ''GET''',
'    , p_parm_name => apex_util.string_to_table(''status:limit'' ',
'      || case',
'           when l_xmin is not null and l_ymin is not null and l_xmax is not null',
'             and l_ymax is not null then '':bbox''',
'           else null',
'         end',
'    )',
'    , p_parm_value => apex_util.string_to_table(''ACTIVE:''',
'      || l_limit',
'      || case',
'           when l_xmin is not null and l_ymin is not null and l_xmax is not null',
'             and l_ymax is not null then ',
'               '':'' || l_xmin || '','' || l_ymin || '','' || l_xmax || '','' || l_ymax',
'           else null',
'         end ',
'    )',
'  );',
' ',
'  apex_json.parse(',
'    p_values => l_values',
'    , p_source => l_result',
'  );',
' ',
'  apex_json.open_object;',
'  apex_json.open_array(''events'');',
' ',
'  for i in 1..apex_json.get_count(p_path => ''events'', p_values => l_values) loop',
'    apex_json.open_object;',
'    apex_json.write(',
'      p_name => ''event_id''',
'      , p_value => apex_json.get_varchar2(',
'        p_path => ''events[%d].id''',
'        , p0 => i',
'        , p_values => l_values',
'      )',
'    );',
'    apex_json.write(',
'      p_name => ''event_name''',
'      , p_value => apex_json.get_varchar2(',
'        p_path => ''events[%d].headline''',
'        , p0 => i',
'        , p_values => l_values',
'      )',
'    );',
'    apex_json.write(',
'      p_name => ''description''',
'      , p_value => apex_json.get_varchar2(',
'        p_path => ''events[%d].description''',
'        , p0 => i',
'        , p_values => l_values',
'      )',
'    );',
'    if ''POINT'' = upper(apex_json.get_varchar2(',
'      p_path => ''events[%d].geography.type''',
'      , p0 => i',
'      , p_values => l_values',
'    )) then ',
'      apex_json.write(',
'        p_name => ''longitude''',
'        , p_value => apex_json.get_number(',
'          p_path => ''events[%d].geography.coordinates[%d]''',
'          , p0 => i',
'          , p1 => 1',
'          , p_values => l_values',
'        )',
'      );',
'      apex_json.write(',
'        p_name => ''latitude''',
'        , p_value => apex_json.get_number(',
'          p_path => ''events[%d].geography.coordinates[%d]''',
'          , p0 => i',
'          , p1 => 2',
'          , p_values => l_values',
'        )',
'      );',
'    else',
'      apex_json.write(',
'        p_name => ''longitude''',
'        , p_value => apex_json.get_number(',
'          p_path => ''events[%d].geography.coordinates[%d][%d]''',
'          , p0 => i',
'          , p1 => 1',
'          , p2 => 1',
'          , p_values => l_values',
'        )',
'      );',
'      apex_json.write(',
'        p_name => ''latitude''',
'        , p_value => apex_json.get_number(',
'          p_path => ''events[%d].geography.coordinates[%d][%d]''',
'          , p0 => i',
'          , p1 => 1',
'          , p2 => 2',
'          , p_values => l_values',
'        )',
'      );',
'    end if;',
'    apex_json.close_object;',
'  end loop;',
' ',
'  apex_json.close_all;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
