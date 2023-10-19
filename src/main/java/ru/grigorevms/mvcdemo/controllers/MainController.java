package ru.grigorevms.mvcdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.grigorevms.mvcdemo.dao.PartDAO;
import ru.grigorevms.mvcdemo.dao.TaskDAO;
import ru.grigorevms.mvcdemo.dao.UserDAO;
import ru.grigorevms.mvcdemo.models.User;

@Controller
@RequestMapping("/main")
public class MainController {
    @Autowired
    private UserDAO userDao;
    @Autowired
    private TaskDAO taskDao;
    @Autowired
    private PartDAO partDAO;

    @GetMapping
    public String mainPage(@ModelAttribute("user") User user,
                           RedirectAttributes atr,
                           Model model) {
        if (userDao.checkUser(user.getLogin(), user.getPassword())) {
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            user = userDao.getUser(user.getLogin());
            model.addAttribute("tasks", taskDao.getInWorkUserTasks(user.getId()));

            model.addAttribute("parts", partDAO.getPartsTree());

            System.out.println(user.toString());

            return "main/main";
        }
        return "redirect:/login";
    }
}
