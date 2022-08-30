--------------------------------------------------------
--  DDL for Procedure JSON_ARRAY_TRAVERSAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."JSON_ARRAY_TRAVERSAL" ( 
   json_document_in   IN CLOB, 
   leaf_action_in     IN VARCHAR2, 
   level_in           IN INTEGER DEFAULT 0) 
IS
   l_array     json_array_t; 
   l_object    json_object_t; 
   l_keys      json_key_list; 
   l_element   json_element_t; 
BEGIN
   l_array := json_array_t.parse (json_document_in); 
  
   put_line ('Traverse: ' || l_array.stringify (), level_in); 
  
   FOR indx IN 0 .. l_array.get_size - 1 
   LOOP 
      put_line ('Index: ' || indx, level_in); 
  
      CASE
         WHEN l_array.get (indx).is_string 
         THEN
            EXECUTE IMMEDIATE leaf_action_in 
               USING l_array.get_string (indx), level_in; 
         WHEN l_array.get (indx).is_object 
         THEN
            l_object := TREAT (l_array.get (indx) AS json_object_t); 
  
            l_keys := l_object.get_keys; 
  
            FOR k_index IN 1 .. l_keys.COUNT
            LOOP 
               EXECUTE IMMEDIATE leaf_action_in 
                  USING l_keys (k_index), level_in; 
            END LOOP; 
         WHEN l_array.get (indx).is_array 
         THEN
            json_array_traversal ( 
               TREAT (l_array.get (indx) AS json_array_t).stringify (), 
               leaf_action_in, 
               level_in + 1); 
         ELSE
            DBMS_OUTPUT.put_line ( 
               '*** No match for type on array index ' || indx); 
      END CASE; 
   END LOOP; 
END;

/
