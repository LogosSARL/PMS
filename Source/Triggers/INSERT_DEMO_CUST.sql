--------------------------------------------------------
--  DDL for Trigger INSERT_DEMO_CUST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."INSERT_DEMO_CUST" 
BEFORE INSERT ON demo_customers
FOR EACH ROW
DECLARE
  cust_id number;
BEGIN
  SELECT demo_cust_seq.nextval
    INTO cust_id
    FROM dual;
  :new.CUSTOMER_ID := cust_id;
END;

/
ALTER TRIGGER "PRJ"."INSERT_DEMO_CUST" ENABLE;
