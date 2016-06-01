package com.tw.edec.web.controllers;

import com.tw.edec.utils.ErrorHandler;
import com.tw.edec.utils.SearchCriteria;
import com.tw.edec.web.models.*;
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

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    @RequestMapping(value="/{productName}" , method = RequestMethod.GET)
    public String showProduct(Model model,Principal principal, @PathVariable String productName){
        System.out.println("\ndisplayProduct");

        if(principal!=null)
            model.addAttribute("username",principal.getName());
        SearchCriteria searchCriteria=new SearchCriteria();
        model.addAttribute("searchCriteria",searchCriteria);

        String URL = REST_URL + "/products/"+productName;
        ResponseEntity<Product> singleProductResponseEntity;
        ResponseEntity<Product[]> relatedProductsResponseEntity;
        ResponseEntity<Characteristic[]> characteristicsResponceEntity;

        try {

            singleProductResponseEntity = restTemplate.exchange(URL, HttpMethod.GET, null, Product.class);
            Product product = singleProductResponseEntity.getBody();
            model.addAttribute("product",product);
            System.out.println("Get Product:\tHTTPStatusCode: " + singleProductResponseEntity.getStatusCode());

            characteristicsResponceEntity=restTemplate.exchange(URL+"/characteristics",HttpMethod.GET,null,Characteristic[].class);
            List<Characteristic> characteristicList=Arrays.asList(characteristicsResponceEntity.getBody());
            model.addAttribute("characteristics",characteristicList);
            System.out.println("Get Characteristics:\tHTTPStatusCode: " + characteristicsResponceEntity.getStatusCode());

            relatedProductsResponseEntity=restTemplate.exchange(URL+"/relatedProducts",HttpMethod.GET,null,Product[].class);
            List<Product> relatedProducts = Arrays.asList(relatedProductsResponseEntity.getBody());
            model.addAttribute("relatedProducts",relatedProducts);
            System.out.println("Get RelatedProducts:\tHTTPStatusCode: " + relatedProductsResponseEntity.getStatusCode());

        } catch (HttpClientErrorException e) {

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "product";
    }

    /*@RequestMapping(value="/likeproduct" , method=RequestMethod.POST)
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

            ErrorHandler errorHandler=new ErrorHandler(e);
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

            ErrorHandler errorHandler=new ErrorHandler(e);
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

            ErrorHandler errorHandler=new ErrorHandler(e);
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

            ErrorHandler errorHandler=new ErrorHandler(e);
        }
        return "redirect:/products/"+productName;
    }
*/
}
