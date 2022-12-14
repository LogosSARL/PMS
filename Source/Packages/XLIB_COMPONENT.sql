--------------------------------------------------------
--  DDL for Package XLIB_COMPONENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."XLIB_COMPONENT" 
AS
/*=========================================================================
  $Id: xlib_component.pks 26 2010-01-08 20:48:22Z dietmar.aust $

  Purpose  :

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2010-01-08 21:48:22 +0100 (Fri, 08 Jan 2010) $
  $LastChangedBy: dietmar.aust $

  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

   -- how many digits does the version key have?
   -- 3 => e.g. 1.0.0
   -- 4 => e.g. 1.0.0.0
   c_num_version_components   CONSTANT NUMBER        := 6;

   PROCEDURE create_component (
      p_name            xlib_components.comp_name%TYPE,
      p_version         xlib_components.comp_version%TYPE,
      p_version_label   xlib_components.comp_version_label%TYPE DEFAULT NULL,
      p_depends_on      xlib_components.comp_depends_on%TYPE DEFAULT NULL
   );

   PROCEDURE set_component (
      p_name            xlib_components.comp_name%TYPE,
      p_version         xlib_components.comp_version%TYPE,
      p_version_label   xlib_components.comp_version_label%TYPE DEFAULT NULL,
      p_depends_on      xlib_components.comp_depends_on%TYPE DEFAULT NULL
   );

   PROCEDURE delete_component (p_name IN xlib_components.comp_name%TYPE);

/*****
utility functions
****/
   FUNCTION get_version (p_name IN xlib_components.comp_name%TYPE)
      RETURN xlib_components.comp_version%TYPE;

   FUNCTION make_version_string (p_version IN VARCHAR2)
      RETURN VARCHAR2;

   PROCEDURE verify_required_component (
      p_comp_name          IN   VARCHAR2,
      p_comp_version_min   IN   VARCHAR2
   );
END xlib_component;

/
