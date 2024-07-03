package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String hello() {
        return "home/home";
    }

    @GetMapping("/home/about")
    public String about() { return "home/about"; }
}
