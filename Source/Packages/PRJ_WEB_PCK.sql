--------------------------------------------------------
--  DDL for Package PRJ_WEB_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WEB_PCK" 
as
function call_url (p_url in varchar2, p_application in varchar2, p_page_number in number, p_text in varchar2, p_image varchar2, p_target in varchar2) return varchar2;
function get_duration (p_temp_id in number, p_uom in number) return number;

end prj_web_pck;

/
