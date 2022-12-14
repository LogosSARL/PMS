--------------------------------------------------------
--  DDL for Table PRJ_WBS
--------------------------------------------------------

  CREATE TABLE "PRJ"."PRJ_WBS" 
   (	"ROW_KEY" VARCHAR2(30 BYTE), 
	"WBS_ID" NUMBER, 
	"WBS_PRJ_ID" NUMBER, 
	"WBS_DESC" VARCHAR2(200 BYTE), 
	"WBS_START_DATE" DATE, 
	"WBS_END_DATE" DATE, 
	"WBS_DURATION" NUMBER, 
	"WBS_COMMENTS" VARCHAR2(1000 BYTE), 
	"WBS_STATUS" NUMBER, 
	"WBS_COMPLETION_PERCENTAGE" NUMBER, 
	"WBS_SCOPE_OF_WORK" VARCHAR2(1000 BYTE), 
	"WBS_LESSONS_LEARNED" VARCHAR2(4000 BYTE), 
	"WBS_RISK" VARCHAR2(4000 BYTE), 
	"WBS_CONCERNS" VARCHAR2(4000 BYTE), 
	"WBS_ASSUMPTIONS" VARCHAR2(4000 BYTE), 
	"WBS_ACCEPTANCE_CRITERIA" VARCHAR2(4000 BYTE), 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(255 BYTE), 
	"WBS_WORK_TYPE_GROUP" NUMBER, 
	"WBS_SCALE" NUMBER, 
	"WBS_ONSITE_DAYS" NUMBER, 
	"WBS_EST_TYPE" NUMBER, 
	"WBS_NUMBER_OF_DAYS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
