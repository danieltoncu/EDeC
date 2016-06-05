package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.User;
import com.tw.edec.rest.models.UserPreferenceCount;
import com.tw.edec.rest.models.UserRole;
import com.tw.edec.rest.services.UserService;
import com.tw.edec.rest.storage.ProductDao;
import com.tw.edec.rest.storage.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ProductDao productDao;

    @Override
    public User addUser(User user) {
        UserRole userRole=new UserRole();
        userRole.setRole("ROLE_USER");
        userRole.setUser(user);

        UserPreferenceCount userPreferenceCount=new UserPreferenceCount();
        userPreferenceCount.setUser(user);
        userPreferenceCount.setCountDislikes(0L);
        userPreferenceCount.setCountLikes(0L);

        user.getUserRoleSet().add(userRole);
        user.setUserPreferenceCount(userPreferenceCount);

        try {
            userDao.add(user);

        }catch(Exception e)
        {
            System.out.println("Merge");
            throw new HttpMessageNotReadableException("Something went wrong.Try again with a different input.");
        }
        return user;
    }

    @Override
    public User updateUser(String username,User user) {
        User existingUser=userDao.getByUsername(username);
        user.setId(existingUser.getId());
        userDao.update(user);
        return user;
    }

    @Override
    public void deleteUser(String username) {
        userDao.delete(userDao.getByUsername(username));
    }

    @Override
    public List<User> getAll() {
        return userDao.getAll();
    }

    public User getUser(String username){
        return userDao.getByUsername(username);
    }

    @Override
    public List<User> getSimilarUsers(String username) {
        Long userId=userDao.getId(username);
        return userDao.getSimilarUsers(userId);
    }

    public List<Product> getSuggestions(String username){
        Long userId=userDao.getId(username);
        return productDao.getSuggestions(userId);
    }

    @Override
    public List<Product> getProductsToAvoid(String username) {
        Long userId=userDao.getId(username);
        return productDao.getProductsToAvoid(userId);
    }
}
