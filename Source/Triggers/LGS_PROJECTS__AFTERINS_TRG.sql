--------------------------------------------------------
--  DDL for Trigger LGS_PROJECTS__AFTERINS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."LGS_PROJECTS__AFTERINS_TRG" 
after INSERT
 ON LGS_PROJECTS
 FOR EACH ROW
DECLARE
Cursor c1 is  select  id, NEW_IMPLEMENTATION , MAINTENANCE, seq
  from PRJ_WORK_TYPES
  order by id;
c1r c1%rowtype;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
/*  if :new.NEW_IMPLEMENTATION = 'Y' then  if c1r.NEW_IMPLEMENTATION = 'Y' then
   insert into PRJ_PROJECTWORK_TYPES (ESTIMATED_DAYS, ENROLLED_DAYS, WRKTYP_ID, PROJ_ID ,QTY, seq ) values
   (0,0,c1r.id, :new.id, 1, c1r.seq);
       end if;
  elsif :new.MAINTENANCE  = 'Y' then   if c1r.MAINTENANCE  = 'Y' then
   insert into PRJ_PROJECTWORK_TYPES (ESTIMATED_DAYS, ENROLLED_DAYS, WRKTYP_ID, PROJ_ID ,QTY, seq ) values
   (0,0,c1r.id, :new.id, 1, c1r.seq);
       end if;
  end if;
*/

insert into PRJ_PROJECTWORK_TYPES (ESTIMATED_DAYS, ENROLLED_DAYS, WRKTYP_ID, PROJ_ID ,QTY, seq ) values
(0,0,c1r.id, :new.id, 1, c1r.seq);

end loop;
close c1;
end LGS_PROJECTS__AFTERINS_trg;

/
ALTER TRIGGER "PRJ"."LGS_PROJECTS__AFTERINS_TRG" ENABLE;
