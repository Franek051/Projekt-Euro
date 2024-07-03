package pl.coderslab.team;

import org.springframework.stereotype.Service;
import pl.coderslab.knockout.KnockoutMatch;
import pl.coderslab.knockout.KnockoutMatchRepository;
import pl.coderslab.match.MatchService;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TeamService {
    private final TeamRepository teamRepository;
    private final MatchService matchService;
    private final KnockoutMatchRepository knockoutMatchRepository;


    public TeamService(TeamRepository teamRepository, MatchService matchService, KnockoutMatchRepository knockoutMatchRepository) {
        this.teamRepository = teamRepository;
        this.matchService = matchService;
        this.knockoutMatchRepository = knockoutMatchRepository;
    }

    public List<Team> getAllTeams() {
        return teamRepository.findAll()
                .stream()
                .sorted(Comparator.comparing((Team team) -> team.getGroup().getName())
                        .thenComparing(Team::getName))
                .collect(Collectors.toList());
    }

    public List<Team> getTeamsWithPosition() {
        return teamRepository.findAll()
                .stream()
                .sorted(Comparator.comparing((Team team) -> team.getGroup().getName())
                        .thenComparing(Comparator.comparing(Team::getPoints).reversed()))
                .collect(Collectors.toList());
    }

    public Optional<Team> getTeamById(Long id) {
        return teamRepository.findById(id);
    }

    public void saveTeam(Team team) {
        teamRepository.save(team);
    }

    public void deleteTeam(Long id) {
        teamRepository.deleteById(id);
    }

    public List<Team> getThirdPlaceTeams() {
        return teamRepository.findAll()
                .stream()
                .collect(Collectors.groupingBy(team -> team.getGroup().getName()))
                .values()
                .stream()
                .map(group -> group.stream()
                        .sorted(Comparator.comparingInt(Team::getPoints).reversed())
                        .collect(Collectors.toList()))
                .filter(group -> group.size() >= 3)
                .map(group -> group.get(2))
                .sorted(Comparator.comparingInt(Team::getPoints).reversed())
                .collect(Collectors.toList());
    }

    public List<Team> getFirstPlaceTeams() {
        return teamRepository.findAll()
                .stream()
                .collect(Collectors.groupingBy(team -> team.getGroup().getName()))
                .values()
                .stream()
                .map(group -> group.stream()
                        .sorted(Comparator.comparingInt(Team::getPoints).reversed())
                        .collect(Collectors.toList()))
                .map(group -> group.get(0))
                .collect(Collectors.toList());
    }

    public List<Team> getSecondPlaceTeams() {
        return teamRepository.findAll()
                .stream()
                .collect(Collectors.groupingBy(team -> team.getGroup().getName()))
                .values()
                .stream()
                .map(group -> group.stream()
                        .sorted(Comparator.comparingInt(Team::getPoints).reversed())
                        .collect(Collectors.toList()))
                .map(group -> group.get(1))
                .collect(Collectors.toList());
    }


    public List<Team> getBestThirdPlaceTeams(List<Team> thirdPlaceTeams) {
        return thirdPlaceTeams.stream()
                .sorted(Comparator.comparingInt(Team::getPoints).reversed())
                .limit(4)
                .collect(Collectors.toList());
    }

    public void resetAllPoints() {
        List<Team> teams = teamRepository.findAll();
        for (Team team : teams) {
            team.setPoints(0);
        }
        teamRepository.saveAll(teams);
        matchService.resetAllMatchResults();
    }





}