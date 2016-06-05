package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.User;

import java.util.List;

public interface UserService {

    User addUser(User user);

    User updateUser(String username,User user);

    void deleteUser(String username);

    List<User> getAll();

    User getUser(String username);

    List<User> getSimilarUsers(String username);

    List<Product> getSuggestions(String username);

    List<Product> getProductsToAvoid(String username);
}
