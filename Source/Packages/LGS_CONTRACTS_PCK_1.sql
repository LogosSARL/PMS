--------------------------------------------------------
--  DDL for Package Body LGS_CONTRACTS_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."LGS_CONTRACTS_PCK" as

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
STEP_p varchar2,ACTIVITI_TASK_ID_p varchar2) return number is NEW_ID number;

BEGIN
select LGS_CONTRACTS_SEQ.nextVal into NEW_ID from dual;
/*
INSERT INTO LGS_CONTRACTS VALUES
(NEW_ID,DSP_CODE_p,
COMPANY_CODE_p,
START_DATE_p,
END_DATE_p,
USD_VALUE_p,
FINALIZED_p,
CONTRACT_TYPE_ID_p,
CONTRACT_STAGE_ID_p,
DISPLAY_IN_CONTRACTS_p,
PRICING_DATE_p,
PERDIUM_p,
DAYS_PER_TICKET_p,
TICKET_VALUE_p,
HOTEL_RATE_p,
CAR_RENTAL_PER_DAY_p,
INTERNATIONAL_p,
WHO_CREATED_p,
ACCOUNT_MANAGER_p,
USAGE_TYPE_p,
PARENT_CONTRACT_p,
REF_TO_PIPELINE_p,
REF_TO_CONTRACT_p,
PROJECT_NAME_p,
REF_PM_p,
REF_INTERNAL_p,
INHOUSE_RATE_p,
ONSITE_RATE_p,
IN_SCOPE_p,
INVOICED_DAYS_p,
INITIAL_AMOUNT_p,
DISCOUNT_IN_DAYS_p,
DISCOUNT_IN_AMOUNT_p,
VAT_VALUE_p,
FINAL_AMOUNT_p,
EXPECTED_DELIVERY_DATE_p,
WARRANTY_IN_MONTH_p,
VALUE_IN_MAINTENANCE_p,
SIGNATURE_DATE_p,
SIGNED_BY_p,
OFFER_STATUS_p,
PAYMENT_TERM_p,
REMARKS_p,
OTHER_EXPENSES_ON_CLIENT_p,
SETTLED_p,
STATUS_p,
IH_INVOICE_DAYS_p,
AS_INVOICE_DAYS_p,
IH_INITIAL_AMOUNT_p,
AS_INITIAL_AMOUNT_p,
INTERNAL_CLASSIFICATION_p,
APPROVAL_DATE_p,
BRANCH_ID_p,
RFP_FILES_p,
RESPONSE_TO_RFP_FILES_p,
DESCRIPTION_p,
REFERENCES_p,
CLIENT_SIGNATURE_NAME_p,
CLIENT_SIGNATURE_DATE_p,
EXPECTED_DELIVERY_NUMODAYS_p,
CREATED_DATE_p,
LL_VALUE_p,
ACCEPTANCE_DATE_p,
DELIVERY_DATE_p,
ORACLE_LICENSE_p,
APP_LICENSE_p,
IS_INVOICED_p,
STEP_p,
ACTIVITI_TASK_ID_p);*/
insert into tareif(c1,c2) values ('INSERT_ROW',NEW_ID);commit;
return new_id;
Exception when others then return -1;
end INSERT_ROW;

