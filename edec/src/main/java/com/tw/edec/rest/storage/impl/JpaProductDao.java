package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Brand;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.storage.ProductDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

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

        String query="select * from products p where p.category=:categoryName AND p.name<>:productName ORDER BY DBMS_RANDOM.RANDOM";
        Query q=entityManager.createNativeQuery(query,Product.class);
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

    public List<Product> getSuggestions(Long userId){
        //Try1
        /*String query="select  distinct p.* from products p\n" +
                "join product_characteristic pc on pc.product_id=p.id\n" +
                "join characteristics c on c.id=pc.characteristic_id\n" +
                "join user_likes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "where ul.user_id=:userId";*/

        //Try2
        /*String query="select  distinct p.* from products p\n" +
                "  join product_characteristic pc on pc.product_id=p.id\n" +
                "  join characteristics c on c.id=pc.characteristic_id\n" +
                "  join user_likes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "  join user_dislikes ud on ud.user_id=ul.user_id and ud.characteristic_id<>ul.characteristic_id\n" +
                "where ul.user_id=:userId";*/

        //Try3
        /*String query="select  distinct p.* from products p\n" +
                "  join product_characteristic pc on pc.product_id=p.id\n" +
                "  join characteristics c on c.id=pc.characteristic_id\n" +
                "  join user_likes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "  join user_dislikes ud on ud.user_id=ul.user_id\n" +
                "where ul.user_id=:userId and ud.CHARACTERISTIC_ID<>ul.CHARACTERISTIC_ID";*/

        String query="select  distinct p.* from products p\n" +
                "  join product_characteristic pc on pc.product_id=p.id\n" +
                "  join characteristics c on c.id=pc.characteristic_id\n" +
                "  join user_likes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "  join user_dislikes ud on ud.user_id=ul.user_id\n" +
                "where ul.user_id=:userId and ud.CHARACTERISTIC_ID<>ul.CHARACTERISTIC_ID AND ud.characteristic_id<>0";

        Query q=entityManager.createNativeQuery(query,Product.class).setParameter("userId",userId);

        return q.getResultList();
    }

    @Override
    public List<Product> getProductsToAvoid(Long userId) {
        //Try1
        /*String query="select  distinct p.* from products p\n" +
                "join product_characteristic pc on pc.product_id=p.id\n" +
                "join characteristics c on c.id=pc.characteristic_id\n" +
                "join user_dislikes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "where ul.user_id=:userId";*/

        //Try2
        /*String query="select  distinct p.* from products p\n" +
                "  join product_characteristic pc on pc.product_id=p.id\n" +
                "  join characteristics c on c.id=pc.characteristic_id\n" +
                "  join user_dislikes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "  join user_likes ud on ud.user_id=ul.user_id\n" +
                "where ul.user_id=:userId and ud.CHARACTERISTIC_ID<>ul.CHARACTERISTIC_ID";*/

        String query="select  distinct p.* from products p\n" +
                "  join product_characteristic pc on pc.product_id=p.id\n" +
                "  join characteristics c on c.id=pc.characteristic_id\n" +
                "  join user_dislikes ul on ul.characteristic_id=pc.characteristic_id\n" +
                "  join user_likes ud on ud.user_id=ul.user_id\n" +
                "where ul.user_id=:userId and ud.CHARACTERISTIC_ID<>ul.CHARACTERISTIC_ID";

        Query q=entityManager.createNativeQuery(query,Product.class).setParameter("userId",userId);

        return q.getResultList();
    }
}
