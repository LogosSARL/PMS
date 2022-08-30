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
--   Date and Time:   09:34 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00115
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>115);
end;
/
prompt --application/pages/page_00115
begin
wwv_flow_api.create_page(
 p_id=>115
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'ACTIVITI TASK PAGE'
,p_page_mode=>'NORMAL'
,p_step_title=>'ACTIVITI TASK PAGE'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180625102846'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190910090394748401)
,p_plug_name=>'TASK '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190910132187748402)
,p_plug_name=>'TASK REGION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193625476033596213)
,p_plug_name=>'TASK CREATE REGION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190910340974748404)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(190910090394748401)
,p_button_name=>'GETTASK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'GET TASK'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(193627889859596237)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(193625476033596213)
,p_button_name=>'CREATETASK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create Task'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190910226055748403)
,p_name=>'P115_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190910090394748401)
,p_prompt=>'Webresp'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190910427100748405)
,p_name=>'P115_TA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'ASSIGNEE'
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
 p_id=>wwv_flow_api.id(190910543028748406)
,p_name=>'P115_TCT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'CREATE TIME'
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
 p_id=>wwv_flow_api.id(190910697240748407)
,p_name=>'P115_TDS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'DELEGATION STATE'
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
 p_id=>wwv_flow_api.id(190910702374748408)
,p_name=>'P115_TD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'DESCRIPTION'
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
 p_id=>wwv_flow_api.id(190910814053748409)
,p_name=>'P115_TDD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'DUE DATE'
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
 p_id=>wwv_flow_api.id(190910931945748410)
,p_name=>'P115_TEU'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'EXECUTION URL'
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
 p_id=>wwv_flow_api.id(190911000706748411)
,p_name=>'P115_TEID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'EXECUTION ID '
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
 p_id=>wwv_flow_api.id(190911129296748412)
,p_name=>'P115_TID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'ID'
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
 p_id=>wwv_flow_api.id(190911297183748413)
,p_name=>'P115_TN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'NAME'
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
 p_id=>wwv_flow_api.id(190911389792748414)
,p_name=>'P115_TO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'OWNER'
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
 p_id=>wwv_flow_api.id(190911499181748415)
,p_name=>'P115_TPTU'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PARENT TASK URL'
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
 p_id=>wwv_flow_api.id(190911546189748416)
,p_name=>'P115_TPTID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PARENT TASK ID'
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
 p_id=>wwv_flow_api.id(190911668236748417)
,p_name=>'P115_TP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PRIORITY'
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
 p_id=>wwv_flow_api.id(190911794265748418)
,p_name=>'P115_TPDU'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PROCESS DEFINITION URL'
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
 p_id=>wwv_flow_api.id(190911877614748419)
,p_name=>'P115_TPDID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PROCESS DEFINITION ID'
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
 p_id=>wwv_flow_api.id(190911997515748420)
,p_name=>'P115_TPIU'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PROCESS INSTANCE URL'
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
 p_id=>wwv_flow_api.id(190912065936748421)
,p_name=>'P115_TPIID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'PROCESS INSTANCE ID'
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
 p_id=>wwv_flow_api.id(190912128714748422)
,p_name=>'P115_TS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'SUSPENDED'
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
 p_id=>wwv_flow_api.id(190912211259748423)
,p_name=>'P115_TFK'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'FROM KEY'
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
 p_id=>wwv_flow_api.id(190912351740748424)
,p_name=>'P115_TC'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'CATEGORY'
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
 p_id=>wwv_flow_api.id(190912475680748425)
,p_name=>'P115_TTDK'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'TASK DEFINITION KEY'
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
 p_id=>wwv_flow_api.id(190912599922748426)
,p_name=>'P115_TU'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'URL'
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
 p_id=>wwv_flow_api.id(190912626739748427)
,p_name=>'P115_TTID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(190910132187748402)
,p_prompt=>'TENANT ID'
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
 p_id=>wwv_flow_api.id(193625516877596214)
,p_name=>'P115_TA_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'ASSIGNEE'
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
 p_id=>wwv_flow_api.id(193625693010596215)
,p_name=>'P115_TCT_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'CREATE TIME'
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
 p_id=>wwv_flow_api.id(193625723192596216)
,p_name=>'P115_TDS_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'DELEGATION STATE'
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
 p_id=>wwv_flow_api.id(193625895465596217)
,p_name=>'P115_TD_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'DESCRIPTION'
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
 p_id=>wwv_flow_api.id(193625935689596218)
,p_name=>'P115_TDD_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'DUE DATE'
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
 p_id=>wwv_flow_api.id(193626042175596219)
