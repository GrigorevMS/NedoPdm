package ru.grigorevms.mvcdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.grigorevms.mvcdemo.dao.*;
import ru.grigorevms.mvcdemo.models.File;
import ru.grigorevms.mvcdemo.models.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/download")
public class DownloadController {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TaskDAO taskDAO;
    @Autowired
    private PartDAO partDAO;
    @Autowired
    private Logger logger;
    @Autowired
    private FileDAO fileDAO;

    /*@GetMapping("/{fileId}")
    public ResponseEntity<Resource> getFileFromStorage(@ModelAttribute("user") User user,
                                                       @PathVariable("fileId") Long fileId,
                                                       RedirectAttributes atr,
                                                       Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            File file = fileDAO.getFileById(fileId);
            System.out.println(file.toStr())    ;
            System.out.println("mi bili tut");

            Path path = Paths.get(file.getPath());
            Resource resource = null;
            try {
                //resource = new UrlResource(path.toUri());
                resource = new java.io.File(file.getPath());
            } catch (MalformedURLException e) {
                System.err.println(e);
            }

            HttpHeaders headers = new HttpHeaders();
            headers.add("Location", "redirect:/login");
            return new ResponseEntity<>(headers, HttpStatus.FOUND);

            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok().header("Content-Disposition",
                        "attachment; filename=" + file.getName()).body(resource);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "redirect:/login");
        return new ResponseEntity<>(headers, HttpStatus.FOUND);
    }*/

    @GetMapping("{fileId}")
    public void getFileFromStorage(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @ModelAttribute("user") User user,
                                   @PathVariable("fileId") Long fileId,
                                   RedirectAttributes atr,
                                   Model model) throws IOException {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            ServletContext context = request.getServletContext();

            File file = fileDAO.getFileById(fileId);
            java.io.File downloadFile = new java.io.File(file.getPath());
            FileInputStream inputStream = new FileInputStream(downloadFile);

            String mimeType = context.getMimeType(file.getPath());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());

            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"",
                    downloadFile.getName());
            response.setHeader(headerKey, headerValue);

            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outStream.close();
        }
    }
}
