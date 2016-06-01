package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.User;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Repository
public class JpaUserDao implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void add(User user) {
        entityManager.persist(user);
    }

    @Transactional
    @Override
    public User update(User user) {
        return entityManager.merge(user);
    }

    @Transactional
    @Override
    public void delete(User user) {
        entityManager.remove(user);
    }

    @Override
    public User getByUsername(String username){
        TypedQuery<User> q=entityManager.createQuery("select u from User u where u.username=:username",User.class)
                .setParameter("username",username);
        return q.getSingleResult();
    }

    @Override
    public User getById(Long userId) {
        return entityManager.find(User.class,userId);
    }

    @Override
    public Long getId(String username) {
        TypedQuery<Long> q=entityManager.createQuery("select u.id from User u where u.username=:username",Long.class)
                .setParameter("username",username);
        return q.getSingleResult();
    }

    public List<User> getAll(){
        TypedQuery<User> q=entityManager.createQuery("select u from User u",User.class);
        return q.getResultList();
    }

}
