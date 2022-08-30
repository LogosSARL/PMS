--------------------------------------------------------
--  DDL for Package Body SHOW_HIDE_MEMORY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."SHOW_HIDE_MEMORY" AS
  PROCEDURE show_hide_collection AS
  l_arr apex_application_global.vc_arr2;
  l_found boolean := FALSE;
  l_collection_name VARCHAR2(255) := 'SHOW_HIDE_COLLECTION';
  BEGIN
    IF(wwv_flow_collection.collection_exists(p_collection_name => l_collection_name) = FALSE) THEN
      htmldb_collection.create_or_truncate_collection(p_collection_name => l_collection_name);
    END IF;
    l_arr := apex_util.string_to_table(p_string => v('TEMPORARY_ITEM'),   p_separator => ']');
    -- If the array member count of l_arr < 3, then the following code will raise an exception
    FOR c1 IN
      (SELECT seq_id
       FROM apex_collections
       WHERE collection_name = l_collection_name
       AND c001 = l_arr(1)
       AND c002 = l_arr(2)
       AND c003 = l_arr(3))
    LOOP
      -- It exists, so delete it
      apex_collection.delete_member(p_collection_name => l_collection_name,   p_seq => c1.seq_id);
      l_found := TRUE;
    END LOOP;
    IF l_found = FALSE THEN
      apex_collection.add_member(p_collection_name => l_collection_name,   p_c001 => l_arr(1),   p_c002 => l_arr(2),   p_c003 => l_arr(3));
    END IF;
    COMMIT;
  END show_hide_collection;
  PROCEDURE show_hide_collection_output AS
  BEGIN
    htp.prn('<script type="text/javascript">' || CHR(10));
    htp.prn('<!--' || CHR(10));
    htp.prn('window.onload=function(){' || CHR(10));
    FOR c1 IN
      (SELECT c003
       FROM apex_collections
       WHERE collection_name = 'SHOW_HIDE_COLLECTION'
       AND c001 = wwv_flow.g_flow_id
       AND c002 = wwv_flow.g_flow_step_id)
    LOOP
      htp.prn('htmldb_ToggleWithImage(''' || c1.c003 || 'img'',''' || c1.c003 || 'body'');' || CHR(10));
    END LOOP;
    htp.prn('}' || CHR(10));
    htp.prn('//-->' || CHR(10));
    htp.prn('</script>' || CHR(10));
  END show_hide_collection_output;
END;

/