,p_name=>'P115_TEU_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'EXECUTION URL'
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
 p_id=>wwv_flow_api.id(193626110608596220)
,p_name=>'P115_TEID_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'EXECUTION ID '
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
 p_id=>wwv_flow_api.id(193626291461596221)
,p_name=>'P115_TID_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'ID'
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
 p_id=>wwv_flow_api.id(193626396011596222)
,p_name=>'P115_TN_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'NAME'
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
 p_id=>wwv_flow_api.id(193626449024596223)
,p_name=>'P115_TO_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'OWNER'
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
 p_id=>wwv_flow_api.id(193626565298596224)
,p_name=>'P115_TPTU_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PARENT TASK URL'
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
 p_id=>wwv_flow_api.id(193626683097596225)
,p_name=>'P115_TPTID_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PARENT TASK ID'
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
 p_id=>wwv_flow_api.id(193626787149596226)
,p_name=>'P115_TP_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PRIORITY'
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
 p_id=>wwv_flow_api.id(193626834497596227)
,p_name=>'P115_TPDU_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PROCESS DEFINITION URL'
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
 p_id=>wwv_flow_api.id(193626957304596228)
,p_name=>'P115_TPDID_1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PROCESS DEFINITION ID'
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
 p_id=>wwv_flow_api.id(193627030910596229)
,p_name=>'P115_TPIU_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PROCESS INSTANCE URL'
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
 p_id=>wwv_flow_api.id(193627176474596230)
,p_name=>'P115_TPIID_1'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'PROCESS INSTANCE ID'
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
 p_id=>wwv_flow_api.id(193627291311596231)
,p_name=>'P115_TS_1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'SUSPENDED'
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
 p_id=>wwv_flow_api.id(193627373888596232)
,p_name=>'P115_TFK_1'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'FROM KEY'
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
 p_id=>wwv_flow_api.id(193627414013596233)
,p_name=>'P115_TC_1'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'CATEGORY'
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
 p_id=>wwv_flow_api.id(193627525120596234)
,p_name=>'P115_TTDK_1'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'TASK DEFINITION KEY'
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
 p_id=>wwv_flow_api.id(193627636002596235)
,p_name=>'P115_TU_1'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'URL'
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
 p_id=>wwv_flow_api.id(193627721491596236)
