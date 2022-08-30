--------------------------------------------------------
--  DDL for Package Body PRJ_WEB_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WEB_PCK" 
as
function call_url (p_url in varchar2, p_application in varchar2, p_page_number in number, p_text in varchar2, p_image varchar2, p_target in varchar2) return varchar2
as
begin
if p_image is null then
return '<a href="'||p_url||'" target="'||p_target||'">'||p_text||'</a>';
else
return '<a href="'||p_url||'" target="'||p_target||'"><img border="0" src="/i/'||p_image||'" width="13" height="13"></a>';
end if;
end call_url;
function get_duration (p_temp_id in number, p_uom in number) return number
is
cursor c1 is  select nvl(t.duration_taken,0)*nvl(d.numofhours,0) dur
  from   prj_DURATION_UOM d, PRJ_PROJECT_TEMPLATE_DETS t
  where t.DURATION_UOM = d.id(+)
  start with t.id = p_temp_id
  connect by prior t.id = t.parent_id;
c1r c1%rowtype;
v_out number :=0;
v_ratio number;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

 v_out := v_out + c1r.dur;

  begin
   select NUMOFHOURS
   into v_ratio
   from prj_DURATION_UOM
   where  id = p_uom;
  exception when others then v_ratio := 1;
  end;



end loop;
close c1;
return v_out/v_ratio;
end get_duration;
end prj_web_pck;

/
