--------------------------------------------------------
--  File created - Tuesday-September-06-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure LGS_SEND_MAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."LGS_SEND_MAIL" (
   p_from   varchar2,
   p_to         varchar2 ,
   p_subject  varchar2 ,
   p_message  varchar2
   )
as
begin

declare
c utl_smtp.connection;
v_ipaddress varchar2(200);
v_domain varchar2(200);
v_host varchar2(200);
PROCEDURE send_header(name IN VARCHAR2, header IN VARCHAR2) AS
BEGIN
utl_smtp.write_data(c, name || ': ' || header || utl_tcp.CRLF);
END;
BEGIN
     begin
 select 'mail.smtp2go.com', 'logos.com.lb' into v_ipaddress, v_domain from dual;
 --lgs_mail_servers;
--    select utl_inaddr.GET_HOST_ADDRESS(ipaddress) into v_ipaddress from lgs_mail_servers;
    exception when no_data_found then null;
    end;
--c := utl_smtp.open_connection(v_ipaddress,25);
--C:\Users\Administrator\ORACLE\WALLETS
--C:\oracle\product\11.2.0\dbhome_1\BIN\owm\wallets\Administrator
  c := utl_smtp.open_connection(v_ipaddress, 2525);
	utl_smtp.ehlo(c, v_domain);
	--UTL_SMTP.STARTTLS(c);
	--utl_smtp.ehlo(c, v_domain);

   utl_smtp.command (c, 'AUTH LOGIN');
   utl_smtp.command (c, Co_SM_Base64_Pck.encode
							  (utl_raw.cast_to_raw('dbinfo@logos.com.lb')));
   utl_smtp.command (c, Co_SM_Base64_Pck.encode
							  (utl_raw.cast_to_raw('Logos123')));
--utl_smtp.helo(c, v_domain);
utl_smtp.mail(c, p_from);
utl_smtp.rcpt(c, p_to);
utl_smtp.open_data(c);
send_header('From',   p_from);
send_header('To',     p_to);
send_header('Subject', P_subject);
Utl_Smtp.Write_Data (c, 'MIME-version: 1.0' || Utl_Tcp.CRLF);
Utl_Smtp.Write_Data (c, 'Content-Type: text/plain; charset=windows-1256'||--charset=utf-8' ||
		              Utl_Tcp.CRLF);
Utl_Smtp.Write_Data (c, 'Content-Transfer-Encoding: 8bit' || 
 		              Utl_Tcp.CRLF); 
--utl_smtp.write_data(c,  Utl_Tcp.CRLF || p_message);
Utl_Smtp.write_Raw_Data (c, Utl_Raw.Cast_To_Raw (Utl_Tcp.CRLF || p_message));
utl_smtp.close_data(c);
utl_smtp.quit(c);
EXCEPTION
WHEN utl_smtp.transient_error OR utl_smtp.permanent_error THEN
utl_smtp.quit(c);
raise_application_error(-20000,'Failed to send mail due to the following error: ' || sqlerrm);
END;
end;

/
