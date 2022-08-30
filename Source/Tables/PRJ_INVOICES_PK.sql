--------------------------------------------------------
--  DDL for Index PRJ_INVOICES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRJ"."PRJ_INVOICES_PK" ON "PRJ"."PRJ_INVOICES" ("INV_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
