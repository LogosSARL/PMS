--------------------------------------------------------
--  DDL for Table PRJ_DELETED_ESTIMATED_DETS
--------------------------------------------------------

  CREATE TABLE "PRJ"."PRJ_DELETED_ESTIMATED_DETS" 
   (	"ID" NUMBER(8,0), 
	"PROJECT_WORKTYPE_ID" NUMBER, 
	"NO_OF_DAYS" NUMBER, 
	"SCALE" NUMBER, 
	"ON_SITE_DAYS" NUMBER, 
	"NO_OF_TICKETS" NUMBER, 
	"MODULE" VARCHAR2(5 BYTE), 
	"NOTES" VARCHAR2(2000 CHAR), 
	"EMPLOYEE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
