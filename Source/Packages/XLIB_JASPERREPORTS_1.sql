--------------------------------------------------------
--  DDL for Package Body XLIB_JASPERREPORTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."XLIB_JASPERREPORTS" 
AS
/*=========================================================================
 $Id: xlib_jasperreports.pkb 34 2010-01-15 06:53:21Z dietmar.aust $
=========================================================================*/
   m_module       VARCHAR2 (50)   := 'XLIB_JASPERREPORTS';
   m_report_url   VARCHAR2 (2000) := NULL;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2)
   IS
   BEGIN
      m_report_url := p_report_url;
   END;

   FUNCTION get_report_url
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_report_url;
   END;

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
   )
   IS
      l_proc   VARCHAR2 (100)   := m_module || '.SHOW_REPORT';
      l_url    VARCHAR2 (32767);
   BEGIN
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_outFilename=' || p_out_filename;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;

      IF (p_additional_params IS NOT NULL)
      THEN
         l_url := l_url || '&' || p_additional_params;
      END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------
      xlib_http.display_url_raw (p_url => l_url);
   END;

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
   )
   IS
      l_proc        VARCHAR2 (100)   := m_module || '.GET_REPORT';
      l_url         VARCHAR2 (32767);
   BEGIN
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;

      IF (p_additional_params IS NOT NULL)
      THEN
         l_url := l_url || '&' || p_additional_params;
      END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------
      xlib_http.retrieve_blob_from_url (p_url            => l_url,
                                        o_blob           => p_out_blob,
                                        o_mime_type      => p_out_mime_type
                                       );
   END;
END;

/
