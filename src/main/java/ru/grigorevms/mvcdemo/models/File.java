package ru.grigorevms.mvcdemo.models;

import org.springframework.web.multipart.MultipartFile;

public class File {
    private Long id;
    private Long parent;
    private String path;
    private MultipartFile file;

    public File() {}
    public File(Long id, Long parent, String path, MultipartFile file) {
        this.id = id;
        this.parent = parent;
        this.path = path;
        this.file = file;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParent() {
        return parent;
    }

    public void setParent(Long parent) {
        this.parent = parent;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
