--------------------------------------------------------
--  DDL for Package TOTP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."TOTP_PKG" AS 


  function get_random_base32_json -- orginal, base32code
  return varchar2;
  
  procedure get_random_base32
  (
    p_orig in out nocopy varchar2
  , p_base in out nocopy varchar2
  );
  
  function totp_code( 
    p_key       in varchar2 -- original code
  , p_unix_time in pls_integer default null 
  , p_interval  in pls_integer default 30  
  ) return varchar2;

  
  
  
 
  function get_greenwich_time return date;

  
  function date_to_unix_time( p_date in date ) return pls_integer;

 
  function encode_base32( p_str in varchar2 ) return varchar2;

  
  function unix_to_hash_message( p_time in pls_integer ) return varchar2;
  
  
  function code_from_hash( p_hash in varchar2 ) return varchar2;
  
  
  function hmac_sha1_hash(
    p_message in varchar2
  , p_key     in varchar2
  ) return varchar2;

  
END TOTP_PKG;

/
