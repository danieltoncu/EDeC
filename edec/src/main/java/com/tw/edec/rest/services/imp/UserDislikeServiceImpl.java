package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Characteristic;
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

    @Override
    public UserDislike addUserDislike(String username,String characteristicName) {

        try{
            userDislikeDao.addUserDislike(username,characteristicName);
            return getUserDislike(username,characteristicName);
        }catch (Exception e){

            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE add_user_dislike\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }

    }

    @Override
    public void removeUserDislike(String username, String characteristicName) {

        try{
            userDislikeDao.removeUserDislike(username,characteristicName);
        }catch (Exception e){

            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE delete_user_like\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }
    }

    @Override
    public List<Characteristic> getAllUserDislikes(String username) {

        return userDislikeDao.getUserDislikedCharacteristics(username);
    }

    @Override
    public UserDislike getUserDislike(String username, String characteristicName) {

        return userDislikeDao.getUserDislike(username,characteristicName);
    }
}
