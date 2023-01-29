-- 
-- Legal Notice 
-- 
-- This document and associated source code (the "Work") is a part of a 
-- benchmark specification maintained by the TPC. 
-- 
-- The TPC reserves all right, title, and interest to the Work as provided 
-- under U.S. and international laws, including without limitation all patent 
-- and trademark rights therein. 
-- 
-- No Warranty 
-- 
-- 1.1 TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE INFORMATION 
--     CONTAINED HEREIN IS PROVIDED "AS IS" AND WITH ALL FAULTS, AND THE 
--     AUTHORS AND DEVELOPERS OF THE WORK HEREBY DISCLAIM ALL OTHER 
--     WARRANTIES AND CONDITIONS, EITHER EXPRESS, IMPLIED OR STATUTORY, 
--     INCLUDING, BUT NOT LIMITED TO, ANY (IF ANY) IMPLIED WARRANTIES, 
--     DUTIES OR CONDITIONS OF MERCHANTABILITY, OF FITNESS FOR A PARTICULAR 
--     PURPOSE, OF ACCURACY OR COMPLETENESS OF RESPONSES, OF RESULTS, OF 
--     WORKMANLIKE EFFORT, OF LACK OF VIRUSES, AND OF LACK OF NEGLIGENCE. 
--     ALSO, THERE IS NO WARRANTY OR CONDITION OF TITLE, QUIET ENJOYMENT, 
--     QUIET POSSESSION, CORRESPONDENCE TO DESCRIPTION OR NON-INFRINGEMENT 
--     WITH REGARD TO THE WORK. 
-- 1.2 IN NO EVENT WILL ANY AUTHOR OR DEVELOPER OF THE WORK BE LIABLE TO 
--     ANY OTHER PARTY FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO THE 
--     COST OF PROCURING SUBSTITUTE GOODS OR SERVICES, LOST PROFITS, LOSS 
--     OF USE, LOSS OF DATA, OR ANY INCIDENTAL, CONSEQUENTIAL, DIRECT, 
--     INDIRECT, OR SPECIAL DAMAGES WHETHER UNDER CONTRACT, TORT, WARRANTY,
--     OR OTHERWISE, ARISING IN ANY WAY OUT OF THIS OR ANY OTHER AGREEMENT 
--     RELATING TO THE WORK, WHETHER OR NOT SUCH AUTHOR OR DEVELOPER HAD 
--     ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES. 
-- 
-- Contributors:
-- Gradient Systems
--
create table dbgen_version
(
    dv_version                varchar(16)                   ,
    dv_create_date            date                          ,
    dv_create_time            datetime                      ,
    dv_cmdline_args           varchar(200)                  
);

create table customer_address
(
    ca_address_sk             integer               not null,
    ca_address_id             char(16)              not null,
    ca_street_number          char(10)                      ,
    ca_street_name            varchar(60)                   ,
    ca_street_type            char(15)                      ,
    ca_suite_number           char(10)                      ,
    ca_city                   varchar(60)                   ,
    ca_county                 varchar(30)                   ,
    ca_state                  char(2)                       ,
    ca_zip                    char(10)                      ,
    ca_country                varchar(20)                   ,
    ca_gmt_offset             double                        ,
    ca_location_type          char(20)
) cluster by (ca_address_sk);

create table customer_demographics
(
    cd_demo_sk                integer               not null,
    cd_gender                 char(1)                       ,
    cd_marital_status         char(1)                       ,
    cd_education_status       char(20)                      ,
    cd_purchase_estimate      integer                       ,
    cd_credit_rating          char(10)                      ,
    cd_dep_count              integer                       ,
    cd_dep_employed_count     integer                       ,
    cd_dep_college_count      integer
)cluster by (cd_demo_sk);

create table date_dim
(
    d_date_sk                 integer                       ,
    d_date_id                 char(16)                      ,
    d_date                    datetime                      ,
    d_month_seq               integer                       ,
    d_week_seq                integer                       ,
    d_quarter_seq             integer                       ,
    d_year                    integer                       ,
    d_dow                     integer                       ,
    d_moy                     integer                       ,
    d_dom                     integer                       ,
    d_qoy                     integer                       ,
    d_fy_year                 integer                       ,
    d_fy_quarter_seq          integer                       ,
    d_fy_week_seq             integer                       ,
    d_day_name                char(9)                       ,
    d_quarter_name            char(6)                       ,
    d_holiday                 char(1)                       ,
    d_weekend                 char(1)                       ,
    d_following_holiday       char(1)                       ,
    d_first_dom               integer                       ,
    d_last_dom                integer                       ,
    d_same_day_ly             integer                       ,
    d_same_day_lq             integer                       ,
    d_current_day             char(1)                       ,
    d_current_week            char(1)                       ,
    d_current_month           char(1)                       ,
    d_current_quarter         char(1)                       ,
    d_current_year            char(1)
)cluster by (d_date_sk);

