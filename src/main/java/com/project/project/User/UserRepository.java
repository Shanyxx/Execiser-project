package com.project.project.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {


    User findUserByMail(String mail);
}
