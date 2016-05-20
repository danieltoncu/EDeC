package com.tw.edec.rest.controllers;

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
@RequestMapping("/users/{username:.+}/likedProducts")
public class UserLikeController {

    @Autowired
    private UserLikeService userLikeService;

    /** Afisare produse placute de user
     *
     * @param username
     * @return lista de produse pe care le place userul
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getUserLikeProducts(@PathVariable String username){
        return userLikeService.getUsersLikedProducts(username);
    }

    /**Afisare detalii produs placut(pe viitor poate si adaugat si un timestamp)
     *
     * @param username
     * @param productName numele produsului(in URI el apare cu _ in loc de spații)
     * @return
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.GET)
    public UserLike getUserLikeProduct(@PathVariable String username,@PathVariable String productName){
        return userLikeService.getUserLike(username,productName.replace('_',' '));
    }

    /**Userul adauga un produs pe lista sa de produse preferate
     *
     * @param username
     * @param productName numele produsului(in URI el apare cu _ in loc de spații)
     * @return
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.POST)
    public UserLike createUserLike(@PathVariable String username,@PathVariable String productName){
        return userLikeService.add_user_like(username,productName.replace('_',' '));
    }

    /**Userul sterge produsul de pe lista sa de produse preferate
     *
     * @param username
     * @param productName numele produsului(in URI el apare cu _ in loc de spații)
     */
    @RequestMapping(path="/{productName}",method=RequestMethod.DELETE)
    public void deleteUserLike(@PathVariable String username,@PathVariable String productName){
        userLikeService.delete_user_like(username,productName.replace('_',' '));
    }
}
