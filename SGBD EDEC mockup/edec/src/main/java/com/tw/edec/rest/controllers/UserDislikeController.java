package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserDislike;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.services.UserDislikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users/{username:.+}/dislikedProducts")
public class UserDislikeController {

    @Autowired
    private UserDislikeService userDislikeService;

    /**Afisare produse care-i displac userului
     *
     * @param username
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getUserDislikeProducts(@PathVariable String username){
        return userDislikeService.getUsersDislikedProducts(username);
    }

    /**Afisare detalii produs displacut
     *
     * @param username
     * @param productName
     * @return
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.GET)
    public UserDislike getUserDislikeProduct(@PathVariable String username, @PathVariable String productName){
        return userDislikeService.getUserDislike(username,productName.replace('_',' '));
    }

    /**Userul adauga un produs pe lista sa de produse displacute
     *
     * @param username
     * @param productName
     * @return
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.POST)
    public UserDislike createUserDislike(@PathVariable String username,@PathVariable String productName){
        return userDislikeService.add_user_dislike(username,productName.replace('_',' '));
    }

    /**Userul sterge produsul de pe lista sa de produse preferate
     *
     * @param username
     * @param productName
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.DELETE)
    public void deleteUserDislike(@PathVariable String username,@PathVariable String productName){
        userDislikeService.delete_user_dislike(username,productName.replace('_',' '));
    }
}
