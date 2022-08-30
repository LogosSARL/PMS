--------------------------------------------------------
--  DDL for Function SIW_SSL_LDAP_AUTH
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."SIW_SSL_LDAP_AUTH" (
  ad_host_p varchar2,
  ad_ssl_port_p number,
  ad_admin_dn_p varchar2,
  ad_admin_passwd_p varchar2,
  ldap_base_p varchar2,
  username_p varchar2,
  password_p varchar2)
  return number
 as

retval pls_integer;
lresult BOOLEAN;
my_session DBMS_LDAP.session;
my_modval DBMS_LDAP.BERVAL_COLLECTION;

my_attrs DBMS_LDAP.STRING_COLLECTION;
ldap_base varchar2(256);
my_dn varchar2(256);
my_message DBMS_LDAP.MESSAGE;
my_entry DBMS_LDAP.MESSAGE;

l_mod_array raw(32);
new_passwd VARCHAR2(60) DEFAULT NULL; 
user_dn VARCHAR2(1024) DEFAULT NULL;

--ad_host VARCHAR2(1024) DEFAULT NULL;
ad_port NUMBER DEFAULT 389;
ad_ssl_port NUMBER DEFAULT 636;

--ad_admin_dn VARCHAR2(1024) DEFAULT NULL;
--ad_admin_passwd VARCHAR2(1024) DEFAULT NULL;

wallet_loc VARCHAR2(1024) DEFAULT NULL;
wallet_passwd VARCHAR2(1024) DEFAULT NULL;
sess number;
BEGIN
DBMS_LDAP.USE_EXCEPTION := TRUE;

user_dn := 'cn=users,dc=ahfad,dc=edu,dc=sd';
new_passwd := 'welcome';

--ad_host := '128.128.5.200';
--ad_ssl_port := 636;

--ad_admin_dn := 'cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd';
--ad_admin_passwd := 'p@ssword4o7C'||chr(38)||'C';

-- reset password
--DBMS_OUTPUT.PUT_LINE (' === reset password ===');
my_session := DBMS_LDAP.init(ad_host_p, ad_ssl_port);
--DBMS_OUTPUT.PUT_LINE( 'ldap_session: ' || RAWTOHEX(SUBSTR(my_session,1,8)));
          retval := DBMS_LDAP.open_ssl(my_session, 'file:c:\adwallet', 'oracle11g', 2);
          DBMS_OUTPUT.PUT_LINE( 'open_ssl: ' || TO_CHAR(retval));     
retval := DBMS_LDAP.simple_bind_s(my_session, username_p, password_p);
--DBMS_OUTPUT.PUT_LINE( 'simple_bind_res: ' || TO_CHAR(retval));

--ldap search

--my_attrs(1):='*';
--ldap_base_p := 'cn=Tareif TK. Khatib,cn=users,dc=ahfad,dc=edu,dc=sd';
--retval:=dbms_ldap.search_s(my_session,ldap_base_p,dbms_ldap.scope_subtree,'objectclass=*',my_attrs,0,my_message);
--dbms_output.put_line('message - ' ||my_message);
--my_entry := dbms_ldap.first_entry(my_session,my_message);
--dbms_output.put_line('my_entry - ' ||my_entry);
--my_dn:=dbms_ldap.get_dn(my_session,my_entry);
--dbms_output.put_line(my_dn);
---end of ldap search
--sess := dbms_ldap.unbind_s(my_session);
return 1;
EXCEPTION
WHEN others THEN

 DBMS_OUTPUT.PUT_LINE('my_session - '||my_session);
     DBMS_OUTPUT.PUT_LINE('Exception when modifying AD password. Error code is ' || to_char(sqlcode));
     DBMS_OUTPUT.put_line(' ' || Sqlerrm);
     sess := dbms_ldap.unbind_s(my_session);
     return 0;
          end;

/
