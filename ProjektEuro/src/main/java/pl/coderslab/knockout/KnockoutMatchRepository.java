package pl.coderslab.knockout;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface KnockoutMatchRepository extends JpaRepository<KnockoutMatch, Long> {


    @Query("SELECT m FROM KnockoutMatch m WHERE m.knockoutStage.stageName = ?1")
    List<KnockoutMatch> findByKnockoutStageName(String stageName);


}
