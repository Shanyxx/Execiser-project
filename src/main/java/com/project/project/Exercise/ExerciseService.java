package com.project.project.Exercise;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciseService {

    private ExerciseRepository exerciseRepository;


    @Autowired
    public ExerciseService (ExerciseRepository exerciseRepository) {
        this.exerciseRepository=exerciseRepository;
    }

    public void saveExercise(Exercise exercise) {
        exerciseRepository.save(exercise);
    }

    public void updateExercise(Exercise exercise) {
        exerciseRepository.save(exercise);
    }

    public void deleteExercise(Long id) {
        exerciseRepository.deleteById(id);
    }

    public Exercise findExercise(Long id) {
        return exerciseRepository.findById(id).orElse(null);
    }

    public Exercise findExerciseWithName(Long id) {
        Exercise exercise = findExercise(id);
        Hibernate.initialize(exercise.getName());
        return exercise;
    }

    public List<Exercise> findAll(){
        List<Exercise> exercises = exerciseRepository.findAll();
        exercises.forEach(b-> Hibernate.initialize(b.getName()));
        return exercises;
    }

}
