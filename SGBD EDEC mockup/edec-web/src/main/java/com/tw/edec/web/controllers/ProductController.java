package com.tw.edec.web.controllers;

import com.tw.edec.web.models.Product;
import com.tw.edec.web.models.UserDislike;
import com.tw.edec.web.models.UserLike;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

import static java.util.stream.Collectors.toMap;

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    @RequestMapping(value="/{productName}" , method = RequestMethod.GET)
    public String showProduct(Model model, @PathVariable String productName){
        String URL = REST_URL + "/products/"+productName;
        ResponseEntity<Product> responseEntity;

        try {
            responseEntity = restTemplate
                    .exchange(URL, HttpMethod.GET, null, Product.class);
            Product product = responseEntity.getBody();
            System.out.println("HTTPStatusCode: " + responseEntity.getStatusCode());

            model.addAttribute("product",product);

        } catch (HttpClientErrorException e) {
            System.out.println("HttpClientErrorException: " + e.getMessage());
            String responseBody = e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: " + responseBody);

            String messageError = responseBody.split("\"message\":")[1];
            messageError = messageError.substring(0, messageError.length() - 1);
        }
        return "product";
    }

    @RequestMapping(value="/likeproduct" , method=RequestMethod.POST)
    public String likeProduct(Principal principal, Model model, @RequestParam String productName){
        System.out.println("Intra in LikeProduct.POST");
        String URL = REST_URL+"/users/"+principal.getName()+"/likedProducts/"+productName;
        ResponseEntity<UserLike> responseEntity;
        try {
            responseEntity = restTemplate
                    .exchange(URL, HttpMethod.POST, null, UserLike.class);
            UserLike userLike=responseEntity.getBody();
            System.out.println("HTTPStatusCode: " + responseEntity.getStatusCode());
        }catch (HttpClientErrorException e) {
            System.out.println("HttpClientErrorException: " + e.getMessage());
            String responseBody = e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: " + responseBody);

            String messageError = responseBody.split("\"message\":")[1];
            messageError = messageError.substring(0, messageError.length() - 1);
        }
        return "redirect:/products/"+productName;
    }

    @RequestMapping(value="/dislikeproduct" , method=RequestMethod.POST)
    public String dislikeProduct(Principal principal, Model model,@RequestParam String productName){
        System.out.println("Intra in dislikeProduct.POST");
        String URL = REST_URL+"/users/"+principal.getName()+"/dislikedProducts/"+productName;
        ResponseEntity<UserDislike> responseEntity;
        try {
            responseEntity = restTemplate
                    .exchange(URL, HttpMethod.POST, null, UserDislike.class);
            UserDislike userDislike=responseEntity.getBody();
            System.out.println("HTTPStatusCode: " + responseEntity.getStatusCode());
        }catch (HttpClientErrorException e) {
            System.out.println("HttpClientErrorException: " + e.getMessage());
            String responseBody = e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: " + responseBody);

            String messageError = responseBody.split("\"message\":")[1];
            messageError = messageError.substring(0, messageError.length() - 1);
        }
        return "redirect:/products/"+productName;
    }

    @RequestMapping(value="/removelikeproduct" , method=RequestMethod.POST)
    public String removeLikeProduct(Principal principal, Model model, @RequestParam String productName){
        System.out.println("Intra in RemoveLikeProduct.POST");
        String URL = REST_URL+"/users/"+principal.getName()+"/likedProducts/"+productName;
        try {
            restTemplate.exchange(URL, HttpMethod.DELETE, null, Object.class);
        }catch (HttpClientErrorException e) {
            System.out.println("HttpClientErrorException: " + e.getMessage());
            String responseBody = e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: " + responseBody);

            String messageError = responseBody.split("\"message\":")[1];
            messageError = messageError.substring(0, messageError.length() - 1);
        }
        return "redirect:/products/"+productName;
    }

    @RequestMapping(value="/removedislikeproduct" , method=RequestMethod.POST)
    public String removeDislikeProduct(Principal principal, Model model, @RequestParam String productName){
        System.out.println("Intra in RemoveDislikeProduct.POST");
        String URL = REST_URL+"/users/"+principal.getName()+"/dislikedProducts/"+productName;
        try {
            restTemplate.exchange(URL, HttpMethod.DELETE, null, Object.class);
        }catch (HttpClientErrorException e) {
            System.out.println("HttpClientErrorException: " + e.getMessage());
            String responseBody = e.getResponseBodyAsString();
            System.out.println("GetResponseBodyAsString: " + responseBody);

            String messageError = responseBody.split("\"message\":")[1];
            messageError = messageError.substring(0, messageError.length() - 1);
        }
        return "redirect:/products/"+productName;
    }

}
