package com.tw.edec.web.controllers;

import com.tw.edec.web.models.Product;
import com.tw.edec.web.models.SearchCriteria;
import com.tw.edec.web.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
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
import java.util.Map;
import java.util.function.Function;

import static java.util.stream.Collectors.toMap;

@Controller

public class SearchController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String REST_URL="http://localhost:8181/edec";

    private String createURLForExchange(Integer pag,String searchQuery,Integer category_id){
        String URL=REST_URL+"/products?pag=" + pag;
        if(searchQuery!=null)   URL+="&search_query="+searchQuery;
        if(category_id!=null)   URL+="&category_id="+category_id;
        return URL;
    }

    @RequestMapping(value="/search",method = RequestMethod.GET)
    public String showSearch(Model model,
                             @RequestParam(required = false) Integer pag,
                             @RequestParam(required = false) String search_query,
                             @RequestParam(required = false) Integer category_id){
        System.out.println("In showSearch()");
        SearchCriteria searchCriteria=new SearchCriteria();
        searchCriteria.setSearchInput(search_query);
        if(pag!=null) {

            String URL = createURLForExchange(pag,search_query,category_id);
            ResponseEntity<Product[]> responseEntity;

            try {
                responseEntity = restTemplate
                        .exchange(URL, HttpMethod.GET, null, Product[].class);
                List<Product> products = Arrays.asList(responseEntity.getBody());
                System.out.println("HTTPStatusCode: " + responseEntity.getStatusCode());

                model.addAttribute("nrPagina",pag);
                model.addAttribute("search_query",search_query);
                model.addAttribute("category_id",category_id);
                model.addAttribute("products",products.stream().collect(toMap(Product::getProductId, Function.<Product> identity())));

            } catch (HttpClientErrorException e) {
                System.out.println("HttpClientErrorException: " + e.getMessage());
                String responseBody = e.getResponseBodyAsString();
                System.out.println("GetResponseBodyAsString: " + responseBody);

                String messageError = responseBody.split("\"message\":")[1];
                messageError = messageError.substring(0, messageError.length() - 1);
            }
        }

        model.addAttribute("searchCriteria",searchCriteria);

        return "search";

    }

    @RequestMapping(value="/search",method = RequestMethod.POST)
    public String processSearchInput(@ModelAttribute("userForm") SearchCriteria searchCriteria,Model model){
        System.out.println("In processSearchInput()");
        if(searchCriteria.getSearchInput()!=null)
            return "redirect:/search?pag=1&search_query="+searchCriteria.getSearchInput().replace(' ','_')+"&category_id=";

        return "redirect:/search";
    }

}
