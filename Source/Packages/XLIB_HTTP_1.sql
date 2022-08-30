--------------------------------------------------------
--  DDL for Package Body XLIB_HTTP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."XLIB_HTTP" 
AS
/*=========================================================================
   FILE  :  $Id: xlib_http.pkb 21 2010-01-07 07:41:27Z dietmar.aust $
=========================================================================*/

   m_module   VARCHAR2 (50) := 'XLIB_HTTP';

   TYPE vc_arr_t IS TABLE OF VARCHAR2 (32767)
      INDEX BY BINARY_INTEGER;

   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL
   )
   IS
      l_http_request       UTL_HTTP.req;
      l_http_response      UTL_HTTP.resp;
      l_blob               BLOB;
      l_raw                RAW (32767);
      l_buffer_size        NUMBER          := 32767;
      --
      l_proc               VARCHAR2 (100)  := m_module || '.DISPLAY_URL_RAW';
      --
      l_mime_type          VARCHAR2 (100);
      l_header_name        VARCHAR2 (256);
      l_header_value       VARCHAR2 (1024);
      --
      l_header_name_arr    vc_arr_t;
      l_header_value_arr   vc_arr_t;
   BEGIN
      xlog (l_proc, 'show url: ' || p_url);

      -- Initialize the BLOB.
      DBMS_LOB.createtemporary (l_blob, FALSE);
      l_http_request := UTL_HTTP.begin_request (p_url);
      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );
         -- store header value in arr
         l_header_name_arr (i) := l_header_name;
         l_header_value_arr (i) := l_header_value;

         IF LOWER (l_header_name) = 'content-type'
         THEN
            l_mime_type := l_header_value;
         END IF;
      END LOOP;

      -- override mime type
      IF p_mime_type_override IS NOT NULL
      THEN
         l_mime_type := p_mime_type_override;
      END IF;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, l_buffer_size);
            DBMS_LOB.writeappend (l_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;

      OWA_UTIL.mime_header (ccontent_type      => l_mime_type,
                            bclose_header      => FALSE,
                            ccharset           => p_charset
                           );

      FOR i IN 1 .. l_header_name_arr.COUNT
      LOOP
         xlog (l_proc,
                  'set header: '
               || l_header_name_arr (i)
               || ': '
               || l_header_value_arr (i)
              );

         IF UPPER (l_header_name_arr (i)) IN
                              ('CONTENT-LENGTH', 'CONTENT-TYPE', 'MIME-TYPE')
         THEN
            xlog (l_proc, 'skip header ' || l_header_name_arr (i));
         ELSE
            HTP.p (l_header_name_arr (i) || ': ' || l_header_value_arr (i));
         END IF;
      END LOOP;

      -- set content length
      HTP.p ('Content-length: ' || DBMS_LOB.getlength (l_blob));
      OWA_UTIL.http_header_close;
      WPG_DOCLOAD.download_file (l_blob);
      -- Relase the resources associated with the temporary LOB.
      DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN UTL_HTTP.end_of_body
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (l_blob);
         RAISE;
      WHEN OTHERS
      THEN
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   PROCEDURE retrieve_blob_from_url (
      p_url               VARCHAR2,
      o_blob        OUT   BLOB,
      o_mime_type   OUT   VARCHAR2
   )
   IS
      l_http_request    UTL_HTTP.req;
      l_http_response   UTL_HTTP.resp;
      l_raw             RAW (32767);
      --
      l_proc            VARCHAR2 (100)
                                     := m_module || '.RETRIEVE_BLOB_FROM_URL';
      --
      l_header_name     VARCHAR2 (256);
      l_header_value    VARCHAR2 (1024);
   BEGIN
      -- Initialize the BLOB.
      DBMS_LOB.createtemporary (o_blob, FALSE);
      l_http_request := UTL_HTTP.begin_request (p_url);
      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );

         IF LOWER (l_header_name) = 'content-type'
         THEN
            o_mime_type := l_header_value;
         END IF;
      END LOOP;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, 32767);
            DBMS_LOB.writeappend (o_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;
   -- Relase the resources associated with the temporary LOB.
   --DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN OTHERS
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (o_blob);
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   FUNCTION escape_form_data (s VARCHAR2)
      RETURN VARCHAR2
   IS
      l_s   VARCHAR2 (500 CHAR);

      FUNCTION r (s VARCHAR2, c VARCHAR2)
         RETURN VARCHAR2
      IS
      BEGIN
         RETURN REPLACE (s, c, '%' || TRIM (TO_CHAR (ASCII (c), 'XX')));
      END;
   BEGIN
      l_s := s;
      l_s := REPLACE (l_s, ' ', '+');
      l_s := r (l_s, chr(37));  -- %
      l_s := r (l_s, chr(37));  -- /
      l_s := r (l_s, chr(63));  -- ?
      l_s := r (l_s, chr(38));  -- &
      l_s := r (l_s, chr(228));  -- ?
      l_s := r (l_s, chr(196));  -- ?
      l_s := r (l_s, chr(246));  -- ?
      l_s := r (l_s, chr(214));  -- ?
      l_s := r (l_s, chr(252));  -- ü
      l_s := r (l_s, chr(220));  -- U
      l_s := r (l_s, chr(223));  -- ?
      RETURN l_s;
   END;

   FUNCTION check_get_request (p_url VARCHAR2)
      RETURN CHAR
   IS
      l_clob   CLOB;
   BEGIN
      IF p_url IS NULL
      THEN
         RETURN c_fail;
      END IF;

      SELECT HTTPURITYPE (p_url).getclob ()
        INTO l_clob
        FROM DUAL;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
      RETURN c_success;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN c_fail;
   END;
END;

/
