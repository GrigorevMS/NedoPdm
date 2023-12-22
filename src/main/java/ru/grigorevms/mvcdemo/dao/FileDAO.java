package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.grigorevms.mvcdemo.models.File;
import ru.grigorevms.mvcdemo.models.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class FileDAO {
    @Autowired
    private DatabaseConnector dbConnector;

    private static String STORAGE_PATH = "D:\\Projects\\NedoPDMStorage";
    private static String[] RUS_ALPHBT = {"А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О",
            "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я",
            "а", "б", "в", "г", "д", "е", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р",
            "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"};
    private static String[] ENG_ALPHBT = {"A", "B", "V", "G", "D", "E", "Zh", "Z", "I", "I", "K", "L", "M", "N", "O",
            "P", "R", "S", "T", "Y", "F", "X", "Ts", "Ch", "Sh", "Shch", "b", "Y", "b", "E", "Yu", "Ya",
            "a", "b", "v", "g", "d", "e", "zh", "z", "i", "i", "k", "l", "m", "n", "o", "p", "r",
            "s", "t", "u", "f", "kh", "ts", "ch", "sh", "shch", "b", "y", "b", "e", "yu", "ya"};
    private int indAtArr(String[] arr, String el) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].equals(el)) {
                return i;
            }
        }
        return -1;
    }

    public void addFileToDatabase(File newFile) {
        String sql = "";
        ResultSet result = dbConnector.executeSelect("SELECT nextval('files_id_seq');");
        Long id = Long.valueOf(0);
        try {
            result.next();
            id = result.getLong("nextval");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        byte[] bytes = (id + "_" + newFile.getFile().getOriginalFilename()).getBytes(StandardCharsets.ISO_8859_1);
        String path = new String(bytes, StandardCharsets.UTF_8);
        String temp = "";
        for (int i = 0; i < path.length(); i++) {
            if (1040 <= (int) path.charAt(i) && (int) path.charAt(i) <= 1103) {
                temp += ENG_ALPHBT[(int) path.charAt(i) - 1040];
            }
            else if ((int) path.charAt(i) == 1025) {
                temp += "Yo";
            }
            else if ((int) path.charAt(i) == 1105) {
                temp += "yo";
            }
            else {
                temp += path.charAt(i);
            }
        }
        path = temp;

        bytes = newFile.getName().getBytes(StandardCharsets.ISO_8859_1);
        String name = new String(bytes, StandardCharsets.UTF_8);

        sql = String.format("INSERT INTO files (id, parent, name, path) VALUES (%d, %d, '%s', '%s')",
                id, newFile.getParent(), name, STORAGE_PATH + "\\" + path);

        dbConnector.executeUpdate(sql);
        addFileToStorage(newFile, id);
    }

    private void addFileToStorage(File newFile, Long id) {
        try {
            byte[] bytes = (id + "_" + newFile.getFile().getOriginalFilename()).getBytes(StandardCharsets.ISO_8859_1);
            String tempPath = new String(bytes, StandardCharsets.UTF_8);
            String temp = "";
            for (int i = 0; i < tempPath.length(); i++) {
                if (1040 <= (int) tempPath.charAt(i) && (int) tempPath.charAt(i) <= 1103) {
                    temp += ENG_ALPHBT[(int) tempPath.charAt(i) - 1040];
                }
                else if ((int) tempPath.charAt(i) == 1025) {
                    temp += "Yo";
                }
                else if ((int) tempPath.charAt(i) == 1105) {
                    temp += "yo";
                }
                else {
                    temp += tempPath.charAt(i);
                }
            }
            tempPath = temp;

            Path path = Paths.get(STORAGE_PATH, tempPath);
            bytes = path.toString().getBytes(StandardCharsets.ISO_8859_1);
            path = Paths.get(new String(bytes, StandardCharsets.UTF_8));
            Path file = Files.createFile(path);

            FileOutputStream stream = new FileOutputStream(file.toString());
            stream.write(newFile.getFile().getBytes());
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<File> getListOfFiles(Long parentId) {
        String sql = String.format("SELECT * FROM files WHERE parent=%d ORDER BY id;",
                parentId);
        ResultSet result = dbConnector.executeSelect(sql);
        List<File> files = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                files.add(new File(result.getLong("id"),
                        result.getLong("parent"),
                        result.getString("name"),
                        result.getString("path"),
                        result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return files;
    }

    public File getFileById(Long fileId) {
        String sql = "";
        sql = String.format("SELECT * FROM files WHERE id=%d;", fileId);
        ResultSet resul = dbConnector.executeSelect(sql);
        try {
            resul.next();
            File file = new File(resul.getLong("id"),
                    resul.getLong("parent"),
                    resul.getString("name"),
                    resul.getString("path"),
                    resul.getTimestamp("time"));
            return file;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return new File();
    }
}
