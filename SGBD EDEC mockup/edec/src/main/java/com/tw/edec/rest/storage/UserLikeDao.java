package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserLike;

import java.util.List;

public interface UserLikeDao {

    public void like_product(Long userId,Long productId);

    public void delete_like_product(Long userId,Long productId);

    public List<Product> getUsersLikedProducts(Long userId);

    public UserLike getUserLike(Long userId,Long productId);

}
