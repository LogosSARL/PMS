--------------------------------------------------------
--  DDL for View EXPE_P0006_ARCHIVE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0006_ARCHIVE_VW" ("EXPE_ID", "EXPE_PURPOSE", "EXPE_AMOUNT", "EXPE_SUBMITTED_BY", "EXPE_SUBMITTED_ON", "EXPE_INVOICE_DD", "EXPE_ACCOUNT") AS 
  select expe.expe_id
       , expe.expe_purpose
       , expe.expe_amount
       , expe.expe_submitted_by
       , expe.expe_submitted_on
       , expe.expe_invoice_dd
       , expe.expe_account
    from expe_expenses expe
   where expe.expe_status = 'paid'
    with read only
;
