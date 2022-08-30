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
--   Date and Time:   11:23 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 49
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00049
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>49);
end;
/
prompt --application/pages/page_00049
begin
wwv_flow_imp_page.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'REPORT'
,p_step_title=>'aaa'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170724135632'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6007449580603836)
,p_plug_name=>'REPORT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       DSP_CODE,',
'       COMPANY_CODE,',
'       START_DATE,',
'       END_DATE,',
'       USD_VALUE,',
'       FINALIZED,',
'       CONTRACT_TYPE_ID,',
'       CONTRACT_STAGE_ID,',
'       DISPLAY_IN_CONTRACTS,',
'       PRICING_DATE,',
'       PERDIUM,',
'       DAYS_PER_TICKET,',
'       TICKET_VALUE,',
'       HOTEL_RATE,',
'       CAR_RENTAL_PER_DAY,',
'       INTERNATIONAL,',
'       WHO_CREATED,',
'       ACCOUNT_MANAGER,',
'       USAGE_TYPE,',
'       PARENT_CONTRACT,',
'       REF_TO_PIPELINE,',
'       REF_TO_CONTRACT,',
'       PROJECT_NAME,',
'       REF_PM,',
'       REF_INTERNAL,',
'       INHOUSE_RATE,',
'       ONSITE_RATE,',
'       IN_SCOPE,',
'       INVOICED_DAYS,',
'       INITIAL_AMOUNT,',
'       DISCOUNT_IN_DAYS,',
'       DISCOUNT_IN_AMOUNT,',
'       VAT_VALUE,',
'       FINAL_AMOUNT,',
'       EXPECTED_DELIVERY_DATE,',
'       WARRANTY_IN_MONTH,',
'       VALUE_IN_MAINTENANCE,',
'       SIGNATURE_DATE,',
'       SIGNED_BY,',
'       OFFER_STATUS,',
'       PAYMENT_TERM,',
'       REMARKS,',
'       OTHER_EXPENSES_ON_CLIENT,',
'       SETTLED,',
'       STATUS,',
'       IH_INVOICE_DAYS,',
'       AS_INVOICE_DAYS,',
'       IH_INITIAL_AMOUNT,',
'       AS_INITIAL_AMOUNT,',
'       INTERNAL_CLASSIFICATION,',
'       APPROVAL_DATE,',
'       BRANCH_ID,',
'       RFP_FILES,',
'       RESPONSE_TO_RFP_FILES,',
'       DESCRIPTION,',
'       REFERENCES,',
'       CLIENT_SIGNATURE_NAME,',
'       CLIENT_SIGNATURE_DATE,',
'       EXPECTED_DELIVERY_NUM_OF_DAYS,',
'       CREATED_DATE,',
'       LL_VALUE,',
'       ACCEPTANCE_DATE,',
'       DELIVERY_DATE',
'  from LGS_CONTRACTS',
'WHERE (SIGNATURE_DATE > :P49_STARTDATE OR EXPECTED_DELIVERY_DATE > :P49_STARTDATE OR DELIVERY_DATE > :P49_STARTDATE OR :P49_STARTDATE IS NULL)',
'AND   (STATUS = :P49_PROJECTSTATUS OR :P49_PROJECTSTATUS IS NULL) ',
'AND (DSP_CODE= :P49_DSPCODE OR :P49_DSPCODE IS NULL)',
'AND (SIGNATURE_DATE < :P49_ENDDATE OR EXPECTED_DELIVERY_DATE < :P49_ENDDATE OR DELIVERY_DATE < :P49_ENDDATE OR :P49_ENDDATE IS NULL)',
'AND CREATED_DATE IS NOT NULL and usage_type= 2',
'and project_pck.get_if_contract_disp (id, V(''APP_USER'')) = 1',
' ORDER BY CREATED_DATE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6007549388603836)
,p_name=>'aaa'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>6007549388603836
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6007964591603852)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6008389785603856)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Integration Code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(1991986855473901)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6008737431603856)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Internal Reference'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6009189599603857)
,p_db_column_name=>'START_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6009510813603858)
,p_db_column_name=>'END_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6009939640603859)
,p_db_column_name=>'USD_VALUE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'FINAL AMOUNT(incl VAT)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6010319781603859)
,p_db_column_name=>'FINALIZED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6010790244603860)
,p_db_column_name=>'CONTRACT_TYPE_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Contract Type Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6011192270603861)
,p_db_column_name=>'CONTRACT_STAGE_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Contract Stage Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6011564980603861)
,p_db_column_name=>'DISPLAY_IN_CONTRACTS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Display In Contracts'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6011952797603862)
,p_db_column_name=>'PRICING_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Pricing Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012338915603863)
,p_db_column_name=>'PERDIUM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Perdium'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012706563603863)
,p_db_column_name=>'DAYS_PER_TICKET'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Days Per Ticket'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6013197514603866)
,p_db_column_name=>'TICKET_VALUE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Ticket Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6013597588603866)
,p_db_column_name=>'HOTEL_RATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Hotel Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6013922079603867)
,p_db_column_name=>'CAR_RENTAL_PER_DAY'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Car Rental Per Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6014371228603867)
,p_db_column_name=>'INTERNATIONAL'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'International'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6014789294603868)
,p_db_column_name=>'WHO_CREATED'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Who Created'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6015120580603869)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Account Manager'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6015568362603869)
,p_db_column_name=>'USAGE_TYPE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Usage Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(1974049848378104)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6015917327603870)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Parent Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6016395263603871)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Ref To Pipeline'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6016742998603872)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Ref To Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6017171002603872)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Project Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6017589069603873)
,p_db_column_name=>'REF_PM'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Ref Pm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6017931418603874)
,p_db_column_name=>'REF_INTERNAL'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6018312991603876)
,p_db_column_name=>'INHOUSE_RATE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Inhouse Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6018783647603876)
,p_db_column_name=>'ONSITE_RATE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Onsite Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6019182110603877)
,p_db_column_name=>'IN_SCOPE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'In Scope'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6019582463603878)
,p_db_column_name=>'INVOICED_DAYS'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Invoiced Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6019953788603878)
,p_db_column_name=>'INITIAL_AMOUNT'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Initial Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6020315828603879)
,p_db_column_name=>'DISCOUNT_IN_DAYS'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Discount In Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6020798133603880)
,p_db_column_name=>'DISCOUNT_IN_AMOUNT'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Discount In Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6021157041603880)
,p_db_column_name=>'VAT_VALUE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Vat Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6021552058603881)
,p_db_column_name=>'FINAL_AMOUNT'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Final Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6021939296603882)
,p_db_column_name=>'EXPECTED_DELIVERY_DATE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Expected Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6022393145603883)
,p_db_column_name=>'WARRANTY_IN_MONTH'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Warranty In Month'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6022789760603883)
,p_db_column_name=>'VALUE_IN_MAINTENANCE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Value In Maintenance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6023198565603884)
,p_db_column_name=>'SIGNATURE_DATE'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Signature Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6023578731603885)
,p_db_column_name=>'SIGNED_BY'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Signed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6023986654603885)
,p_db_column_name=>'OFFER_STATUS'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Offer Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(1974234826383220)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6024339917603886)
,p_db_column_name=>'PAYMENT_TERM'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6024759988603886)
,p_db_column_name=>'REMARKS'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6025103233603887)
,p_db_column_name=>'OTHER_EXPENSES_ON_CLIENT'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Other Expenses On Client'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6025528022603887)
,p_db_column_name=>'SETTLED'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Settled'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6025925135603888)
,p_db_column_name=>'STATUS'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(1974458000386842)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6026315438603888)
,p_db_column_name=>'IH_INVOICE_DAYS'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Ih Invoice Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6026720520603889)
,p_db_column_name=>'AS_INVOICE_DAYS'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'As Invoice Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6027184619603889)
,p_db_column_name=>'IH_INITIAL_AMOUNT'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Ih Initial Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6027565516603890)
,p_db_column_name=>'AS_INITIAL_AMOUNT'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'As Initial Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6027965888603891)
,p_db_column_name=>'INTERNAL_CLASSIFICATION'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Internal Classification'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6028366454603891)
,p_db_column_name=>'APPROVAL_DATE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Approval Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6028763001603892)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029143841603892)
,p_db_column_name=>'RFP_FILES'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Rfp Files'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029506032603893)
,p_db_column_name=>'RESPONSE_TO_RFP_FILES'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Response To Rfp Files'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029969730603894)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6030349515603894)
,p_db_column_name=>'REFERENCES'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'References'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6030771650603895)
,p_db_column_name=>'CLIENT_SIGNATURE_NAME'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Client Signature Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6031197629603896)
,p_db_column_name=>'CLIENT_SIGNATURE_DATE'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Client Signature Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6031542125603897)
,p_db_column_name=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Expected Delivery Num Of Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6031918820603897)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6032314703603898)
,p_db_column_name=>'LL_VALUE'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Ll Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6032785966603899)
,p_db_column_name=>'ACCEPTANCE_DATE'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Acceptance Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6033129732603899)
,p_db_column_name=>'DELIVERY_DATE'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6033727393607060)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'60338'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT_NAME:DSP_CODE:REF_INTERNAL:COMPANY_CODE:SIGNATURE_DATE:INVOICED_DAYS:EXPECTED_DELIVERY_DATE:DELIVERY_DATE:OFFER_STATUS:USAGE_TYPE:FINAL_AMOUNT:VAT_VALUE:STATUS:ACCEPTANCE_DATE:VALUE_IN_MAINTENANCE:REMARKS:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6039554150737806)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6007449580603836)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6039051891737801)
,p_name=>'P49_DSPCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6007449580603836)
,p_prompt=>'REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6039109334737802)
,p_name=>'P49_STARTDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6007449580603836)
,p_prompt=>'START DATE'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6039258719737803)
,p_name=>'P49_ENDDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6007449580603836)
,p_prompt=>'END DATE'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6039453730737805)
,p_name=>'P49_PROJECTSTATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6007449580603836)
,p_prompt=>' PROJECT STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_STATUS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PST_DESC,PST_ID',
'from PRJ_STATUS',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
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
