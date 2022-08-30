
-- Generated by ORDS REST Data Services 21.2.0.r1741826
-- Schema: PRJ  Date: Tue Aug 30 12:17:24 2022 
--

DECLARE
  l_roles     OWA.VC_ARR;
  l_modules   OWA.VC_ARR;
  l_patterns  OWA.VC_ARR;

BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'PRJ',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'pms',
      p_auto_rest_auth      => FALSE);
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'interface-css',
      p_base_path      => '/interface/css/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'interface-css',
      p_pattern        => 'create/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'interface-css',
      p_pattern        => 'create/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'begin

 css_customer_api.insert_row  (
        :p_code                        ,
        :p_name                         ,
        null                    ,
        null                    ,
        null                        ,
        null                        ,
        :p_personnel_code               ,
        :p_category                     ,
        to_date(:p_starting_date ,''DD/MM/YYYY'')               ,
        :p_remarks                      ,
        null                  ,
       null                      ,
        to_date(:p_ending_date,''DD-MM/YYYY'')                  ,
        :p_cust_cust_code              ,
        null                 
    );
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_code',
      p_bind_variable_name => 'p_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_name',
      p_bind_variable_name => 'p_name',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_personnel_code',
      p_bind_variable_name => 'p_personnel_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_category',
      p_bind_variable_name => 'p_category',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_starting_date',
      p_bind_variable_name => 'p_starting_date',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_remarks',
      p_bind_variable_name => 'p_remarks',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_ending_date',
      p_bind_variable_name => 'p_ending_date',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-css',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_cust_cust_code',
      p_bind_variable_name => 'p_cust_cust_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'interface-isrf',
      p_base_path      => '/interface/isrf/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'interface-isrf',
      p_pattern        => 'create/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'interface-isrf',
      p_pattern        => 'create/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'declare 
  err_code number;
    err_msg varchar2(400);
begin
insert into css_api_logs(c1) values(''ISRF create API'');commit;
 css_isrf_api.insert_row  (
        TO_NUMBER(:p_id )                          ,
        :p_code                         ,
        to_date(:p_dt,''DD-MON-YY'')                           ,
        to_date(:p_exp_dt,''DD-MON-YY'')                     ,
        :p_subject                      ,
        :p_text                         ,
        :p_add_text                     ,
        :p_cust_code                    ,
        :p_pers_code                    ,
        :p_proj_code                    ,
        TO_NUMBER(:p_sts_id)                      ,
        :p_ref_code                     ,
        TO_NUMBER(:p_priority    )                 ,
        TO_NUMBER(:p_move_flg   )                  ,
        TO_NUMBER(:p_lng_id    )                   ,
        TO_NUMBER(:p_est_hours)                    ,
        :p_type                         ,
        :p_main_object                  ,
        :p_notes                       
    );
     EXCEPTION
       WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 200);

      INSERT INTO css_api_logs (c1)
      VALUES (''Err - Generate ISRF: '' || err_code||''-''|| err_msg);
      --raise_application_error(-20001,''An error was encountered - ''||SQLCODE||'' -ERROR- ''||SQLERRM);
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_code',
      p_bind_variable_name => 'p_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_dt',
      p_bind_variable_name => 'p_dt',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_exp_dt',
      p_bind_variable_name => 'p_exp_dt',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_subject',
      p_bind_variable_name => 'p_subject',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_text',
      p_bind_variable_name => 'p_text',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_add_text',
      p_bind_variable_name => 'p_add_text',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_id',
      p_bind_variable_name => 'p_id',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_cust_code',
      p_bind_variable_name => 'p_cust_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_pers_code',
      p_bind_variable_name => 'p_pers_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_proj_code',
      p_bind_variable_name => 'p_proj_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_sts_id',
      p_bind_variable_name => 'p_sts_id',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_ref_code',
      p_bind_variable_name => 'p_ref_code',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_priority',
      p_bind_variable_name => 'p_priority',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_move_flg',
      p_bind_variable_name => 'p_move_flg',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_lng_id',
      p_bind_variable_name => 'p_lng_id',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_est_hours',
      p_bind_variable_name => 'p_est_hours',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_type',
      p_bind_variable_name => 'p_type',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_main_object',
      p_bind_variable_name => 'p_main_object',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-isrf',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'p_notes',
      p_bind_variable_name => 'p_notes',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'interface-opp',
      p_base_path      => '/interface/opp/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'interface-opp',
      p_pattern        => 'create/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'interface-opp',
      p_pattern        => 'create/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'declare
OPP_ID_V number;
err_code number;
        err_msg varchar2(400);
begin
OPP_ID_V := OPP_SEQ.NEXTVAL;
    insert into opportunities(
        OPP_ID , 
	OPP_INIT_DATE , 
	OPP_DESC , 
	OPP_HOW_HEARD_ABOUT ,  
	OPP_REMARKS , 
	OPP_CONTRACT_TYPE , 
	OPP_CUSTOMER ,  
	OPP_PROJECT_NAME , 
	OPP_CODE,
    OPP_OWNER_NAME
    ) values(
      OPP_ID_V,
      sysdate,
      :OPP_DESC,
      :OPP_HOW_HEARD_ABOUT,
      :OPP_REMARKS,
      5,
      :OPP_CUSTOMER,
      :OPP_PROJECT_NAME,
      :OPP_CODE,
      :OPP_OWNER
    );
    COMMIT;
    
