package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="users")
public class User {

    @Id
    //@GeneratedValue(strategy= GenerationType.IDENTITY) postgres
    @GeneratedValue(strategy= GenerationType.TABLE)      //oracle
    @Column(nullable = false,name="user_id")
    private Long userId;

    @Column(unique = true,nullable = false,name="username")
    private String username;

    @Column(nullable = false,name="password")
    private String password;

    @Column(nullable = false,name="email")
    private String email;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy="user",cascade={CascadeType.PERSIST,CascadeType.REMOVE})
    private Set<UserRole> userRole =new HashSet<>();

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "user",cascade={CascadeType.PERSIST,CascadeType.REMOVE})
    private Set<UserDislike> userDislikes;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "user",cascade={CascadeType.PERSIST,CascadeType.REMOVE})
    private Set<UserLike> userLikes;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<UserRole> getUserRole() {
        return userRole;
    }

    public void setUserRole(Set<UserRole> userRole) {
        this.userRole = userRole;
    }

    public Set<UserDislike> getUserDislikes() {
        return userDislikes;
    }

    public void setUserDislikes(Set<UserDislike> userDislikes) {
        this.userDislikes = userDislikes;
    }

    public Set<UserLike> getUserLikes() {
        return userLikes;
    }

    public void setUserLikes(Set<UserLike> userLikes) {
        this.userLikes = userLikes;
    }


}
