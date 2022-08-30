--------------------------------------------------------
--  DDL for Table PROJECT_EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "PRJ"."PROJECT_EMPLOYEE" 
   (	"ID" NUMBER, 
	"EMPLOYEE_CODE" VARCHAR2(20 BYTE), 
	"PROJECT_ID" NUMBER, 
	"MODULE_ID" VARCHAR2(5 BYTE), 
	"CONTRACT_ID" NUMBER, 
	"VIEW_ALL" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
