--------------------------------------------------------
--  DDL for Package PRJ_WBS_DOCS_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PRJ_WBS_DOCS_API" 
is
 
    /* example:
        declare
            l_row_key                       varchar2(30);
            l_prj_wb_id                     number;
            l_wbc_id                        number;
            l_wbc_name                      varchar2(100);
            l_wbc_desc                      varchar2(1000);
            l_wbc_path                      varchar2(200);
            l_wbc_doc                       blob;
            l_wbc_doc_filename              varchar2(512);
            l_wbc_doc_mimetype              varchar2(512);
            l_wbc_doc_charset               varchar2(512);
            l_wbc_doc_lastupd               date;
            l_wbc_wbs_id                    number;
            l_created                       date;
            l_created_by                    varchar2(255);
            l_updated                       date;
            l_updated_by                    varchar2(255);
        begin
        prj_wbs_docs_api.get_row (
            p_id                            => 1,
            p_row_key                       => l_row_key,
            p_prj_wb_id                     => l_prj_wb_id,
            p_wbc_id                        => l_wbc_id,
            p_wbc_name                      => l_wbc_name,
            p_wbc_desc                      => l_wbc_desc,
            p_wbc_path                      => l_wbc_path,
            p_wbc_doc                       => l_wbc_doc,
            p_wbc_doc_filename              => l_wbc_doc_filename,
            p_wbc_doc_mimetype              => l_wbc_doc_mimetype,
            p_wbc_doc_charset               => l_wbc_doc_charset,
            p_wbc_doc_lastupd               => l_wbc_doc_lastupd,
            p_wbc_wbs_id                    => l_wbc_wbs_id,
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
        P_prj_wb_id                    out number,
        P_wbc_id                       out number,
        P_wbc_name                     out varchar2,
        P_wbc_desc                     out varchar2,
        P_wbc_path                     out varchar2,
        P_wbc_doc                      out blob,
        P_wbc_doc_filename             out varchar2,
        P_wbc_doc_mimetype             out varchar2,
        P_wbc_doc_charset              out varchar2,
        P_wbc_doc_lastupd              out date,
        P_wbc_wbs_id                   out number,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2
    );
 
    /* example:
        begin
        prj_wbs_docs_api.insert_row (
            p_prj_wb_id                   => null,
            p_wbc_id                      => null,
            p_wbc_name                    => null,
            p_wbc_desc                    => null,
            p_wbc_path                    => null,
            p_wbc_doc                     => null,
            p_wbc_doc_filename            => null,
            p_wbc_doc_mimetype            => null,
            p_wbc_doc_charset             => null,
            p_wbc_doc_lastupd             => null,
            p_wbc_wbs_id                  => null
            );
        end;
    */

    procedure insert_row  (
        p_row_key                      in varchar2 default null,
        p_prj_wb_id                    in number default null,
        p_wbc_id                       in number default null,
        p_wbc_name                     in varchar2 default null,
        p_wbc_desc                     in varchar2 default null,
        p_wbc_path                     in varchar2 default null,
        p_wbc_doc                      in blob default null,
        p_wbc_doc_filename             in varchar2 default null,
        p_wbc_doc_mimetype             in varchar2 default null,
        p_wbc_doc_charset              in varchar2 default null,
        p_wbc_doc_lastupd              in date default null,
        p_wbc_wbs_id                   in number default null
    );
    procedure update_row  (
        p_prj_wb_id                    in number default null,
        p_wbc_id                       in number default null,
        p_wbc_name                     in varchar2 default null,
        p_wbc_desc                     in varchar2 default null,
        p_wbc_path                     in varchar2 default null,
        p_wbc_doc                      in blob default null,
        p_wbc_doc_filename             in varchar2 default null,
        p_wbc_doc_mimetype             in varchar2 default null,
        p_wbc_doc_charset              in varchar2 default null,
        p_wbc_doc_lastupd              in date default null,
        p_wbc_wbs_id                   in number default null
    );
    procedure delete_row (
        p_id                           in number
    );
end prj_wbs_docs_api;

/
