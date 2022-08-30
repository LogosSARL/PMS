--------------------------------------------------------
--  DDL for Package Body TOTP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."TOTP_PKG" AS

   function generate_string(
       p_length  in number   default 20,
       p_options in varchar2 default 'ULAXPD' -- U - upper,
       L - lower, 
       A - alphanumeric,
       X - alphanumeric with upper case letters,
       P - printable characters only,
       D - numbers
     ) return varchar2
     as

     l_options apex_application_global.vc_arr2;
     l_string varchar2(4000);
     l_length number := coalesce( p_length, 20 );
     l_options_cnt number;
     l_index  number;

     l_char varchar2(2);
     l_new_char varchar2(2);

  begin

   
    l_options := apex_util.string_to_table( coalesce( trim( both ':' from regexp_replace( regexp_replace( upper(p_options), '[^ULAXPD]', '' ), '*', ':') ),'D'), ':' );
    l_options_cnt := l_options.count;

    for x in 1..p_length loop

      l_index := dbms_random.value( 1, l_options_cnt );
      l_char   := l_options( l_index );

      if ( l_char = 'U' ) then
        l_new_char := dbms_random.string( 'U', 1 );
      elsif ( l_char = 'L' ) then
       l_new_char := dbms_random.string( 'L', 1 );
      elsif ( l_char = 'A' ) then
        l_new_char := dbms_random.string( 'A', 1 );
      elsif ( l_char = 'X' ) then
        l_new_char := dbms_random.string( 'X', 1 );
      elsif ( l_char = 'P' ) then
        l_new_char := dbms_random.string( 'P', 1 );
      elsif ( l_char = 'D ' ) then
        l_new_char := trunc( to_char( dbms_random.value(0,9) ) );
      else
        l_new_char := trunc( to_char( dbms_random.value(0,9) ) );
      end if;

      l_string := l_string || l_new_char;

    end loop;

    return l_string;

  end generate_string;


END TOTP_PKG;

/
