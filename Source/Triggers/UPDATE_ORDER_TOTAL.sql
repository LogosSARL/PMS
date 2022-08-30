--------------------------------------------------------
--  DDL for Trigger UPDATE_ORDER_TOTAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."UPDATE_ORDER_TOTAL" 
after insert or update or delete on demo_order_items 
begin

-- Update the Order Total when any order item is changed

update demo_orders set order_total = 
  (select sum(unit_price*quantity) from demo_order_items 
    where demo_order_items.order_id = demo_orders.order_id);
end;

/
ALTER TRIGGER "PRJ"."UPDATE_ORDER_TOTAL" ENABLE;
