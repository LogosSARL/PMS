--------------------------------------------------------
--  DDL for Package TWOFACTOR_ADMIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."TWOFACTOR_ADMIN" AS
  /************************************************************************

   OraTOtP - Oracle Time-based One-time Password
   Copyright 2016  Rodrigo Jorge <http://www.dbarj.com.br/>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

  ************************************************************************/
  PROCEDURE SETUP(PUSER IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL, PGAP IN NUMBER DEFAULT NULL);
  PROCEDURE DECONFIG(PUSER IN VARCHAR2, PCODE IN VARCHAR2 DEFAULT NULL, PPASS IN VARCHAR2 DEFAULT NULL, PISADMIN IN BOOLEAN DEFAULT TRUE);
  PROCEDURE VALIDATE(PUSER IN VARCHAR2, PCODE IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL);
  PROCEDURE FORGET(PUSER IN VARCHAR2);
  -- Can't run to another user:
  PROCEDURE AUTHENTICATE(PCODE IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL);
  PROCEDURE REMEMBER(PCODE IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL, PINT IN INTERVAL DAY TO SECOND DEFAULT NULL);
END TWOFACTOR_ADMIN;

/
