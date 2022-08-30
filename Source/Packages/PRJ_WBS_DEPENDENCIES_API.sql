--------------------------------------------------------
--  DDL for Package PRJ_WBS_DEPENDENCIES_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WBS_DEPENDENCIES_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_prj_wbs_doc_id                number;
            l_wbd_id                        number;
            l_wbd_type                      varchar2(1);
            l_wbd_wbs_id                    number;
            l_wbd_dep_task_id               number;
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_wbs_dependencies_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_prj_wbs_doc_id                => l_prj_wbs_doc_id,
            p_wbd_id                        => l_wbd_id,
            p_wbd_type                      => l_wbd_type,
            p_wbd_wbs_id                    => l_wbd_wbs_id,
            p_wbd_dep_task_id               => l_wbd_dep_task_id,
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
        P_prj_wbs_doc_id               out number,
        P_wbd_id                       out number,
        P_wbd_type                     out varchar2,
        P_wbd_wbs_id                   out number,
        P_wbd_dep_task_id              out number,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    );
 
    /* example:
        begin
        prj_wbs_dependencies_api.insert_row (
            p_prj_wbs_doc_id              => null,
            p_wbd_id                      => null,
            p_wbd_type                    => null,
            p_wbd_wbs_id                  => null,
            p_wbd_dep_task_id             => null
            );
        end;
    */

    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_prj_wbs_doc_id               in number default null,
        p_wbd_id                       in number default null,
        p_wbd_type                     in varchar2 default null,
        p_wbd_wbs_id                   in number default null,
        p_wbd_dep_task_id              in number default null
    );
    procedure update_row  (
        p_prj_wbs_doc_id               in number default null,
        p_wbd_id                       in number default null,
        p_wbd_type                     in varchar2 default null,
        p_wbd_wbs_id                   in number default null,
        p_wbd_dep_task_id              in number default null
    );
    procedure delete_row (
        p_id                           in number
    );
     procedure update_dates(p_prj_id_p number);
end prj_wbs_dependencies_api;

/
