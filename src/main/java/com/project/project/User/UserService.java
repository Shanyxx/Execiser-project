package com.project.project.User;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.print.Book;
import java.util.List;


@Service
@Transactional
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository){
        this.userRepository=userRepository;
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public void updateUser(User user) {
        userRepository.save(user);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public User findUser(Long id) {
        return userRepository.findById(id).orElse(null);
    }


    public User findUserWithNick(Long id) {
        User user = findUser(id);
        Hibernate.initialize(user.getNick());
        return user;
    }

   /* public User findUserWithMail(String mail) {
        User user = findUserWithMail(mail);
        Hibernate.initialize(user.getMail());
        return user;
    }*/

    public List<User> findAll(){
        List<User> users = userRepository.findAll();
        users.forEach(b-> Hibernate.initialize(b.getNick()));
        return users;
    }
}

