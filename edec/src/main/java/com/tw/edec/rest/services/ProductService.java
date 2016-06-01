package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    public List<Product> getAllProducts();

    public Product addProduct(Product product);

    public void removeProduct(String productName);

    public Product updateProduct(String productName, Product product);

    public Product getProduct(String productName);

    public List<Product> getByCategory(Map<String, String> q);  //q contine categoria si nr paginii

    public List<Product> getBySearchInput(Map<String, String> q);   //q contine numele si nr paginii

    public List<Product> getRelatedProducts(String productName);
}
