package pl.coderslab.knockout;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.location.Location;
import pl.coderslab.team.Team;

import javax.persistence.*;
import java.time.LocalDateTime;
@Getter
@Setter
@Entity
public class KnockoutMatch {
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

    @ManyToOne
    @JoinColumn(name = "knockout_stage_id", nullable = false)
    private KnockoutStage knockoutStage;
}
