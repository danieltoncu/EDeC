package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.User;
import com.tw.edec.rest.services.UserService;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User addUser(User user) {
        try {
            userDao.add(user);

        }catch (Exception e){
            String aux=e.getCause().toString().split("ORA-[0-9]+: ")[1];
            String exceptionMessage=aux.substring(0,aux.length()-1);
            System.out.println("EROARE addUser\nGetCause\n"+exceptionMessage);
            throw new HttpMessageNotReadableException(exceptionMessage);
        }
        return user;
    }

    @Override
    public User updateUser(User user) {
        User existingUser=userDao.getByUsername(user.getUsername());
        user.setUserId(existingUser.getUserId());
        userDao.update(user);
        return user;
    }

    @Override
    public void deleteUser(String username) {
        userDao.delete(userDao.getByUsername(username));
    }

    @Override
    public List<User> getAll() {
        return userDao.getUsers();
    }

    public User getUser(String username){
        return userDao.getByUsername(username);
    }

}
