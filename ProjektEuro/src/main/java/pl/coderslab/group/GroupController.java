package pl.coderslab.group;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/api/groups")
public class GroupController {

    private final GroupService groupService;

    public GroupController(GroupService groupService) {
        this.groupService = groupService;
    }

    @GetMapping("")
    public String getAllGroups(Model model) {
        model.addAttribute("groups", groupService.getAllGroups());
        return "group/list";
    }

    @GetMapping("/{id}")
    public String getGroupById(@PathVariable Long id, Model model) {
        model.addAttribute("group", groupService.getGroupById(id).orElse(null));
        return "group/details";
    }

    @GetMapping("/new")
    public String newGroupForm(Model model) {
        model.addAttribute("group", new Group());
        return "group/form";
    }

    @PostMapping("/save")
    public String saveGroup(@ModelAttribute Group group) {
        groupService.saveGroup(group);
        return "redirect:/groups";
    }

    @GetMapping("/edit/{id}")
    public String editGroupForm(@PathVariable Long id, Model model) {
        model.addAttribute("group", groupService.getGroupById(id).orElse(null));
        return "group/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteGroup(@PathVariable Long id) {
        groupService.deleteGroup(id);
        return "redirect:/groups";
    }
}

