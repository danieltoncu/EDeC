package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserDislike;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.storage.UserDislikeDao;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class JpaUserDislikeDao implements UserDislikeDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void addUserDislike(String username,String characteristicName) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_dislikes.dislike_characteristic")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class,ParameterMode.OUT)
                .setParameter(1,username)
                .setParameter(2,characteristicName);

        query.executeUpdate();
    }

    @Transactional
    @Override
    public void removeUserDislike(String username,String characteristicName) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_dislikes.delete_dislike_product")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class,ParameterMode.OUT)
                .setParameter(1,username)
                .setParameter(2,characteristicName);

        query.executeUpdate();
    }

    @Override
    public List<Characteristic> getUserDislikedCharacteristics(String username) {
        TypedQuery<Characteristic> query=entityManager.createQuery("select ud.characteristic from UserDislike ud " +
                "where ud.user.username=:username",Characteristic.class);
        query.setParameter("username",username);

        return query.getResultList();
    }

    @Override
    public UserDislike getUserDislike(String username,String characteristicName) {
        TypedQuery<UserDislike> query=entityManager.createQuery("select ud from UserDislike ud " +
                "where ud.user.username=:username " +
                "and ud.characteristic.name=:characteristicName",UserDislike.class)
                .setParameter("username",username)
                .setParameter("characteristicName",characteristicName);

        return query.getSingleResult();
    }
}
