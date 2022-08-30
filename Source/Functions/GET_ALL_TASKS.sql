--------------------------------------------------------
--  DDL for Function GET_ALL_TASKS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_ALL_TASKS" (l_json CLOB) RETURN t_tf_tab AS
  l_tab  t_tf_tab := t_tf_tab();
  

     j apex_json.t_values;
     l_path  VARCHAR2(100);

    BEGIN
      apex_json.parse(l_json);
      FOR i IN 1..apex_json.get_count(p_path   => 'data')
      LOOP
        l_tab.extend;
        l_tab(l_tab.last) := t_tf_row( nvl(apex_json.get_varchar2( p_path => 'data[%d].id', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].url', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].owner', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].assignee', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].delegationState', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].name', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].description', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].createTime', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].dueDate', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].priority', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].suspended', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].taskDefinitionKey', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].tenantId', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].category', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].formKey', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].parentTaskId', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].parentTaskUrl', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].executionId', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].executionUrl', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].processInstanceId', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].processInstanceUrl', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].processDefinitionId', p0 => i),'test'),
                                       nvl(apex_json.get_varchar2( p_path => 'data[%d].processDefinitionUrl', p0 => i),'test')
                                     );
      END LOOP;

  RETURN l_tab;
END;

/
