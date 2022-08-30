--------------------------------------------------------
--  DDL for Table FLOW_TIMERS
--------------------------------------------------------

  CREATE TABLE "PRJ"."FLOW_TIMERS" 
   (	"TIMR_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"TIMR_RUN" NUMBER DEFAULT 0, 
	"TIMR_PRCS_ID" NUMBER, 
	"TIMR_SBFL_ID" NUMBER, 
	"TIMR_STEP_KEY" VARCHAR2(20 CHAR), 
	"TIMR_TYPE" VARCHAR2(50 CHAR), 
	"TIMR_LAST_RUN" TIMESTAMP (6) WITH TIME ZONE, 
	"TIMR_CREATED_ON" TIMESTAMP (6) WITH TIME ZONE, 
	"TIMR_STATUS" VARCHAR2(1 CHAR), 
	"TIMR_START_ON" TIMESTAMP (6) WITH TIME ZONE, 
	"TIMR_INTERVAL_YM" INTERVAL YEAR (2) TO MONTH, 
	"TIMR_INTERVAL_DS" INTERVAL DAY (2) TO SECOND (6), 
	"TIMR_REPEAT_TIMES" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PRJ"."FLOW_TIMERS"."TIMR_STATUS" IS 'Status of the timer. For the status codes see constant definitions in FLOW_TIMERS_PKG package declaration.';
   COMMENT ON COLUMN "PRJ"."FLOW_TIMERS"."TIMR_START_ON" IS 'Expected start datetime.
Used for both date and duration definitions.';
   COMMENT ON COLUMN "PRJ"."FLOW_TIMERS"."TIMR_INTERVAL_YM" IS 'Interval YM for cycles.';
   COMMENT ON COLUMN "PRJ"."FLOW_TIMERS"."TIMR_INTERVAL_DS" IS 'Interval DS for cycles.';
   COMMENT ON COLUMN "PRJ"."FLOW_TIMERS"."TIMR_REPEAT_TIMES" IS 'Number of runs for cycles.';