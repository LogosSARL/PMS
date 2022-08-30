--------------------------------------------------------
--  DDL for Package PRJ_WBS_OUTCOMES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WBS_OUTCOMES_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_prj_wbs_assignee_id           number;
            l_wbo_id                        number;
            l_wbo_outcome                   blob;
            l_wbo_outcome_filename          varchar2(512);
            l_wbo_outcome_mimetype          varchar2(512);
            l_wbo_outcome_charset           varchar2(512);
            l_wbo_outcome_lastupd           date;
            l_wbo_desc                      varchar2(100);
            l_wbo_pot_id                    number;
            l_wbo_to_change                 varchar2(1000);
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_wbs_outcomes_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_prj_wbs_assignee_id           => l_prj_wbs_assignee_id,
            p_wbo_id                        => l_wbo_id,
            p_wbo_outcome                   => l_wbo_outcome,
            p_wbo_outcome_filename          => l_wbo_outcome_filename,
            p_wbo_outcome_mimetype          => l_wbo_outcome_mimetype,
            p_wbo_outcome_charset           => l_wbo_outcome_charset,
            p_wbo_outcome_lastupd           => l_wbo_outcome_lastupd,
            p_wbo_desc                      => l_wbo_desc,
            p_wbo_pot_id                    => l_wbo_pot_id,
            p_wbo_to_change                 => l_wbo_to_change,
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
        P_prj_wbs_assignee_id          out number,
        P_wbo_id                       out number,
        P_wbo_outcome                  out blob,
        P_wbo_outcome_filename         out varchar2,
        P_wbo_outcome_mimetype         out varchar2,
        P_wbo_outcome_charset          out varchar2,
        P_wbo_outcome_lastupd          out date,
        P_wbo_desc                     out varchar2,
        P_wbo_pot_id                   out number,
        P_wbo_to_change                out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    );
 
    /* example:
        begin
        prj_wbs_outcomes_api.insert_row (
            p_prj_wbs_assignee_id         => null,
            p_wbo_id                      => null,
            p_wbo_outcome                 => null,
            p_wbo_outcome_filename        => null,
            p_wbo_outcome_mimetype        => null,
            p_wbo_outcome_charset         => null,
            p_wbo_outcome_lastupd         => null,
            p_wbo_desc                    => null,
            p_wbo_pot_id                  => null,
            p_wbo_to_change               => null
            );
        end;
    */

    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_prj_wbs_assignee_id          in number default null,
        p_wbo_id                       in number default null,
        p_wbo_outcome                  in blob default null,
        p_wbo_outcome_filename         in varchar2 default null,
        p_wbo_outcome_mimetype         in varchar2 default null,
        p_wbo_outcome_charset          in varchar2 default null,
        p_wbo_outcome_lastupd          in date default null,
        p_wbo_desc                     in varchar2 default null,
        p_wbo_pot_id                   in number default null,
        p_wbo_to_change                in varchar2 default null
    );
    procedure update_row  (
        p_prj_wbs_assignee_id          in number default null,
        p_wbo_id                       in number default null,
        p_wbo_outcome                  in blob default null,
        p_wbo_outcome_filename         in varchar2 default null,
        p_wbo_outcome_mimetype         in varchar2 default null,
        p_wbo_outcome_charset          in varchar2 default null,
        p_wbo_outcome_lastupd          in date default null,
        p_wbo_desc                     in varchar2 default null,
        p_wbo_pot_id                   in number default null,
        p_wbo_to_change                in varchar2 default null
    );
    procedure delete_row (
        p_id                           in number
    );
end prj_wbs_outcomes_api;

/
