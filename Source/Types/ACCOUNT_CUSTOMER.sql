--------------------------------------------------------
--  DDL for Type ACCOUNT_CUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."ACCOUNT_CUSTOMER" under customer (
     acct_no varchar2(20)
     , credit_limit number
     ,  member function get_billing_address return varchar2
     ,  member function get_shipping_address return varchar2
     ,  overriding member function get_mailing_address
         (addr_code in varchar2) return varchar2
   ) not final not instantiable;
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."ACCOUNT_CUSTOMER" as
     member function get_billing_address return varchar2
     is
     begin
         return null;
     end get_billing_address;
     member function get_shipping_address return varchar2
     is
     begin
        return null;
    end get_shipping_address;
    overriding member function get_mailing_address
        (addr_code in varchar2) return varchar2
    is
    begin
        case addr_code
     when 'SHIPPING' then
         return self.get_shipping_address();
     when 'BILLING' then
         return self.get_billing_address();
     else
         return self.get_mailing_address();
       end case;
    end get_mailing_address;
  end;

/
