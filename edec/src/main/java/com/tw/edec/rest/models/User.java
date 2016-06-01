package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="users")
public class User {

    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true,nullable = false,name="id")
    private Long id;

    @Column(unique = true,nullable = false,name="username")
    private String username;

    @Column(nullable = false,name="password")
    private String password;

    @Column(nullable = false,name="email")
    private String email;

    @JsonIgnore
    @OneToMany(mappedBy = "user",cascade={CascadeType.PERSIST,CascadeType.REMOVE})
    private Set<UserRole> userRoleSet=new HashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "user",cascade = {CascadeType.REMOVE})
    private Set<UserLike> userLikeSet;

    @JsonIgnore
    @OneToMany(mappedBy = "user",cascade = {CascadeType.REMOVE})
    private Set<UserDislike> userDislikeSet;

    @JsonIgnore
    @OneToOne(mappedBy = "user",cascade = {CascadeType.PERSIST,CascadeType.PERSIST})
    private UserPreferenceCount userPreferenceCount=new UserPreferenceCount();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Set<UserRole> getUserRoleSet() {
        return userRoleSet;
    }

    public void setUserRoleSet(Set<UserRole> userRoleSet) {
        this.userRoleSet = userRoleSet;
    }

    public Set<UserLike> getUserLikeSet() {
        return userLikeSet;
    }

    public void setUserLikeSet(Set<UserLike> userLikeSet) {
        this.userLikeSet = userLikeSet;
    }

    public Set<UserDislike> getUserDislikeSet() {
        return userDislikeSet;
    }

    public void setUserDislikeSet(Set<UserDislike> userDislikeSet) {
        this.userDislikeSet = userDislikeSet;
    }

    public UserPreferenceCount getUserPreferenceCount() {
        return userPreferenceCount;
    }

    public void setUserPreferenceCount(UserPreferenceCount userPreferenceCount) {
        this.userPreferenceCount = userPreferenceCount;
    }
}
