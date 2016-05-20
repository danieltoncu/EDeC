package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    public List<Product> getProducts(Map<String,String> q);

    public List<Product> getAllProducts();

    public List<Product> getProductsByCategory(Long categoryId);

    public List<Product> getProductsByName(String searchCriteria);

    public Product addProduct(Product product);

    public void removeProduct(String productName);

    public Product getProduct(String productName);
}
