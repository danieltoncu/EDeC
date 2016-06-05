package com.tw.edec.rest.storage;


import com.tw.edec.rest.models.Brand;
import com.tw.edec.rest.models.Product;

import java.util.List;
import java.util.Map;

public interface ProductDao {

    void add(Product product);
    Product update(Product product);
    void delete(Product product);

    Product getByName(String productName);
    Long getID(String productName);
    Product getById(Long productId);

    List<Product> getAll();
    List<Product> getByCategory(Map<String, String> q,int recordsPerPage);   //q contine category si nrPaginii
    List<Product> search(Map<String, String> q, int recordsPerPage);//q contine name si nrPaginii

    Brand getProductBrand(String productName);

    List<Product> getSimilarProducts(Product product);

    List<Product> getTop5Overall();
    List<Product> getTop5Health();
    List<Product> getTop5Society();
    List<Product> getTop5Environment();

    List<Product> getTop5Added();
    List<Product> getSuggestions(Long userId);
    List<Product> getProductsToAvoid(Long userId);
}