create table warehouse
(
    w_warehouse_sk            integer               not null,
    w_warehouse_id            char(16)              not null,
    w_warehouse_name          varchar(20)                   ,
    w_warehouse_sq_ft         integer                       ,
    w_street_number           char(10)                      ,
    w_street_name             varchar(60)                   ,
    w_street_type             char(15)                      ,
    w_suite_number            char(10)                      ,
    w_city                    varchar(60)                   ,
    w_county                  varchar(30)                   ,
    w_state                   char(2)                       ,
    w_zip                     char(10)                      ,
    w_country                 varchar(20)                   ,
    w_gmt_offset              double
)cluster by (w_warehouse_sk);

create table ship_mode
(
    sm_ship_mode_sk           integer               not null,
    sm_ship_mode_id           char(16)              not null,
    sm_type                   char(30)                      ,
    sm_code                   char(10)                      ,
    sm_carrier                char(20)                      ,
    sm_contract               char(20)
)cluster by (sm_ship_mode_sk);

create table time_dim
(
    t_time_sk                 integer               not null,
    t_time_id                 char(16)              not null,
    t_time                    integer                       ,
    t_hour                    integer                       ,
    t_minute                  integer                       ,
    t_second                  integer                       ,
    t_am_pm                   char(2)                       ,
    t_shift                   char(20)                      ,
    t_sub_shift               char(20)                      ,
    t_meal_time               char(20)
)cluster by (t_time_sk);

create table reason
(
    r_reason_sk               integer               not null,
    r_reason_id               char(16)              not null,
    r_reason_desc             char(100)
)cluster by (r_reason_sk);

create table income_band
(
    ib_income_band_sk         integer               not null,
    ib_lower_bound            integer                       ,
    ib_upper_bound            integer
)cluster by (ib_income_band_sk);

create table item
(
    i_item_sk                 integer                       ,
    i_item_id                 char(16)                      ,
    i_rec_start_date          date                          ,
    i_rec_end_date            date                          ,
    i_item_desc               char(200)                  ,
    i_current_price           double                  ,
    i_wholesale_cost          double                  ,
    i_brand_id                integer                       ,
    i_brand                   char(50)                      ,
    i_class_id                integer                       ,
    i_class                   char(50)                      ,
    i_category_id             integer                       ,
    i_category                char(50)                      ,
    i_manufact_id             integer                       ,
    i_manufact                char(50)                      ,
    i_size                    char(20)                      ,
    i_formulation             char(20)                      ,
    i_color                   char(20)                      ,
    i_units                   char(10)                      ,
    i_container               char(10)                      ,
    i_manager_id              integer                       ,
    i_product_name            char(50)
)cluster by (i_item_sk);

create table store
(
    s_store_sk                integer               ,
    s_store_id                char(16)              ,
    s_rec_start_date          date                          ,
    s_rec_end_date            date                          ,
    s_closed_date_sk          integer                       ,
    s_store_name              char(50)                   ,
    s_number_employees        integer                       ,
    s_floor_space             integer                       ,
    s_hours                   char(20)                      ,
    s_manager                 char(40)                   ,
    s_market_id               integer                       ,
    s_geography_class         char(100)                  ,
    s_market_desc             char(100)                  ,
    s_market_manager          char(40)                   ,
    s_division_id             integer                       ,
    s_division_name           char(50)                   ,
    s_company_id              integer                       ,
    s_company_name            char(50)                   ,
    s_street_number           char(10)                   ,
    s_street_name             char(60)                   ,
    s_street_type             char(15)                      ,
    s_suite_number            char(10)                      ,
    s_city                    char(60)                   ,
    s_county                  char(30)                   ,
    s_state                   char(2)                       ,
    s_zip                     char(10)                      ,
    s_country                 char(20)                   ,
    s_gmt_offset              double                  ,
    s_tax_precentage          double
)cluster by (s_store_sk);