,p_name=>'P115_TTID_1'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(193625476033596213)
,p_prompt=>'TENANT ID'
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190912711437748428)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET TASK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/runtime/tasks'',',
'    p_http_method => ''GET'',',
' --    p_scheme => ''APEX_050000'',',
'      p_transfer_timeout => 1440000,',
' --      p_parm_name   => APEX_UTIL.string_to_table(''year:month''),',
'   --   p_parm_value  => APEX_UTIL.string_to_table(param_v),',
'      p_username          => ''kermit'',',
'   p_password          =>    ''kermit''',
'  );',
'  ',
'  if apex_web_service.g_status_code = 200 then --ok  ',
'     apex_debug.message(''DEBUGMSG: service Tranfer ACTIVITI REST API DEPLOYMENTS was invoked successfully'');  ',
'    else  ',
'      raise_application_error(-20000,''ACTIVITI REST API DEPLOYMENTS WS call failed with response code '' || apex_web_service.g_status_code);',
'      ',
'    end if;  ',
'    ',
'    ',
'   :P115_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P115_TA :=  apex_json.get_varchar2(p_path => ''assignee'');',
'         :P110_TCT :=  apex_json.get_varchar2(p_path => ''createTime'');',
'         :P110_TDS :=  apex_json.get_varchar2(p_path => ''delegationState'');',
'         :P110_TD :=  apex_json.get_varchar2(p_path => ''description'');',
'         :P110_TDD :=  apex_json.get_varchar2(p_path => ''dueDate'');',
'         :P110_TEU :=  apex_json.get_varchar2(p_path => ''executionUrl'');',
'         :P110_TEID :=  apex_json.get_varchar2(p_path => ''executionId'');',
'         :P110_TID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P110_TN :=  apex_json.get_varchar2(p_path => ''name'');',
'         :P110_TO :=  apex_json.get_varchar2(p_path => ''owner'');',
'         :P110_TPTU :=  apex_json.get_varchar2(p_path => ''parentTaskUrl'');',
'         :P110_TPTID :=  apex_json.get_varchar2(p_path => ''parentTaskId'');',
'         :P110_TP :=  apex_json.get_varchar2(p_path => ''priority'');',
'         :P110_TPDU :=  apex_json.get_varchar2(p_path => ''processDefinitionUrl'');',
'         :P110_TPDID :=  apex_json.get_varchar2(p_path => ''processDefinitionId'');',
'         :P110_TPIU :=  apex_json.get_varchar2(p_path => ''processInstanceUrl'');',
'         :P110_TPIID :=  apex_json.get_varchar2(p_path => ''processInstanceId'');',
'         :P110_TS :=  apex_json.get_varchar2(p_path => ''suspended'');',
'         :P110_TFK :=  apex_json.get_varchar2(p_path => ''formKey'');',
'         :P110_TC :=  apex_json.get_varchar2(p_path => ''category'');',
'         :P110_TTDK :=  apex_json.get_varchar2(p_path => ''taskDefinitionKey'');',
'         :P110_TU :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P110_TTID :=  apex_json.get_varchar2(p_path => ''tenantId'');',
'                               ',
'        ',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(190910340974748404)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(193627993599596238)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create task'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  lc_entire_msg        CLOB;',
'  lv_url               VARCHAR2 (32000);',
'  lr_request            utl_http.req;',
'  lr_response          utl_http.resp;',
'  lv_msg               VARCHAR2 (80);',
'--  content varchar2(4000) := ''{"name":"My task", "description":"The task description"}'';',
'  content varchar2(4000) := '' '';',
'  ',
'   l_list         varchar2(32000);',
'   pos            pls_integer;',
'   endpos          pls_integer;',
'',
'BEGIN ',
'',
'    ---CREATE A DEMO JSON REQUEST/RESPONSE',
'    lv_url := ''http://activiti.lg:8080/activiti-rest/service/query/tasks'';',
'--    content  := ''{"assignee" : '' || :P115_TA_1 || '',"createTime" : '' || :P115_TCT_1 || '',"delegationState" : '' || :P115_TDS_1 || '',"description" : '' || :P115_TD_1 || '',"dueDate" : '' || :P115_TDD_1 || '',"executionUrl" : '' || :P115_TEU_1 || '',"execut'
||'ionId" : '' || :P115_TEID_1 || '',"id" : '' || :P115_TID_1 || '',"name" : '' || :P115_TN_1 || '',"owner" : '' || :P115_TO_1 || '',"parentTaskUrl" : '' || :P115_TPTU_1 || '',"parentTaskId" : '' || :P115_TPTID_1 || '',"priority" : '' || :P115_TP_1 || '',"processDefi'
||'nitionUrl" : '' || :P115_TPDU_1 || '',"processDefinitionId" : '' || :P115_TPDID_1 || '',"processInstanceUrl" : '' || :P115_TPIU_1 || '',"processInstanceId" : '' || :P115_TPIID_1 || '',"suspended" : '' || :P115_TS_1 || '',"formKey" : '' || :P115_TFK_1 || '',"cate'
||'gory": '' || :P115_TC_1 || '',"taskDefinitionKey" : '' || :P115_TTDK_1 || '',"url" : '' || :P115_TU_1 || '',"tenantId" : '' || :P115_TTID_1 || ''}'';',
'',
'    --- CREATE http request and get response',
'  ',
'    lr_request := utl_http.begin_request(lv_url, ''POST'','' HTTP/1.1'');',
'    utl_http.set_header(lr_request, ''user-agent'', ''mozilla/4.0''); ',
'    utl_http.set_header(lr_request, ''content-type'', ''application/json''); ',
'    utl_http.set_header(lr_request, ''Content-Length'', length(content));',
'    utl_http.set_header(lr_request, ''Authorization'',''Basic '' || utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_i18n.string_to_raw(''kermit:kermit'', ''AL32UTF8''))));',
'    ',
'    ',
' ',
'    ',
' ',
' ',
'   utl_http.write_text(lr_request, content);',
'',
'   lr_response := utl_http.get_response(lr_request);',
'',
'',
'   --- LOOP THROUGH THE RESPONSE AND ADD IT TO THE CLOB',
'     BEGIN ',
'        LOOP ',
'          utl_http.read_text(r => lr_response, data => lv_msg);',
'           lc_entire_msg := lc_entire_msg || lv_msg;',
'      --  UTL_HTTP.READ_LINE(lr_response, lv_msg , TRUE);',
'',
'        END LOOP;',
'',
'    EXCEPTION ',
'       WHEN utl_http.end_of_body THEN',
'          utl_http.end_response(lr_response);',
'',
'      WHEN OTHERS THEN ',
'        utl_tcp.close_all_connections;',
'',
'      END;',
'',
'    ',
'     ',
'   ',
'     ',
'    :P115_WEBRESP := lc_entire_msg;',
' ',
'  ---      :P356_TXT :=  l_list;',
'  ',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(193627889859596237)
,p_process_success_message=>'success create task'
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
