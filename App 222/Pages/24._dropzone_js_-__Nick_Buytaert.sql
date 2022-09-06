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
--     PAGE: 24
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00024
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>24);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_imp_page.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'dropzone js -  Nick Buytaert'
,p_step_title=>'dropzone js -  Nick Buytaert'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var fileInputElem = document.getElementById(''P24_FILE'');',
'var fileIndex = 0;',
' ',
'// builds a js array from long string',
'function clob2Array(clob, size, array) {',
'  loopCount = Math.floor(clob.length / size) + 1;',
'  for (var i = 0; i < loopCount; i++) {',
'    array.push(clob.slice(size * i, size * (i + 1)));',
'  }',
'  return array;',
'}',
' ',
'// converts binaryArray to base64 string',
'function binaryArray2base64(int8Array) {',
'  var data = "";',
'  var bytes = new Uint8Array(int8Array);',
'  var length = bytes.byteLength;',
'  for (var i = 0; i < length; i++) {',
'    data += String.fromCharCode(bytes[i]);',
'  }',
'  return btoa(data);',
'}',
' ',
'// a recursive function that calls itself to upload multiple files synchronously',
'function uploadFile(pFileIndex) {',
'  var file = fileInputElem.files[pFileIndex];',
'  var reader = new FileReader();',
' ',
'  reader.onload = (function(pFile) {',
'    return function(e) {',
'      if (pFile) {',
'        var base64 = binaryArray2base64(e.target.result);',
'        var f01Array = [];',
'        f01Array = clob2Array(base64, 30000, f01Array);',
' ',
'        apex.server.process(',
'          ''UPLOAD_FILE'',',
'          {',
'            x01: file.name,',
'            x02: file.type,',
'            f01: f01Array',
'          },',
'          {',
'            dataType: ''json'',',
'            success: function(data) {',
'              if (data.result == ''success'') {',
'                fileIndex++;',
' ',
'                if (fileIndex < fileInputElem.files.length) {',
'                  // start uploading the next file',
'                  uploadFile(fileIndex);',
'                } else {',
'                  // all files have been uploaded at this point',
'                  fileInputElem.value = '''';',
'                  $(''#uploadedFilesRpt'').trigger(''apexrefresh'');',
'                }',
'              } else {',
'                alert(''Oops! Something went terribly wrong. Please try again or contact your application administrator.'');',
'              }',
'            }',
'          }',
'        );',
'      }',
'    }',
'  })(file);',
'  reader.readAsArrayBuffer(file);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20191009120848'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(482054331993110246)
,p_plug_name=>'Files'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>'select * from client_image_desktop'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(566857451958083604)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>566857451958083604
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566857566159083605)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'File #'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566859224525083622)
,p_db_column_name=>'FILENAME'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566859321310083623)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566859457861083624)
,p_db_column_name=>'BYTES'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Bytes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566859569010083625)
,p_db_column_name=>'IMAGE'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Image'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(570396754490028888)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5703968'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:FILENAME:MIMETYPE:BYTES:IMAGE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(482054543801110248)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(482054331993110246)
,p_button_name=>'upload'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Upload'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482054466655110247)
,p_name=>'P24_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(482054331993110246)
,p_prompt=>'Files Browser'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'multiple'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(482054752619110250)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(482054543801110248)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'fileInputElem.files.length != 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(566857163354083601)
,p_event_id=>wwv_flow_imp.id(482054752619110250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(482054331993110246)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'fileIndex = 0;',
'uploadFile(fileIndex);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(566858481542083614)
,p_event_id=>wwv_flow_imp.id(482054752619110250)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'',
'',
'begin',
'',
'',
'',
' insert into client_image_desktop(seq_id,filename, mimetype, bytes, image)',
'',
'     select seq_id,c001,c002,',
'       dbms_lob.getlength(blob001) as file_size,',
'        blob001',
'    ',
'',
'      from apex_collections',
'      where collection_name = ''UPLOADED_FILES'';',
'',
'      ',
'    end;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(482054247872110245)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPLOADED_FILES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  lco_collection_name constant apex_collections.collection_name%type := ''UPLOADED_FILES'';',
'begin',
'',
'    if  apex_collection.collection_exists(lco_collection_name) then',
'    apex_collection.DELETE_COLLECTION(',
'      p_collection_name => lco_collection_name',
'    );',
' end if;',
'  ',
'  if not apex_collection.collection_exists(lco_collection_name) then',
'    apex_collection.create_collection(',
'      p_collection_name => lco_collection_name',
'    );',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(482054663604110249)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPLOAD_FILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  lco_collection_name constant apex_collections.collection_name%type := ''UPLOADED_FILES'';',
'  l_blob blob;',
'  l_filename varchar2(200);',
'  l_mime_type varchar2(200);',
'  l_token varchar2(32000);',
'begin ',
'  l_filename := apex_application.g_x01;',
'  l_mime_type := nvl(apex_application.g_x02, ''application/octet-stream'');',
' ',
'  -- build BLOB from f01 30k array (base64 encoded)',
'  dbms_lob.createtemporary(l_blob, false, dbms_lob.session);',
'  for i in 1 .. apex_application.g_f01.count loop',
'    l_token := wwv_flow.g_f01(i);',
'    if length(l_token) > 0 then',
'      dbms_lob.append(',
'        dest_lob => l_blob,',
'        src_lob => to_blob(utl_encode.base64_decode(utl_raw.cast_to_raw(l_token)))',
'      );',
'    end if;',
'  end loop;',
' ',
'  -- add collection member (only if BLOB is not null)',
'  if dbms_lob.getlength(l_blob) is not null then',
'    apex_collection.add_member(',
'      p_collection_name => lco_collection_name,',
'      p_c001 => l_filename,',
'      p_c002 => l_mime_type,',
'      p_blob001 => l_blob',
'    );',
'  end if;',
' ',
'  apex_json.open_object;',
'  apex_json.write(',
'    p_name => ''result'',',
'    p_value => ''success''',
'  );',
'  apex_json.close_object;',
'exception',
'  when others then',
'    apex_json.open_object;',
'    apex_json.write(',
'      p_name => ''result'',',
'      p_value => ''fail''',
'    );',
'    apex_json.close_object;',
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