create table call_center
(
    cc_call_center_sk         integer               ,
    cc_call_center_id         char(16)              ,
    cc_rec_start_date         date                          ,
    cc_rec_end_date           date                          ,
    cc_closed_date_sk         integer                       ,
    cc_open_date_sk           integer                       ,
    cc_name                   char(50)                   ,
    cc_class                  char(50)                   ,
    cc_employees              integer                       ,
    cc_sq_ft                  integer                       ,
    cc_hours                  char(20)                      ,
    cc_manager                char(40)                   ,
    cc_mkt_id                 integer                       ,
    cc_mkt_class              char(50)                      ,
    cc_mkt_desc               char(100)                  ,
    cc_market_manager         char(40)                   ,
    cc_division               integer                       ,
    cc_division_name          char(50)                   ,
    cc_company                integer                       ,
    cc_company_name           char(50)                      ,
    cc_street_number          char(10)                      ,
    cc_street_name            char(60)                   ,
    cc_street_type            char(15)                      ,
    cc_suite_number           char(10)                      ,
    cc_city                   char(60)                   ,
    cc_county                 char(30)                   ,
    cc_state                  char(2)                       ,
    cc_zip                    char(10)                      ,
    cc_country                char(20)                   ,
    cc_gmt_offset             double                  ,
    cc_tax_percentage         double
)cluster by (cc_call_center_sk);

create table customer
(
    c_customer_sk             integer               not null,
    c_customer_id             char(16)              not null,
    c_current_cdemo_sk        integer                       ,
    c_current_hdemo_sk        integer                       ,
    c_current_addr_sk         integer                       ,
    c_first_shipto_date_sk    integer                       ,
    c_first_sales_date_sk     integer                       ,
    c_salutation              char(10)                      ,
    c_first_name              char(20)                      ,
    c_last_name               char(30)                      ,
    c_preferred_cust_flag     char(1)                       ,
    c_birth_day               integer                       ,
    c_birth_month             integer                       ,
    c_birth_year              integer                       ,
    c_birth_country           char(20)                   ,
    c_login                   char(13)                      ,
    c_email_address           char(50)                      ,
    c_last_review_date_sk     integer
)cluster by (c_customer_sk);

create table web_site
(
    web_site_sk               integer               ,
    web_site_id               char(16)              ,
    web_rec_start_date        date                          ,
    web_rec_end_date          date                          ,
    web_name                  char(50)                   ,
    web_open_date_sk          integer                       ,
    web_close_date_sk         integer                       ,
    web_class                 char(50)                   ,
    web_manager               char(40)                   ,
    web_mkt_id                integer                       ,
    web_mkt_class             char(50)                   ,
    web_mkt_desc              char(100)                  ,
    web_market_manager        char(40)                   ,
    web_company_id            integer                       ,
    web_company_name          char(50)                      ,
    web_street_number         char(10)                      ,
    web_street_name           char(60)                   ,
    web_street_type           char(15)                      ,
    web_suite_number          char(10)                      ,
    web_city                  char(60)                   ,
    web_county                char(30)                   ,
    web_state                 char(2)                       ,
    web_zip                   char(10)                      ,
    web_country               char(20)                   ,
    web_gmt_offset            double                  ,
    web_tax_percentage        double
)cluster by (web_site_sk);

create table store_returns
(
    sr_returned_date_sk       integer                       ,
    sr_return_time_sk         integer                       ,
    sr_item_sk                integer               ,
    sr_customer_sk            integer                       ,
    sr_cdemo_sk               integer                       ,
    sr_hdemo_sk               integer                       ,
    sr_addr_sk                integer                       ,
    sr_store_sk               integer                       ,
    sr_reason_sk              integer                       ,
    sr_ticket_number          integer               ,
    sr_return_quantity        integer                       ,
    sr_return_amt             double                  ,
    sr_return_tax             double                  ,
    sr_return_amt_inc_tax     double                 ,
    sr_fee                    double                 ,
    sr_return_ship_cost       double                  ,
    sr_refunded_cash          double                  ,
    sr_reversed_charge        double                  ,
    sr_store_credit           double                  ,
    sr_net_loss               double
)cluster by (sr_item_sk, sr_ticket_number);

create table household_demographics
(
    hd_demo_sk                integer               ,
    hd_income_band_sk         integer                       ,
    hd_buy_potential          char(15)                      ,
    hd_dep_count              integer                       ,
    hd_vehicle_count          integer
)cluster by (hd_demo_sk);

