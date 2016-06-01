package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Brand;
import com.tw.edec.rest.storage.BrandDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository
public class JpaBrandDao implements BrandDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void add(Brand brand) {
        entityManager.persist(brand);
    }

    @Transactional
    @Override
    public Brand update(Brand brand) {
        return entityManager.merge(brand);
    }

    @Transactional
    @Override
    public void remove(Brand brand) {
        entityManager.remove(brand);
    }
}
