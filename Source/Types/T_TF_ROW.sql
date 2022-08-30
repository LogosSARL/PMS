--------------------------------------------------------
--  DDL for Type T_TF_ROW
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRJ"."T_TF_ROW" AS OBJECT (
  id          varchar2(200),
  url varchar2(500),
  owner            varchar2(500),
  assignee         varchar2(500),
  delegationState      varchar2(500),
  name          varchar2(500),
  description    varchar2(500),
  createTime    varchar2(500),
  dueDate    varchar2(500),
  priority    varchar2(500),
  suspended    varchar2(500),
  taskDefinitionKey    varchar2(500),
  tenantId    varchar2(500),
  category    varchar2(500),
  formKey    varchar2(500),
  parentTaskId    varchar2(500),
  parentTaskUrl    varchar2(500),
  executionId    varchar2(500),
  executionUrl    varchar2(500),
  processInstanceId    varchar2(500),
  processInstanceUrl    varchar2(500),
  processDefinitionId    varchar2(500),
  processDefinitionUrl    varchar2(500)
);

/
