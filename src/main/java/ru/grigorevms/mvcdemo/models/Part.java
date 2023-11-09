package ru.grigorevms.mvcdemo.models;

import java.util.List;

public class Part {
    private Long id;
    private String description;
    private String name;
    private List<Long> parents;
    private String text;
    private Integer count;
    private Integer level;

    public Part() {}
    public Part(Long id, String description, String name) {
        this.id = id;
        this.description = description;
        this.name = name;
    }
    public Part(Long id, String description, String name, List<Long> parents, String text, Integer count) {
        this.id = id;
        this.description = description;
        this.name = name;
        this.parents = parents;
        this.text = text;
        this.count = count;
    }

    @Override
    public String toString() {
        return String.format("%s - %s", description, name);
    }

    public String getStringForm() {
        return String.format("%d, %s, %s, %s", id, description, name, text);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Long> getParents() {
        return parents;
    }

    public void setParents(List<Long> parents) {
        this.parents = parents;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
