package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.User;
import com.tw.edec.rest.models.UserPreferenceCount;

import java.util.List;

public interface UserDao {

    void add(User user);

    User update(User user);

    void delete(User user);

    User getByUsername(String username);

    User getById(Long userId);

    Long getId(String username);

    List<User> getAll();

    List<User> getSimilarUsers(Long userId);

    List<UserPreferenceCount> getTopRestrictive();

    List<UserPreferenceCount> getTopPermissive();
}
