--------------------------------------------------------
--  DDL for Package Body PRJ_WBS_DOCS_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PRJ_WBS_DOCS_API" 
is
 
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
    )
    is
    begin
        for c1 in (select * from prj_wbs_docs where wbc_id = p_id) loop
            p_row_key := c1.row_key;
            p_prj_wb_id := c1.prj_wb_id;
            p_wbc_id := c1.wbc_id;
            p_wbc_name := c1.wbc_name;
            p_wbc_desc := c1.wbc_desc;
            p_wbc_path := c1.wbc_path;
            p_wbc_doc := c1.wbc_doc;
            p_wbc_doc_filename := c1.wbc_doc_filename;
            p_wbc_doc_mimetype := c1.wbc_doc_mimetype;
            p_wbc_doc_charset := c1.wbc_doc_charset;
            p_wbc_doc_lastupd := c1.wbc_doc_lastupd;
            p_wbc_wbs_id := c1.wbc_wbs_id;
            p_created := c1.created;
            p_created_by := c1.created_by;
            p_updated := c1.updated;
            p_updated_by := c1.updated_by;
        end loop;
    end get_row;

 
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
    )
    is
    begin
        insert into prj_wbs_docs (
            prj_wb_id,
            wbc_id,
            wbc_name,
            wbc_desc,
            wbc_path,
            wbc_doc,
            wbc_doc_filename,
            wbc_doc_mimetype,
            wbc_doc_charset,
            wbc_doc_lastupd,
            wbc_wbs_id
        ) values (
            p_prj_wb_id,
            p_wbc_id,
            p_wbc_name,
            p_wbc_desc,
            p_wbc_path,
            p_wbc_doc,
            p_wbc_doc_filename,
            p_wbc_doc_mimetype,
            p_wbc_doc_charset,
            p_wbc_doc_lastupd,
            p_wbc_wbs_id
        );
    end insert_row;

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
    )
    is
    begin
        update  prj_wbs_docs set 
            prj_wb_id = p_prj_wb_id,
            wbc_id = p_wbc_id,
            wbc_name = p_wbc_name,
            wbc_desc = p_wbc_desc,
            wbc_path = p_wbc_path,
            wbc_doc = p_wbc_doc,
            wbc_doc_filename = p_wbc_doc_filename,
            wbc_doc_mimetype = p_wbc_doc_mimetype,
            wbc_doc_charset = p_wbc_doc_charset,
            wbc_doc_lastupd = p_wbc_doc_lastupd,
            wbc_wbs_id = p_wbc_wbs_id
        where wbc_id = p_wbc_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from prj_wbs_docs where wbc_id = p_id;
    end delete_row;

end prj_wbs_docs_api;

/
