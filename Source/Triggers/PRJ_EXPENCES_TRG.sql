--------------------------------------------------------
--  DDL for Trigger PRJ_EXPENCES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_EXPENCES_TRG" 
 BEFORE INSERT or update or delete
 ON prj_expences
 FOR EACH ROW
DECLARE
 v_seq number;
begin

if inserting then
 if :new.id is null then
  select  prj_expences_seq.nextval
  into  v_seq   from  dual;
  :new.id := v_seq;
     end if;
 :new.rate := project_pck.get_rate(:new.currency, :new.day);
elsif updating then
 if :new.currency <> :old.currency or trunc(:new.day) <> trunc(:old.day) then
 :new.rate := project_pck.get_rate(:new.currency, :new.day);
 end if;




end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_EXPENCES_TRG" ENABLE;
