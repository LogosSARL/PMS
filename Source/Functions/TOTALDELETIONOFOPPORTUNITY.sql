--------------------------------------------------------
--  DDL for Function TOTALDELETIONOFOPPORTUNITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."TOTALDELETIONOFOPPORTUNITY" 
return BOOLEAN
is
v_1 boolean;
cursor c1 is select * from opportunities;
c1r c1%rowtype;
begin

open c1;
loop 
fetch c1 into c1r;
exit when c1%notfound;
 v_1 := DELETE_OPPORTUNITY(c1r.opp_id);
end loop;

close c1;
return true;

end;

/
