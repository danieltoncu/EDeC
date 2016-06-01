package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.services.UserLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users/{username:.+}/likes")
public class UserLikeController {

    @Autowired
    private UserLikeService userLikeService;

    @RequestMapping(method = RequestMethod.GET)
    public List<Characteristic> getUserLikes(@PathVariable String username){
        return userLikeService.getAllUserLikes(username);
    }

    @RequestMapping(path="/{characteristicName}" , method=RequestMethod.GET)
    public UserLike getUserLike(@PathVariable String username,@PathVariable String characteristicName){
        return userLikeService.getUserLike(username,characteristicName);
    }

    @RequestMapping(path="/{characteristicName}" , method=RequestMethod.POST)
    public UserLike createUserLike(@PathVariable String username,@PathVariable String characteristicName){
        return userLikeService.addUserLike(username,characteristicName);
    }

    @RequestMapping(path="/{characteristicName}" , method=RequestMethod.DELETE)
    public void deleteUserLike(@PathVariable String username,@PathVariable String characteristicName){
        userLikeService.removeUserLike(username,characteristicName);
    }
}
