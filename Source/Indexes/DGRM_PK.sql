--------------------------------------------------------
--  DDL for Index DGRM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRJ"."DGRM_PK" ON "PRJ"."FLOW_DIAGRAMS" ("DGRM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
