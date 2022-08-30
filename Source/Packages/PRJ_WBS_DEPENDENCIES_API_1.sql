--------------------------------------------------------
--  DDL for Package Body PRJ_WBS_DEPENDENCIES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WBS_DEPENDENCIES_API" 
is
 
    procedure get_row (
        p_id                           in number,
        P_row_key                      out varchar2,
        P_prj_wbs_doc_id               out number,
        P_wbd_id                       out number,
        P_wbd_type                     out varchar2,
        P_wbd_wbs_id                   out number,
        P_wbd_dep_task_id              out number,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    )
    is
    begin
        for c1 in (select * from prj_wbs_dependencies where wbd_id = p_id) loop
            p_row_key := c1.row_key;
            p_prj_wbs_doc_id := c1.prj_wbs_doc_id;
            p_wbd_id := c1.wbd_id;
            p_wbd_type := c1.wbd_type;
            p_wbd_wbs_id := c1.wbd_wbs_id;
            p_wbd_dep_task_id := c1.wbd_dep_task_id;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_prj_wbs_doc_id               in number default null,
        p_wbd_id                       in number default null,
        p_wbd_type                     in varchar2 default null,
        p_wbd_wbs_id                   in number default null,
        p_wbd_dep_task_id              in number default null
    )
    is
    begin
        insert into prj_wbs_dependencies (
            prj_wbs_doc_id,
            wbd_id,
            wbd_type,
            wbd_wbs_id,
            wbd_dep_task_id
        ) values (
            p_prj_wbs_doc_id,
            p_wbd_id,
            p_wbd_type,
            p_wbd_wbs_id,
            p_wbd_dep_task_id
        );
    end insert_row;

    procedure update_row  (
        p_prj_wbs_doc_id               in number default null,
        p_wbd_id                       in number default null,
        p_wbd_type                     in varchar2 default null,
        p_wbd_wbs_id                   in number default null,
        p_wbd_dep_task_id              in number default null
    )
    is
    begin
        update  prj_wbs_dependencies set 
            prj_wbs_doc_id = p_prj_wbs_doc_id,
            wbd_id = p_wbd_id,
            wbd_type = p_wbd_type,
            wbd_wbs_id = p_wbd_wbs_id,
            wbd_dep_task_id = p_wbd_dep_task_id
        where wbd_id = p_wbd_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_wbs_dependencies where wbd_id = p_id;
    end delete_row;
  
  
  procedure update_dates(p_prj_id_p number) is 
cursor prj_tasks is select id from lgs_projects where id = p_prj_id_p;
    p_prj_id number;
    
    cursor c1 is select * from prj_wbs where wbs_prj_id = p_prj_id;
    task_v c1%ROWTYPE;
    
    cursor c2 is select task.wbs_id task_id,
    dep_task.wbs_desc task_desc,
    task.wbs_start_date,
    task.wbs_end_date task_end_date,
    dep_task.wbs_duration task_duration,
    dep_task.wbs_comments task_comments,
    dep_task.wbs_status task_status,
    dep_task.wbs_completion_percentage task_completion_percentage,
    dep_task.wbs_scope_of_work task_scope_of_work,
    dep_task.wbs_lessons_learned task_wbs_lessons_learned,
    dep_task.wbs_risk task_risk,
    dep_task.wbs_concerns task_concerns,
    dep_task.wbs_assumptions task_assumptions,
    dep_task.wbs_acceptance_criteria task_acceptance_criteria,
    dep_task.wbs_id dep_task_id,
    dep_task.wbs_desc dep_task_desc,
    dep.wbd_id dep_id
    from prj_wbs task, prj_wbs dep_task, prj_wbs_dependencies dep 
    where task.wbs_id = dep.WBD_WBS_ID
    and task_v.wbs_id = task.wbs_id
    and dep_task.wbs_id = dep.WBD_DEP_TASK_ID
    and dep_task.wbs_id <> task.wbs_id;
    task_dep_v c2%rowtype;
      begin
    open prj_tasks;
    loop
      fetch prj_tasks into p_prj_id;
      dbms_output.put_line('project is : => '||p_prj_id);
      EXIT WHEN prj_tasks%NOTFOUND;
    open c1;
    loop
      fetch c1 into task_v;
       dbms_output.put_line('task under project is '||task_v.wbs_id);
      EXIT WHEN c1%NOTFOUND; 
      open c2;
        loop
          fetch c2 into task_dep_v;
          dbms_output.put_line('task dependent on task_v is => '||task_dep_v.task_id);
          exit when c2%NOTFOUND;
         -- insert into tareif(c1,c2) values (task_dep_v.dep_task_id,task_dep_v.task_end_date); commit;
       /*  dbms_output.put_line('task_id '||task_dep_v.dep_task_id);
          dbms_output.put_line('p_prj_id '||p_prj_id);
           dbms_output.put_line('task_desc '||task_dep_v.task_desc);
           dbms_output.put_line('task_start '||to_date(task_dep_v.task_end_date + 1));
             dbms_output.put_line('task_end '||to_date(to_date(task_dep_v.task_end_date + 1)+task_dep_v.task_duration));
              dbms_output.put_line('task_duration '||task_dep_v.task_duration);
               dbms_output.put_line('task_comments '||task_dep_v.task_comments);
                dbms_output.put_line('task_status '||task_dep_v.task_status);
                 dbms_output.put_line('task_completion_percentage '||task_dep_v.task_completion_percentage);
                  dbms_output.put_line('task_scope_of_work '||task_dep_v.task_scope_of_work);
                   dbms_output.put_line('task_wbs_lessons_learned '||task_dep_v.task_wbs_lessons_learned);
                   dbms_output.put_line('task_risk '||task_dep_v.task_risk);
                   dbms_output.put_line('task_concerns '||task_dep_v.task_concerns);
                   dbms_output.put_line('task_assumptions '||task_dep_v.task_assumptions);
                   dbms_output.put_line('task_acceptance_criteria '||task_dep_v.task_acceptance_criteria);*/
       PRJ_WBS_API.update_row  (
        p_wbs_id               =>      task_dep_v.dep_task_id,
        p_wbs_prj_id           =>      p_prj_id,
        p_wbs_desc             =>      task_dep_v.task_desc,
        p_wbs_start_date       =>      to_date(task_dep_v.task_end_date + 1),
        p_wbs_end_date         =>      to_date(to_date(task_dep_v.task_end_date + 1)+task_dep_v.task_duration),
        p_wbs_duration         =>      task_dep_v.task_duration,
        p_wbs_comments         =>      task_dep_v.task_comments,
        p_wbs_status           =>      task_dep_v.task_status,
        p_wbs_completion_percentage => task_dep_v.task_completion_percentage,
        p_wbs_scope_of_work          =>task_dep_v.task_scope_of_work,
        p_wbs_lessons_learned        => task_dep_v.task_wbs_lessons_learned,
        p_wbs_risk                   => task_dep_v.task_risk,
        p_wbs_concerns               => task_dep_v.task_concerns,
        p_wbs_assumptions            => task_dep_v.task_assumptions,
        p_wbs_acceptance_criteria    => task_dep_v.task_acceptance_criteria
    );commit;
            
        end loop;
      close c2;
    end loop;
    close c1;
    end loop;
    close prj_tasks;
    end update_dates;
end prj_wbs_dependencies_api;

/
