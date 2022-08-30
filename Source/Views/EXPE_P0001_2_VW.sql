--------------------------------------------------------
--  DDL for View EXPE_P0001_2_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0001_2_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_STATUS", "EXPE_SUBMITTED_ON", "EXPE_SUBMITTED_BY", "EXPE_INVOICE_DD", "EXPE_PURPOSE", "PRCS_ID") AS 
  select expe.expe_id
     , expe.expe_justification
     , expe.expe_amount
     , expe.expe_status
     , expe.expe_submitted_on
     , expe.expe_submitted_by
     , expe.expe_invoice_dd
     , expe.expe_purpose
     , inst.prcs_id
  from expe_expenses      expe
  join flow_instances_vw  inst on expe.expe_id = to_number(inst.prcs_business_ref default -1 on conversion error)
 where inst.dgrm_name = 'Expense Claims'
   and expe.expe_status != 'paid'
with read only
;
