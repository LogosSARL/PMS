--------------------------------------------------------
--  DDL for Trigger INSERT_DEMO_ORDER_ITEMS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."INSERT_DEMO_ORDER_ITEMS" 
BEFORE
insert on "DEMO_ORDER_ITEMS"
for each row
begin
declare
  order_item_id number;
begin
select demo_order_items_seq.nextval into order_item_id from dual;
:new.ORDER_ITEM_ID := order_item_id;
end;
end;

/
ALTER TRIGGER "PRJ"."INSERT_DEMO_ORDER_ITEMS" ENABLE;
