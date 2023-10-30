package ru.grigorevms.mvcdemo.models;

public class TaskFilterLine {
    private Long userId;
    private Long partId;
    private String status;

    public TaskFilterLine(Long userId, Long partId, String status) {
        this.userId = userId;
        this.partId = partId;
        this.status = status;
    }
    public TaskFilterLine() {}

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPartId() {
        return partId;
    }

    public void setPartId(Long partId) {
        this.partId = partId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
