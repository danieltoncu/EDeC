package com.tw.edec.web.controllers;

import com.tw.edec.utils.SearchCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class AboutRatingsController {

    private Model addUsernameAndSearchCriteria(Model model,Principal principal){
        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);
        return model;
    }

    @RequestMapping(value="/about",method = RequestMethod.GET)
    public String displayAbout(Model model, Principal principal){
        System.out.println("displayAbout");
        model=addUsernameAndSearchCriteria(model,principal);

        return "about";
    }

    @RequestMapping(value="/ratings",method = RequestMethod.GET)
    public String displayRatings(Model model, Principal principal){
        System.out.println("displayRatings");
        model=addUsernameAndSearchCriteria(model,principal);

        return "ratings";
    }
}