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
--     PAGE: 44
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00044
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>44);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_imp_page.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Step 1'
,p_step_title=>'Step 1'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170403155627'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(182195703923808341)
,p_plug_name=>'Step 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903549530019134)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51973941798930741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_button_name=>'Update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Update'
,p_button_position=>'CHANGE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51974179950930743)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_button_name=>'Create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51974062378930742)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_button_name=>'Delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182196555862808342)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182196896312808342)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(182197697345808346)
,p_branch_action=>'f?p=&APP_ID.:45:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(182196896312808342)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973144880930733)
,p_name=>'P44_OPP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973218933930734)
,p_name=>'P44_INIT_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Initial Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973342944930735)
,p_name=>'P44_DESCRIPTION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973456150930736)
,p_name=>'P44_OPP_HOW_HEARD_ABOUT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'How heard about'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973550008930737)
,p_name=>'P44_OPP_WHY_ITS_IMP_LOGOS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Imp to Logos'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973617146930738)
,p_name=>'P44_REMARKS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Remarks'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973798480930739)
,p_name=>'P44_CONTRACT_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Contract type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51973893526930740)
,p_name=>'P44_CUSTOMER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(182195703923808341)
,p_prompt=>'Customer'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51974263589930744)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'New'
,p_attribute_02=>'OPPORTUNITIES'
,p_attribute_03=>'P44_OPP_ID'
,p_attribute_04=>'OPP_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
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
