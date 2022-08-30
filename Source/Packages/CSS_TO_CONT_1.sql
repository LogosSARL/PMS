--------------------------------------------------------
--  DDL for Package Body CSS_TO_CONT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."CSS_TO_CONT" as
procedure insert_company_contracts
as
cursor c1 is select distinct customer_code, customer_name, min(schedule_date) min_day
 from css_project_tasks
 where customer_code not in (select customer_code_css from prj_company_contracts)
 group by customer_code, customer_name;
c1r c1%rowtype;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
  insert into prj_company_contracts (id, company_code, customer_code_css,
                                          customer_name_css, min_day)
  values ('', '', c1r.customer_code, c1r.customer_name, c1r.min_day);
  commit;

end loop;
close c1;
end insert_company_contracts;
end css_to_cont;

/
