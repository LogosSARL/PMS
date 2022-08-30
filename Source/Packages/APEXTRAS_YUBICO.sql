--------------------------------------------------------
--  DDL for Package APEXTRAS_YUBICO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."APEXTRAS_YUBICO" is
  -- Author  : Roger Cohen 
  -- Created : 18/03/2009 
  -- Purpose : APEXtras blog code Yuibico example

/*
--SQL to create simple demonstration user table

create table YUBICO_USER
(
  YUBICO_USER_ID NUMBER not null,
  FIRSTNAME      VARCHAR2(50),
  LASTNAME       VARCHAR2(50),
  PASSWORD       VARCHAR2(200),
  SALT           VARCHAR2(200),
  YUBICO_ID      VARCHAR2(12),
  LOGIN_NAME     VARCHAR2(50)
)
*/

  YUBICO_VERIFY_URL     CONSTANT VARCHAR2(200)  := 'http://api.yubico.com/wsapi/verify';
--The following two constants should be copied from 
--your Yubico management site - log in to https://api.yubico.com/yms/
  YUBICO_USER_ID        CONSTANT NUMBER         := 9999;
  YUBICO_API_KEY        CONSTANT VARCHAR2(200)  := 'YourAPIKEY=';

  PROCEDURE YubicoUserInfo(p_yubico_user_id IN OUT YUBICO_USER.YUBICO_USER_ID%TYPE,
                           p_yubico_id      IN OUT YUBICO_USER.YUBICO_ID%TYPE,
                           p_firstname         OUT YUBICO_USER.FIRSTNAME%TYPE,
                           p_lastname          OUT YUBICO_USER.LASTNAME%TYPE,
                           p_login_name        OUT YUBICO_USER.LOGIN_NAME%TYPE,
                           p_hashed_password   OUT YUBICO_USER.PASSWORD%TYPE,
                           p_salt              OUT YUBICO_USER.SALT%TYPE);

  PROCEDURE NewYubicoUser(p_yubico_id      IN YUBICO_USER.YUBICO_ID%TYPE,
                          p_firstname      IN YUBICO_USER.FIRSTNAME%TYPE,
                          p_lastname       IN YUBICO_USER.LASTNAME%TYPE,
                          p_login_name     IN YUBICO_USER.LOGIN_NAME%TYPE,
                          p_password       IN YUBICO_USER.PASSWORD%TYPE);

  FUNCTION YubicoVerify(p_otp               IN VARCHAR2,
                        p_include_signature IN BOOLEAN := TRUE) RETURN VARCHAR2;
  FUNCTION auth (p_username IN VARCHAR2,
                 p_password IN VARCHAR2) RETURN BOOLEAN;

end APEXTRAS_YUBICO;

/
