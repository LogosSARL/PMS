--------------------------------------------------------
--  DDL for Table VLT_SMS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "PRJ"."VLT_SMS" 
   (	"MSG_TEXT" VARCHAR2(20 BYTE), 
	"VALID_TIL" TIMESTAMP (6)
   ) ON COMMIT PRESERVE ROWS ;
