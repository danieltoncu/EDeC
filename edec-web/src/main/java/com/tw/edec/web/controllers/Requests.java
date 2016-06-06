package com.tw.edec.web.controllers;

import com.tw.edec.web.models.*;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

public class Requests {

    private static final String REST_URL="http://localhost:8181/edec";

    void getProduct(RestTemplate restTemplate, Model model, String productName) throws HttpClientErrorException {
        ResponseEntity<Product> singleProductResponseEntity=null;
        String URL = REST_URL + "/products/"+productName;
        singleProductResponseEntity = restTemplate.exchange(URL, HttpMethod.GET, null, Product.class);
        Product product = singleProductResponseEntity.getBody();
        model.addAttribute("product",product);
        System.out.println("Get Product:\t\tHTTPStatusCode: " + singleProductResponseEntity.getStatusCode());
    }

    void getCharacteristics(RestTemplate restTemplate, Model model,String productName) throws HttpClientErrorException{
        String URL = REST_URL + "/products/"+productName;
        ResponseEntity<Characteristic[]> characteristicsResponceEntity;
        characteristicsResponceEntity=restTemplate.exchange(URL+"/characteristics",HttpMethod.GET,null,Characteristic[].class);
        List<Characteristic> characteristicList= Arrays.asList(characteristicsResponceEntity.getBody());
        model.addAttribute("characteristics",characteristicList);
        System.out.println("Get Characteristics:\tHTTPStatusCode: " + characteristicsResponceEntity.getStatusCode());
    }

    void getRelatedProducts(RestTemplate restTemplate, Model model, String productName) throws HttpClientErrorException{
        String URL = REST_URL + "/products/"+productName;
        ResponseEntity<Product[]> relatedProductsResponseEntity;
        relatedProductsResponseEntity=restTemplate.exchange(URL+"/relatedProducts",HttpMethod.GET,null,Product[].class);
        List<Product> relatedProducts = Arrays.asList(relatedProductsResponseEntity.getBody());
        model.addAttribute("relatedProducts",relatedProducts);
        System.out.println("Get RelatedProducts:\tHTTPStatusCode: " + relatedProductsResponseEntity.getStatusCode());
    }

    void getUserLikes(RestTemplate restTemplate, Model model,Principal principal) throws HttpClientErrorException{
        ResponseEntity<Characteristic[]> characteristicsResponceEntity;
        characteristicsResponceEntity=restTemplate.exchange(REST_URL+"/users/"+principal.getName()+"/likes",HttpMethod.GET,null,Characteristic[].class);
        List<Characteristic> userLikes=Arrays.asList(characteristicsResponceEntity.getBody());
        model.addAttribute("userLikes",userLikes);
        System.out.println("Get UserLikes:\t\tHTTPStatusCode: " + characteristicsResponceEntity.getStatusCode());
    }

    void getUserDislikes(RestTemplate restTemplate, Model model, Principal principal) throws HttpClientErrorException{
        ResponseEntity<Characteristic[]> characteristicsResponseEntity;
        characteristicsResponseEntity=restTemplate.exchange(REST_URL+"/users/"+principal.getName()+"/dislikes",HttpMethod.GET,null,Characteristic[].class);
        List<Characteristic> userDislikes=Arrays.asList(characteristicsResponseEntity.getBody());
        model.addAttribute("userDislikes",userDislikes);
        System.out.println("Get UserDislikes:\tHTTPStatusCode: " + characteristicsResponseEntity.getStatusCode());
    }

