--------------------------------------------------------
--  DDL for Type WHOLESALE_CUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."WHOLESALE_CUSTOMER" under account_customer (
     contact_addresses contacts_list
     , overriding member function get_billing_address return varchar2
     , overriding member function get_shipping_address return varchar2
     , member procedure find_address
         (self in wholesale_customer, cntct_type in varchar2
     , addr out address, fao out varchar2)
   );
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."WHOLESALE_CUSTOMER" 
   as
     overriding member function get_billing_address
         return varchar2
     is
         l_fao varchar2(50);
         l_addr address;
     begin
         find_address('BILLING', l_addr, l_fao);
        return l_addr.formatted_address(self.name, l_fao);
    end get_billing_address;
    overriding member function get_shipping_address
        return varchar2
    is
        l_fao varchar2(50);
        l_addr address;
    begin
        find_address('SHIPPING', l_addr, l_fao);
        return l_addr.formatted_address(self.name, l_fao);
    end get_shipping_address;
    member procedure find_address
        (self in wholesale_customer, cntct_type in varchar2, addr out address, fao out varchar2)
    is
    begin
        if self.contact_addresses.contacts.count() = 0 then
     addr := self.legal_address;
     fao := null;
        else
     contact_addresses.get_contact_by_code(cntct_type, addr, fao);
        end if;
    end find_address;
  end;

/
