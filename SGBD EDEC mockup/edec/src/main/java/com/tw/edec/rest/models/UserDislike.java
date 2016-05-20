package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="user_dislikes")
public class UserDislike {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="user_dislikes_id")
    private Long userDislikeId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public Long getUserDislikeId() {
        return userDislikeId;
    }

    public void setUserDislikeId(Long userDislikeId) {
        this.userDislikeId = userDislikeId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
