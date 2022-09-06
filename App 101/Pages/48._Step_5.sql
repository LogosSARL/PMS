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
--     PAGE: 48
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00048
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>48);
end;
/
prompt --application/pages/page_00048
begin
wwv_flow_imp_page.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Step 5'
,p_step_title=>'Step 5'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170403153808'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(182209427349808360)
,p_plug_name=>'Step 5'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903549530019134)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182210268822808361)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(182209427349808360)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182210451765808361)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(182209427349808360)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Previous'
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182210308218808361)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(182209427349808360)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finish'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(182211367326808362)
,p_branch_action=>'f?p=&APP_ID.:47:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(182210451765808361)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182209916260808360)
,p_name=>'P48_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(182209427349808360)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
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
