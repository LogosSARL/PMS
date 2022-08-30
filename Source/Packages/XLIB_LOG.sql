--------------------------------------------------------
--  DDL for Package XLIB_LOG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."XLIB_LOG" 
IS
/*=========================================================================
  $Id: xlib_log.pks 21 2010-01-07 07:41:27Z dietmar.aust $

  Purpose  : Application Logging

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2010-01-07 08:41:27 +0100 (Thu, 07 Jan 2010) $
  $LastChangedBy: dietmar.aust $

  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level        PLS_INTEGER DEFAULT 15
   );
END;

/
