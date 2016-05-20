package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.services.ProductService;
import com.tw.edec.rest.storage.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> getProducts(Map<String, String> q) {
        /*if(q.size()==0)                     return getAllProducts();
        if(q.get("categoryId")!=null)   return getProductsByCategory(Long.parseLong(q.get("categoryId")));
        if(q.get("name")!=null)         return getProductsByName(q.get("name"));*/
        return productDao.getProductsWithPagination(q,10);
    }

    @Override
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    @Override
    public List<Product> getProductsByCategory(Long categoryId) {
        return productDao.getProductsByCategory(categoryId);
    }

    @Override
    public List<Product> getProductsByName(String searchCriteria) {
        return productDao.getProductsByName(searchCriteria);
    }

    @Override
    public Product addProduct(Product product) {
        productDao.addProduct(product);
        return product;
    }

    @Override
    public void removeProduct(String productName) {
        //TODO removeProduct-ProductServiceImpl
    }

    public Product getProduct(String productName){
        return productDao.getProductByName(productName);
    }
}
