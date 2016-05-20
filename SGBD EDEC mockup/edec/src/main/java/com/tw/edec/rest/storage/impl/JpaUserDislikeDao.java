package com.tw.edec.rest.storage.impl;

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
    public void dislike_product(Long userID, Long productID) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_dislikes.dislike_product")
                .registerStoredProcedureParameter(1,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class,ParameterMode.OUT)
                .setParameter(1,userID)
                .setParameter(2,productID);

        query.executeUpdate();
    }

    @Transactional
    @Override
    public void delete_dislike_product(Long userID, Long productID) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_dislikes.delete_dislike_product")
                .registerStoredProcedureParameter(1,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class,ParameterMode.OUT)
                .setParameter(1,userID)
                .setParameter(2,productID);

        query.executeUpdate();
    }

    @Override
    public List<Product> getUsersDislikedProducts(Long userID) {
        TypedQuery<Product> query=entityManager.createQuery("select ud.product from UserDislike ud " +
                "where ud.user.userId=:userID",Product.class);
        query.setParameter("userID",userID);

        return query.getResultList();
    }

    @Override
    public UserDislike getUserDislike(Long userId, Long productId) {
        TypedQuery<UserDislike> query=entityManager.createQuery("select ud from UserDislike ud " +
                "where ud.user.userId=:userId " +
                "and ud.product.productId=:productId",UserDislike.class)
                .setParameter("userId",userId)
                .setParameter("productId",productId);

        return query.getSingleResult();
    }
}
