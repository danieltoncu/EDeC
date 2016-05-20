package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/products")
public class ProductsController {

    @Autowired
    private ProductService productService;

    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getProducts(@RequestParam(required = false) Map<String, String> q){
        return productService.getProducts(q);
    }

    @RequestMapping(value="/{productName}",method = RequestMethod.GET)
    public Product getSingleProduct(@PathVariable String productName){
        return productService.getProduct(productName.replace('_',' '));
    }

}
