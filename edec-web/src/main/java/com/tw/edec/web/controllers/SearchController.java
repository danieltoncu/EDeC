package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.web.models.Product;
import com.tw.edec.utils.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import static java.util.stream.Collectors.toMap;

@Controller

public class SearchController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    private String createURLForExchange(Integer pag,String name,String category){
        String URL=REST_URL+"/products?pag=" + pag;
        if(name!=null)   URL+="&name="+name;    //search din searchBox
        if(category!=null)   URL+="&category="+category;  //search din click pe categorie
        return URL;
    }

    @RequestMapping(value="/search",method = RequestMethod.GET)
    public String displaySearch(Model model,
                                @RequestParam(required = false) Integer pag,
                                @RequestParam(required = false) String name,
                                @RequestParam(required = false) String category,
                                Principal principal){
        System.out.println("\ndisplaySearch");

        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);
        searchCriteria.setSearchInput(name);

        String URL = createURLForExchange(pag,name,category);
        Requests requests=new Requests();

        try {
            requests.getSearchProducts(restTemplate,model,URL);

            model.addAttribute("nrPagina",pag);
            model.addAttribute("name",name);
            model.addAttribute("category",category);

        } catch (HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "search";

    }

    @RequestMapping(value="/search",method = RequestMethod.POST)
    public String processSearch(Model model,
                                @ModelAttribute("userForm") SearchCriteria searchCriteria){
        System.out.println("processSearch");
        if(searchCriteria.getSearchInput()!=null)
            return "redirect:/search?pag=1&name="+searchCriteria.getSearchInput();

        return "redirect:/search";
    }



}
