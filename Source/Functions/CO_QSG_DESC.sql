--------------------------------------------------------
--  DDL for Function CO_QSG_DESC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."CO_QSG_DESC" 
	(Qsg_Id_P  co_req_stage_cd.qsg_id%TYPE)
         RETURN VARCHAR2 IS
-- function that returns the req stage description given its internal id.

Return_V  co_req_stage_cd.qsg_l_desc%type;
Lng_Id_V  lang.id%TYPE := Co_Usp_Lng;



CURSOR Sel_Qsg IS
	SELECT  DECODE(Lng_Id_V, 2, qsg.qsg_a_desc , qsg.qsg_a_desc)
	FROM   co_req_stage_cd qsg
	WHERE  qsg.qsg_id = Qsg_Id_P;
BEGIN
OPEN  Sel_Qsg;
FETCH Sel_Qsg INTO Return_V;
CLOSE Sel_Qsg;

RETURN Return_V;

END Co_Qsg_Desc;

/
