--------------------------------------------------------
--  DDL for Package Body CSS_CUSTOMER_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."CSS_CUSTOMER_API" 
is
 
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
    )
    is
    begin
        for c1 in (select * from css_customer where code = p_code) loop
            p_name := c1.name;
            p_address_1 := c1.address_1;
            p_address_2 := c1.address_2;
            p_phone := c1.phone;
            p_email := c1.email;
            p_personnel_code := c1.personnel_code;
            p_category := c1.category;
            p_starting_date := c1.starting_date;
            p_remarks := c1.remarks;
            p_file_number := c1.file_number;
            p_account := c1.account;
            p_ending_date := c1.ending_date;
            p_cust_cust_code := c1.cust_cust_code;
            p_account_name := c1.account_name;
        end loop;
    end get_row;

 
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
    )
    is
    err_code number;
    err_msg varchar2(400);
    begin
      insert into css_api_logs (
            c1
        ) values (
            p_code||'-'||
            p_name||'-'||
            p_address_1||'-'||
            p_address_2||'-'||
            p_phone||'-'||
            p_email||'-'||
            p_personnel_code||'-'||
            p_category||'-'||
            p_starting_date||'-'||
            p_remarks||'-'||
            p_file_number||'-'||
            p_account||'-'||
            p_ending_date||'-'||
            p_cust_cust_code||'-'||
            p_account_name
        );
        commit;
        insert into css_customer (
            code,
            name,
            address_1,
            address_2,
            phone,
            email,
            personnel_code,
            category,
            starting_date,
            remarks,
            file_number,
            account,
            ending_date,
            cust_cust_code,
            account_name
        ) values (
            p_code,
            p_name,
            p_address_1,
            p_address_2,
            p_phone,
            p_email,
            p_personnel_code,
            p_category,
            p_starting_date,
            p_remarks,
            p_file_number,
            p_account,
            p_ending_date,
            p_cust_cust_code,
            p_account_name
        );
     
        
        commit;
        EXCEPTION
       WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 200);

      INSERT INTO css_api_logs (c1)
      VALUES ('err ' || err_code||'-'|| err_msg);
    --  raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
    end insert_row;

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
    )
    is
    begin
        update  css_customer set 
            code = p_code,
            name = p_name,
            address_1 = p_address_1,
            address_2 = p_address_2,
            phone = p_phone,
            email = p_email,
            personnel_code = p_personnel_code,
            category = p_category,
            starting_date = p_starting_date,
            remarks = p_remarks,
            file_number = p_file_number,
            account = p_account,
            ending_date = p_ending_date,
            cust_cust_code = p_cust_cust_code,
            account_name = p_account_name
        where code = p_code;
    end update_row;

    procedure delete_row (
        p_code                         in varchar2
    )
    is
    begin
        delete from css_customer where code = p_code;
    end delete_row;

end css_customer_api;

/
