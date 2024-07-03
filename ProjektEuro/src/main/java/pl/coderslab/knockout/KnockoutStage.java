package pl.coderslab.knockout;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.knockout.KnockoutMatch;

import javax.persistence.*;
import java.util.List;
@Getter
@Setter
@Entity
public class KnockoutStage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String stageName;

    @OneToMany(mappedBy = "knockoutStage")
    private List<KnockoutMatch> matches;

    public KnockoutStage() {
    }

    public KnockoutStage(String stageName) {
        this.stageName = stageName;
    }
}
