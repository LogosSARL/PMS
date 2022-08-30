--------------------------------------------------------
--  DDL for Package PRJ_OUTCOME_TYPES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_OUTCOME_TYPES_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_pot_id                        number;
            l_pot_name                      varchar2(100);
            l_pot_desc                      varchar2(200);
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_outcome_types_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_pot_id                        => l_pot_id,
            p_pot_name                      => l_pot_name,
            p_pot_desc                      => l_pot_desc,
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
        P_pot_id                       out number,
        P_pot_name                     out varchar2,
        P_pot_desc                     out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    );
 
    /* example:
        begin
        prj_outcome_types_api.insert_row (
            p_pot_id                      => null,
            p_pot_name                    => null,
            p_pot_desc                    => null
            );
        end;
    */

    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_pot_id                       in number default null,
        p_pot_name                     in varchar2 default null,
        p_pot_desc                     in varchar2 default null
    );
    procedure update_row  (
        p_pot_id                       in number default null,
        p_pot_name                     in varchar2 default null,
        p_pot_desc                     in varchar2 default null
    );
    procedure delete_row (
        p_id                           in number
    );
end prj_outcome_types_api;

/
