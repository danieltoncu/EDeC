package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserLike;

import java.util.List;

public interface UserLikeService {

    public UserLike add_user_like(String username, String productName);

    public void delete_user_like(String username,String productName);

    public List<Product> getUsersLikedProducts(String username);

    public UserLike getUserLike(String username,String productName);
}
