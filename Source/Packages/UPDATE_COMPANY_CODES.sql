--------------------------------------------------------
--  DDL for Package UPDATE_COMPANY_CODES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."UPDATE_COMPANY_CODES" 
as
procedure prj (p_from_company in varchar2, p_to_company in varchar2);
end update_company_codes;

/
