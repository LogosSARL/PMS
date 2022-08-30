--------------------------------------------------------
--  DDL for Table PRJ_PIPELINE_MODULES
--------------------------------------------------------

  CREATE TABLE "PRJ"."PRJ_PIPELINE_MODULES" 
   (	"PPM_ID" NUMBER, 
	"PPM_CNT_ID" NUMBER, 
	"PPM_MODULE" VARCHAR2(50 BYTE), 
	"PPM_START_DATE" DATE, 
	"PPM_END_DATE" DATE, 
	"PPM_INT_CODE" VARCHAR2(100 BYTE), 
	"PPM_NEW_IMPLEMENTATION" VARCHAR2(1 BYTE), 
	"PPM_MAINTENANCE" VARCHAR2(1 BYTE), 
	"PPM_PRICING_DATE" DATE, 
	"PPM_HIGH_LEVEL_ESTIMATE" NUMBER, 
	"PPM_RFP_REF" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;