--------------------------------------------------------
--  DDL for Package Body PRJ_WBS_OUTCOMES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WBS_OUTCOMES_API" 
is
 
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
    )
    is
    begin
        for c1 in (select * from prj_wbs_outcomes where wbo_id = p_id) loop
            p_row_key := c1.row_key;
            p_prj_wbs_assignee_id := c1.prj_wbs_assignee_id;
            p_wbo_id := c1.wbo_id;
            p_wbo_outcome := c1.wbo_outcome;
            p_wbo_outcome_filename := c1.wbo_outcome_filename;
            p_wbo_outcome_mimetype := c1.wbo_outcome_mimetype;
            p_wbo_outcome_charset := c1.wbo_outcome_charset;
            p_wbo_outcome_lastupd := c1.wbo_outcome_lastupd;
            p_wbo_desc := c1.wbo_desc;
            p_wbo_pot_id := c1.wbo_pot_id;
            p_wbo_to_change := c1.wbo_to_change;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
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
    )
    is
    begin
        insert into prj_wbs_outcomes (
            prj_wbs_assignee_id,
            wbo_id,
            wbo_outcome,
            wbo_outcome_filename,
            wbo_outcome_mimetype,
            wbo_outcome_charset,
            wbo_outcome_lastupd,
            wbo_desc,
            wbo_pot_id,
            wbo_to_change
        ) values (
            p_prj_wbs_assignee_id,
            p_wbo_id,
            p_wbo_outcome,
            p_wbo_outcome_filename,
            p_wbo_outcome_mimetype,
            p_wbo_outcome_charset,
            p_wbo_outcome_lastupd,
            p_wbo_desc,
            p_wbo_pot_id,
            p_wbo_to_change
        );
    end insert_row;

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
    )
    is
    begin
        update  prj_wbs_outcomes set 
            prj_wbs_assignee_id = p_prj_wbs_assignee_id,
            wbo_id = p_wbo_id,
            wbo_outcome = p_wbo_outcome,
            wbo_outcome_filename = p_wbo_outcome_filename,
            wbo_outcome_mimetype = p_wbo_outcome_mimetype,
            wbo_outcome_charset = p_wbo_outcome_charset,
            wbo_outcome_lastupd = p_wbo_outcome_lastupd,
            wbo_desc = p_wbo_desc,
            wbo_pot_id = p_wbo_pot_id,
            wbo_to_change = p_wbo_to_change
        where wbo_id = p_wbo_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_wbs_outcomes where wbo_id = p_id;
    end delete_row;

end prj_wbs_outcomes_api;

/
