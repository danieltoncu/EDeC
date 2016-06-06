package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.web.models.Product;
import com.tw.edec.web.models.UserDislike;
import com.tw.edec.web.models.UserLike;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;

@Controller
public class LikeDislikeController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec/users/";

    @RequestMapping(value="/like", method = RequestMethod.GET)
    public String processLike(Principal principal, @RequestParam(required = false) String name,@RequestParam(required = false) String product){
        String url=REST_URL+principal.getName()+"/likes/"+name;
        Requests requests=new Requests();

        try {
            requests.postUserLike(restTemplate,url);

        }catch (HttpClientErrorException e) {

            new ErrorHandler(e);
        }
        if(product!=null)
            return "redirect:/products/"+product.replaceAll(" ","%20");
        return "redirect:/myaccount";
    }

    @RequestMapping(value="/dislike", method = RequestMethod.GET)
    public String processDislike(Principal principal,@RequestParam(required = false) String name, @RequestParam(required = false) String product){
        String url=REST_URL+principal.getName()+"/dislikes/"+name;
        Requests requests=new Requests();

        try {
            requests.postUserDislike(restTemplate,url);

        }catch (HttpClientErrorException e) {

            new ErrorHandler(e);
        }
        if(product!=null)
            return "redirect:/products/"+product.replaceAll(" ","%20");
        return "redirect:/myaccount";
    }

    @RequestMapping(value="/removeLike")
    public String processRemoveLike(Principal principal,@RequestParam(required = false) String name){
        String url=REST_URL+principal.getName()+"/likes/"+name;
        Requests requests=new Requests();

        try {
            requests.deleteUserLike(restTemplate,url);

        }catch (HttpClientErrorException e) {

            new ErrorHandler(e);
        }
        return "redirect:/myaccount";
    }

    @RequestMapping(value="/removeDislike")
    public String processRemoveDislike(Principal principal,@RequestParam(required = false) String name){
        String url=REST_URL+principal.getName()+"/dislikes/"+name;
        Requests requests=new Requests();

        try {
            requests.deleteUserDislike(restTemplate,url);

        }catch (HttpClientErrorException e) {

            new ErrorHandler(e);
        }
        return "redirect:/myaccount";
    }
}
