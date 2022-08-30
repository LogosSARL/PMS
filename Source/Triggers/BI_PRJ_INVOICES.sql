--------------------------------------------------------
--  DDL for Trigger BI_PRJ_INVOICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."BI_PRJ_INVOICES" 
  before insert on "PRJ_INVOICES"               
  for each row  
begin   
  if :NEW."INV_ID" is null then 
    select "PRJ_INVOICES_SEQ".nextval into :NEW."INV_ID" from sys.dual; 
  end if; 
end; 


/
ALTER TRIGGER "PRJ"."BI_PRJ_INVOICES" ENABLE;