create table web_page
(
    wp_web_page_sk            integer               ,
    wp_web_page_id            char(16)              ,
    wp_rec_start_date         date                          ,
    wp_rec_end_date           date                          ,
    wp_creation_date_sk       integer                       ,
    wp_access_date_sk         integer                       ,
    wp_autogen_flag           char(1)                       ,
    wp_customer_sk            integer                       ,
    wp_url                    char(100)                  ,
    wp_type                   char(50)                      ,
    wp_char_count             integer                       ,
    wp_link_count             integer                       ,
    wp_image_count            integer                       ,
    wp_max_ad_count           integer
)cluster by (wp_web_page_sk);

create table promotion
(
    p_promo_sk                integer               ,
    p_promo_id                char(16)              ,
    p_start_date_sk           integer                       ,
    p_end_date_sk             integer                       ,
    p_item_sk                 integer                       ,
    p_cost                    double                 ,
    p_response_target         integer                       ,
    p_promo_name              char(50)                      ,
    p_channel_dmail           char(1)                       ,
    p_channel_email           char(1)                       ,
    p_channel_catalog         char(1)                       ,
    p_channel_tv              char(1)                       ,
    p_channel_radio           char(1)                       ,
    p_channel_press           char(1)                       ,
    p_channel_event           char(1)                       ,
    p_channel_demo            char(1)                       ,
    p_channel_details         char(100)                  ,
    p_purpose                 char(15)                      ,
    p_discount_active         char(1)
)cluster by (p_promo_sk);

create table catalog_page
(
    cp_catalog_page_sk        integer               ,
    cp_catalog_page_id        char(16)              ,
    cp_start_date_sk          integer                       ,
    cp_end_date_sk            integer                       ,
    cp_department             char(50)                   ,
    cp_catalog_number         integer                       ,
    cp_catalog_page_number    integer                       ,
    cp_description            char(100)                  ,
    cp_type                   char(100)
)cluster by (cp_catalog_page_sk);

create table inventory
(
    inv_date_sk               integer               not null,
    inv_item_sk               integer               not null,
    inv_warehouse_sk          integer               not null,
    inv_quantity_on_hand      integer
)cluster by (inv_date_sk, inv_item_sk, inv_warehouse_sk);

create table catalog_returns
(
    cr_returned_date_sk       integer                       ,
    cr_returned_time_sk       integer                       ,
    cr_item_sk                integer               ,
    cr_refunded_customer_sk   integer                       ,
    cr_refunded_cdemo_sk      integer                       ,
    cr_refunded_hdemo_sk      integer                       ,
    cr_refunded_addr_sk       integer                       ,
    cr_returning_customer_sk  integer                       ,
    cr_returning_cdemo_sk     integer                       ,
    cr_returning_hdemo_sk     integer                       ,
    cr_returning_addr_sk      integer                       ,
    cr_call_center_sk         integer                       ,
    cr_catalog_page_sk        integer                       ,
    cr_ship_mode_sk           integer                       ,
    cr_warehouse_sk           integer                       ,
    cr_reason_sk              integer                       ,
    cr_order_number           integer               ,
    cr_return_quantity        integer                       ,
    cr_return_amount          double                  ,
    cr_return_tax             double                  ,
    cr_return_amt_inc_tax     double                  ,
    cr_fee                    double                  ,
    cr_return_ship_cost       double                  ,
    cr_refunded_cash          double                  ,
    cr_reversed_charge        double                 ,
    cr_store_credit           double                  ,
    cr_net_loss               double
)cluster by (cr_item_sk, cr_order_number);

create table web_returns
(
    wr_returned_date_sk       integer                       ,
    wr_returned_time_sk       integer                       ,
    wr_item_sk                integer               ,
    wr_refunded_customer_sk   integer                       ,
    wr_refunded_cdemo_sk      integer                       ,
    wr_refunded_hdemo_sk      integer                       ,
    wr_refunded_addr_sk       integer                       ,
    wr_returning_customer_sk  integer                       ,
    wr_returning_cdemo_sk     integer                       ,
    wr_returning_hdemo_sk     integer                       ,
    wr_returning_addr_sk      integer                       ,
    wr_web_page_sk            integer                       ,
    wr_reason_sk              integer                       ,
    wr_order_number           integer               ,
    wr_return_quantity        integer                       ,
    wr_return_amt             double                  ,
    wr_return_tax             double                  ,
    wr_return_amt_inc_tax     double                  ,
    wr_fee                    double                  ,
    wr_return_ship_cost       double                  ,
    wr_refunded_cash          double                  ,
    wr_reversed_charge        double                  ,
    wr_account_credit         double                  ,
    wr_net_loss               double
)cluster by (wr_item_sk, wr_order_number);

