package com.project.project.Exercise;

import com.project.project.Plan.Plan;
import com.project.project.Plan.PlanService;
import com.project.project.User.User;
import com.project.project.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller

@RequestMapping("/exercise")
public class ExerciseController {

    private UserService userService;

    private PlanService planService;

    private ExerciseService exerciseService;


    @Autowired
    public ExerciseController(UserService userService, PlanService planService, ExerciseService exerciseService) {
        this.userService = userService;
        this.planService = planService;
        this.exerciseService = exerciseService;
    }

    @GetMapping("/add")
    public String addExercise(Model model) {
        model.addAttribute("exercise",new Exercise()) ;
        return "exercise";
    }

    @PostMapping("/add")
    public String addExercise(@ModelAttribute @Valid Exercise exercise, BindingResult result) {
        if (result.hasErrors()) {
            return "exercise";
        }
       exerciseService.saveExercise(exercise);
        return "redirect:list";
    }



    @GetMapping("/list")
    public String getExercise(Model model){
        List<Exercise> exercises= exerciseService.findAll();
        model.addAttribute("exercises",exercises);
        return "exerciseList";
    }




    @GetMapping("/update/{id}")
    public String updateExercise(@PathVariable Long id, Model model) {
        Exercise exercise = exerciseService.findExerciseWithName(id);
        model.addAttribute("exercise", exercise);
        return "exercise";
    }

    @PostMapping("/update/{id}")
    public String updateExercise(@ModelAttribute @Valid Exercise exercise, BindingResult result) {
        if (result.hasErrors()) {
            return "exercise";
        }
        exerciseService.updateExercise(exercise);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String deleteExercise(@PathVariable Long id) {
        exerciseService.deleteExercise(id);
        return "redirect:../list";
    }

    @GetMapping("/{id}/plan/add")
    public String addExerciseToPlan(@PathVariable Exercise id, Model model) {
        List<Plan> plans = planService.findAll();

        model.addAttribute("exercise",id);
        model.addAttribute("plans",plans);
        model.addAttribute("exerciseDto",new PlansDto());
        return "exercise_plan";
    }
    @PostMapping("/{id}/plan/add")
    public String addExerciseToPlan(@PathVariable Exercise id, Model model, @ModelAttribute PlansDto exerciseDto) {

        id.getPlans().addAll(exerciseDto.getPlans());
        exerciseService.saveExercise(id);
        return "redirect:/exercise/list";
    }

    /*@GetMapping("/{id}/plan/delete")
    public String deleteExerciseFromPlan(@PathVariable Exercise id, Model model) {
        List<Plan> plans = planService.findAll();

        model.addAttribute("exercise",id);
        model.addAttribute("plans",plans);
        model.addAttribute("exerciseDto",new PlansDto());
        return "exercise_plan";
    }
    @PostMapping("/{id}/plan/delete")
    public String deleteExerciseFromPlan(@PathVariable Exercise id, Model model, @ModelAttribute PlansDto exerciseDto) {

        id.getPlans().addAll(exerciseDto.getPlans());
        exerciseService.saveExercise(id);
        return "redirect:/exercise/list";
    }*/

    private class PlansDto{
        private List<Plan> plans = new ArrayList<>();

        public List<Plan> getPlans() {
            return plans;
        }

        public void setPlans(List<Plan> plans) {
            this.plans = plans;
        }

        public PlansDto() {
        }
    }
}
