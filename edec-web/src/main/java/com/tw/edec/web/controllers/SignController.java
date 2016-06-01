package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import com.tw.edec.web.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
public class SignController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    @RequestMapping(value="/sign",method = RequestMethod.GET)
    public String showLoginRegister(Model model){
        System.out.println("showLoginRegister");

        User userForm = new User();
        model.addAttribute("userForm", userForm);
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        return "login";
    }

    @RequestMapping(value="/loginfailed",method = RequestMethod.GET)
    public String loginFailed(Model model){
        System.out.println("loginFailed");

        User userForm = new User();
        model.addAttribute("userForm", userForm);
        model.addAttribute("errorLogin","true");
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        return "login";
    }

    @RequestMapping(value="/sign",method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") User user, Model model){

        HttpEntity<User> request = new HttpEntity<>(user);
        try{
            restTemplate
                    .exchange(REST_URL + "/users/", HttpMethod.POST, request, User.class);

        }catch(HttpClientErrorException e){
            ErrorHandler errorHandler=new ErrorHandler(e);

            User userForm = new User();
            model.addAttribute("userForm", userForm);
            model.addAttribute("errorRegister","true");
            model.addAttribute("errorMessage",errorHandler.getErrorMessage());
            SearchCriteria searchCriteria=new SearchCriteria();
            model.addAttribute("searchCriteria",searchCriteria);
            return "login";

        }
        return "redirect:/sign";
    }
}
