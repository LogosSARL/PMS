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
--   Date and Time:   10:55 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00037
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>37);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'openstreetmap copy page 14 - 2'
,p_page_mode=>'NORMAL'
,p_step_title=>'openstreetmap copy page 14 - 2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.js'
,p_css_file_urls=>'//unpkg.com/leaflet@1.0.1/dist/leaflet.css'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190822113514'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(482050497502110207)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
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
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
