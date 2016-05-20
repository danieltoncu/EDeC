package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name = "users_role")
public class UserRole {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)   postgres
    @GeneratedValue(strategy= GenerationType.TABLE)  //oracle
    @Column(name = "users_role_id")
    private Long id;

    @ManyToOne
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

    @Column(nullable = false, name = "user_role")
    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}