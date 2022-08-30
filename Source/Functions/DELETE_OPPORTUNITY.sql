--------------------------------------------------------
--  DDL for Function DELETE_OPPORTUNITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."DELETE_OPPORTUNITY" 
(p_opp_id in NUMBER)
return BOOLEAN is 

    cursor c1 is select * from opp_actions where oac_opp_id = p_opp_id;
   c1r c1%rowtype;
begin

fetch c1 into c1r;
 delete from opp_scope where ops_opp_id = p_opp_id;
 delete from opp_role where orl_opp_id = p_opp_id;
 
 delete from opp_actions_docs where oad_oac_id= c1r.oac_id and c1r.oac_opp_id = p_opp_id;
 delete from opp_action_stakeholders where oas_oac_id= c1r.oac_id and c1r.oac_opp_id = p_opp_id;
 
  delete from opp_actions where oac_opp_id = p_opp_id;
   delete from opportunities where opp_id = p_opp_id;
   close c1;
   return true;
end;

/
