package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserDislike;

import java.util.List;

public interface UserDislikeService {

    public UserDislike add_user_dislike(String username,String productName);

    public void delete_user_dislike(String username,String productName);

    public List<Product> getUsersDislikedProducts(String username);

    public UserDislike getUserDislike(String username,String productName);
}
