--------------------------------------------------------
--  DDL for Type ADDRESS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."ADDRESS" as object (
       line_1 varchar2(100)
       ,  line_2 varchar2(100)
       ,  post_town varchar2(50)
       ,  post_code varchar2(10)
       ,  member function formatted_address return varchar2
       ,  member function formatted_address
              ( name in varchar2, fao in varchar := null)
              return varchar2
  );
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "PRJ"."ADDRESS" as
      member function formatted_address
           return varchar2
       is
           return_value varchar2(4000);
       begin
           return_value := self.line_1;
           if self.line_2 is not null then
               return_value := return_value
                  ||chr(10)|| self.line_2;
          end if;
          if self.post_town is not null then
              return_value := return_value
                  ||chr(10)|| self.post_town;
          end if;
          if self.post_code is not null then
              return_value := return_value
                  ||chr(10)|| self.post_code;
          end if;
          return return_value;
      end formatted_address;
      member function formatted_address
         ( name in varchar2, fao in varchar := null)
          return varchar2
      is
          return_value varchar2(4000);
      begin
          return_value := name||chr(10);
          if fao is not null then
              return_value := return_value
                  || 'FAO: '||fao||chr(10);
          end if;
          return_value := return_value||self.formatted_address();
          return return_value;
      end formatted_address;
  end;

/
