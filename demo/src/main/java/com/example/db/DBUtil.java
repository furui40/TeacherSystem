package com.example.db;

import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/db02";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    private static Connection connection;
    private static Statement statement;
    private static ResultSet resultSet;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL Driver not found!");
        }
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }

    public static void close() {
        close(connection, statement, resultSet);
    }

    public static int querySingleValue(String query, String param) {
        int result = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, param);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void close(Connection con, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection con, Statement stmt) {
        close(con, stmt, null);
    }

    public static void close(Connection con) {
        close(con, null, null);
    }

    public static int executeUpdate(String sql, Object... params) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setParameters(ps, params);
            return ps.executeUpdate();
        }
    }

    public static int executeUpdateAndGetGeneratedKey(String sql, Object... params) throws SQLException {
        int generatedKey = -1;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            setParameters(ps, params);

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedKey = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        }

        return generatedKey;
    }



    public static ResultSet executeQuery(String sql, Object... params) throws SQLException {
        connection = getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        setParameters(ps, params);
        resultSet = ps.executeQuery();
        statement = ps; // Keeping the statement reference for closing later
        return resultSet;
    }

    private static void setParameters(PreparedStatement ps, Object... params) throws SQLException {
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }
        }
    }
}
