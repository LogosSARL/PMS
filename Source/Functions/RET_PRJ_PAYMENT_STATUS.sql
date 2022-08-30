--------------------------------------------------------
--  DDL for Function RET_PRJ_PAYMENT_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."RET_PRJ_PAYMENT_STATUS" 
	(p_contract_id lgs_contracts.id%TYPE) 
	 RETURN VARCHAR2 IS
output_v      VARCHAR2(4000):='paid';
CURSOR c1 IS
	SELECT cont.ID contract_id, cont.DSP_CODE displaycode
	FROM	lgs_contracts cont
	WHERE	cont.id = p_contract_id
           and cont.USAGE_TYPE = 2
           and cont.created_date is not null
           and NVL(cont.OFFER_STATUS,0) != 1;
c1r c1%ROWTYPE;

CURSOR c2	IS
select prj.ID project_id,prj.PAYMENT_PERCENTAGE proj_payment,DECODE(PAYMENT_PERCENTAGE, 100, 'paid',null, 'unpaid','unpaid') payment_status
		from	lgs_projects  prj
        where prj.contract_id = c1r.contract_id;
c2r c2%ROWTYPE;


BEGIN
--
IF p_contract_id IS NOT NULL THEN
	OPEN c1;
	LOOP FETCH c1 INTO c1r;
	     EXIT WHEN c1%NOTFOUND;
	     output_v := NULL;
	     OPEN c2;
	     LOOP FETCH c2 INTO c2r;
		  EXIT WHEN c2%NOTFOUND;
		   if nvl(c2r.proj_payment,0) <> 100 then 
             output_v := 'unpaid';
            end if;
	     END LOOP;
	     CLOSE c2;

	END LOOP;
	CLOSE c1;
END IF;

RETURN (output_v);
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
END ret_prj_payment_status;

/
