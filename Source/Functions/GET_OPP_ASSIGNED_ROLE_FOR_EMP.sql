--------------------------------------------------------
--  DDL for Function GET_OPP_ASSIGNED_ROLE_FOR_EMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_OPP_ASSIGNED_ROLE_FOR_EMP" 
(opp_id_p in NUMBER,
emp_code_p in NVARCHAR2)
return number
is
ORL_V number;
 begin
 if emp_code_p = 'WADIH' then
 return 1;
 end if;
  if emp_code_p = 'NAJD' then
 return 1;
 end if;
begin
select nvl(ORL_ROL_ID,0) INTO ORL_V from opp_role where orl_opp_id = opp_id_p and  orl_employee = emp_code_p;
exception
when others then
null;
end;

if nvl(ORL_V,0) < 1 then

select count(*) INTO ORL_V
        from prj_group_employees g1, prj_employee_salary
        where 
        g1.pge_pgr_id in (select g2.pge_pgr_id from prj_group_employees g2, Opportunities o, opp_role r 
        where o.opp_id = opp_id_p and r.orl_opp_id = o.opp_id and g2.pge_employee = r.orl_employee and r.orl_rol_id = 1
        )
        and upper(g1.pge_employee) = upper(emp_code_p) and UPPER(emp_title) = 'PROJECT MANAGER'
        AND g1.pge_employee = emp_code;

if nvl(ORL_V,0) < 1 then
 if upper(emp_code_p) in( 'ELIE','RITAM') THEN
  select count(*) INTO ORL_V
        from opportunities
        where opp_id = opp_id_p
        and UPPER(opp_customer) in ('874','12700');
 end if;
end if;
end if;


RETURN ORL_V;
end;

/
