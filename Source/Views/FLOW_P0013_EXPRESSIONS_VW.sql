--------------------------------------------------------
--  DDL for View FLOW_P0013_EXPRESSIONS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0013_EXPRESSIONS_VW" ("OBJT_BPMN_ID", "EXPR_SET", "EXPR_VAR_NAME", "EXPR_VAR_TYPE", "EXPR_TYPE", "EXPR_EXPRESSION", "OBJT_DGRM_ID", "PRETAG", "POSTTAG") AS 
  select objt.objt_bpmn_id
       , expr.expr_set
       , expr.expr_var_name
       , expr.expr_var_type
       , expr.expr_type
       , expr.expr_expression
       , objt.objt_dgrm_id
       , case when instr(expr.expr_type, 'sql') > 0 then '<pre><code class="language-' || case when instr(expr.expr_type, 'plsql') > 0 then 'plsql' else 'sql' end ||'">' end as pretag
       , case when instr(expr.expr_type, 'sql') > 0 then '</code></pre>' end as posttag
    from flow_object_expressions expr
    join flow_objects objt
      on expr.expr_objt_id = objt.objt_id
with read only
;
