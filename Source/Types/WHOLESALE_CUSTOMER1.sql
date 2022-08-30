--------------------------------------------------------
--  DDL for Type WHOLESALE_CUSTOMER1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."WHOLESALE_CUSTOMER1" under account_customer under customer (
     contact_addresses contacts_list
     , overriding member function get_billing_address return varchar2
     , overriding member function get_shipping_address return varchar2
     , member procedure find_address
         (self in wholesale_customer, cntct_type in varchar2
     , addr out address, fao out varchar2)
   );

/
