--------------------------------------------------------
--  DDL for Package Body UPDATE_COMPANY_CODES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."UPDATE_COMPANY_CODES" 
as
procedure prj (p_from_company in varchar2, p_to_company in varchar2)
as
v_name varchar2(4000 Char);
begin

   select e_name
   into   v_name
   from   prj_companies
   where  code = p_from_company;
--    insert into prj_companies (code, dsp_code, e_name) values (p_to_company, p_to_company, v_name);

   update  LGS_CONTRACTS
   set   company_code = p_to_company
   where   company_code = p_from_company;

   update  PRJ_COMPANY_CONTRACTS
   set   company_code = p_to_company
   where   company_code = p_from_company;



--   insert into deleted_companies (code,to_company, name) values (p_from_company, p_to_company, v_name);
--           delete from prj_companies where code = p_from_company;
   commit;


end prj;
end update_company_codes;

/
