package com.tw.edec.rest.models;


import javax.persistence.*;

@Entity
@Table(name="user_likes")
public class UserLike {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="user_likes_id")
    private Long userLikeId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public Long getUserLikeId() {
        return userLikeId;
    }

    public void setUserLikeId(Long userLikeId) {
        this.userLikeId = userLikeId;
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
