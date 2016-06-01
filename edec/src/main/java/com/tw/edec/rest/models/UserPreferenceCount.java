package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="user_pref_count")
public class UserPreferenceCount {

    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique=true,nullable = false,name="id")
    private Long id;

    @OneToOne
    @JoinColumn(name="user_id")
    private User user;

    @Column(name="count_likes")
    private Long countLikes;

    @Column(name="count_dislikes")
    private Long countDislikes;

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

    public Long getCountLikes() {
        return countLikes;
    }

    public void setCountLikes(Long countLikes) {
        this.countLikes = countLikes;
    }

    public Long getCountDislikes() {
        return countDislikes;
    }

    public void setCountDislikes(Long countDislikes) {
        this.countDislikes = countDislikes;
    }
}
