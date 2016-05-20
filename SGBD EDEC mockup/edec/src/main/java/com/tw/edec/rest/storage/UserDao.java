package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    public void add(User user) throws SQLException;

    public User update(User user);

    public void delete(User user);

    public User getByUsername(String username);

    public User getById(Long userId);

    public Long getId(String username);

    public List<User> getUsers();
}
