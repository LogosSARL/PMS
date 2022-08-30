--------------------------------------------------------
--  DDL for Package Body XLIB_LOG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."XLIB_LOG" 
IS
/*=========================================================================
   FILE  :  $Id: xlib_log.pkb 21 2010-01-07 07:41:27Z dietmar.aust $
=========================================================================*/

   PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level   IN   PLS_INTEGER DEFAULT 15
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      INSERT INTO xlib_logs
                  (log_module, log_msg, log_type, log_level, log_created_on, log_created_by
                  )
           VALUES (p_module, p_msg, p_type, p_level, sysdate, nvl(v('APP_USER'), user)
                  );
      COMMIT;
   END;
END;

/
