package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import ru.grigorevms.mvcdemo.models.File;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDAO {
    @Autowired
    private DatabaseConnector dbConnector;

    public File getFileById(Long fileId) {
        String sql = String.format("SELECT * FROM files WHERE id=%d;", fileId);
        ResultSet result = dbConnector.executeSelect(sql);

        try {
            if (!result.next()) return null;
            else {
                return new File(result.getLong("id"),
                        result.getLong("parent"),
                        result.getString("path"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<File> getFilesByParentId(int parentId) {
        String sql = String.format("SELECT * FROM files WHERE parent=%d", parentId);
        ResultSet result = dbConnector.executeSelect(sql);

        ArrayList<File> files = new ArrayList<>();

        while (true) {
            try {
                if (!result.next()) break;
                files.add(new File(result.getLong("id"),
                        result.getLong("parent"),
                        result.getString("path")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return files;
    }
}
