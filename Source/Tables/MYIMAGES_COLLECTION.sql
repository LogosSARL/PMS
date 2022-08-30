--------------------------------------------------------
--  DDL for Table MYIMAGES_COLLECTION
--------------------------------------------------------

  CREATE TABLE "PRJ"."MYIMAGES_COLLECTION" 
   (	"MYIMG_COL_ID" NUMBER, 
	"COLLECTION_NAME" VARCHAR2(400 BYTE), 
	"PICNAME" VARCHAR2(350 BYTE), 
	"MIME_TYPE" VARCHAR2(255 BYTE), 
	"PIC_SIZE" NUMBER, 
	"CONTENT" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
