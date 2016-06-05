package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserDislike;
import com.tw.edec.rest.services.UserDislikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users/{username:.+}/dislikes")
public class UserDislikeController {

    @Autowired
    private UserDislikeService userDislikeService;

    @RequestMapping(method = RequestMethod.GET)
    public List<Characteristic> getUserDislikeProducts(@PathVariable String username){
        return userDislikeService.getAllUserDislikes(username);
    }

    @RequestMapping(path="/{characteristicName}",method=RequestMethod.GET)
    public UserDislike getUserDislikeProduct(@PathVariable String username, @PathVariable String productName){
        return userDislikeService.getUserDislike(username,productName);
    }

    @RequestMapping(path="/{characteristicName}",method=RequestMethod.POST)
    public UserDislike createUserDislike(@PathVariable String username,@PathVariable String characteristicName){
        return userDislikeService.addUserDislike(username,characteristicName);
    }


    @RequestMapping(path="/{characteristicName}",method=RequestMethod.DELETE)
    public void deleteUserDislike(@PathVariable String username,@PathVariable String characteristicName){
        userDislikeService.removeUserDislike(username,characteristicName);
    }
}
