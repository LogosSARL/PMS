--------------------------------------------------------
--  DDL for Function LIST_PROJECT_PAYMENT_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LIST_PROJECT_PAYMENT_STATUS" (p_contract_id in number)  RETURN VARCHAR2 IS

cursor c1 is 	select ID                 
		from	lgs_contracts
		where 	id = p_contract_id
                and USAGE_TYPE = 2
                and created_date is not null
                and NVL(OFFER_STATUS,0) != 1;
c1r c1%rowtype;
cursor c2 is 	select ID,
                       DECODE(PAYMENT_PERCENTAGE, 100, 'paid',null, 'unpaid','unpaid') payment_status
		from	lgs_projects
		where 	CONTRACT_ID = c1.ID;
c2r c2%rowtype;

v_out 	varchar2(4000);
begin

  v_out := '';


    IF p_contract_id IS NOT NULL THEN
    open c1; --fetch c1 into c1r;
	open c2; --fetch c2 into c2r;
	LOOP FETCH c1 INTO C1r;
	     EXIT WHEN c1%NOTFOUND;
	     OPEN c2;
	     LOOP FETCH c2 INTO c2r;
		  EXIT WHEN c2%NOTFOUND;
		  IF c2r.payment_status = 'paid' THEN
		     v_out := c2r.id || ' is ' || 'paid';
		  ELSE
		       v_out := c2r.id || ' is ' || 'unpaid';
		  END IF;
	     END LOOP;
	     CLOSE c2;
	END LOOP;
	CLOSE c1;
     END IF;

RETURN (v_out);
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
END list_project_payment_status;

/
