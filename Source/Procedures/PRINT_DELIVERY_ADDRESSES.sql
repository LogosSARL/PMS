--------------------------------------------------------
--  DDL for Procedure PRINT_DELIVERY_ADDRESSES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."PRINT_DELIVERY_ADDRESSES" (p_list in customer_nt)
   is
   begin
     for k in p_list.first()..p_list.last()
     loop
         dbms_output.put_line(p_list(k).get_mailing_address('SHIPPING'));
     end loop;
   end print_delivery_addresses;

/
