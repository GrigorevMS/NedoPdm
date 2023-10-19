package ru.grigorevms.mvcdemo;

import org.springframework.beans.factory.annotation.Autowired;
import ru.grigorevms.mvcdemo.dao.DatabaseConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        System.out.println(list);
        list.add(0, 5);
        System.out.println(list);
        List<Integer> addedList = new ArrayList<>();
        addedList.add(6);
        addedList.add(7);
        addedList.add(8);
        list.addAll(3, addedList);
        System.out.println(list);
        list.remove(2);
        list.remove(4);
        System.out.println(list);
    }
}