FUNCTION UPDATE_ROW 
(ID_p varchar2, DSP_CODE_p varchar2 default null,COMPANY_CODE_p varchar2 default null,START_DATE_p varchar2 default null,END_DATE_p varchar2 default null,USD_VALUE_p varchar2 default null,
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
STEP_p varchar2 default null,ACTIVITI_TASK_ID_p varchar2 default null) return number is
begin
/*UPDATE LGS_CONTRACTS LGS_C SET
    LGS_C.DSP_CODE = DSP_CODE_p,
    LGS_C.COMPANY_CODE = COMPANY_CODE_p,
    LGS_C.START_DATE = START_DATE_P,
    LGS_C.END_DATE = END_DATE_P,
    LGS_C.USD_VALUE = USD_VALUE_P,
    LGS_C.FINALIZED = FINALIZED_P,
    LGS_C.CONTRACT_TYPE_ID = CONTRACT_TYPE_ID_P,
    LGS_C.CONTRACT_STAGE_ID = CONTRACT_STAGE_ID_P,
    LGS_C.DISPLAY_IN_CONTRACTS =DISPLAY_IN_CONTRACTS_P ,
    LGS_C.PRICING_DATE = PRICING_DATE_P,
    LGS_C.PERDIUM = PERDIUM_P,
    LGS_C.DAYS_PER_TICKET = DAYS_PER_TICKET_P,
    LGS_C.TICKET_VALUE = TICKET_VALUE_P,
    LGS_C.HOTEL_RATE = HOTEL_RATE_P,
    LGS_C.CAR_RENTAL_PER_DAY = CAR_RENTAL_PER_DAY_P ,
    LGS_C.INTERNATIONAL = INTERNATIONAL_P,
    LGS_C.WHO_CREATED = WHO_CREATED_P,
    LGS_C.ACCOUNT_MANAGER = ACCOUNT_MANAGER_P,
    LGS_C.USAGE_TYPE = USAGE_TYPE_P,
    LGS_C.PARENT_CONTRACT = PARENT_CONTRACT_P,
    LGS_C.REF_TO_PIPELINE = REF_TO_PIPELINE_P,
    LGS_C.REF_TO_CONTRACT = REF_TO_CONTRACT_P,
    LGS_C.PROJECT_NAME = PROJECT_NAME_P,
    LGS_C.REF_PM = REF_PM_P,
    LGS_C.REF_INTERNAL = REF_INTERNAL_P ,
    LGS_C.INHOUSE_RATE = INHOUSE_RATE_P ,
    LGS_C.ONSITE_RATE = ONSITE_RATE_P,
    LGS_C.IN_SCOPE = IN_SCOPE_P,
    LGS_C.INVOICED_DAYS = INVOICED_DAYS_P,
    LGS_C.INITIAL_AMOUNT = INITIAL_AMOUNT_P,
    LGS_C.DISCOUNT_IN_DAYS = DISCOUNT_IN_DAYS_P,
    LGS_C.DISCOUNT_IN_AMOUNT = DISCOUNT_IN_AMOUNT_P,
    LGS_C.VAT_VALUE = VAT_VALUE_P,
    LGS_C.FINAL_AMOUNT = FINAL_AMOUNT_P,
    LGS_C.EXPECTED_DELIVERY_DATE = EXPECTED_DELIVERY_DATE_P,
    LGS_C.WARRANTY_IN_MONTH = WARRANTY_IN_MONTH_P,
    LGS_C.VALUE_IN_MAINTENANCE = VALUE_IN_MAINTENANCE_P,
    LGS_C.SIGNATURE_DATE = SIGNATURE_DATE_P,
    LGS_C.SIGNED_BY = SIGNED_BY_P,
    LGS_C.OFFER_STATUS = OFFER_STATUS_P,
    LGS_C.PAYMENT_TERM = PAYMENT_TERM_P,
    LGS_C.REMARKS = REMARKS_P,
    LGS_C.OTHER_EXPENSES_ON_CLIENT = OTHER_EXPENSES_ON_CLIENT_P,
    LGS_C.SETTLED = SETTLED_P,
    LGS_C.STATUS = STATUS_P,
    LGS_C.IH_INVOICE_DAYS = IH_INVOICE_DAYS_P,
    LGS_C.AS_INVOICE_DAYS = AS_INVOICE_DAYS_P,
    LGS_C.IH_INITIAL_AMOUNT = IH_INITIAL_AMOUNT_P,
    LGS_C.AS_INITIAL_AMOUNT = AS_INITIAL_AMOUNT_P,
    LGS_C.INTERNAL_CLASSIFICATION = INTERNAL_CLASSIFICATION_P,
    LGS_C.APPROVAL_DATE = APPROVAL_DATE_P,
    LGS_C.BRANCH_ID = BRANCH_ID_P,
    LGS_C.DESCRIPTION = DESCRIPTION_P,
    LGS_C.REFERENCES = REFERENCES_P,
    LGS_C.CLIENT_SIGNATURE_NAME = CLIENT_SIGNATURE_NAME_P,
    LGS_C.CLIENT_SIGNATURE_DATE = CLIENT_SIGNATURE_DATE_P,
    LGS_C.EXPECTED_DELIVERY_NUM_OF_DAYS = EXPECTED_DELIVERY_NUMODAYS_p,
    LGS_C.CREATED_DATE = CREATED_DATE_P,
    LGS_C.LL_VALUE = LL_VALUE_P,
    LGS_C.ACCEPTANCE_DATE = ACCEPTANCE_DATE_P,
    LGS_C.DELIVERY_DATE = DELIVERY_DATE_P,
    LGS_C.ORACLE_LICENSE = ORACLE_LICENSE_P,
    LGS_C.APP_LICENSE = APP_LICENSE_P,
    LGS_C.IS_INVOICED = IS_INVOICED_P,
    LGS_C.STEP = STEP_P,
    LGS_C.ACTIVITI_TASK_ID = ACTIVITI_TASK_ID_P
   where LGS_C.ID = ID_P;*/
   
   insert into tareif(c1,c2) values ('UPDATE_ROW',ID_P);commit;
   raise SAVE_ROW_EXCEPTION;
   return ID_P;
