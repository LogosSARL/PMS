--------------------------------------------------------
--  DDL for Type RETAIL_CUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."RETAIL_CUSTOMER" under account_customer(
    overriding member function get_billing_address return varchar2
     , overriding member function get_shipping_address return varchar2
   );
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."RETAIL_CUSTOMER" as
     overriding member function get_billing_address return varchar2
     is
     begin
         return self.get_mailing_address();
     end get_billing_address;
     overriding member function get_shipping_address return varchar2
     is
     begin
        return self.get_mailing_address();
    end get_shipping_address;
  end;

/
