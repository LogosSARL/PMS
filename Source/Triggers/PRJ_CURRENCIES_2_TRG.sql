--------------------------------------------------------
--  DDL for Trigger PRJ_CURRENCIES_2_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_CURRENCIES_2_TRG" 
 after INSERT or update or delete
 ON prj_currencies
 FOR EACH ROW
DECLARE
begin

if inserting then

 insert into prj_currency_rates (id, currency_id, rate, day, who_did, date_changed)
 values ('',:new.id, :new.rate,:new.day, sys_context('userenv', 'os_user'), sysdate);
elsif updating then
  if trunc(:new.day) <> trunc(:old.day) then
      insert into prj_currency_rates (id, currency_id, rate, day, who_did, date_changed)
      values ('',:new.id, :new.rate,:new.day,sys_context('userenv', 'os_user'),sysdate);
  elsif :new.rate <> :old.rate then
     update prj_currency_rates
     set  rate   =  :new.rate,
      who_did   = sys_context('userenv', 'os_user'),
      date_changed = sysdate
     where  currency_id  = :old.id
     and      trunc(day)  = trunc(:old.day);
  end if;



end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_CURRENCIES_2_TRG" ENABLE;
