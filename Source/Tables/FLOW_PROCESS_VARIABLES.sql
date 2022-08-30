--------------------------------------------------------
--  DDL for Table FLOW_PROCESS_VARIABLES
--------------------------------------------------------

  CREATE TABLE "PRJ"."FLOW_PROCESS_VARIABLES" 
   (	"PROV_PRCS_ID" NUMBER, 
	"PROV_VAR_NAME" VARCHAR2(50 CHAR), 
	"PROV_VAR_TYPE" VARCHAR2(50 CHAR), 
	"PROV_VAR_VC2" VARCHAR2(200 CHAR), 
	"PROV_VAR_NUM" NUMBER, 
	"PROV_VAR_DATE" DATE, 
	"PROV_VAR_CLOB" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PROV_VAR_CLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
