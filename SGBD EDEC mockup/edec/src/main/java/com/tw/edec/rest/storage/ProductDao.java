package com.tw.edec.rest.storage;


import com.tw.edec.rest.models.Product;

import java.util.List;
import java.util.Map;

public interface ProductDao {

    public void addProduct(Product product);
    public Product getProductByName(String productName);
    public Long getProductID(String productName);
    public Product getProductById(Long productId);

    public List<Product> getAllProducts();
    public List<Product> getProductsByCategory(Long categoryId);
    public List<Product> getProductsByName(String searchCriteria);

    public List<Product> getProductsWithPagination(Map<String, String> q, int recordsPerPage);
}
