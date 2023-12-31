package ru.grigorevms.mvcdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.grigorevms.mvcdemo.dao.Logger;
import ru.grigorevms.mvcdemo.dao.PartDAO;
import ru.grigorevms.mvcdemo.dao.TaskDAO;
import ru.grigorevms.mvcdemo.dao.UserDAO;
import ru.grigorevms.mvcdemo.models.Part;
import ru.grigorevms.mvcdemo.models.Task;
import ru.grigorevms.mvcdemo.models.TaskFilterLine;
import ru.grigorevms.mvcdemo.models.User;

import java.nio.charset.StandardCharsets;
import java.util.List;

@RequestMapping("/task")
@Controller
public class TaskController {
    @Autowired
    private UserDAO userDao;
    @Autowired
    private TaskDAO taskDao;
    @Autowired
    private PartDAO partDAO;
    @Autowired
    private Logger logger;

    @GetMapping("/task/{id}")
    public String redirectTask(@ModelAttribute("user") User user,
                               RedirectAttributes atr) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            return "redirect:/task/{id}";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}")
    public String showTaskInfo(@ModelAttribute("user") User user,
                               @PathVariable("id") Integer taskId,
                               Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            model.addAttribute("task", taskDao.getTaskById(taskId));
            return "task/info";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/start")
    public String startTask(@ModelAttribute("user") User user,
                            RedirectAttributes atr,
                            @PathVariable("id") Integer taskId,
                            Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            Task task = taskDao.getTaskById(taskId);
            model.addAttribute("task", task);
            if (task.getStatus().equals("not started")) {
                taskDao.startTask(task);
                logger.writeLog(user, "start task", Integer.toString(task.getId()));
            }
            return "redirect:/task/{id}";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/finish")
    public String finishTask(@ModelAttribute("user") User user,
                            RedirectAttributes atr,
                            @PathVariable("id") Integer taskId,
                            Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            Task task = taskDao.getTaskById(taskId);
            model.addAttribute("task", task);
            if (task.getStatus().equals("in work")) {
                taskDao.finishTask(task);
                logger.writeLog(user, "finish task", Integer.toString(task.getId()));
            }
            return "redirect:/task/{id}";
        }
        return "redirect:/login";
    }

    @GetMapping("/notstarted")
    public String showNotStartedTasks(@ModelAttribute("user") User user,
                                      Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());

            model.addAttribute("tasks", taskDao.getNotStartedUserTasks(user.getId()));

            return "task/notstarted";
        }
        return "redirect:/login";
    }

    @GetMapping("/finished")
    public String showfinishedTasks(@ModelAttribute("user") User user,
                                      Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());

            model.addAttribute("tasks", taskDao.getFinishedUserTasks(user.getId()));

            return "task/finished";
        }
        return "redirect:/login";
    }

    @GetMapping("/add")
    public String showAddNewTaskForm(@ModelAttribute("user") User user,
                                     @ModelAttribute("newTask") Task newTask,
                                     RedirectAttributes atr,
                                     Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());
            if (user.getRole().equals("admin")) {

                model.addAttribute("users", userDao.getUsers());
                model.addAttribute("parts", partDAO.getAllParts());

                return "task/add";
            }
            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @PostMapping("/add")
    public String addNewTask(@ModelAttribute("user") User user,
                             @ModelAttribute("newTask") Task newTask,
                             @RequestParam("text") String text,
                             RedirectAttributes atr,
                             Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            if (user.getRole().equals("admin")) {
                model.addAttribute("users", userDao.getUsers());
                atr.addAttribute("login", user.getLogin());
                atr.addAttribute("password", user.getPassword());

                byte[] bytes = text.getBytes(StandardCharsets.ISO_8859_1);
                text = new String(bytes, StandardCharsets.UTF_8);

                newTask.setText(text);
                newTask.setClient(user.getId());

                taskDao.addTask(newTask);
                logger.writeLog(user, "add task", "Executor - " + newTask.getExecutor() +
                                                            "\nClient - " + newTask.getClient() +
                                                            "\nTarget - " + newTask.getTarget() +
                                                            "\nText - " + newTask.getText());

                return "redirect:/main";
            }
        }
        return "redirect:/login";
    }

    @GetMapping("/all")
    public String showAllTasks(@ModelAttribute("user") User user,
                               RedirectAttributes atr,
                               Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());
            if (user.getRole().equals("admin")) {
                model.addAttribute("tasks", taskDao.getAllTasks());

                List<User> users = userDao.getUsers();
                users.add(0, new User(-1, "", ""));
                model.addAttribute("users", users);

                List<Part> parts = partDAO.getAllParts();
                parts.add(0, new Part((long)-1, "", ""));
                model.addAttribute("parts", parts);

                model.addAttribute("filters", new TaskFilterLine());
                return "task/all";
            }
            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @PostMapping("/all")
    public String updateShowAllTasks(@ModelAttribute("user") User user,
                                     @ModelAttribute("filters") TaskFilterLine filterLine,
                                     RedirectAttributes atr,
                                     Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());
            if (user.getRole().equals("admin")) {
                model.addAttribute("tasks", taskDao.getTasksWithFilter(filterLine));

                List<User> users = userDao.getUsers();
                users.add(0, new User(-1, "", ""));
                model.addAttribute("users", users);

                List<Part> parts = partDAO.getAllParts();
                parts.add(0, new Part((long)-1, "", ""));
                model.addAttribute("parts", parts);

                return "task/all";
            }
            return "redirect: /main";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/delete")
    public String deleteTask(@ModelAttribute("user") User user,
                             @PathVariable("id") Integer id,
                             RedirectAttributes atr,
                             Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            user = userDao.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            Task task = taskDao.getTaskById(id);
            if (user.getRole().equals("admin") && !task.getStatus().equals("finished")) {
                taskDao.deleteTask(task);
                taskDao.adddeletedTask(task);
                logger.writeLog(user, "delete task", Integer.toString(id));

                return "redirect:/main";
            }
            return "redirect:/task/{id}";
        }
        return "redirect:/login";
    }
}
