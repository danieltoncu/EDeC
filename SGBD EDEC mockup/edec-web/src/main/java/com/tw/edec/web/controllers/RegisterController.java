package com.tw.edec.web.controllers;

import com.tw.edec.utils.SecurityUtils;
import com.tw.edec.web.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    @RequestMapping(/*value = "/register",*/method= RequestMethod.GET)
    public String showRegister(Model model){
        User userForm = new User();
        model.addAttribute("userForm", userForm);

        System.out.println("in the register method");
        return "register";
    }


    @RequestMapping(method= RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") User user, Model model){

        HttpEntity<User> request = new HttpEntity<>(user);
        ResponseEntity<User> responseEntity;
        try{
            responseEntity = restTemplate
                    .exchange(REST_URL + "/users/", HttpMethod.POST, request, User.class);
            System.out.println("HTTPStatusCode: "+responseEntity.getStatusCode());
            System.out.println("username: " + user.getUsername());
            System.out.println("password: " + user.getPassword());
            System.out.println("email: " + user.getEmail());

        }catch(HttpClientErrorException e){
            System.out.println("HttpClientErrorException: "+e.getMessage());
            String responseBody=e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: "+responseBody);

            String messageError=responseBody.split("\"message\":")[1];
            messageError=messageError.substring(0,messageError.length()-1);

            model.addAttribute("error","true");
            model.addAttribute("errorMessage",messageError);
            return "register";

        }
        return "redirect:/home";
    }

}
