package pl.coderslab.knockout;

import org.springframework.data.jpa.repository.JpaRepository;

public interface KnockoutRepository extends JpaRepository<KnockoutStage, Long> {
}
