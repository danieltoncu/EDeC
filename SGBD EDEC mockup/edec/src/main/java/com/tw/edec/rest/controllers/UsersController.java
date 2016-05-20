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

    @RequestMapping(method = RequestMethod.GET, path = "/{username:.+}")
    public User getUser(@PathVariable String username) {
        return userService.getUser(username);
    }

    @RequestMapping(method = RequestMethod.POST)
    public User createUser(@RequestBody User user) {
        Set<String> userRole=new HashSet<>();
        userRole.add("ROLE_USER");
        return userService.addUser(user);
    }

    @RequestMapping(method = RequestMethod.PUT, path = "/{username:.+}")
    public User updateUser(@PathVariable String username, @RequestBody User user) {
        return null;
    }

    @RequestMapping(method = RequestMethod.DELETE, path = "/{username:.+}")
    public void deleteUser(@PathVariable String username) {
        userService.deleteUser(username);
    }
}
