--------------------------------------------------------
--  DDL for Trigger INSERT_DEMO_PROD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."INSERT_DEMO_PROD" 
BEFORE INSERT ON demo_product_info
FOR EACH ROW
DECLARE
  prod_id number;
BEGIN
  SELECT demo_prod_seq.nextval
    INTO prod_id
    FROM dual;
  :new.PRODUCT_ID := prod_id;
END;

/
ALTER TRIGGER "PRJ"."INSERT_DEMO_PROD" ENABLE;
