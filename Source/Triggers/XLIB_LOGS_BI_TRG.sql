--------------------------------------------------------
--  DDL for Trigger XLIB_LOGS_BI_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."XLIB_LOGS_BI_TRG" 
   BEFORE INSERT
   ON XLIB_LOGS
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
BEGIN
  IF :NEW.log_id IS NULL
  THEN
     SELECT XLIB_SEQ.NEXTVAL
       INTO :NEW.log_id
       FROM DUAL;
  END IF;
END;

/
ALTER TRIGGER "PRJ"."XLIB_LOGS_BI_TRG" ENABLE;
