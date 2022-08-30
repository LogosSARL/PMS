--------------------------------------------------------
--  DDL for Function GET_MAX_PRJ_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_MAX_PRJ_STATUS" (v_prj_id in number) return number
as
cursor c1 is 	select  lgs_projects.CONTRACT_ID, lgs_projects.id,  max(PRJ_PROJECT_STATUS_HISTORY.psh_date)
                        from  lgs_contracts, lgs_projects, PRJ_PROJECT_STATUS_HISTORY
                        where lgs_projects.contract_id = lgs_contracts.id
                        and PRJ_PROJECT_STATUS_HISTORY.PSH_PRJ_ID = lgs_projects.ID
                        group by lgs_projects.CONTRACT_ID, lgs_projects.id;
c1r c1%rowtype;

Cursor c2 is 	select  lgs_projects.CONTRACT_ID, lgs_projects.id,   max(PRJ_PROJECT_STATUS_HISTORY.PSH_STS_ID) STATUS
                        from  lgs_contracts, lgs_projects, PRJ_PROJECT_STATUS_HISTORY
                        where lgs_projects.contract_id = lgs_contracts.id
                        and PRJ_PROJECT_STATUS_HISTORY.PSH_PRJ_ID = lgs_projects.ID
                        group by lgs_projects.CONTRACT_ID, lgs_projects.id;
c2r c2%rowtype;

p_out number;

begin

open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

	

	open c2;
	fetch c2 into c2r;
	p_out := c2r.STATUS;
	close c2;


end loop;
close c1;
return p_out;

end;

/
