--------------------------------------------------------
--  DDL for View EXPE_P0004_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0004_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_STATUS", "EXPE_SUBMITTED_ON", "EXPE_SUBMITTED_BY", "EXPE_INVOICE_DD", "EXPE_PURPOSE", "EXPE_VALIDATION_RESULT", "PRCS_ID", "LINK_TEXT", "SBFL_PRCS_ID", "USER_NAME") AS 
  select expe.expe_id
     , expe.expe_justification
     , expe.expe_amount
     , expe.expe_status
     , expe.expe_submitted_on
     , expe.expe_submitted_by
     , expe.expe_invoice_dd
     , expe.expe_purpose
     , expe.expe_validation_result
     , inst.prcs_id
     , inbx.link_text
     , inbx.sbfl_prcs_id
     , aclr.user_name
  from expe_expenses      expe
  join flow_instances_vw  inst on expe.expe_id = to_number(inst.prcs_business_ref default -1 on conversion error)
  join flow_task_inbox_vw inbx on inst.prcs_id = inbx.sbfl_prcs_id
  join apex_appl_acl_user_roles aclr on upper(inbx.sbfl_current_lane) = aclr.role_static_id
 where inst.dgrm_name = 'Expense Claims'
   and inbx.sbfl_current = 'review_expense_mgr'
   and expe.expe_status = 'submitted'
  with read only
;
