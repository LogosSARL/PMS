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
--     PAGE: 37
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00037
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>37);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_imp_page.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'openstreetmap copy page 14 - 2'
,p_step_title=>'openstreetmap copy page 14 - 2'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.js'
,p_css_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.css'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190822113514'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(482050497502110207)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<html>',
'  <head>',
'    <title>OpenLayers Demo</title>',
'    <style type="text/css">',
'      html, body, #basicMap {',
'          width: 100%;',
'          height: 100%;',
'          margin: 0;',
'      }',
'    </style>',
'    <script src="OpenLayers.js"></script>',
'    <script>',
'      function init() {',
'        map = new OpenLayers.Map("basicMap");',
'        var mapnik         = new OpenLayers.Layer.OSM();',
'        var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984',
'        var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection',
'        var position       = new OpenLayers.LonLat(13.41,52.52).transform( fromProjection, toProjection);',
'        var zoom           = 15; ',
'',
'        map.addLayer(mapnik);',
'        map.setCenter(position, zoom );',
'      }',
'    </script>',
'  </head>',
'  <body onload="init();">',
'    <div id="basicMap"></div>',
'  </body>',
'</html>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
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
