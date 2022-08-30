--------------------------------------------------------
--  DDL for Trigger PRJ_DURATION_UOM_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_DURATION_UOM_TRG" 
 BEFORE DELETE OR INSERT OR UPDATE OF ID
 ON prj_duration_uom
 FOR EACH ROW
DECLARE
    v_seq number;
begin
     if inserting then
      if :new.id is null then

      select  prj_duration_uom_seq.nextval
      into    v_seq
      from    dual;

      :new.id := v_seq;

      end if;
 end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_DURATION_UOM_TRG" ENABLE;
