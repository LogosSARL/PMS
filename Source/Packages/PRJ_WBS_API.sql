--------------------------------------------------------
--  DDL for Package PRJ_WBS_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WBS_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_wbs_id                        number;
            l_wbs_prj_id                    number;
            l_wbs_desc                      varchar2(200);
            l_wbs_start_date                date;
            l_wbs_end_date                  date;
            l_wbs_duration                  number;
            l_wbs_comments                  varchar2(1000);
            l_wbs_status                    number;
            l_wbs_completion_percentage     number;
            l_wbs_scope_of_work             varchar2(1000);
            l_wbs_lessons_learned           varchar2(4000);
            l_wbs_risk                      varchar2(4000);
            l_wbs_concerns                  varchar2(4000);
            l_wbs_assumptions               varchar2(4000);
            l_wbs_acceptance_criteria       varchar2(4000);
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_wbs_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_wbs_id                        => l_wbs_id,
            p_wbs_prj_id                    => l_wbs_prj_id,
            p_wbs_desc                      => l_wbs_desc,
            p_wbs_start_date                => l_wbs_start_date,
            p_wbs_end_date                  => l_wbs_end_date,
            p_wbs_duration                  => l_wbs_duration,
            p_wbs_comments                  => l_wbs_comments,
            p_wbs_status                    => l_wbs_status,
            p_wbs_completion_percentage     => l_wbs_completion_percentage,
            p_wbs_scope_of_work             => l_wbs_scope_of_work,
            p_wbs_lessons_learned           => l_wbs_lessons_learned,
            p_wbs_risk                      => l_wbs_risk,
            p_wbs_concerns                  => l_wbs_concerns,
            p_wbs_assumptions               => l_wbs_assumptions,
            p_wbs_acceptance_criteria       => l_wbs_acceptance_criteria,
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
    );
 
    /* example:
        begin
        prj_wbs_api.insert_row (
            p_wbs_id                      => null,
            p_wbs_prj_id                  => null,
            p_wbs_desc                    => null,
            p_wbs_start_date              => null,
            p_wbs_end_date                => null,
            p_wbs_duration                => null,
            p_wbs_comments                => null,
            p_wbs_status                  => null,
            p_wbs_completion_percentage   => null,
            p_wbs_scope_of_work           => null,
            p_wbs_lessons_learned         => null,
            p_wbs_risk                    => null,
            p_wbs_concerns                => null,
            p_wbs_assumptions             => null,
            p_wbs_acceptance_criteria     => null
            );
        end;
    */

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
    );
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
    );
    procedure delete_row (
        p_id                           in number
    );
   
end prj_wbs_api;

/
