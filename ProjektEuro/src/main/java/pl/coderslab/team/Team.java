package pl.coderslab.team;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.group.Group;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String name;

    private int points;

    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

}
