package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import ru.grigorevms.mvcdemo.models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserDAO {
    private DatabaseConnector dbConnector;

    @Autowired
    public UserDAO(DatabaseConnector dbConnector) {
        this.dbConnector = dbConnector;
    }

    public boolean checkUser(String login, String password) {
        String sql = String.format("SELECT COUNT(*) FROM users WHERE login='%s' AND password='%s'",
                login, password);
        ResultSet result = dbConnector.executeSelect(sql);

        if (result != null) {
            try {
                result.next();
                int count = result.getInt("count");
                if (count == 1) {
                    return true;
                }
                return false;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                return false;
            }
        } else {
            return false;
        }
    }

    public User getUser(String login) {
        String sql = String.format("SELECT * FROM users WHERE login='%s'", login);
        ResultSet result = dbConnector.executeSelect(sql);
        try {
            if (!result.next()) return null;
            else {
                return new User(result.getInt("id"),
                        result.getString("login"),
                        result.getString("password"),
                        result.getString("role"),
                        result.getString("name"),
                        result.getString("surname"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public User getUser(int id) {
        String sql = String.format("SELECT * FROM users WHERE id=%d", id);
        ResultSet result = dbConnector.executeSelect(sql);
        try {
            if (!result.next()) return null;
            else {
                return new User(result.getInt("id"),
                        result.getString("login"),
                        result.getString("password"),
                        result.getString("role"),
                        result.getString("name"),
                        result.getString("surname"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<User> getUsers() {
        ResultSet result = dbConnector.executeSelect("SELECT * FROM users;");
        List<User> users = new ArrayList<>();
        if (result != null) {
            while (true) {
                try {
                    if (!result.next()) break;
                    users.add(new User(result.getInt("id"),
                            result.getString("login"),
                            result.getString("password"),
                            result.getString("role"),
                            result.getString("name"),
                            result.getString("surname")));
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        }
        return users;
    }

    public int addUser(String login, String password, String role) {
        String sql = String.format("INSERT INTO users (login, password, role) VALUES (%s, %s, %s)",
                login, password, role);
        return dbConnector.executeUpdate(sql);
    }
}
