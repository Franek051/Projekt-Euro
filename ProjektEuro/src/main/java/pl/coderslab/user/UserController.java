package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/create-user")
    public String createUser(Model model) {
        model.addAttribute("users", new User());
        return "admin/add";
    }
    @PostMapping("/create-user")
    public String create(User user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/add";
        }
        userService.saveUser(user);
        return "redirect:/";
    }
}
