package com;

import com.execute.QueryDatabendRunnable;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    private final static int THREADS_NUM = 8;
    private final static String URL = "jdbc:mysql://localhost:3306/hivek";
    private final static String[] SQLS = {"select * from roles;"};

    private final static String username = "root";
    private final static String passwd = "1qaz2wsx";

    public static void main(String[] args) throws SQLException, InterruptedException {
        List<QueryDatabendRunnable> queryDatabendRunnableList = new ArrayList<>();

        List<Thread> threads = new ArrayList<>();
        for (int index = 0; index < THREADS_NUM; index++) {
            QueryDatabendRunnable queryDatabendRunnable = new QueryDatabendRunnable(URL, username, passwd, SQLS[0]);
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