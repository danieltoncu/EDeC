package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.User;
import com.tw.edec.rest.models.UserPreferenceCount;
import com.tw.edec.rest.models.UserRole;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import javax.xml.transform.Result;
import java.sql.ResultSet;
import java.util.ArrayList;
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

    /*select distinct u.ID,U.EMAIL,u.username from user_likes ul1
    join user_likes ul2 on ul1.ID<>ul2.ID and ul1.characteristic_id=UL2.CHARACTERISTIC_ID
    join users u on u.id=ul2.user_id
    where ul1.user_id=99;*/
    @Override
    public List<User> getSimilarUsers(Long userId) {

        String query="select distinct u.ID,u.EMAIL,u.PASSWORD,u.USERNAME from user_likes ul1\n" +
                "    join user_likes ul2 on ul1.ID<>ul2.ID and ul1.characteristic_id=UL2.CHARACTERISTIC_ID\n" +
                "    join users u on u.id=ul2.user_id\n" +
                "    where ul1.user_id=:userId";

        Query q=entityManager.createNativeQuery(query,User.class).setParameter("userId",userId);

        q.setMaxResults(5);

        return q.getResultList();
    }

    public List<UserPreferenceCount> getTopRestrictive(){
        TypedQuery<UserPreferenceCount> q=entityManager.createQuery("select upc from UserPreferenceCount upc order by upc.countDislikes DESC",UserPreferenceCount.class);
        q.setMaxResults(5);
        return q.getResultList();
    }

    public List<UserPreferenceCount> getTopPermissive(){
        TypedQuery<UserPreferenceCount> q=entityManager.createQuery("select upc from UserPreferenceCount upc order by upc.countLikes DESC",UserPreferenceCount.class);
        q.setMaxResults(5);
        return q.getResultList();
    }
}
