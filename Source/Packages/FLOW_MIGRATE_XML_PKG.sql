--------------------------------------------------------
--  DDL for Package FLOW_MIGRATE_XML_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."FLOW_MIGRATE_XML_PKG" 
as 
  procedure migrate_xml( 
    p_dgrm_content in out clob 
  , p_has_changed out boolean 
  ); 
end flow_migrate_xml_pkg; 

/
