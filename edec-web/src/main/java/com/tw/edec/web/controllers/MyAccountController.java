package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.web.models.Product;
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
import java.util.function.Function;

import static java.util.stream.Collectors.toMap;

@Controller
public class MyAccountController {
    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    @RequestMapping(value="/myaccount",method = RequestMethod.GET)
    public String showMyAccount(Model model,Principal principal){
        System.out.println("Intra in showMyAccount.GET");
        String URL = REST_URL + "/users/"+principal.getName();
        ResponseEntity<Product[]> responseEntity;

        try {
            //request pentru produsele preferate ale userului
            responseEntity = restTemplate
                    .exchange(URL+"/likedProducts", HttpMethod.GET, null, Product[].class);
            List<Product> userLikedProducts = Arrays.asList(responseEntity.getBody());
            System.out.println(URL+"/likedProducts.GET\tHTTPStatusCode: " + responseEntity.getStatusCode());
            //request pentru produsele neplacute ale userului
            responseEntity = restTemplate
                    .exchange(URL+"/dislikedProducts", HttpMethod.GET, null, Product[].class);
            List<Product> userDislikedProducts = Arrays.asList(responseEntity.getBody());
            System.out.println(URL+"/dislikedProducts.GET\tHTTPStatusCode: " + responseEntity.getStatusCode());

            model.addAttribute("userLikedProducts",userLikedProducts.stream().collect(toMap(Product::getId, Function.<Product> identity())));
            model.addAttribute("userDislikedProducts",userDislikedProducts.stream().collect(toMap(Product::getId, Function.<Product> identity())));

        } catch (HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        model.addAttribute("username",principal.getName());
        return "myaccount";
    }

    @RequestMapping(value="/myaccount",method = RequestMethod.POST)
    public String exportDatabase(Model model){
        System.out.println("Intra in exportDatabase.POST");
        restTemplate.exchange(REST_URL+"/export",HttpMethod.GET, null,Object.class);
        return "redirect:/myaccount";
    }
}
