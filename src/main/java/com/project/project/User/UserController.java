package com.project.project.User;


import com.project.project.Exercise.ExerciseService;
import com.project.project.Plan.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.print.Book;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    private UserService userService;

    private PlanService planService;

    private ExerciseService exerciseService;

    private UserRepository userRepository;


    @Autowired
    public UserController(UserService userService, PlanService planService, ExerciseService exerciseService, UserRepository userRepository) {
        this.userService = userService;
        this.planService = planService;
        this.exerciseService = exerciseService;
        this.userRepository=userRepository;
    }

    @GetMapping("/register")
    public String addUser(Model model) {
        model.addAttribute("user",new User()) ;
        return "user";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }
        userService.saveUser(user);
        return "redirect:list";
    }


    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @PostMapping("/login")
    public String login(@RequestParam(name = "mail") String mail,
                        @RequestParam(name = "password") String password,
                        HttpServletResponse response) {
        User user = userRepository.findUserByMail(mail);
        if (user != null && user.getPassword().equals(password)) {
            Cookie cookie = new Cookie("user", user.getId().toString());
            cookie.setPath("/");
            cookie.setMaxAge(60*60*24);
            response.addCookie(cookie);
            return "redirect:/home";
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        return "login";
    }

    @PostMapping("/logout")
    public String logout(HttpServletResponse response) {
            Cookie cookie = new Cookie("user","asd");
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            return "redirect:/user/login";

    }




    @GetMapping("/list")
    public String getUsers(Model model){
        List<User> users= userService.findAll();
        model.addAttribute("users",users);
        return "userList";
    }




    @GetMapping("/update/{id}")
    public String updateBook(@PathVariable Long id, Model model) {
        User user = userService.findUserWithNick(id);
        model.addAttribute("user", user);
        return "user";
    }

    @PostMapping("/update/{id}")
    public String updateBook(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }
        userService.updateUser(user);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:../list";
    }




}
