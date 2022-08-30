--------------------------------------------------------
--  DDL for Package PRJ_WBS_ASSIGNEES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WBS_ASSIGNEES_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_prj_outcome_type_id           number;
            l_wba_id                        number;
            l_wba_task_id                   number;
            l_wba_emp_id                    number;
            l_wba_status                    number;
            l_wba_start_date                date;
            l_wba_end_date                  date;
            l_wba_compleation_percentage    number;
            l_wba_isrf                      blob;
            l_wba_isrf_filename             varchar2(512);
            l_wba_isrf_mimetype             varchar2(512);
            l_wba_isrf_charset              varchar2(512);
            l_wba_isrf_lastupd              date;
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_wbs_assignees_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_prj_outcome_type_id           => l_prj_outcome_type_id,
            p_wba_id                        => l_wba_id,
            p_wba_task_id                   => l_wba_task_id,
            p_wba_emp_id                    => l_wba_emp_id,
            p_wba_status                    => l_wba_status,
            p_wba_start_date                => l_wba_start_date,
            p_wba_end_date                  => l_wba_end_date,
            p_wba_compleation_percentage    => l_wba_compleation_percentage,
            p_wba_isrf                      => l_wba_isrf,
            p_wba_isrf_filename             => l_wba_isrf_filename,
            p_wba_isrf_mimetype             => l_wba_isrf_mimetype,
            p_wba_isrf_charset              => l_wba_isrf_charset,
            p_wba_isrf_lastupd              => l_wba_isrf_lastupd,
            p_created                       => l_created,
            p_created_by                    => l_created_by,
            p_updated                       => l_updated,
            p_updated_by                    => l_updated_by
            );
        end;
    */

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
    );
 
    /* example:
        begin
        prj_wbs_assignees_api.insert_row (
            p_prj_outcome_type_id         => null,
            p_wba_id                      => null,
            p_wba_task_id                 => null,
            p_wba_emp_id                  => null,
            p_wba_status                  => null,
            p_wba_start_date              => null,
            p_wba_end_date                => null,
            p_wba_compleation_percentage  => null,
            p_wba_isrf                    => null,
            p_wba_isrf_filename           => null,
            p_wba_isrf_mimetype           => null,
            p_wba_isrf_charset            => null,
            p_wba_isrf_lastupd            => null
            );
        end;
    */

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
    );
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
    );
    procedure delete_row (
        p_id                           in number
    );
end prj_wbs_assignees_api;

/
