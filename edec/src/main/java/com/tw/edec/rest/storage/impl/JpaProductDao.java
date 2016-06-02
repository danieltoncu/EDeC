package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Brand;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.storage.ProductDao;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;

@Repository
public class JpaProductDao implements ProductDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void add(Product product) {
        entityManager.persist(product);
    }

    @Transactional
    @Override
    public Product update(Product product) {
        return entityManager.merge(product);
    }

    @Transactional
    @Override
    public void delete(Product product) {
        entityManager.remove(product);
    }

    @Override
    public Product getByName(String productName) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p where p.name=:productName",Product.class)
                .setParameter("productName",productName);
        return query.getSingleResult();
    }

    @Override
    public Long getID(String productName) {
        TypedQuery<Long> query=entityManager.createQuery("select p.id from Product p where p.name=:productName",Long.class)
                .setParameter("productName",productName);
        return query.getSingleResult();
    }

    @Override
    public Product getById(Long productId) {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p where p.id=:productId",Product.class)
                .setParameter("productId",productId);
        return query.getSingleResult();
    }

    @Override
    public List<Product> getAll() {
        TypedQuery<Product> query=entityManager.createQuery("select p from Product p",Product.class);
        return query.getResultList();
    }


    @Override
    public List<Product> getByCategory(Map<String, String> q, int recordsPerPage) {
        String qq = "select p from Product p where p.category like :category";
        TypedQuery<Product> query = entityManager.createQuery(qq, Product.class);
        query.setParameter("category",q.get("category"));

        if (q.get("pag") != null) {
            int firstResult = (Integer.parseInt(q.get("pag")) - 1) * recordsPerPage;
            query.setFirstResult(firstResult);
            query.setMaxResults(recordsPerPage);
        }

        return query.getResultList();
    }

    @Override
    public List<Product> search(Map<String, String> q, int recordsPerPage) {
        String qq="select p from Product p where p.name like :name";
        TypedQuery<Product> query=entityManager.createQuery(qq,Product.class);
        query.setParameter("name","%"+q.get("name")+"%");

        if (q.get("pag") != null) {
            int firstResult = (Integer.parseInt(q.get("pag")) - 1) * recordsPerPage;
            query.setFirstResult(firstResult);
            query.setMaxResults(recordsPerPage);
        }

        return query.getResultList();
    }

    @Override
    public Brand getProductBrand(String productName) {
        TypedQuery<Brand> q=entityManager.createQuery("select pb.brand from ProductBrand pb where pb.product.name=:productName",Brand.class);
        q.setParameter("productName",productName);

        return q.getSingleResult();
    }

    @Override
    public List<Product> getSimilarProducts(Product product) {
        //TODO generare produse random; acum extrage aceleasi 5 produse pentru o categorie..not so good
        String query="select p from Product p where p.category=:categoryName AND p.name<>:productName";
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p where p.category=:categoryName AND p.name<>:productName",Product.class);
        q.setParameter("categoryName",product.getCategory());
        q.setParameter("productName",product.getName());
        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Product> getTop5Overall() {
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p order by p.overallScore DESC",Product.class);
        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Product> getTop5Health() {
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p order by p.healthScore DESC",Product.class);
        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Product> getTop5Society() {
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p order by p.societyScore DESC",Product.class);
        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Product> getTop5Environment() {
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p order by p.environmentScore DESC",Product.class);
        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Product> getTop5Added() {
        TypedQuery<Product> q=entityManager.createQuery("select p from Product p order by p.timestamp DESC",Product.class);
        q.setMaxResults(5);
        return q.getResultList();
    }
}