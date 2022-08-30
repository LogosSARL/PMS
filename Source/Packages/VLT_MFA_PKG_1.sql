--------------------------------------------------------
--  DDL for Package Body VLT_MFA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."VLT_MFA_PKG" IS


procedure generate_mfa_text (
  P_SMS_NUMBER    varchar2
  ) 
as
  l_msg_text      varchar2(6);
  l_timestamp     timestamp;
  l_select_count  number;
begin
  if P_SMS_NUMBER is null then
		raise_application_error (-20000,
			'Error SMS number is null in vlt_mfa_pkg.generate_mfa_text');
  end if;
  -- note: there is a separate procedure that validates the SMS number
  select 
    to_char(round(dbms_random.value('100000','999999'),0)) , 
    current_timestamp + interval '10' minute  
  into
    l_msg_text,
    l_timestamp
  from dual;

  delete from vlt_sms;
  insert into vlt_sms  (
    msg_text,
    valid_til
    ) values (
    l_msg_text,
    l_timestamp
    );

    vlt_mfa_pkg.sendSMS(
      P_RECIPIENT   => P_SMS_NUMBER,
      P_BODY        => l_msg_text
      );


END vlt_mfa_pkg;


/
