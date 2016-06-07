package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.services.ProductService;
import com.tw.edec.rest.storage.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/products")
public class ProductsController {

    @Autowired
    private ProductService productService;
    @Autowired
    private ProductDao productDao;

    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getProducts(@RequestParam(required = false) Map<String, String> q){

        if(q.get("category")!=null) return productService.getByCategory(q); //edec/products?category=Food&pag=1
        if(q.get("name")!=null) return productService.getBySearchInput(q);  //edec/products?name=Samsung&pag=2

        return productService.getAllProducts();
    }

    @RequestMapping(value="/{productName}",method = RequestMethod.GET)
    public Product getSingleProduct(@PathVariable String productName){
        return productService.getProduct(productName);
    }

    @RequestMapping(method = RequestMethod.POST)
    public Product createProduct(@RequestBody Product product){
        return productService.addProduct(product);
    }

    @RequestMapping(value="/{productName}",method = RequestMethod.PUT)
    public Product updateProduct(@PathVariable String productName,@RequestBody Product product){
        return productService.updateProduct(productName,product);
    }

    @RequestMapping(value="/{productName}",method = RequestMethod.DELETE)
    public void deleteProduct(@PathVariable String productName){
        productService.removeProduct(productName);
    }

    @RequestMapping(value="/{productName}/relatedProducts", method= RequestMethod.GET)
    public List<Product> getRelatedProducts(@PathVariable String productName){
        return productService.getRelatedProducts(productName);
    }

    @CrossOrigin(origins = "http://localhost:8282")
    @RequestMapping(value = "/top5overall", method = RequestMethod.GET)
    public List<Product> topFiveByOverall(){
        return productDao.getTop5Overall();
    }

    @RequestMapping(value="/top5health", method = RequestMethod.GET)
    public List<Product> topFiveByHealth(){
        return productDao.getTop5Health();
    }

    @RequestMapping(value="/top5society", method = RequestMethod.GET)
    public List<Product> topFiveBySociety(){
        return productDao.getTop5Society();
    }

    @RequestMapping(value="/top5environment", method = RequestMethod.GET)
    public List<Product> topFiveByEnvironment(){
        return productDao.getTop5Environment();
    }

    @RequestMapping(value="/top5added", method=RequestMethod.GET)
    public List<Product> topFiveByTimestamp(){
        return productDao.getTop5Added();
    }
}
