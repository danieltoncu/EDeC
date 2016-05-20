package com.tw.edec.web.models;

public class UserDislike {

    private Long userDislikeId;

    private User user;

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
