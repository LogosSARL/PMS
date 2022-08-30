--------------------------------------------------------
--  DDL for Index OPP_CONTACTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRJ"."OPP_CONTACTS_PK" ON "PRJ"."OPP_CONTACTS" ("OCN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
