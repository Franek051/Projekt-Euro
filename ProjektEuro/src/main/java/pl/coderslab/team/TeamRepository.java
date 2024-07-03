package pl.coderslab.team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.match.Match;

import java.util.List;

public interface TeamRepository extends JpaRepository<Team, Long> {

}
