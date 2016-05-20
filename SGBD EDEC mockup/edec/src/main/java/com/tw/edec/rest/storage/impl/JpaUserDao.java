package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.User;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.sql.SQLException;
import java.util.List;

@Repository
public class JpaUserDao implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void add(User user) throws SQLException{
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users.add_user")
                .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(5, String.class, ParameterMode.OUT)
                .setParameter(1, user.getUsername())
                .setParameter(2, user.getPassword())
                .setParameter(3, user.getPassword())
                .setParameter(4, user.getEmail());

        query.executeUpdate();
    }

    @Transactional
    @Override
    public User update(User user) {
        return entityManager.merge(user);
    }

    @Transactional
    @Override
    public void delete(User user) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users.delete_user")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class, ParameterMode.OUT)
                .setParameter(1, user.getUsername())
                .setParameter(2, user.getPassword());

        query.executeUpdate();
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
        TypedQuery<Long> q=entityManager.createQuery("select u.userId from User u where u.username=:username",Long.class)
                .setParameter("username",username);
        return q.getSingleResult();
    }

    public List<User> getUsers(){
        TypedQuery<User> q=entityManager.createQuery("select u from User u",User.class);
        return q.getResultList();
    }

}
