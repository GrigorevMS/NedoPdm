package ru.grigorevms.mvcdemo.models;

public class StorageInvoiceLine {
    private String action;
    private Long partId;
    private Long count;

    public StorageInvoiceLine() {
    }

    public StorageInvoiceLine(String action, Long partId, Long count) {
        this.action = action;
        this.partId = partId;
        this.count = count;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Long getPartId() {
        return partId;
    }

    public void setPartId(Long partId) {
        this.partId = partId;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
