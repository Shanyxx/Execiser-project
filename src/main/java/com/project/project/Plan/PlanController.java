package com.project.project.Plan;

import com.project.project.Exercise.Exercise;
import com.project.project.Exercise.ExerciseController;
import com.project.project.Exercise.ExerciseRepository;
import com.project.project.Exercise.ExerciseService;
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
@RequestMapping("/plan")
public class PlanController {

    private UserService userService;

    private PlanService planService;

    private ExerciseService exerciseService;

    private ExerciseRepository exerciseRepository;


    @Autowired
    public PlanController(UserService userService, PlanService planService, ExerciseService exerciseService, ExerciseRepository exerciseRepository) {
        this.userService = userService;
        this.planService = planService;
        this.exerciseService = exerciseService;
        this.exerciseRepository=exerciseRepository;
    }

    @GetMapping("/add")
    public String addPlan(Model model) {
        model.addAttribute("plan",new Plan()) ;
        return "plan";
    }

    @PostMapping("/add")
    public String addPlan(@ModelAttribute @Valid Plan plan, BindingResult result) {
        if (result.hasErrors()) {
            return "plan";
        }
        planService.savePlan(plan);
        return "redirect:list";
    }



    @GetMapping("/list")
    public String getPlans(Model model){
        List<Plan> plans= planService.findAll();
        model.addAttribute("plans",plans);
        return "planList";
    }




    @GetMapping("/update/{id}")
    public String updatePlan(@PathVariable Long id, Model model) {
        Plan plan = planService.findPlanWithName(id);
        model.addAttribute("plan", plan);
        return "plan";
    }

    @PostMapping("/update/{id}")
    public String updatePlan(@ModelAttribute @Valid Plan plan, BindingResult result) {
        if (result.hasErrors()) {
            return "plan";
        }
        planService.updatePlan(plan);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String deletePlan(@PathVariable Long id) {
        planService.deletePlan(id);
        return "redirect:../list";
    }

    @GetMapping("/{plan}/details")
    public String showDetails(@PathVariable Plan plan, Model model) {
        model.addAttribute("plan",plan);
        return "planDetails";
    }

    @GetMapping("/{plan}/details/{id}/delete")
    public String deleteDetails(@PathVariable Long plan,@PathVariable Long id) {
        exerciseRepository.deleteExerciseFromPlan(id,plan);
        return "redirect:/plan/{plan}/details";
    }

/////////////////////////////////////////////////////////////////////////////////////
    /*@GetMapping("/{id}/exercise/add")
    public String addExerciseToPlan(@PathVariable Exercise id, Model model) {
        List<Plan> plans = planService.findAll();

        model.addAttribute("exercise",id);
        model.addAttribute("plans",plans);
        model.addAttribute("exerciseDto",new ExerciseController.PlansDto());
        return "exercise_plan";
    }
    @PostMapping("/{id}/plan/add")
    public String addExerciseToPlan(@PathVariable Exercise id, Model model, @ModelAttribute ExerciseController.PlansDto exerciseDto) {

        id.getPlans().addAll(exerciseDto.getPlans());
        exerciseService.saveExercise(id);
        //return "redirect:/exercise/list"; adamowe
        return "home";
    }

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
    }*/
}
