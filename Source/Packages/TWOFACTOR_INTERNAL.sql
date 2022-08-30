--------------------------------------------------------
--  DDL for Package TWOFACTOR_INTERNAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."TWOFACTOR_INTERNAL" AS
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
  -- Code Gen
  TYPE CODEROW IS RECORD(
    CODE VARCHAR2(6 CHAR)); --Only to give column a name
  TYPE CODES IS TABLE OF CODEROW;
  FUNCTION CODEGEN(PSECRET IN VARCHAR2, PGAP IN NUMBER) RETURN CODES
    PIPELINED;
  -- Support Functions
  FUNCTION URLGEN(PUSER IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL) RETURN VARCHAR2;
  FUNCTION CODECHECK(PUSER IN VARCHAR2, PCODE IN VARCHAR2, PPASS IN VARCHAR2 DEFAULT NULL) RETURN BOOLEAN;
  -- Sets
  PROCEDURE SETSTATUS(PUSER IN VARCHAR2, PSTATUS IN VARCHAR2);
  PROCEDURE SETVALIDATED(PUSER IN VARCHAR2);
  PROCEDURE SETAUTHENTICATED;
  -- Manipulate
  PROCEDURE ADDUSER(PUSER IN VARCHAR2, PGAP IN NUMBER DEFAULT NULL, PPASS IN VARCHAR2 DEFAULT NULL);
  PROCEDURE REMUSER(PUSER IN VARCHAR2);
  PROCEDURE CLEANMEMORY(PUSER IN VARCHAR2);
  FUNCTION ADDMEMORY(PUSER IN VARCHAR2, PINT IN INTERVAL DAY TO SECOND DEFAULT INTERVAL '7' DAY) RETURN BOOLEAN;
  -- Checks
  FUNCTION ISUSERSETUP(PUSER IN VARCHAR2) RETURN BOOLEAN;
  FUNCTION ISUSERENABLED(PUSER IN VARCHAR2) RETURN BOOLEAN;
  FUNCTION ISUSERVALIDATED(PUSER IN VARCHAR2) RETURN BOOLEAN;
  -- Login Refresh
  PROCEDURE CHECKANDAUTHUSER;
END TWOFACTOR_INTERNAL;

/
