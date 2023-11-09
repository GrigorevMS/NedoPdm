package ru.grigorevms.mvcdemo.models;

public class File {
    private Long id;
    private Long parent;
    private String path;

    public File() {}
    public File(Long id, Long parent, String path) {
        this.id = id;
        this.parent = parent;
        this.path = path;
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
}
