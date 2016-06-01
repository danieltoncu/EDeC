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
    public List<Product> getAllProducts() {
        return productDao.getAll();
    }

    @Override
    public Product addProduct(Product product) {
        productDao.add(product);
        return product;
    }

    @Override
    public void removeProduct(String productName) {
        Product product=getProduct(productName);
        productDao.delete(product);
    }

    public Product updateProduct(String productName, Product product){
        Product existingProduct=productDao.getByName(productName);
        product.setId(existingProduct.getId());

        return productDao.update(product);
    }

    public Product getProduct(String productName){
        return productDao.getByName(productName);
    }

    @Override
    public List<Product> getByCategory(Map<String, String> q) {
        return productDao.getByCategory(q,5);
    }

    @Override
    public List<Product> getBySearchInput(Map<String, String> q) {
        return productDao.search(q,5);
    }

    @Override
    public List<Product> getRelatedProducts(String productName) {
        Product product=productDao.getByName(productName);
        return productDao.getSimilarProducts(product);
    }
}
