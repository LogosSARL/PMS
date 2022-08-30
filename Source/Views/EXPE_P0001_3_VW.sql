--------------------------------------------------------
--  DDL for View EXPE_P0001_3_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0001_3_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_SUBMITTED_ON", "EXPE_SUBMITTED_BY", "EXPE_INVOICE_DD", "EXPE_PURPOSE") AS 
  select expe.expe_id
     , expe.expe_justification
     , expe.expe_amount
     , expe.expe_submitted_on
     , expe.expe_submitted_by
     , expe.expe_invoice_dd
     , expe.expe_purpose
  from expe_expenses expe
 where expe.expe_status = 'paid' 
with read only
;
