--------------------------------------------------------
--  DDL for View EXPE_P0007_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0007_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_STATUS", "EXPE_SUBMITTED_BY", "EXPE_SUBMITTED_ON", "LINK_TEXT", "SBFL_PRCS_ID", "USER_NAME", "EXPE_INVOICE_DD", "EXPE_PURPOSE") AS 
  select expe.expe_id
     , expe.expe_justification
     , expe.expe_amount
     , expe.expe_status
     , expe.expe_submitted_by
     , expe.expe_submitted_on
     , inbx.link_text
     , inbx.sbfl_prcs_id
     , aclr.user_name
     , expe.expe_invoice_dd
     , expe.expe_purpose
  from expe_expenses      expe
  join flow_instances_vw  inst on expe.expe_id = to_number(inst.prcs_business_ref default -1 on conversion error)
  join flow_task_inbox_vw inbx on inst.prcs_id = inbx.sbfl_prcs_id
  join apex_appl_acl_user_roles aclr on upper(inbx.sbfl_current_lane) = aclr.role_static_id
 where inst.dgrm_name = 'Expense Claims'
   and inbx.sbfl_current = 'review_expense_vp'
   and expe.expe_status = 'approved_mgr'
  with read only
;
