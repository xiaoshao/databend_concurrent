package com;

import com.execute.QueryDatabendRunnable;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    private final static int THREADS_NUM = 8;

    private final static String[] URLS = {
            "jdbc:mysql://116.204.91.205:3307/test",
            "jdbc:mysql://116.204.110.132:3307/test",
            "jdbc:mysql://116.204.71.17:3307/test",
            "jdbc:mysql://121.37.69.104:3307/test"
    };
    private final static String URL = "jdbc:mysql://116.204.91.205:3307/test";
    private final static String[] SQLS = {"select avg(ss_quantity)\n" +
            "       ,avg(ss_ext_sales_price)\n" +
            "       ,avg(ss_ext_wholesale_cost)\n" +
            "       ,sum(ss_ext_wholesale_cost)\n" +
            " from store_sales\n" +
            "     ,store\n" +
            "     ,customer_demographics\n" +
            "     ,household_demographics\n" +
            "     ,customer_address\n" +
            "     ,date_dim\n" +
            " where s_store_sk = ss_store_sk\n" +
            " and  ss_sold_date_sk = d_date_sk and d_year = 2001\n" +
            " and((ss_hdemo_sk=hd_demo_sk\n" +
            "  and cd_demo_sk = ss_cdemo_sk\n" +
            "  and cd_marital_status = 'D'\n" +
            "  and cd_education_status = '2 yr Degree'\n" +
            "  and ss_sales_price between 100.00 and 150.00\n" +
            "  and hd_dep_count = 3   \n" +
            "     )or\n" +
            "     (ss_hdemo_sk=hd_demo_sk\n" +
            "  and cd_demo_sk = ss_cdemo_sk\n" +
            "  and cd_marital_status = 'S'\n" +
            "  and cd_education_status = 'Secondary'\n" +
            "  and ss_sales_price between 50.00 and 100.00   \n" +
            "  and hd_dep_count = 1\n" +
            "     ) or \n" +
            "     (ss_hdemo_sk=hd_demo_sk\n" +
            "  and cd_demo_sk = ss_cdemo_sk\n" +
            "  and cd_marital_status = 'W'\n" +
            "  and cd_education_status = 'Advanced Degree'\n" +
            "  and ss_sales_price between 150.00 and 200.00 \n" +
            "  and hd_dep_count = 1  \n" +
            "     ))\n" +
            " and((ss_addr_sk = ca_address_sk\n" +
            "  and ca_country = 'United States'\n" +
            "  and ca_state in ('CO', 'IL', 'MN')\n" +
            "  and ss_net_profit between 100 and 200  \n" +
            "     ) or\n" +
            "     (ss_addr_sk = ca_address_sk\n" +
            "  and ca_country = 'United States'\n" +
            "  and ca_state in ('OH', 'MT', 'NM')\n" +
            "  and ss_net_profit between 150 and 300  \n" +
            "     ) or\n" +
            "     (ss_addr_sk = ca_address_sk\n" +
            "  and ca_country = 'United States'\n" +
            "  and ca_state in ('TX', 'MO', 'MI')\n" +
            "  and ss_net_profit between 50 and 250  \n" +
            "     ))\n" +
            ";"};

    private final static String username = "zwshao";
    private final static String passwd = "zwshao";

    public static void main(String[] args) throws SQLException, InterruptedException {
        List<QueryDatabendRunnable> queryDatabendRunnableList = new ArrayList<>();

        List<Thread> threads = new ArrayList<>();
        for (int index = 0; index < THREADS_NUM; index++) {

            String url = URLS[index % 4];

            QueryDatabendRunnable queryDatabendRunnable = new QueryDatabendRunnable(url, username, passwd, SQLS[0]);
            queryDatabendRunnableList.add(queryDatabendRunnable);
            Thread thread = new Thread(queryDatabendRunnable);
            threads.add(thread);
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        for (QueryDatabendRunnable queryDatabendRunnable : queryDatabendRunnableList) {
            System.out.println(queryDatabendRunnable.getDuration() / queryDatabendRunnable.getTimes());
        }
    }
}