package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.User;
import com.tw.edec.rest.models.UserPreferenceCount;
import com.tw.edec.rest.services.UserService;
import com.tw.edec.rest.storage.ProductDao;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;

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

    @RequestMapping(value="/{username}/similarUsers", method = RequestMethod.GET)
    public List<User> getSimilarUsers(@PathVariable String username){
        return userService.getSimilarUsers(username);
    }

    @RequestMapping(value="/top5RestrictiveUsers", method = RequestMethod.GET)
    public List<UserPreferenceCount> getTopRestrictiveUsers(){
        return userDao.getTopRestrictive();
    }

    @RequestMapping(value="/top5PermissiveUsers", method = RequestMethod.GET)
    public List<UserPreferenceCount> getTopIndulgentUsers(){
        return userDao.getTopPermissive();
    }

    @RequestMapping(value="/{username}/suggestions", method = RequestMethod.GET)
    public List<Product> getSuggestions(@PathVariable String username){
        return userService.getSuggestions(username);
    }

    @RequestMapping(value="/{username}/toAvoid", method = RequestMethod.GET)
    public List<Product> getProductsToAvoid(@PathVariable String username){
        return userService.getProductsToAvoid(username);
    }
}
