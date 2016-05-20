package com.tw.edec.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class HomeController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String goToHome(){
        return "redirect:/home";
    }

    @RequestMapping(value="/home",method= RequestMethod.GET)
    public String displayHome(Model model,Principal principal) {
        model.addAttribute("username",principal.getName());
        return "home";
    }
}
