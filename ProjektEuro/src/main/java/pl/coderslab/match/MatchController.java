package pl.coderslab.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.location.LocationService;
import pl.coderslab.team.TeamService;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/api/matches")
public class MatchController {

    private final MatchService matchService;
    private final TeamService teamService;

    private final LocationService locationService;

    @Autowired
    public MatchController(MatchService matchService, TeamService teamService, LocationService locationService) {
        this.matchService = matchService;
        this.teamService = teamService;
        this.locationService = locationService;
    }

    @GetMapping("")
    public String getAllMatches(Model model) {
        List<Match> matches = matchService.getAllMatches();
        model.addAttribute("matches", matches);
        return "match/list";
    }

    @GetMapping("/{id}")
    public String getMatchById(@PathVariable Long id, Model model) {
        Match match = matchService.getMatchById(id).orElse(null);
        model.addAttribute("match", match);
        return "match/details";
    }

    @GetMapping("/new")
    public String newMatchForm(Model model) {
        model.addAttribute("match", new Match());
        model.addAttribute("teams", teamService.getAllTeams());
        model.addAttribute("locations", locationService.getAllLocations());
        return "match/form";
    }

    @PostMapping("/save")
    public String saveMatch(@ModelAttribute Match match) {
        matchService.saveMatch(match);
        return "redirect:/api/matches";
    }

    @GetMapping("/edit/{id}")
    public String editMatchForm(@PathVariable Long id, Model model) {
        Match match = matchService.getMatchById(id).orElse(null);
        model.addAttribute("match", match);
        model.addAttribute("teams", teamService.getAllTeams());
        model.addAttribute("locations", locationService.getAllLocations());
        return "match/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteMatch(@PathVariable Long id) {
        matchService.deleteMatch(id);
        return "redirect:/api/matches";
    }


    @GetMapping("/{teamId}/{id}/simulate")
    public String simulateMatch(@PathVariable Long teamId, @PathVariable Long id, Model model) {
        matchService.simulateMatch(id);
        List<Match> matches = matchService.getMatchesByTeam(teamId);
        model.addAttribute("matches", matches);
        return "match/team-matches";
    }

    @GetMapping("/team/{teamId}")
    public String getMatchesByTeam(@PathVariable Long teamId, Model model) {
        List<Match> matches = matchService.getMatchesByTeam(teamId);
        model.addAttribute("matches", matches);
        return "match/team-matches";
    }

}
