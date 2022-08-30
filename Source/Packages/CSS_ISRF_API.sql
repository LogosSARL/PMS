--------------------------------------------------------
--  DDL for Package CSS_ISRF_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."CSS_ISRF_API" 
is
 
    /* example:
        declare
            l_code                          varchar2(12);
            l_dt                            date;
            l_exp_dt                        date;
            l_subject                       varchar2(100);
            l_text                          varchar2(2000);
            l_add_text                      varchar2(2000);
            l_cust_code                     varchar2(30);
            l_pers_code                     varchar2(15);
            l_proj_code                     varchar2(15);
            l_sts_id                        number(2);
            l_ref_code                      varchar2(100);
            l_priority                      number(2);
            l_move_flg                      number(1);
            l_lng_id                        number(4);
            l_est_hours                     number;
            l_type                          varchar2(10);
            l_main_object                   varchar2(100);
            l_notes                         varchar2(2000);
        begin
        css_isrf_api.get_row (
            p_id                            => 1,
            p_code                          => l_code,
            p_dt                            => l_dt,
            p_exp_dt                        => l_exp_dt,
            p_subject                       => l_subject,
            p_text                          => l_text,
            p_add_text                      => l_add_text,
            p_cust_code                     => l_cust_code,
            p_pers_code                     => l_pers_code,
            p_proj_code                     => l_proj_code,
            p_sts_id                        => l_sts_id,
            p_ref_code                      => l_ref_code,
            p_priority                      => l_priority,
            p_move_flg                      => l_move_flg,
            p_lng_id                        => l_lng_id,
            p_est_hours                     => l_est_hours,
            p_type                          => l_type,
            p_main_object                   => l_main_object,
            p_notes                         => l_notes
            );
        end;
    */

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
    );

    /* example:
        begin
        css_isrf_api.insert_row (
            p_id                          => null,
            p_code                        => null,
            p_dt                          => null,
            p_exp_dt                      => null,
            p_subject                     => null,
            p_text                        => null,
            p_add_text                    => null,
            p_cust_code                   => null,
            p_pers_code                   => null,
            p_proj_code                   => null,
            p_sts_id                      => null,
            p_ref_code                    => null,
            p_priority                    => null,
            p_move_flg                    => null,
            p_lng_id                      => null,
            p_est_hours                   => null,
            p_type                        => null,
            p_main_object                 => null,
            p_notes                       => null
            );
        end;
    */

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
    );
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
    );
    procedure delete_row (
        p_id                           in number
    );
end css_isrf_api;

/
