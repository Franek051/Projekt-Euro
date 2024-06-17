package pl.coderslab.group;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.team.Team;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.*;
@Getter
@Setter
@Entity
public class GroupStandings {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "team_id", nullable = false)
    private Team team;

    private int groupPosition;
}
