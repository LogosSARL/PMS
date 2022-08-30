--------------------------------------------------------
--  DDL for Package Body PRJ_OUTCOME_TYPES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_OUTCOME_TYPES_API" 
is
 
    procedure get_row (
        p_id                           in number,
        P_row_key                      out varchar2,
        P_pot_id                       out number,
        P_pot_name                     out varchar2,
        P_pot_desc                     out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    )
    is
    begin
        for c1 in (select * from prj_outcome_types where pot_id = p_id) loop
            p_row_key := c1.row_key;
            p_pot_id := c1.pot_id;
            p_pot_name := c1.pot_name;
            p_pot_desc := c1.pot_desc;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_pot_id                       in number default null,
        p_pot_name                     in varchar2 default null,
        p_pot_desc                     in varchar2 default null
    )
    is
    begin
        insert into prj_outcome_types (
            pot_id,
            pot_name,
            pot_desc
        ) values (
            p_pot_id,
            p_pot_name,
            p_pot_desc
        );
    end insert_row;

    procedure update_row  (
        p_pot_id                       in number default null,
        p_pot_name                     in varchar2 default null,
        p_pot_desc                     in varchar2 default null
    )
    is
    begin
        update  prj_outcome_types set 
            pot_id = p_pot_id,
            pot_name = p_pot_name,
            pot_desc = p_pot_desc
        where pot_id = p_pot_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_outcome_types where pot_id = p_id;
    end delete_row;

end prj_outcome_types_api;

/
