--------------------------------------------------------
--  DDL for Package Body CSS_ISRF_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."CSS_ISRF_API" 
is
 
    procedure get_row (
        p_id                           in  number,
        p_code                         out varchar2,
        p_dt                           out date,
        p_exp_dt                       out date,
        p_subject                      out varchar2,
        p_text                         out varchar2,
        p_add_text                     out varchar2,
        p_cust_code                    out varchar2,
        p_pers_code                    out varchar2,
        p_proj_code                    out varchar2,
        p_sts_id                       out number,
        p_ref_code                     out varchar2,
        p_priority                     out number,
        p_move_flg                     out number,
        p_lng_id                       out number,
        p_est_hours                    out number,
        p_type                         out varchar2,
        p_main_object                  out varchar2,
        p_notes                        out varchar2
    )
    is
    begin
        for c1 in (select * from css_isrf where id = p_id) loop
            p_code := c1.code;
            p_dt := c1.dt;
            p_exp_dt := c1.exp_dt;
            p_subject := c1.subject;
            p_text := c1.text;
            p_add_text := c1.add_text;
            p_cust_code := c1.cust_code;
            p_pers_code := c1.pers_code;
            p_proj_code := c1.proj_code;
            p_sts_id := c1.sts_id;
            p_ref_code := c1.ref_code;
            p_priority := c1.priority;
            p_move_flg := c1.move_flg;
            p_lng_id := c1.lng_id;
            p_est_hours := c1.est_hours;
            p_type := c1.type;
            p_main_object := c1.main_obj;
            p_notes := c1.notes;
        end loop;
    end get_row;

 
    procedure insert_row  (
        p_id                           in number default null,
        p_code                         in varchar2 default null,
        p_dt                           in date default null,
        p_exp_dt                       in date default null,
        p_subject                      in varchar2 default null,
        p_text                         in varchar2 default null,
        p_add_text                     in varchar2 default null,
        p_cust_code                    in varchar2 default null,
        p_pers_code                    in varchar2 default null,
        p_proj_code                    in varchar2 default null,
        p_sts_id                       in number default null,
        p_ref_code                     in varchar2 default null,
        p_priority                     in number default null,
        p_move_flg                     in number default null,
        p_lng_id                       in number default null,
        p_est_hours                    in number default null,
        p_type                         in varchar2 default null,
        p_main_object                  in varchar2 default null,
        p_notes                        in varchar2 default null
    )
    is
     err_code number;
    err_msg varchar2(400);
    begin
     insert into css_api_logs(c1)
         values (
             p_id||'-'||
            p_code||'-'||
            p_dt||'-'||
            p_exp_dt||'-'||
            p_subject||'-'||
            p_text||'-'||
            p_add_text||'-'||
            p_cust_code||'-'||
            p_pers_code||'-'||
            p_proj_code||'-'||
            p_sts_id||'-'||
            p_ref_code||'-'||
            p_priority||'-'||
            p_move_flg||'-'||
            p_lng_id||'-'||
            p_est_hours||'-'||
            p_type||'-'||
            p_main_object||'-'||
            p_notes
        );commit;
        insert into css_isrf (
            id,
            code,
            dt,
            exp_dt,
            subject,
            text,
            add_text,
            cust_code,
            pers_code,
            proj_code,
            sts_id,
            ref_code,
            priority,
            move_flg,
            lng_id,
            est_hours,
            type,
            main_obj,
            notes
        ) values (
            p_id,
            p_code,
            p_dt,
            p_exp_dt,
            p_subject,
            p_text,
            p_add_text,
            p_cust_code,
            p_pers_code,
            p_proj_code,
            p_sts_id,
            p_ref_code,
            p_priority,
            p_move_flg,
            p_lng_id,
            p_est_hours,
            p_type,
            p_main_object,
            p_notes
        );
       commit;
        EXCEPTION
       WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 200);

      INSERT INTO css_api_logs (c1)
      VALUES ('Err - Generate ISRF: ' || err_code||'-'|| err_msg);
      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
    end insert_row;

    procedure update_row  (
        p_id                           in number default null,
        p_code                         in varchar2 default null,
        p_dt                           in date default null,
        p_exp_dt                       in date default null,
        p_subject                      in varchar2 default null,
        p_text                         in varchar2 default null,
        p_add_text                     in varchar2 default null,
        p_cust_code                    in varchar2 default null,
        p_pers_code                    in varchar2 default null,
        p_proj_code                    in varchar2 default null,
        p_sts_id                       in number default null,
        p_ref_code                     in varchar2 default null,
        p_priority                     in number default null,
        p_move_flg                     in number default null,
        p_lng_id                       in number default null,
        p_est_hours                    in number default null,
        p_type                         in varchar2 default null,
        p_main_object                  in varchar2 default null,
        p_notes                        in varchar2 default null
    )
    is
    begin
        update  css_isrf set 
            id = p_id,
            code = p_code,
            dt = p_dt,
            exp_dt = p_exp_dt,
            subject = p_subject,
            text = p_text,
            add_text = p_add_text,
            cust_code = p_cust_code,
            pers_code = p_pers_code,
            proj_code = p_proj_code,
            sts_id = p_sts_id,
            ref_code = p_ref_code,
            priority = p_priority,
            move_flg = p_move_flg,
            lng_id = p_lng_id,
            est_hours = p_est_hours,
            type = p_type,
            main_obj = p_main_object,
            notes = p_notes
        where id = p_id;
    end update_row;

    procedure delete_row (
        p_id                           in number
    )
    is
    begin
        delete from css_isrf where id = p_id;
    end delete_row;

end css_isrf_api;

/
