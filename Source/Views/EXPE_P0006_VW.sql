--------------------------------------------------------
--  DDL for View EXPE_P0006_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0006_VW" ("EXPE_ID", "EXPE_PURPOSE", "EXPE_AMOUNT", "EXPE_SUBMITTED_BY", "EXPE_SUBMITTED_ON", "EXPE_INVOICE_DD", "EXPE_ACCOUNT", "SBFL_PRCS_ID", "SBFL_ID", "USER_NAME", "SBFL_STEP_KEY") AS 
  select expe.expe_id
     , expe.expe_purpose
     , expe.expe_amount
     , expe.expe_submitted_by
     , expe.expe_submitted_on
     , expe.expe_invoice_dd
     , expe.expe_account
     , inbx.sbfl_prcs_id
     , inbx.sbfl_id
     , aclr.user_name
     , inbx.sbfl_step_key
  from expe_expenses      expe
  join flow_instances_vw  inst on expe.expe_id = to_number(inst.prcs_business_ref default -1 on conversion error)
  join flow_task_inbox_vw inbx on inst.prcs_id = inbx.sbfl_prcs_id
  join apex_appl_acl_user_roles aclr on upper(inbx.sbfl_current_lane) = aclr.role_static_id
 where inst.dgrm_name = 'Expense Claims'
   and inbx.sbfl_current = 'prepare_payment'
  with read only
;
