--------------------------------------------------------
--  DDL for View EXPE_P0002_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0002_VW" ("EXPE_ID", "EXPE_JUSTIFICATION", "EXPE_AMOUNT", "EXPE_STATUS", "EXPE_INVOICE_DD", "EXPE_PURPOSE", "EXPE_COMMENT_MGR", "EXPE_COMMENT_VP") AS 
  select expe.expe_id 
       , expe.expe_justification
       , expe.expe_amount
       , expe.expe_status
       , expe.expe_invoice_dd
       , expe.expe_purpose
       , expe.expe_comment_mgr
       , expe.expe_comment_vp
    from expe_expenses expe
;
