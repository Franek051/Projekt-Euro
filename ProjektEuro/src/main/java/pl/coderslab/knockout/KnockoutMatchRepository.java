package pl.coderslab.knockout;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KnockoutMatchRepository extends JpaRepository<KnockoutMatch, Long> {
    List<KnockoutMatch> findByKnockoutStage_Id (Long knockoutStageID);
}
