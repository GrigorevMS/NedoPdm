package ru.grigorevms.mvcdemo.models;

import org.springframework.web.multipart.MultipartFile;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;

public class File {
    private Long id;
    private Long parent;    // parent id
    private String name;
    private MultipartFile file;
    private String path;
    private Timestamp time;

    public File() {}
    public File(Long parent, String name, MultipartFile file) {
        this.parent = parent;

        byte[] bytes = name.getBytes(StandardCharsets.ISO_8859_1);
        this.name = new String(bytes, StandardCharsets.UTF_8);

        this.file = file;
    }
    public File(Long id, Long parent, String name, String path, Timestamp time) {
        this.id = id;
        this.parent = parent;
        this.name = name;
        this.path = path;
        this.time = time;
    }

    public String toStr() {
        return id + "; " + parent + "; " + name + "; " + path + "; " + time.toString();
    }

    public Long getParent() {
        return parent;
    }

    public void setParent(Long parent) {
        this.parent = parent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
