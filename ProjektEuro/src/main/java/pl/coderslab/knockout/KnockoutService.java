package pl.coderslab.knockout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.location.Location;
import pl.coderslab.location.LocationRepository;
import pl.coderslab.team.Team;
import pl.coderslab.team.TeamRepository;
import pl.coderslab.team.TeamService;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class KnockoutService {
    private final KnockoutMatchRepository knockoutMatchRepository;
    private final KnockoutStageRepository knockoutStageRepository;
    private final TeamService teamService;
    private final LocationRepository locationRepository;
    private final TeamRepository teamRepository;

    @Autowired
    public KnockoutService(KnockoutMatchRepository knockoutMatchRepository,
                           KnockoutStageRepository knockoutStageRepository,
                           TeamService teamService,
                           LocationRepository locationRepository, TeamRepository teamRepository) {
        this.knockoutMatchRepository = knockoutMatchRepository;
        this.knockoutStageRepository = knockoutStageRepository;
        this.teamService = teamService;
        this.locationRepository = locationRepository;
        this.teamRepository = teamRepository;
    }

    public void setupKnockoutStage() {
        List<Team> firstPlaceTeams = teamService.getFirstPlaceTeams();
        List<Team> secondPlaceTeams = teamService.getSecondPlaceTeams();
        List<Team> thirdPlaceTeams = teamService.getThirdPlaceTeams();

        List<Team> bestThirdPlaceTeams = teamService.getBestThirdPlaceTeams(thirdPlaceTeams);

        KnockoutStage roundOf16 = knockoutStageRepository.save(new KnockoutStage("1/8 finału"));

        createKnockoutMatch(firstPlaceTeams.get(0), secondPlaceTeams.get(2), roundOf16, "2024-06-29T21:00", "Westfalenstadion");
        createKnockoutMatch(secondPlaceTeams.get(0), secondPlaceTeams.get(1), roundOf16, "2024-06-29T18:00", "Olympiastadion");
        createKnockoutMatch(firstPlaceTeams.get(2), bestThirdPlaceTeams.get(0), roundOf16, "2024-06-30T21:00", "Veltins-Arena");
        createKnockoutMatch(firstPlaceTeams.get(1), bestThirdPlaceTeams.get(1), roundOf16, "2024-06-30T18:00", "RheinEnergieStadion");
        createKnockoutMatch(firstPlaceTeams.get(5), bestThirdPlaceTeams.get(2), roundOf16, "2024-07-01T21:00", "Waldstadion");
        createKnockoutMatch(secondPlaceTeams.get(3), secondPlaceTeams.get(4), roundOf16, "2024-07-01T18:00", "Merkur Spiel-Arena");
        createKnockoutMatch(firstPlaceTeams.get(4), bestThirdPlaceTeams.get(3), roundOf16, "2024-07-02T18:00", "Allianz Arena");
        createKnockoutMatch(firstPlaceTeams.get(3), secondPlaceTeams.get(5), roundOf16, "2024-07-02T21:00", "Red Bull Arena");

    }

    public void setupQuarterFinalStage() {
        List<KnockoutMatch> roundOf16Matches = knockoutMatchRepository.findByKnockoutStageName("1/8 finału");
        List<Team> quarterFinalTeams = new ArrayList<>();
        for (KnockoutMatch match : roundOf16Matches) {
            Team winner = getWinner(match);
            if (winner != null) {
                quarterFinalTeams.add(winner);
            }
        }
        if (quarterFinalTeams.size() != 8) {
            throw new IllegalStateException("Expected exactly 8 teams for quarter finals");
        }
        KnockoutStage quarterFinal = knockoutStageRepository.save(new KnockoutStage("1/4 finału"));

        createKnockoutMatch(quarterFinalTeams.get(2), quarterFinalTeams.get(0), quarterFinal, "2024-07-05T18:00", "MHPArena");
        createKnockoutMatch(quarterFinalTeams.get(4), quarterFinalTeams.get(5), quarterFinal, "2024-07-05T21:00", "Volksparkstadion");
        createKnockoutMatch(quarterFinalTeams.get(6), quarterFinalTeams.get(7), quarterFinal, "2024-07-06T21:00", "Olympiastadion");
        createKnockoutMatch(quarterFinalTeams.get(3), quarterFinalTeams.get(1), quarterFinal, "2024-07-06T18:00", "Merkur Spiel-Arena");
    }

    public void setupSemiFinalStage() {
        List<KnockoutMatch> quarterFinalMatches = knockoutMatchRepository.findByKnockoutStageName("1/4 finału");
        List<Team> semiFinalTeams = new ArrayList<>();
        for (KnockoutMatch match : quarterFinalMatches) {
            Team winner = getWinner(match);
            if (winner != null) {
                semiFinalTeams.add(winner);
            }
        }

        if (semiFinalTeams.size() != 4) {
            throw new IllegalStateException("Expected exactly 4 teams for semi finals");
        }
        KnockoutStage semiFinal = knockoutStageRepository.save(new KnockoutStage("1/2 finału"));

        createKnockoutMatch(semiFinalTeams.get(0), semiFinalTeams.get(1), semiFinal, "2024-07-09T21:00", "Allianz Arena");
        createKnockoutMatch(semiFinalTeams.get(2), semiFinalTeams.get(3), semiFinal, "2024-07-10T21:00", "Westfalenstadion");
    }

    public void setupFinalStage() {
        List<KnockoutMatch> semiFinalMatches = knockoutMatchRepository.findByKnockoutStageName("1/2 finału");
        List<Team> finalTeams = new ArrayList<>();
        for (KnockoutMatch match : semiFinalMatches) {
            Team winner = getWinner(match);
            if (winner != null) {
                finalTeams.add(winner);
            }
        }

        if (finalTeams.size() != 2) {
            throw new IllegalStateException("Expected exactly 2 teams for the final");
        }
        KnockoutStage finalStage = knockoutStageRepository.save(new KnockoutStage("Finał"));
        createKnockoutMatch(finalTeams.get(0), finalTeams.get(1), finalStage, "2024-07-14T21:00", "Olympiastadion");

    }

    public Team getWinner(KnockoutMatch match) {
        if (match.getHomeTeamScore() == null || match.getAwayTeamScore() == null) {
            return null;
        }
        if (match.getHomeTeamScore() > match.getAwayTeamScore()) {
            return match.getHomeTeam();
        } else if (match.getHomeTeamScore() < match.getAwayTeamScore()) {
            return match.getAwayTeam();
        } else {
            if (match.getExtraTimeHomeScore() > match.getExtraTimeAwayScore()) {
                return match.getHomeTeam();
            } else if (match.getExtraTimeHomeScore() < match.getExtraTimeAwayScore()) {
                return match.getAwayTeam();
            } else {
                if (match.getPenaltyHomeScore() > match.getPenaltyAwayScore()) {
                    return match.getHomeTeam();
                } else {
                    return match.getAwayTeam();
                }
            }
        }
    }

    private void createKnockoutMatch(Team homeTeam, Team awayTeam, KnockoutStage stage, String dateTime, String locationName) {
        Optional<Location> locationOpt = locationRepository.findByName(locationName);
        if (locationOpt.isPresent()) {
            Location location = locationOpt.get();
            KnockoutMatch match = new KnockoutMatch();
            match.setHomeTeam(homeTeam);
            match.setAwayTeam(awayTeam);
            match.setMatchDateTime(LocalDateTime.parse(dateTime));
            match.setLocation(location);
            match.setKnockoutStage(stage);
            match.setHomeTeamScore(null);
            match.setAwayTeamScore(null);
            knockoutMatchRepository.save(match);
        } else {
            throw new IllegalArgumentException("Location not found: " + locationName);
        }
    }

    public void simulateKnockoutMatch(Long id) {
        KnockoutMatch match = knockoutMatchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Match not found"));

        if (match.getHomeTeamScore() == null || match.getAwayTeamScore() == null) {
            int homeScore = simulateScore();
            int awayScore = simulateScore();
            match.setHomeTeamScore(homeScore);
            match.setAwayTeamScore(awayScore);
            if (homeScore == awayScore) {
                int extraTimeHomeScore = simulateScore();
                int extraTimeAwayScore = simulateScore();
                match.setExtraTimeHomeScore(extraTimeHomeScore);
                match.setExtraTimeAwayScore(extraTimeAwayScore);
                if (extraTimeHomeScore == extraTimeAwayScore) {
                    simulatePenaltyShootout(match);
                }
            }
            knockoutMatchRepository.save(match);
        }
    }

    private int simulateScore() {
        return new Random().nextInt(6);
    }

    private void simulatePenaltyShootout(KnockoutMatch match) {
        int penaltyHomeScore = simulateScore();
        int penaltyAwayScore = simulateScore();

        while (penaltyHomeScore == penaltyAwayScore) {
            penaltyHomeScore = simulateScore();
            penaltyAwayScore = simulateScore();
        }

        match.setPenaltyHomeScore(penaltyHomeScore);
        match.setPenaltyAwayScore(penaltyAwayScore);
    }

    public List<KnockoutMatch> getAllKnockoutMatches() {
        return knockoutMatchRepository.findAll();
    }

    public List<KnockoutMatch> getQualifiedMatchesForQuarterFinals() {
        return knockoutMatchRepository.findByKnockoutStageName("1/4 finału");
    }

    public List<KnockoutMatch> getQualifiedTeamsForSemiFinals() {
        return knockoutMatchRepository.findByKnockoutStageName("1/2 finału");
    }

    public List<KnockoutMatch> getQualifiedTeamsForFinal() {
        return knockoutMatchRepository.findByKnockoutStageName("Finał");
    }



}