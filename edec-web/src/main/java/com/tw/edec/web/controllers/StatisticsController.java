package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;

@Controller
public class StatisticsController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value="/statistics",method = RequestMethod.GET)
    public String displayStatistics(Model model, Principal principal){
        System.out.println("\ndisplayStatistics");
        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        Requests requests=new Requests();

        try{
            requests.getTopLikedCharacteristics(restTemplate, model);

            requests.getTopDislikedCharacteristics(restTemplate, model);

            requests.getTopPermissiveUsers(restTemplate,model);

            requests.getTopRestrictiveUsers(restTemplate,model);

        }catch(HttpClientErrorException e){
            new ErrorHandler(e);
        }

        return "statistics";
    }
}
