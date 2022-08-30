--------------------------------------------------------
--  DDL for Package EXPE_CONSTANTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."EXPE_CONSTANTS" 
as
  -- expense claim status
  gc_expe_status_submitted        constant  varchar2(20 char) := 'submitted';
  gc_expe_status_declined_by_mgr  constant  varchar2(20 char) := 'declined_mgr';
  gc_expe_status_declined_by_vp   constant  varchar2(20 char) := 'declined_vp';
  gc_expe_status_approved_by_mgr  constant  varchar2(20 char) := 'approved_mgr';
  gc_expe_status_approved_by_vp   constant  varchar2(20 char) := 'approved_vp';
  gc_expe_status_paid             constant  varchar2(20 char) := 'paid';
end;

/
