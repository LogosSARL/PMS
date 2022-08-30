--------------------------------------------------------
--  DDL for Trigger PRJ_PROJECT_TEMPLATE_DETS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_PROJECT_TEMPLATE_DETS_TRG" 
 BEFORE DELETE OR INSERT OR UPDATE OF ID
 ON prj_project_template_dets
 FOR EACH ROW
DECLARE
    v_seq number;
begin
     if inserting then
      if :new.id is null then

      select prj_project_template_dets_seq.nextval
      into    v_seq
      from    dual;

      :new.id := v_seq;

      end if;
 end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_PROJECT_TEMPLATE_DETS_TRG" ENABLE;
