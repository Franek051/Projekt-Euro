package pl.coderslab.knockout;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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

    private Integer homeTeamScore;
    private Integer awayTeamScore;

    private LocalDateTime matchDateTime;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    @ManyToOne
    @JoinColumn(name = "knockout_stage_id", nullable = false)
    private KnockoutStage knockoutStage;

    private Integer extraTimeHomeScore;
    private Integer extraTimeAwayScore;
    private Integer penaltyHomeScore;
    private Integer penaltyAwayScore;
}
