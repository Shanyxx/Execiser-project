package com.project.project.Exercise;


import com.project.project.Plan.Plan;
import com.project.project.User.User;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "exercise")
public class Exercise {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 2,max = 50)
    private String name;



    @NotNull
    @Range(min = 1,max= 1000)
    private Integer numberOfRepetitions;

    @NotNull
    @Range(min = 1,max= 10000)
    private Integer timeOfRepetition;


    @NotNull
    @Range (min = 1,max =1000)
    private Integer numberOfSeries;

    @NotBlank
    @Size(min=1,max=1000)
    private String description;

    @ManyToOne
    private User user;

    @ManyToMany
    @JoinTable(name = "exercise_plans",
            joinColumns = @JoinColumn(name = "exercise_id"),
            inverseJoinColumns = @JoinColumn(name = "plan_id"))
    private List<Plan> plans;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public  Integer getNumberOfRepetitions() {
        return numberOfRepetitions;
    }

    public void setNumberOfRepetitions( Integer numberOfRepetitions) {
        this.numberOfRepetitions = numberOfRepetitions;
    }

    public  Integer getTimeOfRepetition() {
        return timeOfRepetition;
    }

    public void setTimeOfRepetition( Integer timeOfRepetition) {
        this.timeOfRepetition = timeOfRepetition;
    }

    public  Integer getNumberOfSeries() {
        return numberOfSeries;
    }

    public void setNumberOfSeries( Integer numberOfSeries) {
        this.numberOfSeries = numberOfSeries;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Plan> getPlans() {
        return plans;
    }

    public void setPlans(List<Plan> plans) {
        this.plans = plans;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
