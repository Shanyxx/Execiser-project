package com.project.project.Exercise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, Long> {

    @Modifying
    @Transactional
    @Query(value = "delete from exercise_plans where exercise_id =:exerciseId and plan_id=:planId", nativeQuery = true)
    void deleteExerciseFromPlan(Long exerciseId, Long planId);
}
