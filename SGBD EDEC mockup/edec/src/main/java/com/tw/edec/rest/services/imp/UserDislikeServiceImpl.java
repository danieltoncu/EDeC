package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserDislike;
import com.tw.edec.rest.services.UserDislikeService;
import com.tw.edec.rest.storage.ProductDao;
import com.tw.edec.rest.storage.UserDao;
import com.tw.edec.rest.storage.UserDislikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserDislikeServiceImpl implements UserDislikeService {

    @Autowired
    private UserDislikeDao userDislikeDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductDao productDao;

    @Override
    public UserDislike add_user_dislike(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);
        try{
            userDislikeDao.dislike_product(userId,productId);
            return getUserDislike(username,productName);
        }catch (Exception e){
            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE add_user_dislike\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }

    }

    @Override
    public void delete_user_dislike(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);
        try{
            userDislikeDao.delete_dislike_product(userId,productId);
        }catch (Exception e){
            //extragere mesaj de eroare din procedura stocata
            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE delete_user_like\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }
    }

    @Override
    public List<Product> getUsersDislikedProducts(String username) {
        Long userId=userDao.getId(username);
        return userDislikeDao.getUsersDislikedProducts(userId);
    }

    @Override
    public UserDislike getUserDislike(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);
        return userDislikeDao.getUserDislike(userId,productId);
    }
}
