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

    @RequestMapping(value="/sign",method = RequestMethod.GET)
    public String showLoginRegister(Model model){
        System.out.println("\ndisplayLoginRegister");

        User userForm = new User();
        model.addAttribute("userForm", userForm);
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        return "login";
    }

    @RequestMapping(value="/loginfailed",method = RequestMethod.GET)
    public String loginFailed(Model model){
        System.out.println("\ndisplay LoginFailed");

        User userForm = new User();
        model.addAttribute("userForm", userForm);
        model.addAttribute("errorLogin","true");
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        return "login";
    }

    @RequestMapping(value="/sign",method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") User user, Model model){

        Requests requests=new Requests();

        try{
            requests.postUser(restTemplate,user);

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
