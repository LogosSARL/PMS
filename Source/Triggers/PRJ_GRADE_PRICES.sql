--------------------------------------------------------
--  DDL for Trigger PRJ_GRADE_PRICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_GRADE_PRICES" 
 BEFORE INSERT
 ON PRJ_GRADE_PRICES
 FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
		select prj_grade_prices_seq.nextval into v_seq from dual;
:new.id := v_seq;
    end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_GRADE_PRICES" ENABLE;
