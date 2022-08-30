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

prompt --application/pages/delete_00044
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>44);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'copy of page 42'
,p_page_mode=>'NORMAL'
,p_step_title=>'copy of page 42'
,p_step_sub_title=>'copy of page 42'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var fileInputElem = document.getElementById(''P44_BROWSE'');',
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
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20191028155502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1190378099276197650)
,p_plug_name=>'Image in Database'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  MYIMG_COL_ID,COLLECTION_NAME,PICNAME,MIME_TYPE,PIC_SIZE,CONTENT, dbms_lob.getlength(CONTENT) as download, dbms_lob.getlength(CONTENT) as display',
'FROM   MYIMAGES_COLLECTION  ',
'order by 1    ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
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
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1190378253373197651)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JAWAD'
,p_internal_uid=>1190378253373197651
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607858031806890764)
,p_db_column_name=>'MYIMG_COL_ID'
,p_display_order=>10
,p_column_identifier=>'N'
,p_column_label=>'Myimg col id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607858459286890764)
,p_db_column_name=>'COLLECTION_NAME'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>'Collection name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607858816598890765)
,p_db_column_name=>'PICNAME'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Picname'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607859274353890765)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>40
,p_column_identifier=>'Q'
,p_column_label=>'Mime type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607859615493890765)
,p_db_column_name=>'PIC_SIZE'
,p_display_order=>50
,p_column_identifier=>'R'
,p_column_label=>'Pic size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607860069300890766)
,p_db_column_name=>'CONTENT'
,p_display_order=>60
,p_column_identifier=>'S'
,p_column_label=>'Content'
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
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607860493718890766)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Download'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607860874123890766)
,p_db_column_name=>'DISPLAY'
,p_display_order=>80
,p_column_identifier=>'V'
,p_column_label=>'Display'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'IMAGE:MYIMAGES_COLLECTION:CONTENT:MYIMG_COL_ID::::::::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1196574726113224453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6078612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'MYIMG_COL_ID:COLLECTION_NAME:PICNAME:MIME_TYPE:PIC_SIZE:CONTENT:DOWNLOAD:DISPLAY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1763407094146721645)
,p_plug_name=>'Images Collection'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id,',
'       ''UPLOADED_FILES'' as collection_name,',
'       c001,',
'       c002,',
'       dbms_lob.getlength(blob001) as file_size,',
'       dbms_lob.getlength(blob001) as blob001,',
'       seq_id as delete_file',
'from apex_collections',
'where collection_name = ''UPLOADED_FILES'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
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
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1763407193255721646)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JAWAD'
,p_internal_uid=>1763407193255721646
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607852978286890751)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607853315492890751)
,p_db_column_name=>'COLLECTION_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Collection name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607853721488890752)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'C001'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607854128645890752)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'C002'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607854516731890752)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607854980810890752)
,p_db_column_name=>'BLOB001'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Blob001'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(607855335314890752)
,p_db_column_name=>'DELETE_FILE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Delete file'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1779078142919946575)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6078557'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'SEQ_ID:COLLECTION_NAME:C001:C002:FILE_SIZE:BLOB001:DELETE_FILE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(607856156133890757)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_button_name=>'upload'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Upload'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(607861694524890767)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_button_name=>'deletedb'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Delete Database'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(607856964202890758)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_button_name=>'delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Delete Collection'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(607856597795890757)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_button_name=>'INSERT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'INSERT DATABASE'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(592664662198281343)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_button_name=>'INSERTBULK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Insert bulk'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(607857351014890760)
,p_name=>'P44_BROWSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1763407094146721645)
,p_prompt=>'Browse'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'multiple'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(607864492229890778)
,p_name=>'INSERT'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(607856156133890757)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'fileInputElem.files.length != 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(607864965939890778)
,p_event_id=>wwv_flow_api.id(607864492229890778)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'fileIndex = 0;',
'uploadFile(fileIndex);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(607863515968890778)
,p_name=>'delete'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(607856964202890758)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(607864039327890778)
,p_event_id=>wwv_flow_api.id(607863515968890778)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'  lco_collection_name constant apex_collections.collection_name%type := ''UPLOADED_FILES'';',
'begin ',
'',
' if  apex_collection.collection_exists(lco_collection_name) then',
'    apex_collection.DELETE_COLLECTION(',
'      p_collection_name => lco_collection_name',
'    );',
'  end if;',
'',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(607862731224890777)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  lco_collection_name constant apex_collections.collection_name%type := ''UPLOADED_FILES'';',
'begin',
'',
'   ',
'  ',
'  if not apex_collection.collection_exists(lco_collection_name) then',
'    apex_collection.create_collection(',
'      p_collection_name => lco_collection_name',
'    );',
'  end if;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'prerendering sucess'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(607862072373890776)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERTDATABASE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'--SET serverout ON;',
'',
'V_MYIMG_COL_ID       NUMBER DEFAULT NULL;',
'V_COLLECTION_NAME    VARCHAR2(400)  DEFAULT NULL;',
'V_PICNAME            VARCHAR2(350)  DEFAULT NULL;',
'V_MIME_TYPE          VARCHAR2(255)  DEFAULT NULL;',
'V_PIC_SIZE           NUMBER  DEFAULT NULL;',
'V_CONTENT            BLOB   DEFAULT NULL;',
'',
'V_seq_id            NUMBER   DEFAULT NULL;',
'V_collection_name1  VARCHAR2(400)  DEFAULT NULL;',
'V_c001              VARCHAR2(350)  DEFAULT NULL;',
'V_c002              VARCHAR2(255)  DEFAULT NULL;',
'V_file_size         NUMBER  DEFAULT NULL;',
'V_blob001           BLOB  DEFAULT NULL;',
'',
'V_LOOP  NUMBER  DEFAULT NULL;',
'V_MAX  NUMBER  DEFAULT NULL;',
'  ',
'BEGIN',
'',
'',
'-- GET MAXIMUM RECORDS OF COLLECTION',
'select MAX(seq_id) INTO V_LOOP ',
'from apex_collections',
'where collection_name = ''UPLOADED_FILES'';',
'',
'SELECT MAX(MYIMG_COL_ID) INTO V_MAX',
'FROM  MYIMAGES_COLLECTION;',
'',
'',
'      WHILE V_LOOP != 0 ',
'      LOOP ',
'         ',
'          select seq_id INTO V_seq_id',
'          from apex_collections',
'          where collection_name = ''UPLOADED_FILES''',
'          AND seq_id = V_LOOP;',
'        ',
'            V_MYIMG_COL_ID := V_seq_id + V_MAX;',
'        ',
'          ',
'          select ''UPLOADED_FILES''  INTO   V_collection_name1      ',
'          from apex_collections',
'          where collection_name = ''UPLOADED_FILES''',
'          AND seq_id = V_LOOP;',
'        ',
'          V_COLLECTION_NAME := V_collection_name1;',
'',
'         ',
'           select c001 INTO    V_c001',
'           from apex_collections',
'           where collection_name = ''UPLOADED_FILES''',
'           AND seq_id = V_LOOP;',
'        ',
'        V_PICNAME := V_c001;',
'',
'         ',
'           select c002 INTO    V_c002 ',
'           from apex_collections',
'           where collection_name = ''UPLOADED_FILES''',
'           AND seq_id = V_LOOP;',
'    ',
'        ',
'           V_MIME_TYPE:= V_c002;',
'',
'        ',
'           select dbms_lob.getlength(blob001)  INTO  V_file_size  ',
'           from apex_collections',
'           where collection_name = ''UPLOADED_FILES''',
'           AND seq_id = V_LOOP;',
'        ',
'           V_PIC_SIZE := V_file_size;',
'',
'        ',
'           select blob001  INTO   V_blob001  ',
'           from apex_collections',
'           where collection_name = ''UPLOADED_FILES''',
'           AND seq_id = V_LOOP;',
'        ',
'           V_CONTENT := V_blob001;',
'',
'',
'           INSERT INTO MYIMAGES_COLLECTION',
'           (MYIMG_COL_ID,COLLECTION_NAME,PICNAME,MIME_TYPE,PIC_SIZE,CONTENT)',
'            VALUES',
'           (V_MYIMG_COL_ID, V_COLLECTION_NAME,V_PICNAME,V_MIME_TYPE,V_PIC_SIZE,V_CONTENT);',
'            COMMIT;',
'',
'           V_LOOP := V_LOOP - 1;',
'',
'          END LOOP;',
'          V_MAX := 0;',
'',
'',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(607856597795890757)
,p_process_success_message=>'INSERT DATABASE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(607862325360890777)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'deletedb'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'',
'delete from MYIMAGES_COLLECTION;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(607861694524890767)
,p_process_success_message=>'Delete database rows successfully'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(592664528316281342)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT BULK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'',
'',
'BEGIN  ',
'',
'',
'',
'',
' INSERT INTO MYIMAGES_COLLECTION (MYIMG_COL_ID,COLLECTION_NAME,PICNAME,MIME_TYPE,PIC_SIZE,CONTENT)',
'',
'select seq_id,',
'       ''UPLOADED_FILES'' as collection_name,',
'       c001,',
'       c002,',
'       dbms_lob.getlength(blob001) as file_size,',
'        blob001    ',
'from apex_collections',
'where collection_name = ''UPLOADED_FILES'';',
'',
'COMMIT;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(592664662198281343)
,p_process_success_message=>'INSERT BULK SUCCESS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(607863180061890777)
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
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'ajax callback process'
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
