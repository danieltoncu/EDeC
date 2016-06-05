package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import com.tw.edec.web.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String goToHome(){
        return "redirect:/home";
    }

    @RequestMapping(value="/home",method= RequestMethod.GET)
    public String displayHome(Model model,Principal principal) {
        System.out.println("\ndisplayHome");

        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        Requests requests=new Requests();
        try {

            requests.getLatestProducts(restTemplate,model);

            requests.getTop5Health(restTemplate,model);
//          Asta e requestul facut catre server pentru cele 5 produse(pe care eu vreau sa le iau prin AJAX)
            requests.getTop5Society(restTemplate,model);

            requests.getTop5Environment(restTemplate,model);

        } catch (HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "home";
    }
}
