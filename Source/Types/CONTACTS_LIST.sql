--------------------------------------------------------
--  DDL for Type CONTACTS_LIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."CONTACTS_LIST" as object (
     contacts contact_nt
     , member function get_contact_by_code
      (cntct_type varchar2) return contact
    , member procedure get_contact_by_code
         (self in contacts_list, cntct_type in varchar2, addr out address, fao out varchar2)
   );
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."CONTACTS_LIST" as
     member function get_contact_by_code
      (cntct_type varchar2) return contact
     is
         return_value contact;
     begin
         if self.contacts.count() > 0 then
      for i in self.contacts.first()..self.contacts.last()
     loop
         if self.contacts(i).cntct_code = upper(trim(cntct_type)) then
      return_value := self.contacts(i);
      exit;
          end if;
     end loop;
        end if;
        return return_value;
    end get_contact_by_code;
    member procedure get_contact_by_code
        (self in contacts_list, cntct_type in varchar2, addr out address, fao out varchar2)
    is
        l_cntct contact;
    begin
        l_cntct := self.get_contact_by_code(cntct_type);
        addr := l_cntct.cntct_address;
        fao := l_cntct.name;
    end get_contact_by_code;
  end ;

/
