--------------------------------------------------------
--  DDL for Trigger UPDATEPROJECTSTATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."UPDATEPROJECTSTATUS" 
AFTER INSERT OR UPDATE ON PRJ_PROJECT_STATUS_HISTORY 
REFERENCING NEW AS NEW OLD AS OLD

FOR EACH ROW
BEGIN
  if (:NEW.PSH_STS_ID = 5) then
   update lgs_projects
   set status = 5
   where id = :NEW.PSH_PRJ_ID;
  end if;
END;

/
ALTER TRIGGER "PRJ"."UPDATEPROJECTSTATUS" ENABLE;
