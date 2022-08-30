--------------------------------------------------------
--  DDL for Function LGS_GET_CONTRACT_FIRST_EMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LGS_GET_CONTRACT_FIRST_EMP" (p_contract_id in number) return varchar2
as
cursor c1 is  select  c.id,e.emp_name n
  from prj_user_contracts  c, prj_employee_salary  e
  where   c.contract_id = p_contract_id
  and     c.emp_code = e.emp_code
  and     c.active = 'Y'
  order by c.id;
c1r c1%rowtype;
cursor c2 is select who_created from lgs_contracts where id = p_contract_id;
c2r c2%rowtype;
v_out varchar2(2000 char);
i number :=0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
i := i+1;
if i = 1 then v_out := c1r.n;
else v_out := v_out||' ; '||c1r.n;
end if;

end loop;
close c1;
if v_out is null then open c2; fetch c2 into v_out; close c2; end if; 
return v_out;
end lgs_get_contract_first_emp ;

/
