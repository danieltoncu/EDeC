package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.User;
import com.tw.edec.rest.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/users")
public class UsersController {

    @Autowired
    UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public List<User> getUsers() {
        return userService.getAll();
    }

    @RequestMapping(path = "/{username:.+}",method = RequestMethod.GET)
    public User getUser(@PathVariable String username) {
        return userService.getUser(username);
    }

    @RequestMapping(method = RequestMethod.POST)
    public User createUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    @RequestMapping(path = "/{username:.+}", method = RequestMethod.PUT)
    public User updateUser(@PathVariable String username, @RequestBody User user) {
        return userService.updateUser(username,user);
    }

    @RequestMapping(path = "/{username:.+}", method = RequestMethod.DELETE)
    public void deleteUser(@PathVariable String username) {
        userService.deleteUser(username);
    }
}
