--------------------------------------------------------
--  DDL for Package LGS_CONTRACTS_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."LGS_CONTRACTS_PCK" as

FUNCTION INSERT_ROW 
(DSP_CODE_p varchar2,COMPANY_CODE_p varchar2,START_DATE_p varchar2,END_DATE_p varchar2,USD_VALUE_p varchar2,
FINALIZED_p varchar2,CONTRACT_TYPE_ID_p varchar2,CONTRACT_STAGE_ID_p varchar2,DISPLAY_IN_CONTRACTS_p varchar2,
PRICING_DATE_p varchar2,PERDIUM_p varchar2,DAYS_PER_TICKET_p varchar2,TICKET_VALUE_p varchar2,HOTEL_RATE_p varchar2,
CAR_RENTAL_PER_DAY_p varchar2,INTERNATIONAL_p varchar2,WHO_CREATED_p varchar2,ACCOUNT_MANAGER_p varchar2,
USAGE_TYPE_p varchar2,PARENT_CONTRACT_p varchar2,REF_TO_PIPELINE_p varchar2,REF_TO_CONTRACT_p varchar2,PROJECT_NAME_p varchar2,
REF_PM_p varchar2,REF_INTERNAL_p varchar2,INHOUSE_RATE_p varchar2,ONSITE_RATE_p varchar2,IN_SCOPE_p varchar2,INVOICED_DAYS_p varchar2,
INITIAL_AMOUNT_p varchar2,DISCOUNT_IN_DAYS_p varchar2,DISCOUNT_IN_AMOUNT_p varchar2,VAT_VALUE_p varchar2,FINAL_AMOUNT_p varchar2,EXPECTED_DELIVERY_DATE_p varchar2,
WARRANTY_IN_MONTH_p varchar2,VALUE_IN_MAINTENANCE_p varchar2,SIGNATURE_DATE_p varchar2,SIGNED_BY_p varchar2,
OFFER_STATUS_p varchar2,PAYMENT_TERM_p varchar2,REMARKS_p varchar2,OTHER_EXPENSES_ON_CLIENT_p varchar2,SETTLED_p varchar2,
STATUS_p varchar2,IH_INVOICE_DAYS_p varchar2,AS_INVOICE_DAYS_p varchar2,IH_INITIAL_AMOUNT_p varchar2,AS_INITIAL_AMOUNT_p varchar2,INTERNAL_CLASSIFICATION_p varchar2,
APPROVAL_DATE_p varchar2,BRANCH_ID_p varchar2,RFP_FILES_p varchar2,RESPONSE_TO_RFP_FILES_p varchar2,
DESCRIPTION_p varchar2,REFERENCES_p varchar2,CLIENT_SIGNATURE_NAME_p varchar2,CLIENT_SIGNATURE_DATE_p varchar2,
EXPECTED_DELIVERY_NUMODAYS_p varchar2,CREATED_DATE_p varchar2,LL_VALUE_p varchar2,ACCEPTANCE_DATE_p varchar2,
DELIVERY_DATE_p varchar2,ORACLE_LICENSE_p varchar2,APP_LICENSE_p varchar2,IS_INVOICED_p varchar2,
STEP_p varchar2,ACTIVITI_TASK_ID_p varchar2) return number;

FUNCTION UPDATE_ROW 
(ID_p varchar2,DSP_CODE_p varchar2 default null,COMPANY_CODE_p varchar2 default null,START_DATE_p varchar2 default null,END_DATE_p varchar2 default null,USD_VALUE_p varchar2 default null,
FINALIZED_p varchar2 default null,CONTRACT_TYPE_ID_p varchar2 default null,CONTRACT_STAGE_ID_p varchar2 default null,DISPLAY_IN_CONTRACTS_p varchar2 default null,
PRICING_DATE_p varchar2 default null,PERDIUM_p varchar2 default null,DAYS_PER_TICKET_p varchar2 default null,TICKET_VALUE_p varchar2 default null,HOTEL_RATE_p varchar2 default null,
CAR_RENTAL_PER_DAY_p varchar2 default null,INTERNATIONAL_p varchar2 default null,WHO_CREATED_p varchar2 default null,ACCOUNT_MANAGER_p varchar2 default null,
USAGE_TYPE_p varchar2 default null,PARENT_CONTRACT_p varchar2 default null,REF_TO_PIPELINE_p varchar2 default null,REF_TO_CONTRACT_p varchar2 default null,PROJECT_NAME_p varchar2 default null,
REF_PM_p varchar2 default null,REF_INTERNAL_p varchar2 default null,INHOUSE_RATE_p varchar2 default null,ONSITE_RATE_p varchar2 default null,IN_SCOPE_p varchar2 default null,INVOICED_DAYS_p varchar2 default null,
INITIAL_AMOUNT_p varchar2 default null,DISCOUNT_IN_DAYS_p varchar2 default null,DISCOUNT_IN_AMOUNT_p varchar2 default null,VAT_VALUE_p varchar2 default null,FINAL_AMOUNT_p varchar2 default null,EXPECTED_DELIVERY_DATE_p varchar2 default null,
WARRANTY_IN_MONTH_p varchar2 default null,VALUE_IN_MAINTENANCE_p varchar2 default null,SIGNATURE_DATE_p varchar2 default null,SIGNED_BY_p varchar2 default null,
OFFER_STATUS_p varchar2 default null,PAYMENT_TERM_p varchar2 default null,REMARKS_p varchar2 default null,OTHER_EXPENSES_ON_CLIENT_p varchar2 default null,SETTLED_p varchar2 default null,
STATUS_p varchar2 default null,IH_INVOICE_DAYS_p varchar2 default null,AS_INVOICE_DAYS_p varchar2 default null,IH_INITIAL_AMOUNT_p varchar2 default null,AS_INITIAL_AMOUNT_p varchar2 default null,INTERNAL_CLASSIFICATION_p varchar2 default null,
APPROVAL_DATE_p varchar2 default null,BRANCH_ID_p varchar2 default null,RFP_FILES_p varchar2 default null,RESPONSE_TO_RFP_FILES_p varchar2 default null,
DESCRIPTION_p varchar2 default null,REFERENCES_p varchar2 default null,CLIENT_SIGNATURE_NAME_p varchar2 default null,CLIENT_SIGNATURE_DATE_p varchar2 default null,
EXPECTED_DELIVERY_NUMODAYS_p varchar2 default null,CREATED_DATE_p varchar2 default null,LL_VALUE_p varchar2 default null,ACCEPTANCE_DATE_p varchar2 default null,
DELIVERY_DATE_p varchar2 default null,ORACLE_LICENSE_p varchar2 default null,APP_LICENSE_p varchar2 default null,IS_INVOICED_p varchar2 default null,
STEP_p varchar2 default null,ACTIVITI_TASK_ID_p varchar2 default null) return number;



FUNCTION DELETE_ROW 
(ID_p varchar2) return number;

SAVE_ROW_EXCEPTION EXCEPTION;

end LGS_CONTRACTS_PCK;

/
