--------------------------------------------------------
--  DDL for Trigger PRJ_ENROLLED_FILES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_ENROLLED_FILES_TRG" 
before insert on prj_enrolled_files
for each row
begin
if :new.id is null then select prj_enrolled_files_seq.nextval into :new.id from dual;
end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_ENROLLED_FILES_TRG" ENABLE;
