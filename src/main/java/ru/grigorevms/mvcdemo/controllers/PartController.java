package ru.grigorevms.mvcdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.grigorevms.mvcdemo.dao.*;
import ru.grigorevms.mvcdemo.models.*;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/part")
public class PartController {
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

    @GetMapping("/{id}")
    public String seePartInformation(@ModelAttribute("user") User user,
                                     @PathVariable("id") Long partId,
                                     RedirectAttributes atr,
                                     Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            model.addAttribute("part", partDAO.getPart(partId));
            List<String> parents = new ArrayList<>();
            for (Long part : partDAO.getPart(partId).getParents()) {
                parents.add(partDAO.getPart(part).getDescription());
            }
            model.addAttribute("parents", parents);

            return "part/info";
        }
        return "redirect:/login";
    }

    @GetMapping("/add")
    public String showAddNewPartForm(@ModelAttribute("user") User user,
                             @ModelAttribute("newPart") Part newPart,
                             Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            model.addAttribute("parts", partDAO.getAllParts());
            return "part/add";
        }
        return "redirect:/login";
    }

    @PostMapping("/add")
    public String addNewPart(@ModelAttribute("user") User user,
                             @ModelAttribute("newPart") Part newPart,
                             @RequestParam("description") String description,
                             @RequestParam("name") String name,
                             @RequestParam("text") String text,
                             RedirectAttributes atr) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            // Перекодирование
            byte[] bytes = description.getBytes(StandardCharsets.ISO_8859_1);
            description = new String(bytes, StandardCharsets.UTF_8);
            bytes = name.getBytes(StandardCharsets.ISO_8859_1);
            name = new String(bytes, StandardCharsets.UTF_8);
            bytes = text.getBytes(StandardCharsets.ISO_8859_1);
            text = new String(bytes, StandardCharsets.UTF_8);

            newPart.setDescription(description);
            newPart.setName(name);
            newPart.setText(text);
            if (newPart.getParents().size() == 0)  newPart.setParents(null);

            partDAO.addPart(newPart);
            logger.writeLog(user, "add part", newPart.toString());

            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/update")
    public String showUpdatePartForm(@ModelAttribute("user") User user,
                             @PathVariable("id") Long partId,
                             Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            model.addAttribute("parts", partDAO.getAllParts());
            model.addAttribute("partForUpdate", partDAO.getPart(partId));
            return "part/update";
        }
        return "redirect:/login";
    }

    @PostMapping("/{id}/update")
    public String updatePart(@ModelAttribute("user") User user,
                             @ModelAttribute("partForUpdate") Part partForUpdate,
                             @RequestParam("description") String description,
                             @RequestParam("name") String name,
                             @RequestParam("text") String text,
                             @PathVariable("id") Long partForUpdateId,
                             RedirectAttributes atr,
                             Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            // Перекодирование
            byte[] bytes = description.getBytes(StandardCharsets.ISO_8859_1);
            description = new String(bytes, StandardCharsets.UTF_8);
            bytes = name.getBytes(StandardCharsets.ISO_8859_1);
            name = new String(bytes, StandardCharsets.UTF_8);
            bytes = text.getBytes(StandardCharsets.ISO_8859_1);
            text = new String(bytes, StandardCharsets.UTF_8);

            partForUpdate.setDescription(description);
            partForUpdate.setName(name);
            partForUpdate.setText(text);
            if (partForUpdate.getParents().size() == 0)  partForUpdate.setParents(null);

            partDAO.updatePart(partForUpdate);
            logger.writeLog(user, "update part", partForUpdate.toString());

            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/delete")
    public String deletePart(@ModelAttribute("user") User user,
                             @ModelAttribute("partForDelete") Part partForDelete,
                             @PathVariable("id") Long id,
                             RedirectAttributes atr,
                             Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            partForDelete = partDAO.getPart(id);

            System.out.println(partForDelete.getStringForm());
            partDAO.deletePart(partForDelete);
            partDAO.addDeletedPart(partForDelete);
            logger.writeLog(user, "delete part", partForDelete.toString());

            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @GetMapping("/storage")
    public String showStorageBill(@ModelAttribute("user") User user,
                                  Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            model.addAttribute("parts", partDAO.getAllParts());

            StorageInvoice invoice = new StorageInvoice();
            invoice.addLine(new StorageInvoiceLine());
            model.addAttribute("invoice", invoice);

            return "part/storage";
        }
        return "redirect:/login";
    }

    @PostMapping(params = "action=save", value = "/storage")
    public String inputStorageBill(@ModelAttribute("user") User user,
                                   @ModelAttribute StorageInvoice invoice,
                                   RedirectAttributes atr,
                                   Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            List<StorageInvoiceLine> lines = invoice.getLines();
            String info = "";
            for (StorageInvoiceLine line : lines) {
                Part part = partDAO.getPart(line.getPartId());
                int count = part.getCount();
                if (line.getAction().equals("get")) {
                    count -= line.getCount();
                    info += "get, " + part.getId() + ", " + part.toString() + ", " + line.getCount() + "\n";
                } else if (line.getAction().equals("put")) {
                    count += line.getCount();
                    info += "put, " + part.getId() + ", " + part.toString() + ", " + line.getCount() + "\n";
                }
                part.setCount(count);
                partDAO.updatePart(part);
            }
            logger.writeLog(user, "storage", info);
            return "redirect:/main";
        }
        return "redirect:/login";
    }

    @PostMapping(params = "action=add", value = "/storage")
    public String addLineToStorageBill(@ModelAttribute("user") User user,
                                       @ModelAttribute StorageInvoice invoice,
                                       RedirectAttributes atr,
                                       Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            invoice.addLine(new StorageInvoiceLine());

            model.addAttribute("invoice", invoice);
            model.addAttribute("parts", partDAO.getAllParts());

            return "part/storage";
        }
        return "redirect:/login";
    }

    @PostMapping(params = "action=pop", value = "/storage")
    public String popLineFromStorageBill(@ModelAttribute("user") User user,
                                       @ModelAttribute StorageInvoice invoice,
                                       RedirectAttributes atr,
                                       Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            invoice.removeLastLine();

            model.addAttribute("invoice", invoice);
            model.addAttribute("parts", partDAO.getAllParts());

            return "part/storage";
        }
        return "redirect:/login";
    }

    @GetMapping("/{id}/files")
    public String showAttachedFiles(@ModelAttribute("user") User user,
                                    @PathVariable("id") Long partId,
                                    @ModelAttribute("newFile") File newFile,
                                    RedirectAttributes atr,
                                    Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            model.addAttribute("part", partDAO.getPart(partId));

            newFile.setParent(partId);
            model.addAttribute("files", fileDAO.getListOfFiles(partId));

            return "part/files";
        }
        return "redirect:/login";
    }

    @PostMapping("{id}/files")
    public String uploadFile(@ModelAttribute("user") User user,
                             @PathVariable("id") Long partId,
                             @ModelAttribute("newFile") File newFile,
                             RedirectAttributes atr,
                             Model model) {
        if (userDAO.checkUser(user.getLogin(), user.getPassword())) {
            user = userDAO.getUser(user.getLogin());
            atr.addAttribute("login", user.getLogin());
            atr.addAttribute("password", user.getPassword());

            newFile.setParent(partId);

            fileDAO.addFileToDatabase(newFile);
            logger.writeLog(user, "upload file", "Upload file to storage");

            return "redirect:/part/{id}/files";
        }
        return "rediret:/login";
    }
}
