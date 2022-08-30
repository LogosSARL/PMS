--------------------------------------------------------
--  DDL for DB Link CSS254.WORLD
--------------------------------------------------------

  CREATE DATABASE LINK "CSS254.WORLD"
   CONNECT TO "CSSPMS" IDENTIFIED BY VALUES ':1'
   USING ' (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.3.254)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = lgs.world)
    )
  )';
