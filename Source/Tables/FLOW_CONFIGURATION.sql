--------------------------------------------------------
--  DDL for Table FLOW_CONFIGURATION
--------------------------------------------------------

  CREATE TABLE "PRJ"."FLOW_CONFIGURATION" 
   (	"CFIG_KEY" VARCHAR2(50 CHAR), 
	"CFIG_VALUE" VARCHAR2(2000 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
