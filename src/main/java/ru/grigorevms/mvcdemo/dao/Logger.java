package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.grigorevms.mvcdemo.models.User;

@Component
public class Logger {
    @Autowired
    private DatabaseConnector dbConnector;

    public int writeLog(Long userId, String action, String info) {
        String sql = String.format("INSERT INTO logs (user_id, action, info) VALUES (%d, '%s', '%s')",
                userId, action, info);
        return dbConnector.executeUpdate(sql);
    }

    public int writeLog(User user, String action, String info) {
        return writeLog((long) user.getId(), action, info);
    }
}
