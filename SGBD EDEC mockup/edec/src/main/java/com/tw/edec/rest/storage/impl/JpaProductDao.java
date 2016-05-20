package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.storage.ProductDao;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;

@Repository
public class JpaProductDao implements ProductDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addProduct(Product product) {
        //TODO implementat procedure manage_product.add_product (parca asa se chema)
    }

    @Override
    public Product getProductByName(String productName) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p where p.productName=:productName",Product.class)
                .setParameter("productName",productName);
        return query.getSingleResult();
    }

    @Override
    public Long getProductID(String productName) {
        TypedQuery<Long> query=entityManager.createQuery("select p.productId from Product p " +
                "where p.productName=:productName",Long.class)
                .setParameter("productName",productName);
        return query.getSingleResult();
    }

    @Override
    public Product getProductById(Long productId) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p " +
                "where p.product_id=:productId",Product.class)
                .setParameter("productId",productId);
        return query.getSingleResult();
    }

    @Override
    public List<Product> getAllProducts() {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p",Product.class);
        return query.getResultList();
    }

    @Override
    public List<Product> getProductsByCategory(Long categoryId) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p " +
                "where p.category.categoryId=:categoryId",Product.class)
                .setParameter("categoryId",categoryId);
        return query.getResultList();
    }

    @Override
    public List<Product> getProductsByName(String searchCriteria) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p " +
                "where p.productName like :searchCriteria",Product.class)
                .setParameter("searchCriteria","%"+searchCriteria.replace('_',' ')+"%");

        return query.getResultList();
    }

    @Override
    public List<Product> getProductsWithPagination(Map<String, String> q, int recordsPerPage){
        String qq="select p from Product p";
        boolean addWhere= true;

        if(q.get("search_query")!=null)
            if(addWhere){
                qq+=" where p.productName like :name";
                addWhere=false;
            }

        if(q.get("category_id")!=null)
            if(addWhere){
                qq+=" where p.category.categoryId=:category_id";
                addWhere=false;
            }
            else    qq+=" and p.category.categoryId=:category_id";

        TypedQuery<Product> query=entityManager.createQuery(qq,Product.class);

        if(q.get("search_query")!=null)
            query.setParameter("name","%" + q.get("search_query").replace('_',' ') + "%");

        if(q.get("category_id")!=null)
            query.setParameter("category_id",Long.parseLong(q.get("category_id")));

        if(q.get("pag")!=null) {
            int firstResult=(Integer.parseInt(q.get("pag"))-1)*recordsPerPage;
            query.setFirstResult(firstResult);
            query.setMaxResults(recordsPerPage);
        }
        return query.getResultList();
    }
}