insert into OPP_ROLE (ORL_ID,ORL_ROL_ID, ORL_OPP_ID, ORL_EMPLOYEE)
VALUES(OPP_OPR_SEQ.NEXTVAL,1,OPP_ID_V,:OPP_ACCOUNT_MANAGER);
commit;
insert into OPP_ROLE (ORL_ID,ORL_ROL_ID, ORL_OPP_ID, ORL_EMPLOYEE)
VALUES(OPP_OPR_SEQ.NEXTVAL,2,OPP_ID_V,:OPP_OWNER);
commit;
  EXCEPTION
       WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 200);

      INSERT INTO css_api_logs (c1)
      VALUES (''Err - Generate OPP: '' || err_code||''-''|| err_msg);
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_HOW_HEARD_ABOUT',
      p_bind_variable_name => 'OPP_HOW_HEARD_ABOUT',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_REMARKS',
      p_bind_variable_name => 'OPP_REMARKS',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_CUSTOMER',
      p_bind_variable_name => 'OPP_CUSTOMER',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_PROJECT_NAME',
      p_bind_variable_name => 'OPP_PROJECT_NAME',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_CODE',
      p_bind_variable_name => 'OPP_CODE',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_OWNER',
      p_bind_variable_name => 'OPP_OWNER',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_DESC',
      p_bind_variable_name => 'OPP_DESC',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'interface-opp',
      p_pattern            => 'create/',
      p_method             => 'POST',
      p_name               => 'OPP_ACCOUNT_MANAGER',
      p_bind_variable_name => 'OPP_ACCOUNT_MANAGER',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'oracle.example.hr',
      p_base_path      => '/hr/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsec/:empname',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsec/:empname',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select empno, ename, deptno, job from emp 
	where ((select job from emp where ename = :empname) IN (''PRESIDENT'', ''MANAGER'')) 
    OR  
    (deptno = (select deptno from emp where ename = :empname)) 
order by deptno, ename
');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsecformat/:empname',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsecformat/:empname',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'DECLARE
  prevdeptno     number;
  total_rows     number;
  deptloc        varchar2(20);
  deptname       varchar2(20);
  
  CURSOR         getemps is select * from emp 
                             start with ename = :empname
                           connect by prior empno = mgr
                             order siblings by deptno, ename;
BEGIN
  sys.htp.htmlopen;
  sys.htp.headopen;
  sys.htp.title(''Hierarchical Department Report for Employee ''||apex_escape.html(:empname));
  sys.htp.headclose;
  sys.htp.bodyopen;
 
  for l_employee in getemps 
  loop
      if l_employee.deptno != prevdeptno or prevdeptno is null then
          select dname, loc 
            into deptname, deptloc 
            from dept 
           where deptno = l_employee.deptno;
           
          if prevdeptno is not null then
              sys.htp.print(''</ul>'');
          end if;

          sys.htp.print(''Department '' || apex_escape.html(deptname) || '' located in '' || apex_escape.html(deptloc) || ''<p/>'');
          sys.htp.print(''<ul>'');
      end if;

      sys.htp.print(''<li>'' || apex_escape.html(l_employee.ename) || '', ''  || apex_escape.html(l_employee.empno) || '', '' || 
                        apex_escape.html(l_employee.job) || '', '' || apex_escape.html(l_employee.sal) || ''</li>'');

      prevdeptno := l_employee.deptno;
      total_rows := getemps%ROWCOUNT;
      
  end loop;

  if total_rows > 0 then
      sys.htp.print(''</ul>'');
  end if;

  sys.htp.bodyclose;
  sys.htp.htmlclose;
END;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 7,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno
  from (
       select emp.*
            , row_number() over (order by empno) rn
         from emp
       ) tmp');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'version/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'version/',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'begin 
 sys.htp.p(''{"version": "21.2"}'');
end;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_method         => 'GET',
      p_source_type    => 'json/query;type=single',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from emp 
where empno = :id');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_method         => 'PUT',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'begin
    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno
    where empno = :id;
    :status := 200;
    :location := :id;
exception
    when others then
        :status := 400;
        sys.htp.p( sys.htf.escape_sc(sqlerrm) );
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'X-APEX-FORWARD',
      p_bind_variable_name => 'location',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'ID',
      p_bind_variable_name => 'id',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empinfo/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empinfo/',
      p_method         => 'GET',
      p_source_type    => 'csv/query',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from emp');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employeesfeed/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employeesfeed/',
      p_method         => 'GET',
      p_source_type    => 'json/query;type=feed',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select empno, ename from emp order by deptno, ename');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employeesfeed/:id',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employeesfeed/:id',
      p_method         => 'GET',
      p_source_type    => 'csv/query',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from emp where empno = :id');

    
  ORDS.CREATE_ROLE(p_role_name => 'oracle.dbtools.role.autorest.PRJ');
    
  l_roles(1) := 'oracle.dbtools.autorest.any.schema';
  l_roles(2) := 'oracle.dbtools.role.autorest.PRJ';

  ORDS.DEFINE_PRIVILEGE(
      p_privilege_name => 'oracle.dbtools.autorest.privilege.PRJ',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => '',
      p_description    => '',
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;
    
  l_roles(1) := 'SODA Developer';
  l_patterns(1) := '/soda/*';

  ORDS.DEFINE_PRIVILEGE(
      p_privilege_name => 'oracle.soda.privilege.developer',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => '',
      p_description    => '',
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;
          
COMMIT;

END;