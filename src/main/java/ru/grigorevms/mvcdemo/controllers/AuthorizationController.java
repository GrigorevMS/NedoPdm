package ru.grigorevms.mvcdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.grigorevms.mvcdemo.dao.Logger;
import ru.grigorevms.mvcdemo.dao.UserDAO;
import ru.grigorevms.mvcdemo.models.User;

@Controller
public class AuthorizationController {
    @Autowired
    private UserDAO userDao;
    @Autowired
    private Logger logger;

    @GetMapping("/")
    public String mainPageController() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm(@ModelAttribute("user") User user) {
        return "authorization/login";
    }

    @PostMapping("/login")
    public String logToSystem(@ModelAttribute("user") User user, RedirectAttributes atr) {
        String login = user.getLogin();
        String password = user.getPassword();
        if (userDao.checkUser(login, password)) {
            user = userDao.getUser(login);
            logger.writeLog(user, "login", "Start session");

            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());
            return "redirect:/main";
        }
        return "authorization/failedlogin";
    }
}
