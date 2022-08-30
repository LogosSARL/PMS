--------------------------------------------------------
--  DDL for Function GET_TASK_INFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_TASK_INFO" (l_json CLOB)RETURN Task_Info_tab AS
  l_tab  Task_Info_tab := Task_Info_tab();
 

     j apex_json.t_values;
     l_path  VARCHAR2(100);

    BEGIN
      apex_json.parse(l_json);
      dbms_output.put_line(apex_json.get_count(p_path =>'formProperties'));
      FOR i IN 1..apex_json.get_count(p_path   => 'formProperties')
      LOOP
        l_tab.extend;
       -- l_tab(l_tab.last) := Task_Info( nvl(apex_json.get_varchar2( p_path => 'formProperties[%d].id', p0 => i),'test')
                                       --nvl(apex_json.get_varchar2( p_path => 'formProperties[%d].name', p0 => i),'test'),
                                      -- nvl(apex_json.get_varchar2( p_path => 'formProperties[%d].type', p0 => i),'test'),
                                     --  nvl(apex_json.get_varchar2( p_path => 'formProperties[%d].value', p0 => i),'test'),
                                     --  decode(apex_json.get_boolean( p_path => 'formProperties[%d].readable', p0 => i),true,'1','0'),
                                    --   decode(apex_json.get_boolean( p_path => 'formProperties[%d].writable', p0 => i),true,'1','0'),
                                    --   decode(apex_json.get_boolean( p_path => 'formProperties[%d].required', p0 => i),true,'1','0'),
                                     --  nvl(apex_json.get_varchar2( p_path => 'formProperties[%d].datePattern', p0 => i),'test')
                            --         );
                           dbms_output.put_line(apex_json.get_count(p_path =>'enumValues'));
                           -- dbms_output.put_line(apex_json.get_varchar2( p_path => 'formProperties[%d].enumValues[%d].id[0]', p0 => 0));
      END LOOP;

  RETURN l_tab;
END;

/
