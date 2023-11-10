package ru.grigorevms.mvcdemo.dao;

import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;
import javax.swing.plaf.nimbus.State;
import java.io.BufferedReader;
import java.sql.*;

@Component
public class DatabaseConnector {
    private static final String DB_URL = "jdbc:postgresql://127.0.0.1:5432/nedopdm";
    private static final String USER = "postgres";
    private static final String PASS = "1234";

    private Connection dbConnection;

    public DatabaseConnector() {
        try {
            Class.forName("org.postgresql.Driver");
            dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.err.println("Connection to DB has been created!!!");
        } catch (SQLException | ClassNotFoundException throwables) {
            System.err.println("Some problem with DB...");
            throwables.printStackTrace();
        }
    }

    public synchronized int executeUpdate(String query) {
        synchronized (this) {
            Statement statement = null;
            Statement logStatement = null;
            try {
                logStatement = dbConnection.createStatement();
                String sql = String.valueOf(query);
                String sqlFinal = "";
                for (int i = 0; i < sql.length(); i++) {
                    sqlFinal += sql.charAt(i);
                    if (sql.charAt(i) == '\'') {
                        sqlFinal += "'";
                    }
                }
                logStatement.executeUpdate(String.format("INSERT INTO sqllogs (sql_text) VALUES ('%s');", sqlFinal));
                statement = dbConnection.createStatement();
                return statement.executeUpdate(query);
            } catch (SQLException throwables) {
                System.err.println("DatabaseConnector executeUpdate error");
                throwables.printStackTrace();
                return -1;
            }
        }
    }

    public synchronized ResultSet executeSelect(String query) {
        synchronized (this) {
            PreparedStatement statement = null;
            Statement logStatement = null;
            try {
                logStatement = dbConnection.createStatement();
                String sql = String.valueOf(query);
                String sqlFinal = "";
                for (int i = 0; i < sql.length(); i++) {
                    sqlFinal += sql.charAt(i);
                    if (sql.charAt(i) == '\'') {
                        sqlFinal += "'";
                    }
                }
                logStatement.executeUpdate(String.format("INSERT INTO sqllogs (sql_text) VALUES ('%s');", sqlFinal));
                statement = dbConnection.prepareStatement(query);
                boolean hasResult = statement.execute();
                if (hasResult) {
                    return statement.getResultSet();
                } else {
                    return null;
                }
            } catch (SQLException throwables) {
                System.err.println("DatabaseConnector executeSelect error");
                throwables.printStackTrace();
                return null;
            }
        }
    }

    @PreDestroy
    public void destroy() throws Exception {
        dbConnection.close();
        DriverManager.deregisterDriver(DriverManager.getDrivers().nextElement());
    }

}
