package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import com.tw.edec.web.models.Characteristic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import static java.util.stream.Collectors.toMap;

@Controller
public class MyAccountController {
    @Autowired
    private RestTemplate restTemplate;
    //TODO THE MAIN EVENT OF THE APP! WE NEED THIS TO PASS! GO GO OG

    @RequestMapping(value="/myaccount",method = RequestMethod.GET)
    public String displayMyAccount(Model model,Principal principal){
        System.out.println("\ndisplayMyAccount");

        model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        Requests requests=new Requests();
        try{
            requests.getUserLikes(restTemplate,model,principal);

            requests.getUserDislikes(restTemplate,model,principal);


        }catch(HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "myAccount";
    }

}
