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
--     PAGE: 45
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00045
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>45);
end;
/
prompt --application/pages/page_00045
begin
wwv_flow_imp_page.create_page(
 p_id=>45
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'PIPELINE SPA'
,p_step_title=>'SPA'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var res;',
'var created;',
'',
'function setID(contractID) {',
'   $s("P45_ID",contractID);',
'    ',
'    console.log($v("P45_ID"));',
'    if($v("P45_ID") != '''')',
'    apex.server.process(',
'    ''PIPELINE_FETCH_CNT_INF_SPA'',                             // Process or AJAX Callback name',
'    {x01: contractID} , // Parameter "x01"',
'    {',
'      success: function (pData) {             // Success Javascript',
'        res = pData.cnt[0];',
'        var i = 1;  ',
'        Object.keys(pData.cnt[0]).forEach(function(key) {',
'            console.log("creating item "+"P45_"+key );',
'             ',
'            $s("P45_"+key,res[key]);',
'            $("#P45_"+key).addClass("editable");',
'           /* var itemAttr = getItemAttr("P45_"+key).then(function(data){',
'                $("#P45_"+key).addClass(data.attr);',
'            })*/',
'         });',
'      },',
'      dataType: "Json"                        // Response type (here: plain text)',
'    }',
'  );',
'}',
'',
'var getItemAttr = function(item) {',
'    return apex.server.process(',
'        "AJAX_GET_ITEM_ATTR",',
'        {x01:item}',
'    )',
'}',
'',
'var displayError = function(error) {',
'    ',
'    console.error("Promise is rejected:", error);',
'    apex.message.showErrors([',
'              {',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page","inline"],',
'                message: error,',
'                pageItem:"P45_ACCOUNT_MANAGER",',
'                unsafe: true',
'              },',
'            ]);',
'};',
'',
'var saveActionPromise = function (items,owner,table,page) {',
'    return apex.server.process(',
'        "CNT_INF_SAVE", {',
'            x01:items, x02:owner, x03:table, x04:page',
'        },{ }',
'    );',
'};',
'',
'var insertActionPromise = function (param) {',
'    return apex.server.process(',
'        "CNT_INF_CREATE", {',
'            x01: param',
'        }',
'    );',
'};',
'',
'var deleteActionPromise = function (param) {',
'    return apex.server.process(',
'        "CNT_INF_DELETE", {',
'            x01: param',
'        }',
'    );',
'};',
'',
'function calculateAmounts(){',
'    ',
'$(''#P45_IH_INITIAL_AMOUNT'').val( $(''#P45_INHOUSE_RATE'').val() * $( "#P45_IH_INVOICED_DAYS" ).val());',
'',
'$(''#P45_AS_INITIAL_AMOUNT'').val( $(''#P45_ONSITE_RATE'').val() * $( "#P45_AS_INVOICED_DAYS" ).val());',
'$(''#P45_INITIAL_AMOUNT'').val( Number($(''#P45_IH_INITIAL_AMOUNT'').val() )+ Number($( "#P45_AS_INITIAL_AMOUNT" ).val())+ Number($( "#P45_ORACLELICENSE" ).val())+ Number($( "#P45_APPLICENSE" ).val()));',
'$(''#P45_FINAL_AMOUNT'').val( Number($(''#P45_INITIAL_AMOUNT'').val() ) - Number($( "#P45_DISCOUNT_IN_AMOUNT" ).val()));',
'$(''#P45_USD_VALUE'').val( Number($(''#P45_FINAL_AMOUNT'').val() )+(Number($(''#P45_FINAL_AMOUNT'').val()) * (Number($( "#P45_VAT_VALUE" ).val()) /100)));',
'    ',
'}'))
,p_javascript_code_onload=>'$("#pipeline").draggable({ containment: "window" }).resizable()'
,p_css_file_urls=>'#APP_IMAGES#animate.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#pipeline {',
'position: relative !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200313151352'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(798612010982179832)
,p_plug_name=>'PIPELINE'
,p_region_name=>'pipeline'
,p_region_css_classes=>'resizable'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_query_type=>'SQL'
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
'AND ( LGS_CONTRACTS.ID = :P143_CONTRACTID  OR  :P143_CONTRACTID IS NULL )  ',
'and created_date is not null',
'',
'',
'order by LGS_CONTRACTS.ID desc'))
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
 p_id=>wwv_flow_imp.id(798612101507179833)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>1200
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>798612101507179833
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613064919179842)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Client'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(148756615181244033)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612258291179834)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_link=>'javascript:setID(''#ID#'');'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408003886397412)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>30
,p_column_identifier=>'AC'
,p_column_label=>'Reference to Contracts'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408421797397416)
,p_db_column_name=>'REF_INTERNAL'
,p_display_order=>40
,p_column_identifier=>'AG'
,p_column_label=>'Proposal/Offer Reference'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_PCI,P40_CID:#REFCNT#,#REFCNT#,null'
,p_column_linktext=>'#REF_INTERNAL#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613756436179849)
,p_db_column_name=>'DISPLAY_IN_CONTRACTS'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Display in contracts'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613440516179846)
,p_db_column_name=>'FINALIZED'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613654384179848)
,p_db_column_name=>'CONTRACT_STAGE_ID'
,p_display_order=>70
,p_column_identifier=>'O'
,p_column_label=>'Contract stage id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613151196179843)
,p_db_column_name=>'START_DATE'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Start date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613247782179844)
,p_db_column_name=>'END_DATE'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'End date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410645380397438)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'BC'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410399789397435)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>110
,p_column_identifier=>'AZ'
,p_column_label=>'Branch id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(148757821512244040)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410527059397437)
,p_db_column_name=>'SETTLED'
,p_display_order=>120
,p_column_identifier=>'BB'
,p_column_label=>'Settled'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408199948397413)
,p_db_column_name=>'REFCNT'
,p_display_order=>130
,p_column_identifier=>'AD'
,p_column_label=>'Reference To Contract'
,p_column_html_expression=>'<a href=''#LINKCONTRACT#''>#REFCNT#</a>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612981527179841)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>140
,p_column_identifier=>'H'
,p_column_label=>'Dsp code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(148754223503244016)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613538688179847)
,p_db_column_name=>'CONTRACT_TYPE_ID'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Contract type id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(148754979867244031)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407897275397410)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'Parent contract'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(148754779221244031)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408236945397414)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>170
,p_column_identifier=>'AE'
,p_column_label=>'Project name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410074273397432)
,p_db_column_name=>'OFFER_STATUS'
,p_display_order=>180
,p_column_identifier=>'AW'
,p_column_label=>'Offer status'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612711663179839)
,p_db_column_name=>'LINKPIPELINE'
,p_display_order=>190
,p_column_identifier=>'F'
,p_column_label=>'Linkpipeline'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407741714397409)
,p_db_column_name=>'USAGE_TYPE'
,p_display_order=>200
,p_column_identifier=>'Z'
,p_column_label=>'Usage type'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612860282179840)
,p_db_column_name=>'LINKPARENT'
,p_display_order=>210
,p_column_identifier=>'G'
,p_column_label=>'Linkparent'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612629170179838)
,p_db_column_name=>'LINKCONTRACT'
,p_display_order=>220
,p_column_identifier=>'E'
,p_column_label=>'Linkcontract'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407635858397408)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>230
,p_column_identifier=>'Y'
,p_column_label=>'Account manager'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407993760397411)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>240
,p_column_identifier=>'AB'
,p_column_label=>'Ref to pipeline'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(148755125081244031)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408345675397415)
,p_db_column_name=>'REF_PM'
,p_display_order=>250
,p_column_identifier=>'AF'
,p_column_label=>'PM Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613816376179850)
,p_db_column_name=>'PRICING_DATE'
,p_display_order=>260
,p_column_identifier=>'Q'
,p_column_label=>'Date Raised'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407594411397407)
,p_db_column_name=>'WHO_CREATED'
,p_display_order=>270
,p_column_identifier=>'X'
,p_column_label=>'Initiator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408523383397417)
,p_db_column_name=>'INHOUSE_RATE'
,p_display_order=>280
,p_column_identifier=>'AH'
,p_column_label=>'Inhouse rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408629041397418)
,p_db_column_name=>'ONSITE_RATE'
,p_display_order=>290
,p_column_identifier=>'AI'
,p_column_label=>'Onsite rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408762569397419)
,p_db_column_name=>'IN_SCOPE'
,p_display_order=>300
,p_column_identifier=>'AJ'
,p_column_label=>'WithIn scope'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408982486397421)
,p_db_column_name=>'INVOICED_DAYS'
,p_display_order=>310
,p_column_identifier=>'AL'
,p_column_label=>'Invoiced days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409185840397423)
,p_db_column_name=>'DISCOUNT_IN_DAYS'
,p_display_order=>320
,p_column_identifier=>'AN'
,p_column_label=>'Discount in days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409299973397424)
,p_db_column_name=>'DISCOUNT_IN_AMOUNT'
,p_display_order=>330
,p_column_identifier=>'AO'
,p_column_label=>'Discount in amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409379241397425)
,p_db_column_name=>'VAT_VALUE'
,p_display_order=>340
,p_column_identifier=>'AP'
,p_column_label=>'Vat value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409051121397422)
,p_db_column_name=>'INITIAL_AMOUNT'
,p_display_order=>350
,p_column_identifier=>'AM'
,p_column_label=>'Initial amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409445149397426)
,p_db_column_name=>'FINAL_AMOUNT'
,p_display_order=>360
,p_column_identifier=>'AQ'
,p_column_label=>'Final amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798613316097179845)
,p_db_column_name=>'USD_VALUE'
,p_display_order=>370
,p_column_identifier=>'L'
,p_column_label=>'Amount incl. VAT (USD)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409594852397427)
,p_db_column_name=>'EXPECTED_DELIVERY_DATE'
,p_display_order=>380
,p_column_identifier=>'AR'
,p_column_label=>'Expected delivery date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409694097397428)
,p_db_column_name=>'WARRANTY_IN_MONTH'
,p_display_order=>390
,p_column_identifier=>'AS'
,p_column_label=>'Warranty in month'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409711873397429)
,p_db_column_name=>'VALUE_IN_MAINTENANCE'
,p_display_order=>400
,p_column_identifier=>'AT'
,p_column_label=>'Value in maintenance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409872361397430)
,p_db_column_name=>'SIGNATURE_DATE'
,p_display_order=>410
,p_column_identifier=>'AU'
,p_column_label=>'Signature date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803409950844397431)
,p_db_column_name=>'SIGNED_BY'
,p_display_order=>420
,p_column_identifier=>'AV'
,p_column_label=>'Signed by'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410435824397436)
,p_db_column_name=>'OTHER_EXPENSES_ON_CLIENT'
,p_display_order=>430
,p_column_identifier=>'BA'
,p_column_label=>'Other expenses on client'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803406942626397401)
,p_db_column_name=>'PERDIUM'
,p_display_order=>440
,p_column_identifier=>'R'
,p_column_label=>'Perdium'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407227958397404)
,p_db_column_name=>'HOTEL_RATE'
,p_display_order=>450
,p_column_identifier=>'U'
,p_column_label=>'Hotel rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407365511397405)
,p_db_column_name=>'CAR_RENTAL_PER_DAY'
,p_display_order=>460
,p_column_identifier=>'V'
,p_column_label=>'Car rental per day'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407045132397402)
,p_db_column_name=>'DAYS_PER_TICKET'
,p_display_order=>470
,p_column_identifier=>'S'
,p_column_label=>'Days per ticket'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407197974397403)
,p_db_column_name=>'TICKET_VALUE'
,p_display_order=>480
,p_column_identifier=>'T'
,p_column_label=>'Ticket value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803407479414397406)
,p_db_column_name=>'INTERNATIONAL'
,p_display_order=>490
,p_column_identifier=>'W'
,p_column_label=>'International'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410234215397434)
,p_db_column_name=>'REMARKS'
,p_display_order=>500
,p_column_identifier=>'AY'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803408868309397420)
,p_db_column_name=>'INTERNAL_CLASSIFICATION'
,p_display_order=>510
,p_column_identifier=>'AK'
,p_column_label=>'Internal classification'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612596870179837)
,p_db_column_name=>'CONTRACTTEMPLATE'
,p_display_order=>520
,p_column_identifier=>'D'
,p_column_label=>'Contracttemplate'
,p_column_html_expression=>'<a href="#CONTRACTTEMPLATE#">Template</a>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410148648397433)
,p_db_column_name=>'PAYMENT_TERM'
,p_display_order=>530
,p_column_identifier=>'AX'
,p_column_label=>'Payment term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612306120179835)
,p_db_column_name=>'BLOBCONTENT'
,p_display_order=>540
,p_column_identifier=>'B'
,p_column_label=>'Blobcontent'
,p_column_html_expression=>'<A HREF="#BLOBCONTENT#">RFP FILE</a>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(798612478387179836)
,p_db_column_name=>'RESPONSECONTENT'
,p_display_order=>550
,p_column_identifier=>'C'
,p_column_label=>'Responsecontent'
,p_column_html_expression=>'<A HREF="#RESPONSECONTENT#">RESPONSE FILE</a>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410771342397439)
,p_db_column_name=>'IH_INVOICE_DAYS'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Ih invoice days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410826567397440)
,p_db_column_name=>'AS_INVOICE_DAYS'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'As invoice days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803410987543397441)
,p_db_column_name=>'CONTRACTDOCUMENTS'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Contractdocuments'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:P36_LCD_ID:#ID#'
,p_column_linktext=>'CONTRACT DOCUMENTS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803411057082397442)
,p_db_column_name=>'STEP'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Step'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803411169607397443)
,p_db_column_name=>'ACTIVITI_TASK_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Activiti task id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803411230311397444)
,p_db_column_name=>'DIAGRAM_LINK'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Diagram link'
,p_column_link=>'http://128.128.5.166:8080/activiti-rest/service/runtime/process-instances/#ACTIVITI_TASK_ID#/diagram'
,p_column_linktext=>'DIAGRAM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(803411399030397445)
,p_db_column_name=>'HISTORY'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'History'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(803442685908438724)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8034427'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:BLOBCONTENT:RESPONSECONTENT:CONTRACTTEMPLATE:LINKCONTRACT:LINKPIPELINE:LINKPARENT:DSP_CODE:COMPANY_CODE:START_DATE:END_DATE:USD_VALUE:FINALIZED:CONTRACT_TYPE_ID:CONTRACT_STAGE_ID:DISPLAY_IN_CONTRACTS:PRICING_DATE:PERDIUM:DAYS_PER_TICKET:TICKET_VAL'
||'UE:HOTEL_RATE:CAR_RENTAL_PER_DAY:INTERNATIONAL:WHO_CREATED:ACCOUNT_MANAGER:USAGE_TYPE:PARENT_CONTRACT:REF_TO_PIPELINE:REF_TO_CONTRACT:REFCNT:PROJECT_NAME:REF_PM:REF_INTERNAL:INHOUSE_RATE:ONSITE_RATE:IN_SCOPE:INTERNAL_CLASSIFICATION:INVOICED_DAYS:INIT'
||'IAL_AMOUNT:DISCOUNT_IN_DAYS:DISCOUNT_IN_AMOUNT:VAT_VALUE:FINAL_AMOUNT:EXPECTED_DELIVERY_DATE:WARRANTY_IN_MONTH:VALUE_IN_MAINTENANCE:SIGNATURE_DATE:SIGNED_BY:OFFER_STATUS:PAYMENT_TERM:REMARKS:BRANCH_ID:OTHER_EXPENSES_ON_CLIENT:SETTLED:STATUS:IH_INVOIC'
||'E_DAYS:AS_INVOICE_DAYS:CONTRACTDOCUMENTS:STEP:ACTIVITI_TASK_ID:DIAGRAM_LINK:HISTORY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(803417067220402540)
,p_plug_name=>'New'
,p_region_name=>'CNT_INF'
,p_region_css_classes=>'resizable'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'animate fadeInRight'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(803414710214402517)
,p_plug_name=>'General Information'
,p_region_name=>'test'
,p_parent_plug_id=>wwv_flow_imp.id(803417067220402540)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(803417198591402541)
,p_plug_name=>'Dates and Rates'
,p_parent_plug_id=>wwv_flow_imp.id(803417067220402540)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(803981293877409420)
,p_plug_name=>'Financial Offer'
,p_parent_plug_id=>wwv_flow_imp.id(803417067220402540)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(804110702015652324)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(803417067220402540)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(804111204498652329)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(804110702015652324)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Upload'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416950565402539)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'BACK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Back'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416271961402532)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Apply Changes'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_database_action=>'UPDATE'
);
end;
/
begin
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416714530402537)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'MODULES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Modules'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416398480402533)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Create'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416403775402534)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'REJECT_CONTRACT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Reject contract'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416513393402535)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'APPROVE_CONTRACT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Approve contract'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803416845354402538)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Delete'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803413505035402405)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_button_name=>'CreatePipeline'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Create Pipeline'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(803413664235402506)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_button_name=>'ShowAll'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Show All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803411465647397446)
,p_name=>'P45_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803411565857397447)
,p_name=>'P45_CONTRACTID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803411683013397448)
,p_name=>'P45_REFCONTRACT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803411726258397449)
,p_name=>'P45_REFPIPELINE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803411867995397450)
,p_name=>'P45_LCD_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803413128318402401)
,p_name=>'P45_REFPARENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803413227800402402)
,p_name=>'P45_CNTID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803413370908402403)
,p_name=>'P45_PCI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803413452177402404)
,p_name=>'P45_CID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(798612010982179832)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803414881140402518)
,p_name=>'P45_ACCOUNT_MANAGER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Account manager'
,p_source=>'ACCOUNT_MANAGER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_ACCOUNT_MANAGER_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME,EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803414971968402519)
,p_name=>'P45_DSP_CODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contract Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --L_DESCRIPTION,',
'DSP_CODE',
'from LGS_PROJECTS',
'order by 1'))
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415002554402520)
,p_name=>'P45_COMPANY_CODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client'
,p_source=>'COMPANY_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'COMPANIES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415134482402521)
,p_name=>'P45_CONTRACT_TYPE_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Type'
,p_source=>'CONTRACT_TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'36_PROPOSAL_TYPE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME,ID',
'from PRJ_CONTRACT_TYPES',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415266509402522)
,p_name=>'P45_REF_INTERNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Reference'
,p_source=>'REF_INTERNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415377955402523)
,p_name=>'P45_PROJECT_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project name'
,p_source=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415484956402524)
,p_name=>'P45_DESCRIPTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_tag_css_classes=>'editable'
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415573925402525)
,p_name=>'P45_PARENT_CONTRACT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where COMPANY_CODE = :P45_COMPANY_CODE',
'and usage_type = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_value=>'P45_COMPANY_CODE'
,p_cHeight=>1
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415656906402526)
,p_name=>'P45_WHO_CREATED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Initiator'
,p_source=>'WHO_CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415752980402527)
,p_name=>'P45_OFFER_STATUS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proposal/Offer Status'
,p_source=>'OFFER_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT POS_DESC,POS_ID',
'FROM PRJ_OFFER_STATUS',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415818734402528)
,p_name=>'P45_INTERNAL_CLASSIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Internal classification'
,p_source=>'INTERNAL_CLASSIFICATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pic_desc,pic_id',
'from prj_internal_classification',
'order by 2'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803415993648402529)
,p_name=>'P45_LOGOS_BRANCHES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos branches'
,p_source=>'BRANCH_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOGOS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  LLB_DESC as d,',
'       LLB_ID as r',
'  from LGS_LOGOS_BRANCHES',
' order by 2'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803416036989402530)
,p_name=>'P45_APPROVAL_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Approval date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'APPROVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803416116387402531)
,p_name=>'P45_IN_SCOPE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(803414710214402517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In scope'
,p_source=>'IN_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_INSCOPE_LOV'
,p_lov=>'.'||wwv_flow_imp.id(148754386301244016)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742491192243641)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417277694402542)
,p_name=>'P45_PRICING_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Raised'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417327121402543)
,p_name=>'P45_REF_PM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'REF_PM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417413744402544)
,p_name=>'P45_DELIVERY_NUMODDAYS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected deliver Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417560807402545)
,p_name=>'P45_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected Delivery Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'EXPECTED_DELIVERY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417698457402546)
,p_name=>'P45_REFERENCE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reference'
,p_source=>'REFERENCES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417782462402547)
,p_name=>'P45_ONSITE_RATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Onsite rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'ONSITE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803417895368402548)
,p_name=>'P45_INHOUSE_RATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(803417198591402541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Inhouse Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INHOUSE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981322542409421)
,p_name=>'P45_REF_TO_CONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981459051409422)
,p_name=>'P45_USAGE_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981547509409423)
,p_name=>'P45_IH_INVOICED_DAYS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'In House Invoiced Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981630231409424)
,p_name=>'P45_IH_INITIAL_AMOUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'In House INITIAL AMOUNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981799372409425)
,p_name=>'P45_INVOICED_DAYS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Invoiced days'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981809150409426)
,p_name=>'P45_AS_INVOICED_DAYS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'At Site INVOICED DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803981910749409427)
,p_name=>'P45_AS_INITIAL_AMOUNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'At Site INITIAL AMOUNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803982082306409428)
,p_name=>'P45_ORACLELICENSE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Oracle License'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803982176173409429)
,p_name=>'P45_APPLICENSE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'App License'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803982206293409430)
,p_name=>'P45_INITIAL_AMOUNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Initial amount'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803983372965409441)
,p_name=>'P45_DISCOUNT_IN_DAYS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Discount in days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803983466682409442)
,p_name=>'P45_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Discount in amount'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803983793179409445)
,p_name=>'P45_FINAL_AMOUNT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Final amount'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803984052318409448)
,p_name=>'P45_VAT_VALUE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Vat value'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803984102584409449)
,p_name=>'P45_USD_VALUE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Amount incl. VAT (USD)'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(803984238230409450)
,p_name=>'P45_LL_VALUE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Amount incl. VAT (L.L)'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108421455652301)
,p_name=>'P45_WARRANTY_IN_MONTH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Warranty in month'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108587125652302)
,p_name=>'P45_VALUE_IN_MAINTENANCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Value in maintenance'
,p_source=>'VALUE_IN_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108643930652303)
,p_name=>'P45_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Other expenses on client'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108715028652304)
,p_name=>'P45_PERDIUM'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Perdium'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108897897652305)
,p_name=>'P45_TICKET_VALUE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Ticket value'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804108952367652306)
,p_name=>'P45_HOTEL_RATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Hotel rate'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109038541652307)
,p_name=>'P45_CAR_RENTAL_PER_DAY'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'New'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109149892652308)
,p_name=>'P45_INTERNATIONAL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'International'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109263231652309)
,p_name=>'P45_DAYS_PER_TICKET'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Days per ticket'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109371596652310)
,p_name=>'P45_PAYMENT_TERM'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Payment term'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109418284652311)
,p_name=>'P45_REMARKS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Remarks'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109517740652312)
,p_name=>'P45_SIGNED_BY'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Signed by'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109653569652313)
,p_name=>'P45_SIGNATURE_DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Logos Signature Date'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109799694652314)
,p_name=>'P45_CLIENT_SIGNATURE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Client signature'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109830678652315)
,p_name=>'P45_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_prompt=>'Client signature date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'editable'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804109940779652316)
,p_name=>'P45_END_DATE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110053777652317)
,p_name=>'P45_SETTLED'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110136031652318)
,p_name=>'P45_START_DATE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110253907652319)
,p_name=>'P45_STATUS'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110395236652320)
,p_name=>'P45_CONTRACT_STAGE_ID'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110403902652321)
,p_name=>'P45_FINALIZED'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110500006652322)
,p_name=>'P45_DISPLAY_IN_CONTRACTS'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110667402652323)
,p_name=>'P45_REF_TO_PIPELINE'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(803981293877409420)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110872762652325)
,p_name=>'P45_RFP_FILES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(804110702015652324)
,p_prompt=>'Rfp files'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804110954812652326)
,p_name=>'P45_RFPFILES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(804110702015652324)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804111047147652327)
,p_name=>'P45_RESPONSE_TO_RFP_FILES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(804110702015652324)
,p_prompt=>'Response to RFP files'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'NATIVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(804111123217652328)
,p_name=>'P45_RESPTORFP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(804110702015652324)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803413772526402507)
,p_name=>'ShowAll_Clicked'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(803413664235402506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803413842871402508)
,p_event_id=>wwv_flow_imp.id(803413772526402507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P45_CONTRACTID := NULL ;'
,p_attribute_02=>'P45_CONTRACTID'
,p_attribute_03=>'P45_CONTRACTID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803413915791402509)
,p_event_id=>wwv_flow_imp.id(803413772526402507)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803414034860402510)
,p_name=>'ColorRows'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(798612010982179832)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803414195660402511)
,p_event_id=>wwv_flow_imp.id(803414034860402510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('$(''td[headers="OFFER_STATUS"]'').each(function()\00A0{\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''PENDING''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"red"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''CANCELED''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"blue"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''CONTRACT''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"green"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
unistr('  if\00A0(\00A0$(this).text()\00A0===\00A0''REJECTED''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"purple"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803979391631409401)
,p_name=>'HIDE_CNT_INF'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803979494411409402)
,p_event_id=>wwv_flow_imp.id(803979391631409401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(803417067220402540)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803980026679409408)
,p_event_id=>wwv_flow_imp.id(803979391631409401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".row").children().first().removeClass("col-8").addClass("col-12");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803980307473409411)
,p_name=>'CNT_PICKED'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_ID'
,p_condition_element=>'P45_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803980512005409413)
,p_event_id=>wwv_flow_imp.id(803980307473409411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".row").children().first().removeClass("col-12").addClass("col-8");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803980482968409412)
,p_event_id=>wwv_flow_imp.id(803980307473409411)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(803417067220402540)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803980646298409414)
,p_name=>'CLEAR_ID'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(803416950565402539)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803980769577409415)
,p_event_id=>wwv_flow_imp.id(803980646298409414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P45_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$s("P45_ID","")'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803981072843409418)
,p_event_id=>wwv_flow_imp.id(803980646298409414)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(803417067220402540)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803981193673409419)
,p_event_id=>wwv_flow_imp.id(803980646298409414)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".row").children().first().removeClass("col-8").addClass("col-12");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803982344942409431)
,p_name=>'IH_DAYS_CHANGED'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_IH_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803982478526409432)
,p_event_id=>wwv_flow_imp.id(803982344942409431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803982573527409433)
,p_name=>'OS_DAYS_CHANGED'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_AS_INVOICED_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803982634361409434)
,p_event_id=>wwv_flow_imp.id(803982573527409433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803982728693409435)
,p_name=>'OL-CHANGED'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_ORACLELICENSE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803982820468409436)
,p_event_id=>wwv_flow_imp.id(803982728693409435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803982955787409437)
,p_name=>'AL_CHANGED'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_APPLICENSE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803983056413409438)
,p_event_id=>wwv_flow_imp.id(803982955787409437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803983158696409439)
,p_name=>'INITIAL_AMOUNT_CHANGED'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_INITIAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803983221701409440)
,p_event_id=>wwv_flow_imp.id(803983158696409439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803983549330409443)
,p_name=>'DISC_AM_CHANGED'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_DISCOUNT_IN_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803983600739409444)
,p_event_id=>wwv_flow_imp.id(803983549330409443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculateAmounts();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(803983853739409446)
,p_name=>'FIN_AM_CHANGED'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_FINAL_AMOUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(803983913289409447)
,p_event_id=>wwv_flow_imp.id(803983853739409446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P45_USD_VALUE'').val( Number($(''#P45_FINAL_AMOUNT'').val() )+(Number($(''#P45_FINAL_AMOUNT'').val()) * (Number($( "#P45_VAT_VALUE" ).val()) /100)));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(804111915502652336)
,p_name=>'CLIENT_SIDE_DML_BUTTONS'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_ID'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'((apex.item(''P45_ID'').getValue() != ''''))'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112097633652337)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416271961402532)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112340647652340)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416398480402533)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112127546652338)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416714530402537)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112458136652341)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416271961402532)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112213635652339)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416398480402533)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112536506652342)
,p_event_id=>wwv_flow_imp.id(804111915502652336)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416714530402537)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(804112602010652343)
,p_name=>'CLIENT_ADMIN_BUTTONS'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_ID'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'((apex.item(''P45_ID'').getValue() != '''')&&',
'  apex.item(''P79_OFFER_STATUS '').getValue() == ''1'')'))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112751000652344)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416513393402535)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804113033115652347)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416403775402534)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112854479652345)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416403775402534)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804113172634652348)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416513393402535)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804112930715652346)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416845354402538)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804113293106652349)
,p_event_id=>wwv_flow_imp.id(804112602010652343)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(803416845354402538)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(804113324794652350)
,p_name=>'CREATE_PIPELINE'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(803413505035402405)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804213851957693904)
,p_event_id=>wwv_flow_imp.id(804113324794652350)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P45_ID",'''');',
'$(".editable").val("");'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804213553406693901)
,p_event_id=>wwv_flow_imp.id(804113324794652350)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(803417067220402540)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804214032134693906)
,p_event_id=>wwv_flow_imp.id(804113324794652350)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".row").children().first().removeClass("col-12").addClass("col-8");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(804214216694693908)
,p_name=>'AUTO_DML'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(803416271961402532)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(804214326085693909)
,p_event_id=>wwv_flow_imp.id(804214216694693908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var items = $(".editable").map(function() {',
'    if($(this).hasClass("popup_lov")) return "\"" + this.id +"\":\""+$("#"+this.id+"_HIDDENVALUE").val() +"\"" ;',
'   return "\"" + this.name +"\":\""+this.value +"\"" ;',
'}).get();',
'',
'items.join('','');',
'items = ''{'' + items +''}'';',
'',
'console.log(items);',
'',
'saveActionPromise(items,''PRJ'',''LGS_CONTRACTS'',''P45'')',
'    .then(function(data){',
'    console.log(data);',
'',
'    if (data.success)',
'    console.log("saveActionPromise is resolved", data);',
'    else{',
'       displayError(data.message);',
'    }',
'});',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(804111719646652334)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CNT_INF_SAVE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'owner_v varchar2(100) := apex_application.g_x02;',
'table_v varchar2(100) := apex_application.g_x03;',
'page_v  varchar2(5)   := apex_application.g_x04;',
'l_constraint_name varchar2(100);',
'cursor sel_cols is',
' select ',
'       col.column_name col_name, ',
'       col.data_type col_type',
'from sys.all_tab_columns col',
'inner join sys.all_tables t on col.owner = t.owner ',
'                              and col.table_name = t.table_name',
'where col.owner = owner_v -- ''PRJ''',
'and col.table_name = table_v -- ''LGS_CONTRACTS''',
'order by col.column_id;',
'col_v sel_cols%ROWTYPE;',
'',
'UPD_STMT varchar2(4000);',
'result number;',
'begin',
'apex_json.parse(apex_application.g_x01);',
'insert into tareif (c1,c2) values (''CNT_INF_SAVE'',''post-parse''); commit;',
'open sel_cols;',
'    loop',
'        fetch sel_cols into col_v;',
'        EXIT WHEN SEL_COLS%NOTFOUND;',
'        insert into tareif (c1,c2) values (''CNT_INF_SAVE'',apex_json.get_varchar2 (page_v||''_''||col_v.col_name)); commit;',
'         UPD_STMT := UPD_STMT ||''''''''||apex_json.get_varchar2 (page_v||''_''||col_v.col_name)||'''''','';',
'        ',
'    end loop;',
'close sel_cols;',
'insert into tareif (c1,c2) values (''CNT_INF_SAVE'',''pre - exec''); commit;',
'EXECUTE IMMEDIATE',
'    ''CALL LGS_CONTRACTS_PCK.UPDATE_ROW(''||substr(UPD_STMT,1,LENGTH(UPD_STMT) -1)||'') INTO :result''',
'     USING OUT result;',
'     insert into tareif (c1,c2) values (''CNT_INF_SAVE'',''post - exec - pre raise''); commit;',
'--raise_application_error(-20001, ''test Error'');',
'     apex_json.open_object;',
'     apex_json.write(''success'',true);',
'     apex_json.write(''message'',result);',
'     apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN ',
'     apex_json.open_object;',
'     apex_json.write(''success'',false);',
'     apex_json.write(''message'',sqlerrm);',
'     apex_json.write(''relaredItems'',''P45_ACCOUNT_MANAGER'');',
'     apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'no'
,p_process_success_message=>'ok'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(804214429935693910)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CNT_INF_CREATE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'owner_v varchar2(100) := apex_application.g_x02;',
'table_v varchar2(100) := apex_application.g_x03;',
'page_v  varchar2(5)   := apex_application.g_x04;',
'cursor sel_cols is',
' select ',
'       col.column_name col_name, ',
'       col.data_type col_type',
'from sys.all_tab_columns col',
'inner join sys.all_tables t on col.owner = t.owner ',
'                              and col.table_name = t.table_name',
'where col.owner = owner_v -- ''PRJ''',
'and col.table_name = table_v -- ''LGS_CONTRACTS''',
'order by col.column_id;',
'col_v sel_cols%ROWTYPE;',
'',
'UPD_STMT varchar2(4000);',
'result number;',
'begin',
'apex_json.parse(apex_application.g_x01);',
'open sel_cols;',
'    loop',
'        fetch sel_cols into col_v;',
'        EXIT WHEN SEL_COLS%NOTFOUND;',
'         UPD_STMT := UPD_STMT ||apex_json.get_varchar2 (page_v||''_''||col_v.col_name)||'','';',
'        ',
'    end loop;',
'close sel_cols;',
'EXECUTE IMMEDIATE',
'    ''CALL LGS_CONTRACTS_PCK.INSERT_ROW(''||UPD_STMT||'') INTO :result''',
'     USING OUT result;EXCEPTION WHEN OTHERS THEN raise;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(804214523119693911)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CNT_INF_DEL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'owner_v varchar2(100) := apex_application.g_x02;',
'table_v varchar2(100) := apex_application.g_x03;',
'page_v  varchar2(5)   := apex_application.g_x04;',
'cursor sel_cols is',
' select ',
'       col.column_name col_name, ',
'       col.data_type col_type',
'from sys.all_tab_columns col',
'inner join sys.all_tables t on col.owner = t.owner ',
'                              and col.table_name = t.table_name',
'where col.owner = owner_v -- ''PRJ''',
'and col.table_name = table_v -- ''LGS_CONTRACTS''',
'order by col.column_id;',
'col_v sel_cols%ROWTYPE;',
'',
'UPD_STMT varchar2(4000);',
'result number;',
'begin',
'apex_json.parse(apex_application.g_x01);',
'open sel_cols;',
'    loop',
'        fetch sel_cols into col_v;',
'        EXIT WHEN SEL_COLS%NOTFOUND;',
'         UPD_STMT := UPD_STMT ||apex_json.get_varchar2 (page_v||''_''||col_v.col_name)||'','';',
'        ',
'    end loop;',
'close sel_cols;',
'EXECUTE IMMEDIATE',
'    ''CALL LGS_CONTRACTS_PCK.DELETE_ROW(''||UPD_STMT||'') INTO :result''',
'     USING OUT result;EXCEPTION WHEN OTHERS THEN raise;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(804214724091693913)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_error'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'raise_application_error(-20001, sqlerrm);',
''))
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
