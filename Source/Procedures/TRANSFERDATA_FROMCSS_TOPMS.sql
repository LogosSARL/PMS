--------------------------------------------------------
--  DDL for Procedure TRANSFERDATA_FROMCSS_TOPMS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."TRANSFERDATA_FROMCSS_TOPMS" 
is
cursor c1 is select * from lgs_contracts where created_date is not null and usage_type = 2;
c1r c1%rowtype;
count1 number;

begin

select count(*)  into count1 from lgs_contracts;
css_pck.refresh_data();
OPEN c1; 
 FOR counter IN 1 .. count1
 LOOP  
   FETCH c1 into c1r; 
      EXIT WHEN c1%notfound; 
   transfer_data.create_enrolled_data_contract (c1r.id);
  END LOOP; 
   CLOSE c1;
end;

/
