package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.grigorevms.mvcdemo.models.Part;
import ru.grigorevms.mvcdemo.models.Task;
import ru.grigorevms.mvcdemo.models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class TaskDAO {
    @Autowired
    private DatabaseConnector dbConnector;
    @Autowired
    private UserDAO userDao;
    @Autowired
    private PartDAO partDAO;

    public List<Task> getAllTasks() {
        String sql = "SELECT * FROM tasks ORDER BY time DESC";
        ResultSet result = dbConnector.executeSelect(sql);
        List<Task> tasks = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                User executor = userDao.getUser(result.getInt("executor"));
                User client = userDao.getUser(result.getInt("client"));
                Part target = partDAO.getPart(result.getLong("target"));
                tasks.add(new Task(result.getInt("id"),
                                    result.getInt("executor"),
                                    executor.getName() + " " + executor.getSurname(),
                                    result.getInt("client"),
                                    client.getName() + " " + client.getSurname(),
                                    result.getString("text"),
                                    result.getInt("target"),
                                    target.getDescription(),
                                    result.getInt("count"),
                                    result.getString("status"),
                                    result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return tasks;
    }

    public List<Task> getAllUserTasks(Integer userId) {
        String sql = String.format("SELECT * FROM tasks WHERE executor=%d ORDER BY time DESC;", userId);
        ResultSet result = dbConnector.executeSelect(sql);
        List<Task> tasks = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                User executor = userDao.getUser(result.getInt("executor"));
                User client = userDao.getUser(result.getInt("client"));
                Part target = partDAO.getPart(result.getLong("target"));
                tasks.add(new Task(result.getInt("id"),
                        result.getInt("executor"),
                        executor.getName() + " " + executor.getSurname(),
                        result.getInt("client"),
                        client.getName() + " " + client.getSurname(),
                        result.getString("text"),
                        result.getInt("target"),
                        target.getDescription(),
                        result.getInt("count"),
                        result.getString("status"),
                        result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return tasks;
    }

    public Task getTaskById(Integer taskId) {
        String sql = String.format("SELECT * FROM tasks WHERE id=%d ORDER BY time DESC;", taskId);
        ResultSet result = dbConnector.executeSelect(sql);
        try {
            result.next();
            User executor = userDao.getUser(result.getInt("executor"));
            User client = userDao.getUser(result.getInt("client"));
            Part target = partDAO.getPart(result.getLong("target"));
            return new Task(result.getInt("id"),
                    result.getInt("executor"),
                    executor.getName() + " " + executor.getSurname(),
                    result.getInt("client"),
                    client.getName() + " " + client.getSurname(),
                    result.getString("text"),
                    result.getInt("target"),
                    target.getDescription(),
                    result.getInt("count"),
                    result.getString("status"),
                    result.getTimestamp("time"));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return new Task();
    }

    public List<Task> getInWorkUserTasks(Integer userId) {
        String sql = String.format("SELECT * FROM tasks WHERE executor=%d AND status='in work' ORDER BY time DESC;", userId);
        ResultSet result = dbConnector.executeSelect(sql);
        List<Task> tasks = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                User executor = userDao.getUser(result.getInt("executor"));
                User client = userDao.getUser(result.getInt("client"));
                Part target = partDAO.getPart(result.getLong("target"));
                tasks.add(new Task(result.getInt("id"),
                        result.getInt("executor"),
                        executor.getName() + " " + executor.getSurname(),
                        result.getInt("client"),
                        client.getName() + " " + client.getSurname(),
                        result.getString("text"),
                        result.getInt("target"),
                        target.getDescription(),
                        result.getInt("count"),
                        result.getString("status"),
                        result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return tasks;
    }

    public List<Task> getNotStartedUserTasks(Integer userId) {
        String sql = String.format("SELECT * FROM tasks WHERE executor=%d AND status='not started' ORDER BY time DESC;", userId);
        ResultSet result = dbConnector.executeSelect(sql);
        List<Task> tasks = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                User executor = userDao.getUser(result.getInt("executor"));
                User client = userDao.getUser(result.getInt("client"));
                Part target = partDAO.getPart(result.getLong("target"));
                tasks.add(new Task(result.getInt("id"),
                        result.getInt("executor"),
                        executor.getName() + " " + executor.getSurname(),
                        result.getInt("client"),
                        client.getName() + " " + client.getSurname(),
                        result.getString("text"),
                        result.getInt("target"),
                        target.getDescription(),
                        result.getInt("count"),
                        result.getString("status"),
                        result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return tasks;
    }

    public List<Task> getFinishedUserTasks(Integer userId) {
        String sql = String.format("SELECT * FROM tasks WHERE executor=%d AND status='finished'  ORDER BY time DESC;", userId);
        ResultSet result = dbConnector.executeSelect(sql);
        List<Task> tasks = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                User executor = userDao.getUser(result.getInt("executor"));
                User client = userDao.getUser(result.getInt("client"));
                Part target = partDAO.getPart(result.getLong("target"));
                tasks.add(new Task(result.getInt("id"),
                        result.getInt("executor"),
                        executor.getName() + " " + executor.getSurname(),
                        result.getInt("client"),
                        client.getName() + " " + client.getSurname(),
                        result.getString("text"),
                        result.getInt("target"),
                        target.getDescription(),
                        result.getInt("count"),
                        result.getString("status"),
                        result.getTimestamp("time")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return tasks;
    }

    public int startTask(Task taskForStart) {
        String sql = String.format("UPDATE tasks SET status='in work', start_time=CURRENT_TIMESTAMP WHERE id=%d;", taskForStart.getId());
        return dbConnector.executeUpdate(sql);
    }

    public int finishTask(Task taskForFinish) {
        String sql = String.format("UPDATE tasks SET status='finished', finish_time=CURRENT_TIMESTAMP WHERE id=%d;", taskForFinish.getId());
        return dbConnector.executeUpdate(sql);
    }

    public int addTask(Task newTask) {
        String sql = String.format("INSERT INTO tasks (executor, client, text, target, count, status) VALUES (%d, %d, '%s', %d, %d, 'not started')",
                newTask.getExecutor(), newTask.getClient(), newTask.getText(), newTask.getTarget(), newTask.getCount());
        return  dbConnector.executeUpdate(sql);
    }

    public int deleteTask(Task taskForDelete) {
        String sql = String.format("DELETE FROM tasks WHERE id=%d;", taskForDelete.getId());
        return dbConnector.executeUpdate(sql);
    }
}
