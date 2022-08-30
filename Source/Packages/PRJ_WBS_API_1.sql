--------------------------------------------------------
--  DDL for Package Body PRJ_WBS_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WBS_API" 
is
 
    procedure get_row (
        p_id                           in number,
        P_row_key                      out varchar2,
        P_wbs_id                       out number,
        P_wbs_prj_id                   out number,
        P_wbs_desc                     out varchar2,
        P_wbs_start_date               out date,
        P_wbs_end_date                 out date,
        P_wbs_duration                 out number,
        P_wbs_comments                 out varchar2,
        P_wbs_status                   out number,
        P_wbs_completion_percentage    out number,
        P_wbs_scope_of_work            out varchar2,
        P_wbs_lessons_learned          out varchar2,
        P_wbs_risk                     out varchar2,
        P_wbs_concerns                 out varchar2,
        P_wbs_assumptions              out varchar2,
        P_wbs_acceptance_criteria      out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    )
    is
    begin
        for c1 in (select * from prj_wbs where wbs_id = p_id) loop
            p_row_key := c1.row_key;
            p_wbs_id := c1.wbs_id;
            p_wbs_prj_id := c1.wbs_prj_id;
            p_wbs_desc := c1.wbs_desc;
            p_wbs_start_date := c1.wbs_start_date;
            p_wbs_end_date := c1.wbs_end_date;
            p_wbs_duration := c1.wbs_duration;
            p_wbs_comments := c1.wbs_comments;
            p_wbs_status := c1.wbs_status;
            p_wbs_completion_percentage := c1.wbs_completion_percentage;
            p_wbs_scope_of_work := c1.wbs_scope_of_work;
            p_wbs_lessons_learned := c1.wbs_lessons_learned;
            p_wbs_risk := c1.wbs_risk;
            p_wbs_concerns := c1.wbs_concerns;
            p_wbs_assumptions := c1.wbs_assumptions;
            p_wbs_acceptance_criteria := c1.wbs_acceptance_criteria;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_wbs_id                       in number default null,
        p_wbs_prj_id                   in number default null,
        p_wbs_desc                     in varchar2 default null,
        p_wbs_start_date               in date default null,
        p_wbs_end_date                 in date default null,
        p_wbs_duration                 in number default null,
        p_wbs_comments                 in varchar2 default null,
        p_wbs_status                   in number default null,
        p_wbs_completion_percentage    in number default null,
        p_wbs_scope_of_work            in varchar2 default null,
        p_wbs_lessons_learned          in varchar2 default null,
        p_wbs_risk                     in varchar2 default null,
        p_wbs_concerns                 in varchar2 default null,
        p_wbs_assumptions              in varchar2 default null,
        p_wbs_acceptance_criteria      in varchar2 default null
    )
    is
    begin
        insert into prj_wbs (
            wbs_id,
            wbs_prj_id,
            wbs_desc,
            wbs_start_date,
            wbs_end_date,
            wbs_duration,
            wbs_comments,
            wbs_status,
            wbs_completion_percentage,
            wbs_scope_of_work,
            wbs_lessons_learned,
            wbs_risk,
            wbs_concerns,
            wbs_assumptions,
            wbs_acceptance_criteria
        ) values (
            p_wbs_id,
            p_wbs_prj_id,
            p_wbs_desc,
            p_wbs_start_date,
            p_wbs_end_date,
            p_wbs_duration,
            p_wbs_comments,
            p_wbs_status,
            p_wbs_completion_percentage,
            p_wbs_scope_of_work,
            p_wbs_lessons_learned,
            p_wbs_risk,
            p_wbs_concerns,
            p_wbs_assumptions,
            p_wbs_acceptance_criteria
        );
        
    end insert_row;

    procedure update_row  (
        p_wbs_id                       in number default null,
        p_wbs_prj_id                   in number default null,
        p_wbs_desc                     in varchar2 default null,
        p_wbs_start_date               in date default null,
        p_wbs_end_date                 in date default null,
        p_wbs_duration                 in number default null,
        p_wbs_comments                 in varchar2 default null,
        p_wbs_status                   in number default null,
        p_wbs_completion_percentage    in number default null,
        p_wbs_scope_of_work            in varchar2 default null,
        p_wbs_lessons_learned          in varchar2 default null,
        p_wbs_risk                     in varchar2 default null,
        p_wbs_concerns                 in varchar2 default null,
        p_wbs_assumptions              in varchar2 default null,
        p_wbs_acceptance_criteria      in varchar2 default null
    )
    is
    begin
        update  prj_wbs set 
            wbs_id = p_wbs_id,
            wbs_prj_id = p_wbs_prj_id,
            wbs_desc = p_wbs_desc,
            wbs_start_date = p_wbs_start_date,
            wbs_end_date = p_wbs_end_date,
            wbs_duration = p_wbs_duration,
            wbs_comments = p_wbs_comments,
            wbs_status = p_wbs_status,
            wbs_completion_percentage = p_wbs_completion_percentage,
            wbs_scope_of_work = p_wbs_scope_of_work,
            wbs_lessons_learned = p_wbs_lessons_learned,
            wbs_risk = p_wbs_risk,
            wbs_concerns = p_wbs_concerns,
            wbs_assumptions = p_wbs_assumptions,
            wbs_acceptance_criteria = p_wbs_acceptance_criteria
        where wbs_id = p_wbs_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_wbs where wbs_id = p_id;
    end delete_row;
    
    
 
end prj_wbs_api;

/
