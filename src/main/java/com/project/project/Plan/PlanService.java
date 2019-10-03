package com.project.project.Plan;

import com.project.project.Exercise.Exercise;
import com.project.project.Exercise.ExerciseRepository;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanService {

    private PlanRepository planRepository;

    private ExerciseRepository exerciseRepository;


    @Autowired
    public PlanService (PlanRepository planRepository) {
        this.planRepository=planRepository;
    }

    public void savePlan(Plan plan) {
        planRepository.save(plan);
    }

    public void updatePlan(Plan plan) {
        planRepository.save(plan);
    }

    public void deletePlan(Long id) {
        planRepository.deleteById(id);
    }

    public Plan findPlan(Long id) {
        return planRepository.findById(id).orElse(null);
    }

    public Plan findPlanWithName(Long id) {
        Plan plan = findPlan(id);
        Hibernate.initialize(plan.getName());
        return plan;
    }

    public List<Plan> findAll(){
        List<Plan> plans = planRepository.findAll();
        plans.forEach(b-> Hibernate.initialize(b.getName()));
        return plans;
    }



   }