Exception 
when SAVE_ROW_EXCEPTION THEN 
   insert into tareif(c1) values ('SAVE_ROW_EXCEPTION');commit;
    raise;
when others then raise;
end UPDATE_ROW;

FUNCTION DELETE_ROW 
(ID_p varchar2) return number
is 

begin
DELETE LGS_CONTRACTS WHERE ID = ID_P;

return ID_P;
EXCEPTION WHEN OTHERS THEN Return -1;
end DELETE_ROW;

function apex_error_handling (
    p_error in apex_error.t_error )
    return apex_error.t_error_result
is
    l_result          apex_error.t_error_result;
    l_constraint_name varchar2(255);
begin
    l_result := apex_error.init_error_result (
                    p_error => p_error );
    -- If it is an internal error raised by APEX, like an invalid statement or
    -- code which can not be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then
        -- mask all errors that are not common runtime errors (Access Denied
        -- errors raised by application / page authorization and all errors
        -- regarding session and session state)
        if not p_error.is_common_runtime_error then
            
            -- Change the message to the generic error message which doesn't expose
            -- any sensitive information.
            l_result.message := 'An unexpected internal application error has occurred.';
            l_result.additional_info := null;
        end if;
    else
        -- Always show the error as inline error
        -- Note: If you have created manual tabular forms (using the package
        --       apex_item/htmldb_item in the SQL statement) you should still
        --       use "On error page" on that pages to avoid loosing entered data
        l_result.display_location := case
                                       when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                       else l_result.display_location
                                     end;
        
        -- If an ORA error has been raised, for example a raise_application_error(-20xxx)
        -- in a table trigger or in a PL/SQL package called by a process and we
        -- haven't found the error in our lookup table, then we just want to see
        -- the actual error text and not the full error stack
        if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
            l_result.message := apex_error.get_first_ora_error_text (
                                    p_error => p_error );
        end if;
        -- If no associated page item/tabular form column has been set, we can use
        -- apex_error.auto_set_associated_item to automatically guess the affected
        -- error field by examine the ORA error for constraint names or column names.
        if l_result.page_item_name is null and l_result.column_alias is null then
            apex_error.auto_set_associated_item (
                p_error        => p_error,
                p_error_result => l_result );
        end if;
    end if;
    insert into tareif(c1) values ('test error_handling_apex_function');commit;
    return l_result;
end apex_error_handling;
end LGS_CONTRACTS_PCK;

/
