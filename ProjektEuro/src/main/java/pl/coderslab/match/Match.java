package pl.coderslab.match;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.team.Team;
import pl.coderslab.location.Location;

import javax.persistence.*;
import java.time.LocalDateTime;
@Setter
@Getter
@Entity
@Table(name = "matches")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "home_team_id", nullable = false)
    private Team homeTeam;

    @ManyToOne
    @JoinColumn(name = "away_team_id", nullable = false)
    private Team awayTeam;

    private int homeTeamScore;
    private int awayTeamScore;

    private LocalDateTime matchDateTime;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;
}
