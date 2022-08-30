--------------------------------------------------------
--  DDL for Trigger CSS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."CSS_TRG" 
 BEFORE INSERT
 ON css
 FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
		select css_seq.nextval into v_seq from dual;
:new.id := v_seq;
    end if;
end;

/
ALTER TRIGGER "PRJ"."CSS_TRG" ENABLE;
