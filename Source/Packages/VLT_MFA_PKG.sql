--------------------------------------------------------
--  DDL for Package VLT_MFA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."VLT_MFA_PKG" AS
procedure generate_mfa_text(P_SMS_NUMBER    varchar2);
--procedure sendSMS(P_SMS_NUMBER varchar2, l_msg_text varchar2);


END vlt_mfa_pkg;

/
