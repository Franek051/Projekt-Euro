package pl.coderslab.team;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.match.Match;
import pl.coderslab.match.MatchService;

import java.util.List;

@Controller
@RequestMapping("/api/teams")
public class TeamController {
    private final TeamService teamService;
    private final MatchService matchService;

    public TeamController(TeamService teamService, MatchService matchService) {
        this.teamService = teamService;
        this.matchService = matchService;
    }

    @GetMapping("")
    public String getAllTeams(Model model) {
        model.addAttribute("teams", teamService.getTeamsWithPosition());
        return "team/list";
    }

    @GetMapping("/{id}")
    public String getTeamById(@PathVariable Long id, Model model) {
        Team team = teamService.getTeamById(id).orElse(null);
        if (team == null) {
            return "redirect:/api/teams";
        }
        List<Match> matches = matchService.getMatchesByTeamId(id);
        model.addAttribute("team", team);
        model.addAttribute("matches", matches);
        return "team/details";
    }

    @GetMapping("/third-place")
    public String getThirdPlaceTeams(Model model) {
        List<Team> thirdPlaceTeams = teamService.getThirdPlaceTeams();
        model.addAttribute("teams", thirdPlaceTeams);
        return "team/third-place";
    }

    @PostMapping("/reset-points")
    public String resetPoints() {
        teamService.resetAllPoints();
        return "redirect:/api/teams";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/new")
    public String newTeamForm(Model model) {
        model.addAttribute("team", new Team());
        return "team/form";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/save")
    public String saveTeam(@ModelAttribute Team team) {
        teamService.saveTeam(team);
        return "redirect:/api/teams";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/edit/{id}")
    public String editTeamForm(@PathVariable Long id, Model model) {
        model.addAttribute("team", teamService.getTeamById(id).orElse(null));
        return "team/form";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/delete/{id}")
    public String deleteTeam(@PathVariable Long id) {
        teamService.deleteTeam(id);
        return "redirect:/api/teams";
    }
}