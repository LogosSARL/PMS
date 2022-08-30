--------------------------------------------------------
--  DDL for Function FETCH_MODULES_NAME_PERCONTRACT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."FETCH_MODULES_NAME_PERCONTRACT" 
(cnt_id in NVARCHAR2)
return VARCHAR2
is
cursor C1 is

select e_name from prj_modules, prj_pipeline_modules

where ppm_cnt_id = cnt_id

and PPM_module = code;

 

output_v varchar2(2000);

 

begin

 

for C1R in C1 loop

output_v := output_v || '/' || C1R.e_name;

 

end loop;

return output_v;
end;

/