    void getLatestProducts(RestTemplate restTemplate, Model model) throws HttpClientErrorException{
        ResponseEntity<Product[]> responseEntity;
        List<Product> products;
        responseEntity = restTemplate.exchange(REST_URL+"/products/top5added", HttpMethod.GET, null, Product[].class);
        products= Arrays.asList(responseEntity.getBody());
        model.addAttribute("latestProducts",products);
        System.out.println("Get LatestProducts:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getTop5Health(RestTemplate restTemplate, Model model) throws HttpClientErrorException {
        ResponseEntity<Product[]> responseEntity;
        List<Product> products;
        responseEntity = restTemplate.exchange(REST_URL+"/products/top5health", HttpMethod.GET, null, Product[].class);
        products= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topHealthProducts",products);
        System.out.println("Get Top5Health:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getTop5Society(RestTemplate restTemplate, Model model) throws HttpClientErrorException {
        ResponseEntity<Product[]> responseEntity;
        List<Product> products;
        responseEntity = restTemplate.exchange(REST_URL+"/products/top5society", HttpMethod.GET, null, Product[].class);
        products= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topSocietyProducts",products);
        System.out.println("Get Top5Society:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getTop5Environment(RestTemplate restTemplate, Model model) throws HttpClientErrorException {
        ResponseEntity<Product[]> responseEntity;
        List<Product> products;
        responseEntity = restTemplate.exchange(REST_URL+"/products/top5environment", HttpMethod.GET, null, Product[].class);
        products= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topEnvironmentProducts",products);
        System.out.println("Get Top5Environment:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getSearchProducts(RestTemplate restTemplate, Model model, String URL) throws HttpClientErrorException{
        ResponseEntity<Product[]> responseEntity;
        responseEntity = restTemplate.exchange(URL, HttpMethod.GET, null, Product[].class);
        List<Product> products = Arrays.asList(responseEntity.getBody());
        shortDescription(products);
        model.addAttribute("products",products);
        System.out.println("Get SearchProducts:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }
    private void shortDescription(List<Product> products){
        for(Product product:products){
            String text;
            if(product.getDescription().length()<35)
            {
                int i=product.getDescription().length();
                product.setDescription(product.getDescription().substring(0,i)+"...");
            }
            else
                product.setDescription(product.getDescription().substring(0,35)+"...");
        }
    }

    void postUserLike(RestTemplate restTemplate, String url) throws HttpClientErrorException{
        ResponseEntity<UserLike> responseEntity;
        responseEntity = restTemplate.exchange(url, HttpMethod.POST, null, UserLike.class);
        System.out.println("\nPost UserLike:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void postUserDislike(RestTemplate restTemplate, String url) throws HttpClientErrorException{
        ResponseEntity<UserDislike> responseEntity;
        responseEntity = restTemplate.exchange(url, HttpMethod.POST, null, UserDislike.class);
        System.out.println("\nPost UserDislike:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void deleteUserLike(RestTemplate restTemplate, String url) throws HttpClientErrorException{
        restTemplate.exchange(url, HttpMethod.DELETE, null, Object.class);
        System.out.println("\nDelete UserLike:\tHTTPStatusCode: 200hardcodat");
    }

    void deleteUserDislike(RestTemplate restTemplate, String url) throws HttpClientErrorException{
        restTemplate.exchange(url, HttpMethod.DELETE, null, Object.class);
        System.out.println("\nDelete UserDislike:\tHTTPStatusCode: 200hardcodat");
    }

    void postUser(RestTemplate restTemplate, User user) throws HttpClientErrorException{
        HttpEntity<User> request = new HttpEntity<>(user);
        restTemplate.exchange(REST_URL + "/users/", HttpMethod.POST, request, User.class);
        System.out.println("\nPost User:\tHTTPStatusCode: 200hardcodat");
    }

    void getTopLikedCharacteristics(RestTemplate restTemplate,Model model) throws HttpClientErrorException{
        ResponseEntity<Characteristic[]> responseEntity;
        List<Characteristic> characteristics;
        responseEntity = restTemplate.exchange(REST_URL+"/characteristics/top10liked", HttpMethod.GET, null, Characteristic[].class);
        characteristics= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topLikedCharacteristics", characteristics);
        System.out.println("Get Top10LikedCharacteristics:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getTopDislikedCharacteristics(RestTemplate restTemplate,Model model) throws HttpClientErrorException{
        ResponseEntity<Characteristic[]> responseEntity;
        List<Characteristic> characteristics;
        responseEntity = restTemplate.exchange(REST_URL+"/characteristics/top10disliked", HttpMethod.GET, null, Characteristic[].class);
        characteristics= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topDislikedCharacteristics",characteristics);
        System.out.println("Get Top10DislikedCharacteristics:\tHTTPStatusCode: " + responseEntity.getStatusCode());

    }

    void getTopRestrictiveUsers(RestTemplate restTemplate, Model model) throws HttpClientErrorException{
        ResponseEntity<UserPreferenceCount[]> responseEntity;
        List<UserPreferenceCount> users;
        responseEntity = restTemplate.exchange(REST_URL+"/users/top5RestrictiveUsers", HttpMethod.GET, null, UserPreferenceCount[].class);
        users= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topRestrictiveUsers", users);
        System.out.println("Get Top5RestrictiveUsers:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getTopPermissiveUsers(RestTemplate restTemplate, Model model) throws HttpClientErrorException{
        ResponseEntity<UserPreferenceCount[]> responseEntity;
        List<UserPreferenceCount> users;
        responseEntity = restTemplate.exchange(REST_URL+"/users/top5PermissiveUsers", HttpMethod.GET, null, UserPreferenceCount[].class);
        users= Arrays.asList(responseEntity.getBody());
        model.addAttribute("topPermissiveUsers", users);
        System.out.println("Get Top5PermissiveUsers:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getSuggestions(RestTemplate restTemplate, Model model, String URL) throws HttpClientErrorException{
        ResponseEntity<Product[]> responseEntity;
        responseEntity = restTemplate.exchange(URL, HttpMethod.GET, null, Product[].class);
        List<Product> products = Arrays.asList(responseEntity.getBody());
        shortDescription(products);
        model.addAttribute("suggestions",products);

        System.out.println("Get ProductsSuggestions:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getProductsToAvoid(RestTemplate restTemplate, Model model, String URL) throws HttpClientErrorException{
        ResponseEntity<Product[]> responseEntity;
        responseEntity = restTemplate.exchange(URL, HttpMethod.GET, null, Product[].class);
        List<Product> products = Arrays.asList(responseEntity.getBody());
        shortDescription(products);
        model.addAttribute("toAvoid",products);

        System.out.println("Get ProductsToAvoid:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }

    void getSimilarUsers(RestTemplate restTemplate, Model model,Principal principal) throws HttpClientErrorException{
        ResponseEntity<User[]> responseEntity;
        List<User> users;
        responseEntity = restTemplate.exchange(REST_URL+"/users/"+principal.getName()+"/similarUsers", HttpMethod.GET, null, User[].class);
        users= Arrays.asList(responseEntity.getBody());
        model.addAttribute("similarUsers", users);
        System.out.println("Get SimilarUsers:\tHTTPStatusCode: " + responseEntity.getStatusCode());
    }
}
