package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.storage.UserLikeDao;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class JpaUserLikeDao implements UserLikeDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void addUserLike(String username,String characteristicName) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_likes.like_characteristic")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class, ParameterMode.OUT)
                .setParameter(1,username)
                .setParameter(2,characteristicName);

        query.execute();
    }

    @Transactional
    @Override
    public void removeUserLike(String username,String characteristicName) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_likes.delete_like_characteristic")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class, ParameterMode.OUT)
                .setParameter(1,username)
                .setParameter(2,characteristicName);

        query.execute();
    }

    @Override
    public List<Characteristic> getUserLikedCharacteristics(String username) {
        TypedQuery<Characteristic> q=entityManager.createQuery("select ul.characteristic from UserLike ul where ul.user.username=:username",Characteristic.class)
                                .setParameter("username",username);

        return q.getResultList();
    }

    @Override
    public UserLike getUserLike(String username, String characteristicName) {
        TypedQuery<UserLike> q=entityManager.createQuery("select ul from UserLike ul" +
                " where ul.user.username=:username" +
                " and ul.characteristic.name=:characteristicName",UserLike.class)
                .setParameter("username",username)
                .setParameter("characteristicName",characteristicName);

        return q.getSingleResult();
    }
}
