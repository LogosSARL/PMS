--------------------------------------------------------
--  DDL for Trigger PRJ_WBS_DEPENDENCIES_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_WBS_DEPENDENCIES_BIU" 
    before insert or update 
    on prj_wbs_dependencies
    for each row
declare
   function compress_int (n in integer ) return varchar2
   as
      ret       varchar2(30);
      quotient  integer;
      remainder integer;
      digit     char(1);
   begin
      ret := null; quotient := n;
      while quotient > 0
      loop
          remainder := mod(quotient, 10 + 26);
          quotient := floor(quotient  / (10 + 26));
          if remainder < 26 then
              digit := chr(ascii('A') + remainder);
          else
              digit := chr(ascii('0') + remainder - 26);
          end if;
          ret := digit || ret;
      end loop ;
      if length(ret) < 5 then ret := lpad(ret, 4, 'A'); end if ;
      return upper(ret);
   end compress_int;
begin
    if :new.wbd_id is null then
        :new.wbd_id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.row_key := compress_int(row_key_seq.nextval);
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end prj_wbs_dependencies_biu;

/
ALTER TRIGGER "PRJ"."PRJ_WBS_DEPENDENCIES_BIU" ENABLE;
