package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.ProductCharacteristic;
import com.tw.edec.rest.storage.ProductCharacteristicDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class JpaProductCharacteristicDao implements ProductCharacteristicDao{

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void addProductCharacteristic(ProductCharacteristic productCharacteristic) {
        entityManager.persist(productCharacteristic);
    }

    @Transactional
    @Override
    public void removeProductCharacteristic(ProductCharacteristic productCharacteristic) {
        entityManager.remove(productCharacteristic);
    }

    @Override
    public List<Characteristic> getAllProductCharacteristics(String productName) {
        TypedQuery<Characteristic> q=entityManager.createQuery("select pc.characteristic from ProductCharacteristic pc " +
                "where pc.product.name=:productName",Characteristic.class);

        q.setParameter("productName",productName);

        return q.getResultList();
    }

    @Override
    public ProductCharacteristic getProductCharacteristic(String productName, String characteristicName) {
        TypedQuery<ProductCharacteristic> q=entityManager.createQuery("select pc from ProductCharacteristic pc " +
                "where pc.product.name=:productName " + "and pc.characteristic.name=:characteristicName",ProductCharacteristic.class);

        q.setParameter("productName",productName);
        q.setParameter("characteristicName",characteristicName);

        return q.getSingleResult();
    }
}
