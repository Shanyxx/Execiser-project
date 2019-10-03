package com.project.project.Plan;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;

@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {
}
