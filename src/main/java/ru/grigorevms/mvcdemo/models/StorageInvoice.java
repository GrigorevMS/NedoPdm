package ru.grigorevms.mvcdemo.models;

import java.util.ArrayList;
import java.util.List;

public class StorageInvoice {
    private List<StorageInvoiceLine> lines = new ArrayList<>();

    public void addLine(StorageInvoiceLine line) {
        lines.add(line);
    }

    public void removeLastLine() {
        if (lines.size() > 0) {
            lines.remove(lines.size() - 1);
        }
    }

    public List<StorageInvoiceLine> getLines() {
        return lines;
    }

    public void setLines(List<StorageInvoiceLine> lines) {
        this.lines = lines;
    }
}
