--------------------------------------------------------
--  DDL for Table FLOW_DIAGRAMS
--------------------------------------------------------

  CREATE TABLE "PRJ"."FLOW_DIAGRAMS" 
   (	"DGRM_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"DGRM_NAME" VARCHAR2(150 CHAR), 
	"DGRM_VERSION" VARCHAR2(10 CHAR) DEFAULT '0', 
	"DGRM_STATUS" VARCHAR2(10 CHAR) DEFAULT 'draft', 
	"DGRM_CATEGORY" VARCHAR2(30 CHAR), 
	"DGRM_LAST_UPDATE" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp, 
	"DGRM_CONTENT" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DGRM_CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;