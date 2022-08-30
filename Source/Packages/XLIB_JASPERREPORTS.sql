--------------------------------------------------------
--  DDL for Package XLIB_JASPERREPORTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."XLIB_JASPERREPORTS" 
AS
/*=========================================================================
  $Id: xlib_jasperreports.pks 39 2011-05-06 10:57:41Z dietmar.aust $

  Purpose  :

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2011-05-06 12:57:41 +0200 (Fr, 06 Mai 2011) $
  $LastChangedBy: dietmar.aust $

  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  06.05.2011  D. Aust         added constants for xlsx and docx

=========================================================================*/

   -- constants
   c_rep_format_pdf    CONSTANT VARCHAR2 (20) := 'pdf';
   c_rep_format_rtf    CONSTANT VARCHAR2 (20) := 'rtf';
   c_rep_format_xls    CONSTANT VARCHAR2 (20) := 'xls';
   c_rep_format_html   CONSTANT VARCHAR2 (20) := 'html';
   c_rep_format_csv    CONSTANT VARCHAR2 (20) := 'csv';
   c_rep_format_docx    CONSTANT VARCHAR2 (20) := 'docx';
   c_rep_format_pptx    CONSTANT VARCHAR2 (20) := 'pptx';
   c_rep_format_xlsx    CONSTANT VARCHAR2 (20) := 'xlsx';

   -- exceptions
   report_url_not_defined       EXCEPTION;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2);

   FUNCTION get_report_url
      RETURN VARCHAR2;

----------------------------------------------------------------------------
-- make a callout with utl_http to the j2ee container running the
-- JasperReportsIntegration webapp
-- => return the results
----------------------------------------------------------------------------
   PROCEDURE show_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          IN   VARCHAR2 DEFAULT 'pdf',
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_out_filename        IN   VARCHAR2 DEFAULT NULL,
      p_rep_locale          IN   VARCHAR2 DEFAULT 'de_DE',
      p_rep_encoding        IN   VARCHAR2 DEFAULT 'UTF-8',
      p_additional_params   IN   VARCHAR2 DEFAULT NULL
   );

----------------------------------------------------------------------------
-- run the report and return the result as a blob
----------------------------------------------------------------------------
   PROCEDURE get_report (
      p_rep_name            IN       VARCHAR2 DEFAULT 'test',
      p_rep_format          IN       VARCHAR2 DEFAULT 'pdf',
      p_data_source         IN       VARCHAR2 DEFAULT 'default',
      p_rep_locale          IN       VARCHAR2 DEFAULT 'de_DE',
      p_rep_encoding        IN       VARCHAR2 DEFAULT 'UTF-8',
      p_additional_params   IN       VARCHAR2 DEFAULT NULL,
      p_out_blob            IN OUT   BLOB,
      p_out_mime_type       IN OUT   VARCHAR2
   );
END;

/
