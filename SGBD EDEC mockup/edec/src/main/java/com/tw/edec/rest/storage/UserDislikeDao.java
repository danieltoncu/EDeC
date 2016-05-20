package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserDislike;

import java.util.List;

public interface UserDislikeDao {

    public void dislike_product(Long userId,Long productId);

    public void delete_dislike_product(Long userId,Long productId);

    public List<Product> getUsersDislikedProducts(Long userId);

    public UserDislike getUserDislike(Long userId,Long productId);
}
