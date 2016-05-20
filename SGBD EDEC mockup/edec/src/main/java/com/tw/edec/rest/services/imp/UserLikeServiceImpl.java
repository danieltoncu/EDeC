package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.services.UserLikeService;
import com.tw.edec.rest.storage.ProductDao;
import com.tw.edec.rest.storage.UserDao;
import com.tw.edec.rest.storage.UserLikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserLikeServiceImpl implements UserLikeService {

    @Autowired
    private UserLikeDao userLikeDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductDao productDao;

    @Override
    public UserLike add_user_like(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);

        try{
            userLikeDao.like_product(userId,productId);
            return getUserLike(username,productName);

        }catch (Exception e){//extragere mesaj de eroare din procedura stocata
            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE add_user_like\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }

    }

    @Override
    public void delete_user_like(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);

        try{
            userLikeDao.delete_like_product(userId,productId);

        }catch (Exception e){//extragere mesaj de eroare din procedura stocata
            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE delete_user_like\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }
    }

    @Override
    public List<Product> getUsersLikedProducts(String username) {
        Long userId=userDao.getId(username);
        return userLikeDao.getUsersLikedProducts(userId);
    }

    @Override
    public UserLike getUserLike(String username, String productName) {
        Long userId=userDao.getId(username);
        Long productId=productDao.getProductID(productName);
        return userLikeDao.getUserLike(userId,productId);
    }
}
