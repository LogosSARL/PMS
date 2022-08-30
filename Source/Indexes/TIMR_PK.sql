--------------------------------------------------------
--  DDL for Index TIMR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRJ"."TIMR_PK" ON "PRJ"."FLOW_TIMERS" ("TIMR_ID", "TIMR_RUN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
