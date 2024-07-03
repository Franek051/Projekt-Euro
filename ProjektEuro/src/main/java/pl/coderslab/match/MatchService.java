package pl.coderslab.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.team.Team;
import pl.coderslab.team.TeamRepository;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
public class MatchService {

    private final MatchRepository matchRepository;
    private final TeamRepository teamRepository;

    @Autowired
    public MatchService(MatchRepository matchRepository, TeamRepository teamRepository) {
        this.matchRepository = matchRepository;
        this.teamRepository = teamRepository;
    }

    public List<Match> getAllMatches() {
        return matchRepository.findAll();
    }

    public Optional<Match> getMatchById(Long id) {
        return matchRepository.findById(id);
    }

    public Match saveMatch(Match match) {
        return matchRepository.save(match);
    }

public void resetAllMatchResults() {
    List<Match> matches = matchRepository.findAll();
    for (Match match : matches) {
        match.setHomeTeamScore(null);
        match.setAwayTeamScore(null);
    }
    matchRepository.saveAll(matches);
}

    public void deleteMatch(Long id) {
        matchRepository.deleteById(id);
    }

    public Optional<Match> simulateMatch(Long id) {
        Optional<Match> matchOptional = matchRepository.findById(id);
        if (matchOptional.isPresent()) {
            Match match = matchOptional.get();
            Random random = new Random();
            int homeTeamScore = random.nextInt(5);
            int awayTeamScore = random.nextInt(5);
            match.setHomeTeamScore(homeTeamScore);
            match.setAwayTeamScore(awayTeamScore);

            Team homeTeam = match.getHomeTeam();
            Team awayTeam = match.getAwayTeam();

            if (homeTeamScore > awayTeamScore) {
                homeTeam.setPoints(homeTeam.getPoints() + 3);
            } else if (homeTeamScore < awayTeamScore) {
                awayTeam.setPoints(awayTeam.getPoints() + 3);
            } else {
                homeTeam.setPoints(homeTeam.getPoints() + 1);
                awayTeam.setPoints(awayTeam.getPoints() + 1);
            }

            teamRepository.save(homeTeam);
            teamRepository.save(awayTeam);

            return Optional.of(matchRepository.save(match));
        }
        return Optional.empty();
    }
    public List<Match> getMatchesByTeamId(Long teamId) {
        return matchRepository.findByHomeTeam_IdOrAwayTeam_Id(teamId, teamId);
    }


    public List<Match> getMatchesByTeam(Long teamId) {
        Team team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            return null;
        }
        List<Match> homeMatches = matchRepository.findByHomeTeam(team);
        List<Match> awayMatches = matchRepository.findByAwayTeam(team);
        homeMatches.addAll(awayMatches);
        return homeMatches;
    }
}
