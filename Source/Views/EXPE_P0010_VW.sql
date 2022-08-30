--------------------------------------------------------
--  DDL for View EXPE_P0010_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0010_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_STATUS", "EXPE_SUBMITTED_BY", "EXPE_SUBMITTED_ON", "EXPE_INVOICE_DD", "EXPE_ACCOUNT", "EXPE_PURPOSE") AS 
  select expe.expe_id
       , expe.expe_justification
       , expe.expe_amount
       , expe.expe_status
       , expe.expe_submitted_by
       , expe.expe_submitted_on
       , to_char(expe.expe_invoice_dd, 'DD-MON-YYYY') expe_invoice_dd
       , expe.expe_account
       , expe.expe_purpose
    from expe_expenses expe
    with read only
;
