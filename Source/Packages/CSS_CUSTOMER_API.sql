--------------------------------------------------------
--  DDL for Package CSS_CUSTOMER_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."CSS_CUSTOMER_API" 
is
 
    /* example:
        declare
            l_name                          varchar2(75);
            l_address_1                     varchar2(75);
            l_address_2                     varchar2(75);
            l_phone                         varchar2(75);
            l_email                         varchar2(75);
            l_personnel_code                varchar2(15);
            l_category                      varchar2(12);
            l_starting_date                 date;
            l_remarks                       varchar2(250);
            l_file_number                   varchar2(8);
            l_account                       varchar2(12);
            l_ending_date                   date;
            l_cust_cust_code                varchar2(30);
            l_account_name                  varchar2(2000);
        begin
        css_customer_api.get_row (
            p_code                          => 1,
            p_name                          => l_name,
            p_address_1                     => l_address_1,
            p_address_2                     => l_address_2,
            p_phone                         => l_phone,
            p_email                         => l_email,
            p_personnel_code                => l_personnel_code,
            p_category                      => l_category,
            p_starting_date                 => l_starting_date,
            p_remarks                       => l_remarks,
            p_file_number                   => l_file_number,
            p_account                       => l_account,
            p_ending_date                   => l_ending_date,
            p_cust_cust_code                => l_cust_cust_code,
            p_account_name                  => l_account_name
            );
        end;
    */

    procedure get_row (
        p_code                         in  varchar2,
        p_name                         out varchar2,
        p_address_1                    out varchar2,
        p_address_2                    out varchar2,
        p_phone                        out varchar2,
        p_email                        out varchar2,
        p_personnel_code               out varchar2,
        p_category                     out varchar2,
        p_starting_date                out date,
        p_remarks                      out varchar2,
        p_file_number                  out varchar2,
        p_account                      out varchar2,
        p_ending_date                  out date,
        p_cust_cust_code               out varchar2,
        p_account_name                 out varchar2
    );

    /* example:
        begin
        css_customer_api.insert_row (
            p_code                        => null,
            p_name                        => null,
            p_address_1                   => null,
            p_address_2                   => null,
            p_phone                       => null,
            p_email                       => null,
            p_personnel_code              => null,
            p_category                    => null,
            p_starting_date               => null,
            p_remarks                     => null,
            p_file_number                 => null,
            p_account                     => null,
            p_ending_date                 => null,
            p_cust_cust_code              => null,
            p_account_name                => null
            );
        end;
    */

    procedure insert_row  (
        p_code                         in varchar2 default null,
        p_name                         in varchar2 default null,
        p_address_1                    in varchar2 default null,
        p_address_2                    in varchar2 default null,
        p_phone                        in varchar2 default null,
        p_email                        in varchar2 default null,
        p_personnel_code               in varchar2 default null,
        p_category                     in varchar2 default null,
        p_starting_date                in date default null,
        p_remarks                      in varchar2 default null,
        p_file_number                  in varchar2 default null,
        p_account                      in varchar2 default null,
        p_ending_date                  in date default null,
        p_cust_cust_code               in varchar2 default null,
        p_account_name                 in varchar2 default null
    );
    procedure update_row  (
        p_code                         in varchar2 default null,
        p_name                         in varchar2 default null,
        p_address_1                    in varchar2 default null,
        p_address_2                    in varchar2 default null,
        p_phone                        in varchar2 default null,
        p_email                        in varchar2 default null,
        p_personnel_code               in varchar2 default null,
        p_category                     in varchar2 default null,
        p_starting_date                in date default null,
        p_remarks                      in varchar2 default null,
        p_file_number                  in varchar2 default null,
        p_account                      in varchar2 default null,
        p_ending_date                  in date default null,
        p_cust_cust_code               in varchar2 default null,
        p_account_name                 in varchar2 default null
    );
    procedure delete_row (
        p_code                         in varchar2
    );
end css_customer_api;

/
