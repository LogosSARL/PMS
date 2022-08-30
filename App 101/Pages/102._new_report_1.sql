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
--   Date and Time:   11:25 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 102
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00102
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>102);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_imp_page.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Client History'
,p_step_title=>'new report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20180308162339'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(151953017704752903)
,p_plug_name=>'CLIENT HISTORY'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'   Cursor c_1 Is',
'      Select opp_id,OPP_DESC,',
'       OPP_INIT_DATE	, D.E_NAME,',
'       OPS_ENAME, OST_E_DESC ',
'  from OPPORTUNITIES A, OPP_STAGES B , OPP_STATUS C, PRJ_COMPANIES D',
'  WHERE A.OPP_STAGE  = B.OST_CODE',
'  AND A.OPP_STATUS = C.OPS_CODE(+)',
'  AND A.OPP_CUSTOMER = D.CODE;',
'   ',
'   Cursor c_2(opp_id_p Number) Is',
'      Select a.id,A.DSP_CODE,A.START_DATE, B.E_NAME, D.NAME , C.NAME',
'      From   lgs_contracts A,PRJ_COMPANIES B, PRJ_CONTRACT_STAGES C , PRJ_CONTRACT_TYPES D',
'       WHERE A.COMPANY_CODE = B.CODE',
'       AND A.CONTRACT_TYPE_ID= D.ID',
'       AND A.CONTRACT_TYPE_ID = C.ID',
'       AND A.id in( select OPP_REFERENCE_TO_PIPELINE',
'                   from opportunities',
'                   where opp_id = opp_id_p );',
'',
'    Cursor c_3(cnt_id_p Number) Is',
'     SELECT A.id, A.DSP_CODE,A.START_DATE, B.E_NAME, D.NAME , C.NAME',
'       FROM LGS_CONTRACTS A, PRJ_COMPANIES B, PRJ_CONTRACT_STAGES C , PRJ_CONTRACT_TYPES D',
'       WHERE A.COMPANY_CODE = B.CODE',
'       AND A.CONTRACT_TYPE_ID= D.ID',
'       AND A.CONTRACT_TYPE_ID = C.ID',
'       AND A. ID IN  ( Select REF_TO_CONTRACT',
'                      From   lgs_contracts ',
'                      Where id= cnt_id_p);',
'',
' Cursor c_4 Is',
'      Select A.id,A.DSP_CODE,A.START_DATE, B.E_NAME, D.NAME , C.NAME',
'       FROM LGS_CONTRACTS A, PRJ_COMPANIES B, PRJ_CONTRACT_STAGES C , PRJ_CONTRACT_TYPES D',
'       WHERE A.COMPANY_CODE = B.CODE',
'       AND A.CONTRACT_TYPE_ID= D.ID',
'       AND A.CONTRACT_TYPE_ID = C.ID',
'       ---and A.usage_type = 1',
'       AND A.id  NOT IN ( select  nvl(OPP_REFERENCE_TO_PIPELINE,0)',
'                   from opportunities',
'                   );',
'',
' Cursor c_5(PIPELINE_id_p Number) Is',
'      Select A.id,A.DSP_CODE,A.START_DATE, B.E_NAME, D.NAME , C.NAME',
'       FROM LGS_CONTRACTS A, PRJ_COMPANIES B, PRJ_CONTRACT_STAGES C , PRJ_CONTRACT_TYPES D',
'       WHERE A.COMPANY_CODE = B.CODE',
'       AND A.CONTRACT_TYPE_ID= D.ID',
'       AND A.id = PIPELINE_id_p ',
'       and A.usage_type = 2;',
'',
'C_opp_id   NUMBER;',
'C_OPP_DESC   VARCHAR2(500);',
'C_OPP_INIT_DATE   DATE;',
'C_E_NAME   VARCHAR2(500);',
'C_OPS_ENAME  VARCHAR2(500);',
'C_OST_E_DESC  VARCHAR2(500);',
'',
'C2_id   NUMBER;',
'C2_DSP_CODE  VARCHAR2(500);',
'C2_START_DATE  DATE;',
'C2_E_NAME  VARCHAR2(500);',
'C2_D_NAME  VARCHAR2(500);',
'C2_C_NAME   VARCHAR2(500);',
'',
'c3_id   NUMBER;',
'c3_DSP_CODE  VARCHAR2(500);',
'c3_START_DATE  DATE;',
'c3_E_NAME  VARCHAR2(500);',
'c3_D_NAME  VARCHAR2(500);',
'c3_C_NAME   VARCHAR2(500);',
'',
'c4_id   NUMBER;',
'c4_DSP_CODE  VARCHAR2(500);',
'c4_START_DATE  DATE;',
'c4_E_NAME  VARCHAR2(500);',
'c4_D_NAME  VARCHAR2(500);',
'c4_C_NAME   VARCHAR2(500);',
'',
'c5_id   NUMBER;',
'c5_DSP_CODE  VARCHAR2(500);',
'c5_START_DATE  DATE;',
'c5_E_NAME  VARCHAR2(500);',
'c5_D_NAME  VARCHAR2(500);',
'c5_C_NAME   VARCHAR2(500);',
'',
'',
'Begin  ',
'Htp.p(''<div class="mytree-container">'');',
'  Htp.p(''<TABLE>'');',
'open c_1;',
'LOOP ',
'   FETCH c_1 into C_opp_id,C_OPP_DESC,C_OPP_INIT_DATE	, C_E_NAME,C_OPS_ENAME, C_OST_E_DESC ; ',
'      EXIT WHEN c_1%notfound;',
'  ',
'Htp.p(''<div class="myseconddiv">'');',
'   Htp.p(''<TABLE>'');',
' Htp.p(''<TR bgcolor="#FF0000">'' ); ',
' Htp.p(''<TD>'' || C_opp_id|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C_OPP_DESC|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C_OPP_INIT_DATE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C_E_NAME|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C_OPS_ENAME|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C_OST_E_DESC|| ''</TD>'' );',
' Htp.p(''</TR>'' );',
'',
' Htp.p(''</TABLE>'');',
' Htp.p(''</div>'');',
'',
'open c_2(C_opp_id);',
'loop',
'     FETCH c_2 into C2_id, C2_DSP_CODE,C2_START_DATE, C2_E_NAME, C2_D_NAME , C2_C_NAME; ',
'      EXIT WHEN c_2%notfound;',
' Htp.p(''<br> </br>'');',
'Htp.p(''<div class="mythirddiv">'');',
'   Htp.p(''<TABLE>'');',
'Htp.p(''<TR  bgcolor= "#0066ff" >'' );',
'  Htp.p(''<TD>'' ||C2_id|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C2_DSP_CODE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C2_START_DATE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||C2_E_NAME || ''</TD>'' );',
' Htp.p(''<TD>'' || C2_D_NAME || ''</TD>'' );',
' Htp.p(''<TD>'' || C2_C_NAME || ''</TD>'' );',
' Htp.p(''</TR>'' );',
' Htp.p(''</table>'' );',
'Htp.p(''</div>'' );',
'   ',
'open c_3(C2_id );',
'loop',
'     FETCH c_3 into c3_id,c3_DSP_CODE,c3_START_DATE, c3_E_NAME, c3_D_NAME  , C3_C_NAME ; ',
'      EXIT WHEN c_3%notfound;',
'       Htp.p(''<br> </br>'');',
'      Htp.p(''<div class="myforthdiv">'');',
'   Htp.p(''<TABLE>'');',
'    Htp.p(''<TR bgcolor = "#009933" >'' );',
'     Htp.p(''<TD>'' ||c3_id|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c3_DSP_CODE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c3_START_DATE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c3_E_NAME|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c3_D_NAME || ''</TD>'' );',
' Htp.p(''<TD>'' ||c3_C_NAME|| ''</TD>'' );',
' Htp.p(''</TR>'' );',
'Htp.p(''</Table>'' );',
'Htp.p(''</div>'' );',
'end loop;--contract',
'close c_3;',
'end loop;--pipeline',
'close c_2;',
'',
'end loop;--Opportunities',
'close c_1;',
'',
'open c_4;',
'loop',
'     FETCH c_4 into c4_id,c4_DSP_CODE, c4_START_DATE, c4_E_NAME, c4_D_NAME  , c4_C_NAME ; ',
'      EXIT WHEN c_4%notfound;',
'       Htp.p(''<br> </br>'');',
'      Htp.p(''<div class="myfifthdiv">'');',
'   Htp.p(''<TABLE>'');',
' Htp.p(''<TR bgcolor= "#ee82ee"  >'' );',
'  Htp.p(''<TD>'' ||c4_id|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c4_DSP_CODE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c4_START_DATE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c4_E_NAME|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c4_D_NAME || ''</TD>'' );',
' Htp.p(''<TD>'' ||c4_C_NAME|| ''</TD>'' );',
' Htp.p(''</TR>'' );',
'  Htp.p(''</Table>'' ); ',
'   Htp.p(''</div>'' );',
'open  c_5(C4_id);',
'loop',
'     FETCH c_5 into c5_id, c5_DSP_CODE, c5_START_DATE, c5_E_NAME, c5_D_NAME  , c5_C_NAME ; ',
'      EXIT WHEN c_5%notfound;',
'      Htp.p(''<br> </br>'');',
'      Htp.p(''<div class="mysixthdiv">'');',
'   Htp.p(''<TABLE>'');',
' Htp.p(''<TR bgcolor= "#ffa500" >'' );',
'  Htp.p(''<TD>'' ||c5_id|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c5_DSP_CODE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c5_START_DATE|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c5_E_NAME|| ''</TD>'' );',
' Htp.p(''<TD>'' ||c5_D_NAME || ''</TD>'' );',
' Htp.p(''<TD>'' ||c5_C_NAME|| ''</TD>'' );',
' Htp.p(''</TR>'' );',
'Htp.p(''</Table>'' );',
'Htp.p(''</div>'' );',
'end loop;--contract',
'close c_5;',
'end loop;--pipeline',
'close c_4;',
'',
'   Htp.p(''</TABLE>'');',
'   Htp.p(''</div>'');',
'End;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
