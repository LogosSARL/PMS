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

prompt --application/pages/delete_00015
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>15);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'leaflet map'
,p_page_mode=>'NORMAL'
,p_step_title=>'leaflet map'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_footer_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script type="text/javascript" src="/i/libraries/jquery/2.2.3/jquery-2.2.3.min.js?v=5.1.1.00.08"></script>',
'',
'	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" integrity="sha512-07I2e+7D8p6he1SIM+1twR5TIrhUQn9+I6yjqD53JQjFiMf8EtC93ty0/5vJTZGF8aAocvHYNEDJajGdNx1IsQ=="crossorigin=""/>',
'',
'	<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js" integrity="sha512-A7vV8IFfih/D732iSSKi20u/ooOfj/AGehOKq0f4vLT1Zr2Y+RX7C+w8A1gaSasGtRUZpF/NZgzSAu4/Gc41Lg=="',
'            crossorigin=""></script>'))
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.infoDiv {',
'',
'	    max-height: 500px;',
'',
'	    height: auto;',
'',
'	    width: 300px;',
'',
'	    background-color: white;',
'',
'	}',
'',
'	div.infoDiv >p >img { width: 180px; border: 2px solid #CCC; -moz-border-radius: 2px; -webkit-border-radius: 2px; }',
'',
'	div.infoDiv>h3 { font-weight: bold; font-size: 14px; text-shadow: 1px 2px #e6dede; }',
'',
'	div.infoDiv>p>i.fa { vertical-align: middle !important;}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190814162913'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(478101196281773601)
,p_plug_name=>'New'
,p_region_name=>'lmap'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148710019351243458)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="lmap" style="height: 600px; width: 100%"> Loading ...</div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(478101238186773602)
,p_name=>'P15_SIT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(478101196281773601)
,p_prompt=>'Sit id'
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
 p_id=>wwv_flow_api.id(478101353441773603)
,p_name=>'P15__NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(478101196281773601)
,p_prompt=>'New'
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
 p_id=>wwv_flow_api.id(478119214720297301)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(478119389179297302)
,p_event_id=>wwv_flow_api.id(478119214720297301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(function(){',
'',
'var str =$(''#P15_NEW'').val(); //get the json string from the page item;',
'',
'//samle json data ={"assets":[{"NAME":"MT TOOLBRUNUP","STATUS":"OPEN", "LATITUDE": 32.442342, "LONGITUDE": -114.543534, etc}]};',
'',
' var arr = JSON.parse(str);',
'',
'var latlng = L.latLng(-30.81881, 116.16596);',
'',
'var mymap = L.map(''lmap'', { center: latlng, zoom: 12 });',
'',
'L.tileLayer(''https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'', {',
'',
'maxZoom: 16,',
'',
'attribution: ''Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, '' +',
'',
'''<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '' +',
'',
'''Imagery © <a href="http://mapbox.com">Mapbox</a>'',',
'',
'	                    id: ''mapbox.satellite''',
'',
'	                    }).addTo(mymap);',
'',
'	                if(arr.assets.length <= 0)',
'',
'	                    {',
'',
'	                        //display message when the array is empty',
'',
'	                        alert("No assets found with valid GPS a coordinates!");',
'',
'	                        return false;',
'',
'	                    }',
'',
'',
'	                 $.each(arr.assets, function(i, item ) {',
'',
'	                       // loadMap(parseFloat(item.FAC_LONGITUDE_DEC), parseFloat(item.FAC_LATITUDE_DEC));',
'',
'	                         // alert( item.FAC_TYPE + " " + item.FAC_ASSET_STATUS + " lat: " + item.FAC_LATITUDE_DEC );',
'',
'	                     var imgT=item.IMAGE;',
'',
'',
'	                     var marker = L.marker(L.latLng(parseFloat(item.LATITUDE), parseFloat(item.LONGITUDE)), { title: item.FAC_TYPE });',
'',
'	                          ',
'',
'	                        var popupContent = "<div class=''infoDiv''><h3><i class=''fa fa-tag''></i> " + item.FT_DESC + " ("+ item.FAC_TYPE  + ")" + "</h3><p>"+ imgTag + "<br />" + item.FAC_DESC +" <br /><i class=''fa fa-flag''></i> Status: " + item.CONDITI'
||'ON + "</p></div>";',
'',
'	 ',
'',
'	                         marker.bindPopup(popupContent);',
'',
'	                        ',
'',
'	                        mymap.setView(new L.LatLng(parseFloat(item.LATITUDE), parseFloat(item.LONGITUDE)), 12);',
'',
'	                        //display popup',
'',
'	                        mymap.addLayer(marker);',
'',
'	 ',
'',
'	    });',
'',
'	 ',
'',
'	            ',
'',
'	             mymap.invalidateSize(true);',
'',
'	        ',
'',
'	       ',
'',
'	                //L.marker([lon, lat]).addTo(mymap);',
'',
'	            mymap.scrollWheelZoom.disable();',
'',
'	     ',
'',
'	 ',
'',
'	    });'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(478101436013773604)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'',
'cur_sql SYS_REFCURSOR;',
'',
'BEGIN',
'',
'Open cur_sql for select initcap(fac_type) fac_type, initcap(asset_condition) condition, latitude, longitude, fac_sub_type_desc ft_desc, fac_asset_desc fac_desc, CASE',
'',
'WHEN f.fil_id IS NOT NULL ',
'',
'THEN decode(nvl(dbms_lob.getlength(f.file_contents),0),0,null,',
'',
'''<img alt="''||fac_type||''"''||  '' src="''||  apex_util.get_blob_file_src(''P3_FILE_THUMBNAIL_2'',f.fil_id)||   ''"  />'')',
'',
' ELSE ''NO''',
'',
'END Image from tbl_facilities_subtype fs, tbl_files f where sit_id= :P15_SIT_ID and f.SOURCE_ID(+) = fs.FAC_ID and latitude is not null and longitude is not null;',
'',
'apex_json.initialize_clob_output;',
'',
'apex_json.open_object;',
'',
'/* apex_json.open_array(''array''); */',
'',
'apex_json.write(''assets'',cur_sql);',
'',
'/* apex_json.close_array; */',
'',
'',
'apex_json.close_object;',
'',
'	 ',
':P15_NEW := apex_json.get_clob_output;',
'',
'apex_json.free_output;',
'',
'End;'))
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
