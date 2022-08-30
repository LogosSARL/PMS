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
--   Date and Time:   09:32 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00036
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>36);
end;
/
prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Pipeline'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pipeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200713181915'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1842312855854691)
,p_plug_name=>'Pipeline'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LGS_CONTRACTS.ID, CASE WHEN RFP_FILES IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RFP_FILES END',
'AS BLOBCONTENT,  CASE WHEN RESPONSE_TO_RFP_FILES  IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RESPONSE_TO_RFP_FILES END',
'AS ResponseCONTENT,',
'',
'',
'case  when CONTRACT_TYPE_ID = 1 then case  when BRANCH_ID = 1 then ''http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || LGS_CONTRACTS.ID || ''&_xpt=1&_xt=Logos_SARL_Offer_Tmp&_xmode=4&_xf=rtf&_xaut'
||'orun=true''',
'                                                              when BRANCH_ID = 2 then ''http://192.168.3.201:7001/xmlpserver/PMS/Reports/Logos_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || LGS_CONTRACTS.ID || ''&_xpt=1&_xt=Logos_Off_Offer&_xmode=4'
||'&_xf=rtf&_xautorun=true''',
'                                                              end',
'                                   when CONTRACT_TYPE_ID = 2 then ''http://192.168.3.201:7001/xmlpserver/PMS/Reports/Maintenance_SARL_Offer.xdo?id=tareif&passwd=tareif&CNT_ID='' || LGS_CONTRACTS.ID || ''&_xpt=1&_xmode=4&_xf=rtf&_xautorun=true''',
'                end as ContractTemplate,',
'''f?p='' || :APP_ID || '':40:'' || :APP_SESSION || ''::::P40_CONTRACT_ID:'' || REF_TO_CONTRACT as linkcontract, '''' as linkpipeline, '''' as linkparent,',
'"DSP_CODE",',
'"COMPANY_CODE",',
'START_DATE,',
'"END_DATE",',
'"USD_VALUE", ',
'"FINALIZED",',
'"CONTRACT_TYPE_ID",',
'"CONTRACT_STAGE_ID",',
'"DISPLAY_IN_CONTRACTS",',
'"PRICING_DATE",',
'"PERDIUM",',
'"DAYS_PER_TICKET",',
'"TICKET_VALUE",',
'"HOTEL_RATE",',
'"CAR_RENTAL_PER_DAY",',
'"INTERNATIONAL",',
'"WHO_CREATED",',
'"ACCOUNT_MANAGER",',
'"USAGE_TYPE",',
'"PARENT_CONTRACT",',
'"REF_TO_PIPELINE",',
'"REF_TO_CONTRACT",',
'"REF_TO_CONTRACT" REFCNT,',
'"PROJECT_NAME",',
'"REF_PM",',
'"REF_INTERNAL",',
'"INHOUSE_RATE",',
'"ONSITE_RATE",',
'"IN_SCOPE",',
'"INTERNAL_CLASSIFICATION",',
'"INVOICED_DAYS",',
'"INITIAL_AMOUNT",',
'"DISCOUNT_IN_DAYS",',
'"DISCOUNT_IN_AMOUNT",',
'"VAT_VALUE",',
'"FINAL_AMOUNT",',
'"EXPECTED_DELIVERY_DATE",',
'"WARRANTY_IN_MONTH",',
'"VALUE_IN_MAINTENANCE",',
'SIGNATURE_DATE, ',
'"SIGNED_BY",',
'"OFFER_STATUS",',
'"PAYMENT_TERM",',
'"REMARKS",',
'"BRANCH_ID",',
'"OTHER_EXPENSES_ON_CLIENT",',
'"SETTLED",',
'"STATUS","IH_INVOICE_DAYS","AS_INVOICE_DAYS", '''' AS CONTRACTDOCUMENTS,',
'"STEP",',
'"ACTIVITI_TASK_ID",',
''''' as DIAGRAM_LINK,',
''''' as HISTORY',
'from LGS_CONTRACTS',
'where ',
'  ----lgs_contracts.branch_id = (+)lgs_logos_branches.LLb_id',
' USAGE_TYPE = 1',
'and project_pck.get_if_contract_disp (LGS_CONTRACTS.id, V(''APP_USER'')) = 1 ',
'AND ( LGS_CONTRACTS.ID = :P36_CONTRACTID  OR  :P36_CONTRACTID IS NULL )  ',
'and created_date is not null',
'',
'',
'order by start_date, LGS_CONTRACTS.ID desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1842725818854691)
,p_name=>'Pipeline'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::P79_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'JAWAD'
,p_internal_uid=>1842725818854691
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1843666396854694)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Client'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1842839199854692)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1851605190854706)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>30
,p_column_identifier=>'W'
,p_column_label=>'Reference to Contracts'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1852897812854708)
,p_db_column_name=>'REF_INTERNAL'
,p_display_order=>40
,p_column_identifier=>'Z'
,p_column_label=>'Proposal/Offer Reference'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP,40:P40_CONTRACT_ID,P40_PCI,P40_CID,P40_INTCODE_SELECTED,P40_VIEW,P40_START_DATETOVALID,P40_END_DATETOVALID:#REFCNT#,#REFCNT#,null,#ID#,non,#PRICING_DATE#,#EXPECTED_DELIVERY_DATE#'
,p_column_linktext=>'#REF_INTERNAL#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1846409537854698)
,p_db_column_name=>'DISPLAY_IN_CONTRACTS'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>'Display In Contracts'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1845271535854697)
,p_db_column_name=>'FINALIZED'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1846054727854698)
,p_db_column_name=>'CONTRACT_STAGE_ID'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Contract Stage Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1844030218854695)
,p_db_column_name=>'START_DATE'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_column_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1844446422854695)
,p_db_column_name=>'END_DATE'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_column_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1861166932854718)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'AU'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51971896144930720)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>110
,p_column_identifier=>'BC'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(81277486830177530)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1860735897854718)
,p_db_column_name=>'SETTLED'
,p_display_order=>120
,p_column_identifier=>'AT'
,p_column_label=>'Settled'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_comment=>'contract field so hidden in pipeline'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2078241809538701)
,p_db_column_name=>'REFCNT'
,p_display_order=>130
,p_column_identifier=>'AY'
,p_column_label=>'Reference To Contract'
,p_column_html_expression=>'<a href=''#LINKCONTRACT#''>#REFCNT#</a>'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1843217642854694)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>140
,p_column_identifier=>'B'
,p_column_label=>'Contract Code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1991986855473901)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1845651489854697)
,p_db_column_name=>'CONTRACT_TYPE_ID'
,p_display_order=>150
,p_column_identifier=>'H'
,p_column_label=>'Proposal Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1973067848295975)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1850837448854705)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>160
,p_column_identifier=>'U'
,p_column_label=>'Parent'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1974692870424180)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1852056839854707)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>170
,p_column_identifier=>'X'
,p_column_label=>'Project Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1859133773854716)
,p_db_column_name=>'OFFER_STATUS'
,p_display_order=>180
,p_column_identifier=>'AP'
,p_column_label=>'Offer Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_static_id=>'OFFER_STATUS'
,p_rpt_named_lov=>wwv_flow_api.id(1974234826383220)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1986574284255407)
,p_db_column_name=>'LINKPIPELINE'
,p_display_order=>190
,p_column_identifier=>'AW'
,p_column_label=>'Pipeline'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1850431205854705)
,p_db_column_name=>'USAGE_TYPE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Usage Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1986648860255408)
,p_db_column_name=>'LINKPARENT'
,p_display_order=>210
,p_column_identifier=>'AX'
,p_column_label=>'Contract Parent'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID:#LINKPARENT#'
,p_column_linktext=>'Contract Parent'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1986462176255406)
,p_db_column_name=>'LINKCONTRACT'
,p_display_order=>220
,p_column_identifier=>'AV'
,p_column_label=>'Contract'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1850058653854704)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>230
,p_column_identifier=>'S'
,p_column_label=>'Account Manager'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1973668125372222)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1851281054854706)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>240
,p_column_identifier=>'V'
,p_column_label=>'Reference To Pipeline'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1975026760435175)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1852448130854708)
,p_db_column_name=>'REF_PM'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'PM Reference'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1846867113854699)
,p_db_column_name=>'PRICING_DATE'
,p_display_order=>260
,p_column_identifier=>'K'
,p_column_label=>'Date Raised'
,p_column_type=>'DATE'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1849661346854703)
,p_db_column_name=>'WHO_CREATED'
,p_display_order=>270
,p_column_identifier=>'R'
,p_column_label=>'Initiator'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1853235297854709)
,p_db_column_name=>'INHOUSE_RATE'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Inhouse Rate'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1853587422854709)
,p_db_column_name=>'ONSITE_RATE'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Onsite Rate'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1853905851854710)
,p_db_column_name=>'IN_SCOPE'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Within Scope'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1854757853854711)
,p_db_column_name=>'INVOICED_DAYS'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Invoiced Days'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1855572478854712)
,p_db_column_name=>'DISCOUNT_IN_DAYS'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'Discount In Days'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1855992727854712)
,p_db_column_name=>'DISCOUNT_IN_AMOUNT'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'Discount In Amount'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1856303263854713)
,p_db_column_name=>'VAT_VALUE'
,p_display_order=>340
,p_column_identifier=>'AI'
,p_column_label=>'Vat Value'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1855154514854711)
,p_db_column_name=>'INITIAL_AMOUNT'
,p_display_order=>350
,p_column_identifier=>'AF'
,p_column_label=>'Initial Amount'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1856790258854713)
,p_db_column_name=>'FINAL_AMOUNT'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Final Amount'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1844898956854696)
,p_db_column_name=>'USD_VALUE'
,p_display_order=>370
,p_column_identifier=>'F'
,p_column_label=>'Amount incl. VAT (USD)'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1857162060854713)
,p_db_column_name=>'EXPECTED_DELIVERY_DATE'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Expected Delivery Date'
,p_column_type=>'DATE'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1857591013854714)
,p_db_column_name=>'WARRANTY_IN_MONTH'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Warranty In Month'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1857969137854714)
,p_db_column_name=>'VALUE_IN_MAINTENANCE'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Value In Maintenance'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1858326439854715)
,p_db_column_name=>'SIGNATURE_DATE'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Signature Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1858746275854715)
,p_db_column_name=>'SIGNED_BY'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Signed By'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1860337189854717)
,p_db_column_name=>'OTHER_EXPENSES_ON_CLIENT'
,p_display_order=>430
,p_column_identifier=>'AS'
,p_column_label=>'Other Expenses On Client'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1847258137854700)
,p_db_column_name=>'PERDIUM'
,p_display_order=>440
,p_column_identifier=>'L'
,p_column_label=>'Perdium'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1848441877854702)
,p_db_column_name=>'HOTEL_RATE'
,p_display_order=>450
,p_column_identifier=>'O'
,p_column_label=>'Hotel Rate'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1848899281854702)
,p_db_column_name=>'CAR_RENTAL_PER_DAY'
,p_display_order=>460
,p_column_identifier=>'P'
,p_column_label=>'Car Rental Per Day'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1847625694854700)
,p_db_column_name=>'DAYS_PER_TICKET'
,p_display_order=>470
,p_column_identifier=>'M'
,p_column_label=>'Days Per Ticket'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1848060497854701)
,p_db_column_name=>'TICKET_VALUE'
,p_display_order=>480
,p_column_identifier=>'N'
,p_column_label=>'Ticket Value'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1849243310854703)
,p_db_column_name=>'INTERNATIONAL'
,p_display_order=>490
,p_column_identifier=>'Q'
,p_column_label=>'International'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1859983832854717)
,p_db_column_name=>'REMARKS'
,p_display_order=>500
,p_column_identifier=>'AR'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2861719586683120)
,p_db_column_name=>'INTERNAL_CLASSIFICATION'
,p_display_order=>510
,p_column_identifier=>'AZ'
,p_column_label=>'Internal classification'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1716749314273836)
,p_db_column_name=>'CONTRACTTEMPLATE'
,p_display_order=>520
,p_column_identifier=>'BA'
,p_column_label=>'Template'
,p_column_html_expression=>'<a href="#CONTRACTTEMPLATE#">Template</a>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1716804577273837)
,p_db_column_name=>'PAYMENT_TERM'
,p_display_order=>530
,p_column_identifier=>'BB'
,p_column_label=>'Payment term'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90138441529650603)
,p_db_column_name=>'BLOBCONTENT'
,p_display_order=>540
,p_column_identifier=>'BF'
,p_column_label=>'RFP'
,p_column_html_expression=>'<A HREF="#BLOBCONTENT#">RFP FILE</a>'
,p_column_type=>'STRING'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90138740169650606)
,p_db_column_name=>'RESPONSECONTENT'
,p_display_order=>550
,p_column_identifier=>'BG'
,p_column_label=>'Response'
,p_column_html_expression=>'<A HREF="#RESPONSECONTENT#">RESPONSE FILE</a>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182540355655767101)
,p_db_column_name=>'IH_INVOICE_DAYS'
,p_display_order=>560
,p_column_identifier=>'BH'
,p_column_label=>'In House Invoice Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182540421016767102)
,p_db_column_name=>'AS_INVOICE_DAYS'
,p_display_order=>570
,p_column_identifier=>'BI'
,p_column_label=>'At Site Invoice Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184221907122304846)
,p_db_column_name=>'CONTRACTDOCUMENTS'
,p_display_order=>580
,p_column_identifier=>'BJ'
,p_column_label=>'Contract Documents'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:P36_LCD_ID:#ID#'
,p_column_linktext=>'CONTRACT DOCUMENTS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286096252391795741)
,p_db_column_name=>'STEP'
,p_display_order=>590
,p_column_identifier=>'BK'
,p_column_label=>'Step'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286097008401795749)
,p_db_column_name=>'ACTIVITI_TASK_ID'
,p_display_order=>600
,p_column_identifier=>'BL'
,p_column_label=>'Activiti task id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(291155555803660201)
,p_db_column_name=>'DIAGRAM_LINK'
,p_display_order=>610
,p_column_identifier=>'BM'
,p_column_label=>'Diagram link'
,p_column_link=>'http://192.168.3.193:8080/activiti-rest/service/runtime/process-instances/#ACTIVITI_TASK_ID#/diagram'
,p_column_linktext=>'DIAGRAM'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(291156142528660207)
,p_db_column_name=>'HISTORY'
,p_display_order=>620
,p_column_identifier=>'BN'
,p_column_label=>'History'
,p_column_link=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP:P141_HISTORY_TASK_ID:#ACTIVITI_TASK_ID#'
,p_column_linktext=>'HISTORY'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1981758577705676)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'19818'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DSP_CODE:REF_INTERNAL:COMPANY_CODE:BLOBCONTENT:RESPONSECONTENT:CONTRACTTEMPLATE:CONTRACT_TYPE_ID:PARENT_CONTRACT:PROJECT_NAME:OFFER_STATUS:BRANCH_ID:LINKPARENT:USD_VALUE:PERDIUM:DAYS_PER_TICKET:TICKET_VALUE:CAR_RENTAL_PER_DAY:INTERNATIONAL:ACCOUNT_MA'
||'NAGER:REF_PM:PRICING_DATE:WHO_CREATED:INHOUSE_RATE:ONSITE_RATE:IN_SCOPE:INVOICED_DAYS:INITIAL_AMOUNT:DISCOUNT_IN_DAYS:DISCOUNT_IN_AMOUNT:VAT_VALUE:FINAL_AMOUNT:EXPECTED_DELIVERY_DATE:WARRANTY_IN_MONTH:VALUE_IN_MAINTENANCE:SIGNATURE_DATE:SIGNED_BY:OTH'
||'ER_EXPENSES_ON_CLIENT:REMARKS:IH_INVOICE_DAYS:AS_INVOICE_DAYS:CONTRACTDOCUMENTS:DIAGRAM_LINK:HISTORY:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1861583766854726)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1842312855854691)
,p_button_name=>'CreatePipeline'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create Pipeline'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:37:P37_OFFER_STATUS:1'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2863117725683134)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1842312855854691)
,p_button_name=>'ShowAll'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Show All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1986768794255409)
,p_name=>'P36_REFCONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1986813353255410)
,p_name=>'P36_REFPIPELINE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1986987082255411)
,p_name=>'P36_REFPARENT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2078722065538706)
,p_name=>'P36_CONTRACTID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184222001397304847)
,p_name=>'P36_LCD_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(266939291412206603)
,p_name=>'P36_CNTIDD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(266939301285206604)
,p_name=>'P36_PCI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(266939421767206605)
,p_name=>'P36_CID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1842312855854691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1987684782255418)
,p_name=>'ColorRows'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(1842312855854691)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1987706625255419)
,p_event_id=>wwv_flow_api.id(1987684782255418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="OFFER_STATUS"]'').each(function() {  ',
'  if ( $(this).text() === ''PENDING'' ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"red"});  ',
'  }  ',
'  if ( $(this).text() === ''CANCELED'' ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"blue"});  ',
'  }  ',
'  if ( $(this).text() === ''CONTRACT'' ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"green"});  ',
'  }  ',
'  if ( $(this).text() === ''REJECTED'' ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"purple"});  ',
'  }  ',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2863208440683135)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2863117725683134)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2863391735683136)
,p_event_id=>wwv_flow_api.id(2863208440683135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P36_CONTRACTID := NULL ;'
,p_attribute_02=>'P36_CONTRACTID'
,p_attribute_03=>'P36_CONTRACTID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2863483478683137)
,p_event_id=>wwv_flow_api.id(2863208440683135)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
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
