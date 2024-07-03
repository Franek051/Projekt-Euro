package pl.coderslab.knockout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.team.Team;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/knockout")
public class KnockoutController {

    private final KnockoutService knockoutService;


    public KnockoutController(KnockoutService knockoutService) {
        this.knockoutService = knockoutService;
    }

    @GetMapping("")
    public String knockoutOverview(Model model) {
        model.addAttribute("matches", knockoutService.getAllKnockoutMatches());
        return "knockoutOverview";
    }


    @GetMapping("/simulate/{matchId}")
    public String simulateRoundOf16Match(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout";
    }

    @PostMapping("/simulate/{matchId}")
    public String simulateRoundOf16MatchPost(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout";
    }


    @GetMapping("/simulate/quarter-finals/{matchId}")
    public String simulateQuarterFinalMatch(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/quarter-finals";
    }

    @PostMapping("/simulate/quarter-finals/{matchId}")
    public String simulateQuarterFinalMatchPost(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/quarter-finals";
    }


    @GetMapping("/simulate/semi-finals/{matchId}")
    public String simulateSemiFinalMatch(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/semi-finals";
    }

    @PostMapping("/simulate/semi-finals/{matchId}")
    public String simulateSemiFinalMatchPost(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/semi-finals";
    }


    @GetMapping("/simulate/final/{matchId}")
    public String simulateFinalMatch(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/final";
    }

    @PostMapping("/simulate/final/{matchId}")
    public String simulateFinalMatchPost(@PathVariable Long matchId) {
        knockoutService.simulateKnockoutMatch(matchId);
        return "redirect:/api/knockout/final";
    }

    @PostMapping("/next-stage")
    public String proceedToNextStage(@RequestParam String stageName) {
        switch (stageName) {
            case "quarter-finals":
                knockoutService.setupQuarterFinalStage();
                return "redirect:/api/knockout/quarter-finals";
            case "semi-finals":
                knockoutService.setupSemiFinalStage();
                return "redirect:/api/knockout/semi-finals";
            case "final":
                knockoutService.setupFinalStage();
                return "redirect:/api/knockout/final";
            default:
                throw new IllegalArgumentException("Invalid stage name: " + stageName);
        }
    }

    @PostMapping("/setup-round-of-16")
    public String setupRoundOf16() {
        knockoutService.setupKnockoutStage();
        return "redirect:/api/knockout";
    }

    @PostMapping("/setup-quarter-finals")
    public String setupQuarterFinalStage() {
        knockoutService.setupQuarterFinalStage();
        return "redirect:/api/knockout/quarter-finals";
    }

    @PostMapping("/setup-semi-finals")
    public String setupSemiFinalStage() {
        knockoutService.setupSemiFinalStage();
        return "redirect:/api/knockout/semi-finals";
    }

    @PostMapping("/setup-final")
    public String setupFinalStage() {
        knockoutService.setupFinalStage();
        return "redirect:/api/knockout/final";
    }

    @GetMapping("/quarter-finals")
    public String quarterFinals(Model model) {
        model.addAttribute("matches", knockoutService.getQualifiedMatchesForQuarterFinals());
        return "knockoutQuarterFinals";
    }

    @GetMapping("/semi-finals")
    public String semiFinals(Model model) {
        model.addAttribute("matches", knockoutService.getQualifiedTeamsForSemiFinals());
        return "knockoutSemiFinals";
    }

    @GetMapping("/final")
    public String finalMatch(Model model) {
        List<KnockoutMatch> finalMatches = knockoutService.getQualifiedTeamsForFinal();
        if (finalMatches.size() == 1) {
            model.addAttribute("match", finalMatches.get(0));
        }
        return "knockoutFinal";

    }

    @GetMapping("/champion")
    public String champion(Model model) {
        KnockoutMatch finalMatch = knockoutService.getQualifiedTeamsForFinal().get(0);
        Team winner = knockoutService.getWinner(finalMatch);
        model.addAttribute("winner", winner);
        return "champion";
    }


}