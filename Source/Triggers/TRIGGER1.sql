--------------------------------------------------------
--  DDL for Trigger TRIGGER1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."TRIGGER1" 
BEFORE UPDATE  ON LGS_CONTRACTS 
FOR EACH ROW
  WHEN (NEW.FINALIZED = 'Y') BEGIN
  
   :NEW.STATUS := 5;
  
  END;

/
ALTER TRIGGER "PRJ"."TRIGGER1" ENABLE;
