package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Product;
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
    public void like_product(Long userId, Long productId) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_likes.like_product")
                .registerStoredProcedureParameter(1,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class, ParameterMode.OUT)
                .setParameter(1,userId)
                .setParameter(2,productId);

        query.executeUpdate();
    }

    @Transactional
    @Override
    public void delete_like_product(Long userId, Long productId) {
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("manage_users_likes.delete_like_product")
                .registerStoredProcedureParameter(1,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,String.class,ParameterMode.OUT)
                .setParameter(1,userId)
                .setParameter(2,productId);

        query.executeUpdate();
    }

    @Override
    public List<Product> getUsersLikedProducts(Long userID) {
        TypedQuery<Product> query=entityManager.createQuery("select ul.product from UserLike ul " +
                "where ul.user.userId=:userID",Product.class)
                .setParameter("userID",userID);

        return query.getResultList();
    }

    @Override
    public UserLike getUserLike(Long userId, Long productId) {
        TypedQuery<UserLike> query=entityManager.createQuery("select ul from UserLike ul " +
                "where ul.user.userId=:userId " +
                "and ul.product.productId=:productId",UserLike.class)
                .setParameter("userId",userId)
                .setParameter("productId",productId);

        return query.getSingleResult();
    }
}
