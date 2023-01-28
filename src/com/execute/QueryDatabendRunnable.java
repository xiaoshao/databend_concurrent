package com.execute;

import scala.collection.parallel.immutable.ParRange;

import java.sql.*;

public class QueryDatabendRunnable implements Runnable {

    private long duration = 0L;
    private long times = 0L;

    private Connection con = null;

    private String sql = null;

    private int count = 0;

    public QueryDatabendRunnable(String url, String username, String password, String sql) throws SQLException {
        this.con = DriverManager.getConnection(url, username, password);
        this.sql = sql;
    }

    @Override
    public void run() {
        try {
            for (long index = 0; index < 10; index++) {
                long start = System.currentTimeMillis();
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    count++;
                }

                long durationNow = System.currentTimeMillis() - start;
                this.duration += durationNow;
                this.times++;

                if (60000 - durationNow > 0) {
                    Thread.currentThread().sleep(60000 - durationNow);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public long getDuration() {
        return duration;
    }

    public long getTimes() {
        return times;
    }

    private int getCount() {
        return count;
    }
}
