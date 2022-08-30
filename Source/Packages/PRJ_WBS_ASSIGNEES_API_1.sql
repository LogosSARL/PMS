--------------------------------------------------------
--  DDL for Package Body PRJ_WBS_ASSIGNEES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WBS_ASSIGNEES_API" 
is
 
    procedure get_row (
        p_id                           in number,
        P_row_key                      out varchar2,
        P_wba_id                       out number,
        P_wba_task_id                  out number,
        P_wba_emp_id                   out number,
        P_wba_status                   out number,
        P_wba_start_date               out date,
        P_wba_end_date                 out date,
        P_wba_compleation_percentage   out number,
        P_wba_isrf                     out blob,
        P_wba_isrf_filename            out varchar2,
        P_wba_isrf_mimetype            out varchar2,
        P_wba_isrf_charset             out varchar2,
        P_wba_isrf_lastupd             out date,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    )
    is
    begin
        for c1 in (select * from prj_wbs_assignees where wba_id = p_id) loop
            p_row_key := c1.row_key;
            p_wba_id := c1.wba_id;
            p_wba_task_id := c1.wba_task_id;
            p_wba_emp_id := c1.wba_emp_id;
            p_wba_status := c1.wba_status;
            p_wba_start_date := c1.wba_start_date;
            p_wba_end_date := c1.wba_end_date;
            p_wba_compleation_percentage := c1.wba_compleation_percentage;
            p_wba_isrf := c1.wba_isrf;
            p_wba_isrf_filename := c1.wba_isrf_filename;
            p_wba_isrf_mimetype := c1.wba_isrf_mimetype;
            p_wba_isrf_charset := c1.wba_isrf_charset;
            p_wba_isrf_lastupd := c1.wba_isrf_lastupd;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_wba_id                       in number default null,
        p_wba_task_id                  in number default null,
        p_wba_emp_id                   in number default null,
        p_wba_status                   in number default null,
        p_wba_start_date               in date default null,
        p_wba_end_date                 in date default null,
        p_wba_compleation_percentage   in number default null,
        p_wba_isrf                     in blob default null,
        p_wba_isrf_filename            in varchar2 default null,
        p_wba_isrf_mimetype            in varchar2 default null,
        p_wba_isrf_charset             in varchar2 default null,
        p_wba_isrf_lastupd             in date default null
    )
    is
    begin
        insert into prj_wbs_assignees (
            wba_id,
            wba_task_id,
            wba_emp_id,
            wba_status,
            wba_start_date,
            wba_end_date,
            wba_compleation_percentage,
            wba_isrf,
            wba_isrf_filename,
            wba_isrf_mimetype,
            wba_isrf_charset,
            wba_isrf_lastupd
        ) values (
            p_wba_id,
            p_wba_task_id,
            p_wba_emp_id,
            p_wba_status,
            p_wba_start_date,
            p_wba_end_date,
            p_wba_compleation_percentage,
            p_wba_isrf,
            p_wba_isrf_filename,
            p_wba_isrf_mimetype,
            p_wba_isrf_charset,
            p_wba_isrf_lastupd
        );
    end insert_row;

    procedure update_row  (
        p_wba_id                       in number default null,
        p_wba_task_id                  in number default null,
        p_wba_emp_id                   in varchar2 default null,
        p_wba_status                   in number default null,
        p_wba_start_date               in date default null,
        p_wba_end_date                 in date default null,
        p_wba_compleation_percentage   in number default null,
        p_wba_isrf                     in blob default null,
        p_wba_isrf_filename            in varchar2 default null,
        p_wba_isrf_mimetype            in varchar2 default null,
        p_wba_isrf_charset             in varchar2 default null,
        p_wba_isrf_lastupd             in date default null
    )
    is
    begin
        update  prj_wbs_assignees set 
            wba_id = p_wba_id,
            wba_task_id = p_wba_task_id,
            wba_emp_id = p_wba_emp_id,
            wba_status = p_wba_status,
            wba_start_date = p_wba_start_date,
            wba_end_date = p_wba_end_date,
            wba_compleation_percentage = p_wba_compleation_percentage,
            wba_isrf = p_wba_isrf,
            wba_isrf_filename = p_wba_isrf_filename,
            wba_isrf_mimetype = p_wba_isrf_mimetype,
            wba_isrf_charset = p_wba_isrf_charset,
            wba_isrf_lastupd = p_wba_isrf_lastupd
        where wba_id = p_wba_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_wbs_assignees where wba_id = p_id;
    end delete_row;

end prj_wbs_assignees_api;

/
