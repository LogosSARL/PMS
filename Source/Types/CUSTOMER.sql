--------------------------------------------------------
--  DDL for Type CUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."CUSTOMER" as object (
     id number
    , name varchar2(50)
     , legal_address address
     ,  final member function get_mailing_address return varchar2
     ,  member function get_mailing_address
           (addr_code in varchar2) return varchar2
   ) not final;
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."CUSTOMER" as
     final member function get_mailing_address
         return varchar2
     is
     begin
         return self.legal_address.formatted_address(self.name);
     end get_mailing_address;
     member function get_mailing_address
         (addr_code in varchar2) return varchar2
    is
    begin
        return self.get_mailing_address();
   end get_mailing_address;
  end;

/
