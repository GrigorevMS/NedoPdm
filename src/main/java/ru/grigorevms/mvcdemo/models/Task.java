package ru.grigorevms.mvcdemo.models;

import java.sql.Timestamp;

public class Task {
    private Integer id;
    private Integer executor;
    private String executorStr;
    private Integer client;
    private String clientStr;
    private String text;
    private Integer target;
    private String targetStr;
    private Integer count;
    private String status;
    private Timestamp time;

    public Task() {}

    public Task(Integer id, Integer executor, String executorStr, Integer client, String clientStr,
                String text, Integer target, String targetStr, Integer count,
                String status, Timestamp time) {
        this.id = id;
        this.executor = executor;
        this.executorStr = executorStr;
        this.client = client;
        this.clientStr = clientStr;
        this.text = text;
        this.target = target;
        this.targetStr = targetStr;
        this.count = count;
        this.status = status;
        this.time = time;
    }

    @Override
    public String toString() {
        return String.format("Исполнитель: %s/n" + "Заказчик: %s\n" + "Описание: %s\n" + "Статус: %s\n",
                executorStr, clientStr, targetStr, status);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getExecutor() {
        return executor;
    }

    public void setExecutor(Integer executor) {
        this.executor = executor;
    }

    public Integer getClient() {
        return client;
    }

    public void setClient(Integer client) {
        this.client = client;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getTarget() {
        return target;
    }

    public void setTarget(Integer target) {
        this.target = target;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getExecutorStr() {
        return executorStr;
    }

    public void setExecutorStr(String executorStr) {
        this.executorStr = executorStr;
    }

    public String getClientStr() {
        return clientStr;
    }

    public void setClientStr(String clientStr) {
        this.clientStr = clientStr;
    }

    public String getTargetStr() {
        return targetStr;
    }

    public void setTargetStr(String targetStr) {
        this.targetStr = targetStr;
    }
}
