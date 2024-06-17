package pl.coderslab.match;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MatchRepository extends JpaRepository<Match, Long> {
    List<Match> findByHomeTeam_IdOrAwayTeam_Id (Long homeTeamId, Long awayTeamId);
}