create table web_sales
(
    ws_sold_date_sk           integer                       ,
    ws_sold_time_sk           integer                       ,
    ws_ship_date_sk           integer                       ,
    ws_item_sk                integer                       ,
    ws_bill_customer_sk       integer                       ,
    ws_bill_cdemo_sk          integer                       ,
    ws_bill_hdemo_sk          integer                       ,
    ws_bill_addr_sk           integer                       ,
    ws_ship_customer_sk       integer                       ,
    ws_ship_cdemo_sk          integer                       ,
    ws_ship_hdemo_sk          integer                       ,
    ws_ship_addr_sk           integer                       ,
    ws_web_page_sk            integer                       ,
    ws_web_site_sk            integer                       ,
    ws_ship_mode_sk           integer                       ,
    ws_warehouse_sk           integer                       ,
    ws_promo_sk               integer                       ,
    ws_order_number           integer                       ,
    ws_quantity               integer                       ,
    ws_wholesale_cost         double                        ,
    ws_list_price             double                        ,
    ws_sales_price            double                        ,
    ws_ext_discount_amt       double                        ,
    ws_ext_sales_price        double                        ,
    ws_ext_wholesale_cost     double                        ,
    ws_ext_list_price         double                        ,
    ws_ext_tax                double                        ,
    ws_coupon_amt             double                        ,
    ws_ext_ship_cost          double                        ,
    ws_net_paid               double                        ,
    ws_net_paid_inc_tax       double                        ,
    ws_net_paid_inc_ship      double                        ,
    ws_net_paid_inc_ship_tax  double                        ,
    ws_net_profit             double
)cluster by (ws_item_sk, ws_order_number);

create table catalog_sales
(
    cs_sold_date_sk           integer                       ,
    cs_sold_time_sk           integer                       ,
    cs_ship_date_sk           integer                       ,
    cs_bill_customer_sk       integer                       ,
    cs_bill_cdemo_sk          integer                       ,
    cs_bill_hdemo_sk          integer                       ,
    cs_bill_addr_sk           integer                       ,
    cs_ship_customer_sk       integer                       ,
    cs_ship_cdemo_sk          integer                       ,
    cs_ship_hdemo_sk          integer                       ,
    cs_ship_addr_sk           integer                       ,
    cs_call_center_sk         integer                       ,
    cs_catalog_page_sk        integer                       ,
    cs_ship_mode_sk           integer                       ,
    cs_warehouse_sk           integer                       ,
    cs_item_sk                integer                       ,
    cs_promo_sk               integer                       ,
    cs_order_number           integer                       ,
    cs_quantity               integer                       ,
    cs_wholesale_cost         double                        ,
    cs_list_price             double                        ,
    cs_sales_price            double                        ,
    cs_ext_discount_amt       double                        ,
    cs_ext_sales_price        double                        ,
    cs_ext_wholesale_cost     double                        ,
    cs_ext_list_price         double                        ,
    cs_ext_tax                double                        ,
    cs_coupon_amt             double                        ,
    cs_ext_ship_cost          double                        ,
    cs_net_paid               double                        ,
    cs_net_paid_inc_tax       double                        ,
    cs_net_paid_inc_ship      double                        ,
    cs_net_paid_inc_ship_tax  double                        ,
    cs_net_profit             double
)cluster by (cs_item_sk, cs_order_number);

create table store_sales
(
    ss_sold_date_sk           integer                       ,
    ss_sold_time_sk           integer                       ,
    ss_item_sk                integer                       ,
    ss_customer_sk            integer                       ,
    ss_cdemo_sk               integer                       ,
    ss_hdemo_sk               integer                       ,
    ss_addr_sk                integer                       ,
    ss_store_sk               integer                       ,
    ss_promo_sk               integer                       ,
    ss_ticket_number          integer                       ,
    ss_quantity               integer                       ,
    ss_wholesale_cost         double                        ,
    ss_list_price             double                        ,
    ss_sales_price            double                        ,
    ss_ext_discount_amt       double                        ,
    ss_ext_sales_price        double                        ,
    ss_ext_wholesale_cost     double                        ,
    ss_ext_list_price         double                        ,
    ss_ext_tax                double                        ,
    ss_coupon_amt             double                        ,
    ss_net_paid               double                        ,
    ss_net_paid_inc_tax       double                        ,
    ss_net_profit             double
)cluster by (ss_item_sk, ss_ticket_number);

