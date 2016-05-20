package com.tw.edec.rest.services;

import com.tw.edec.rest.models.User;

import java.util.List;

public interface UserService {

    public User addUser(User user);

    public User updateUser(User user);

    public void deleteUser(String username);

    public List<User> getAll();

    public User getUser(String username);
}
