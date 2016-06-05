package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value="/{productName}" , method = RequestMethod.GET)
    public String showProduct(Model model,Principal principal, @PathVariable String productName){
        System.out.println("\ndisplayProduct");

        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        Requests requests=new Requests();
        try {

            requests.getProduct(restTemplate, model, productName);

            requests.getCharacteristics(restTemplate, model,productName);

            requests.getRelatedProducts(restTemplate, model,productName);

            if(principal!=null) //daca e logat preiau si lista de likes/dislikes pentru a-i restrictiona accesul la butoane
            {
                requests.getUserLikes(restTemplate, model,principal);

                requests.getUserDislikes(restTemplate, model,principal);
            }

        } catch (HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "product";
    }

}
