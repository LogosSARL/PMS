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
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 101 - Projects
--
-- Application Export:
--   Application:     101
--   Name:            Projects
--   Date and Time:   10:34 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 120
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00120
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>120);
end;
/
prompt --application/pages/page_00120
begin
wwv_flow_imp_page.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'ACTIVITI HISTORIC TASKS INSTANCES ORDS'
,p_step_title=>'ACTIVITI HISTORIC TASKS INSTANCES ORDS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180622144501'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(193624217938596201)
,p_plug_name=>'TEST'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(384302948615188648)
,p_plug_name=>'HISTORIC TASKS INSTANCES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(384303041306188649)
,p_plug_name=>'HISTORIC TASKS INSTANCES REGIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193333171194209569)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(384302948615188648)
,p_button_name=>'GHTI'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'GET HISTORIC TASKS INSTANCES'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193624465707596203)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_button_name=>'TEST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Test'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193624759429596206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_button_name=>'PARSE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Parse1'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193624940119596208)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_button_name=>'parseobject'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Parseobject'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193625009472596209)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_button_name=>'parseobjectquery'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Parseobjectquery'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193625223095596211)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_button_name=>'parsejsontable'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Parsejsontable'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193333547807209579)
,p_name=>'P120_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(384302948615188648)
,p_prompt=>'HISTORIC TASKS INSTANCES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193334296212209597)
,p_name=>'P120_HTIID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193334654050209599)
,p_name=>'P120_HTIPDID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PROCESS DEFINITION ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193335031793209600)
,p_name=>'P120_HTIPDU'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PROCESS DEFINITION URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193335407666209600)
,p_name=>'P120_HTIPIID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PROCESS INSTANCE ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193335806351209601)
,p_name=>'P120_HTIPIU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PROCESS INSTANCE URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193336261143209601)
,p_name=>'P120_HTIEID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'EXECUTION ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193336695845209602)
,p_name=>'P120_HTIN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193337041208209603)
,p_name=>'P120_HTID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193337433624209603)
,p_name=>'P120_HTIDR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'DELETE REASON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193337829467209604)
,p_name=>'P120_HTIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'OWNER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193338222231209604)
,p_name=>'P120_HTIA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'ASSIGNEE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193338613835209605)
,p_name=>'P120_HTIST'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'START TIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193339011704209606)
,p_name=>'P120_HTIET'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'END TIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193339440842209606)
,p_name=>'P120_HTIDIM'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'DURATION IN MILLIS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193339867929209607)
,p_name=>'P120_HTIWTIM'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'WORK TIME IN MILLIS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193340291263209609)
,p_name=>'P120_HTICT'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'CLAIM TIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193340660995209609)
,p_name=>'P120_HTITDK'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'TASK DEFINITION KEY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193341036757209610)
,p_name=>'P120_HTIFK'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'FROM KEY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193341402512209610)
,p_name=>'P120_HTIP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PRIORITY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193341892858209611)
,p_name=>'P120_HTIDD'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'DUE DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193342213775209612)
,p_name=>'P120_HTIPTID'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PARENT TASK ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193342661423209612)
,p_name=>'P120_HTIU'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193343067270209613)
,p_name=>'P120_HTITV'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'TASK VARIABLES'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193343419641209613)
,p_name=>'P120_HTIPV'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'PROCESS VARIABLES'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193343781025209614)
,p_name=>'P120_HTITID'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(384303041306188649)
,p_prompt=>'TENANT ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193624363892596202)
,p_name=>'P120_TESTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(193624217938596201)
,p_prompt=>'Testid'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193344177271209650)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GHTI'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/history/historic-task-instances'',',
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
'   :P120_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'     ',
'',
'         :P120_HTIID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P120_HTIPDID :=  apex_json.get_varchar2(p_path => ''processDefinitionId'');',
'         :P120_HTIPDU :=  apex_json.get_varchar2(p_path => ''processDefinitionUrl'');',
'         :P120_HTIPIID :=  apex_json.get_varchar2(p_path => ''processInstanceId'');',
'         :P120_HTIPIU :=  apex_json.get_varchar2(p_path => ''processInstanceUrl'');',
'         :P120_HTIEID :=  apex_json.get_varchar2(p_path => ''executionId'');',
'         :P120_HTIN :=  apex_json.get_varchar2(p_path => ''name'');',
'         :P120_HTID :=  apex_json.get_varchar2(p_path => ''description'');',
'         :P120_HTIDR :=  apex_json.get_varchar2(p_path => ''deleteReason'');',
'         :P120_HTIO :=  apex_json.get_varchar2(p_path => ''owner'');',
'         :P120_HTIA :=  apex_json.get_varchar2(p_path => ''assignee'');',
'         :P120_HTIST :=  apex_json.get_varchar2(p_path => ''startTime'');',
'         :P120_HTIET :=  apex_json.get_varchar2(p_path => ''endTime'');',
'         :P120_HTIDIM :=  apex_json.get_varchar2(p_path => ''durationInMillis'');',
'         :P120_HTIWTIM :=  apex_json.get_varchar2(p_path => ''workTimeInMillis'');',
'         :P120_HTIICT :=  apex_json.get_varchar2(p_path => ''claimTime'');',
'         :P120_HTITDK :=  apex_json.get_varchar2(p_path => ''taskDefinitionKey'');',
'         :P120_HTIFK :=  apex_json.get_varchar2(p_path => ''formKey'');',
'         :P120_HTIP :=  apex_json.get_varchar2(p_path => ''priority'');',
'         :P120_HTIDD :=  apex_json.get_varchar2(p_path => ''dueDate'');',
'         :P120_HTIPTID :=  apex_json.get_varchar2(p_path => ''parentTaskId'');',
'         :P120_HTIU :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P120_HTIITV :=  apex_json.get_varchar2(p_path => ''taskVariables'');',
'         :P120_HTIPV :=  apex_json.get_varchar2(p_path => ''processVariables'');',
'         :P120_HTITID :=  apex_json.get_varchar2(p_path => ''tenantId'');',
'         ',
'     ',
'     ',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193333171194209569)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193624545277596204)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TEST1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'create table earthquake_json(',
'    id          number    generated always as identity,',
'    fetched_at  timestamp default systimestamp,',
'    document    clob,',
'    constraint document_isjson check (document is json)',
');',
'',
'',
'',
'insert into earthquake_json( ',
'    document ',
') values (',
'    apex_web_service.make_rest_request(',
'        p_url         => ''https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'',',
'        p_http_method => ''GET'' )',
');',
'',
'select id, fetched_at, dbms_lob.getlength(document) from earthquake_json;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193624465707596203)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193624600488596205)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARSE1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob           clob;',
'    l_feature_count  pls_integer;',
'    l_time           timestamp;',
'begin',
'    select document into l_clob',
'      from earthquake_json',
'     where id = 1;',
'',
'    l_time := systimestamp;',
'',
'    apex_json.parse(',
'        p_source => l_clob );',
'',
'    dbms_output.put_line( ''Parsing Time: '' || extract( second from ( systimestamp - l_time ) ) );',
'    l_time := systimestamp;',
'',
'    l_feature_count := apex_json.get_count( ''features'' );',
'    dbms_output.put_line( ''Array Count: '' || l_feature_count );',
'',
'    dbms_output.put_line( ''Get Array Count Time: '' || extract( second from ( systimestamp - l_time ) ) );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193624759429596206)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193624816770596207)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'parsejsonobject'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob           clob;',
'    l_feature_count  pls_integer;',
'    l_time           timestamp;',
'',
'    l_json           json_object_t;',
'    l_features       json_array_t;',
'begin',
'    select document into l_clob',
'      from earthquake_json',
'     where id = 1;',
'',
'    l_time := systimestamp;',
'',
'    l_json := json_object_t.parse( l_clob );',
'',
'    dbms_output.put_line( ''Parsing Time: '' || extract( second from ( systimestamp - l_time ) ) );',
'    l_time := systimestamp;',
'',
'    l_features := l_json.get_array( ''features'' );',
'    dbms_output.put_line( ''Array Count: '' || l_features.get_size );',
'',
'    dbms_output.put_line( ''Get Array Count Time: '' || extract( second from ( systimestamp - l_time ) ) );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193624940119596208)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193625169127596210)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'parseobjectquery'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'',
'with eqdata as (',
'    select e.id,',
'           e.title,',
'           e.mag',
'    from earthquake_json j, json_table(',
'        document,',
'        ''$.features[*]''',
'        columns(',
'            id    varchar2(20)  path ''$.id'',',
'            mag   number        path ''$.properties.mag'',',
'            title varchar2(200) path ''$.properties.title'' ) ) e',
'), minmax as (',
'    select min(e.mag) minmag, max(e.mag) maxmag ',
'      from eqdata e',
')',
'select e.id,',
'       e.title,',
'       e.mag',
'  from eqdata e, minmax m',
' where e.mag in ( m.minmag, m.maxmag )',
'/',
'',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193625009472596209)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193625332731596212)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'parsejsontable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'with eqdata as (',
'    select e.id,',
'           e.title,',
'           e.mag',
'    from earthquake_json j, xmltable(',
'        ''/json/features/row''',
'        passing apex_json.to_xmltype( j.document )',
'        columns',
'            id    varchar2(20)  path ''id/text()'',',
'            mag   number        path ''properties/mag/text()'',',
'            title varchar2(200) path ''properties/title/text()'' ) e',
'), minmax as (',
'    select min(e.mag) minmag, max(e.mag) maxmag ',
'      from eqdata e',
')',
'select e.id,',
'       e.title,',
'       e.mag',
'  from eqdata e, minmax m',
' where e.mag in ( m.minmag, m.maxmag )',
'/',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193625223095596211)
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
