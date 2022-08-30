--------------------------------------------------------
--  DDL for Index TIMR_PRCS_SBFL_IX
--------------------------------------------------------

  CREATE INDEX "PRJ"."TIMR_PRCS_SBFL_IX" ON "PRJ"."FLOW_TIMERS" ("TIMR_PRCS_ID", "TIMR_SBFL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
