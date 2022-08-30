--------------------------------------------------------
--  DDL for Function LGS_GET_BUS_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LGS_GET_BUS_TYPE" (p_customer_code in varchar2) return varchar2
as
cursor c1 is 	select bus_type bt
				from   companies
				where  dsp_code = p_customer_code;
c1r c1%rowtype;
Cursor c2 is 	select t.e_name bus_type
				from   lgs_bus_types t
				where  code = c1r.bt;
c2r c2%rowtype;
p_out varchar2(4000 char);
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

	p_out := 'N.A.';
	open c2;
	fetch c2 into c2r;
	p_out := c2r.bus_type;
	close c2;


end loop;
close c1;
return nvl(p_out,'N.A.');

end;

/
