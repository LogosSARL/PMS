--------------------------------------------------------
--  DDL for Trigger CITIZEN_REPORTS_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."CITIZEN_REPORTS_BIU" before insert or update on citizen_events
for each row
begin
  if inserting then 
    if :new.event_id is null then
      :new.event_id := citizen_events_seq.nextval;
    end if;
  end if;
end;


/
ALTER TRIGGER "PRJ"."CITIZEN_REPORTS_BIU" ENABLE;
