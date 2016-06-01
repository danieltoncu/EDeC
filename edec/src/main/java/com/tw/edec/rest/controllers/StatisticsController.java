package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.storage.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StatisticsController {

    @Autowired
    private ProductDao productDao;

    @RequestMapping(value = "/top5overall", method = RequestMethod.GET)
    public List<Product> topFiveByOverall(){
        return productDao.getTop5Overall();
    }

    @RequestMapping(value="/top5health", method = RequestMethod.GET)
    public List<Product> topFiveByHealth(){
        return productDao.getTop5Health();
    }

    @RequestMapping(value="/top5society", method = RequestMethod.GET)
    public List<Product> topFiveBySociety(){
        return productDao.getTop5Society();
    }

    @RequestMapping(value="/top5environment", method = RequestMethod.GET)
    public List<Product> topFiveByEnvironment(){
        return productDao.getTop5Environment();
    }

    @RequestMapping(value="/top5added", method=RequestMethod.GET)
    public List<Product> topFiveByTimestamp(){
        return productDao.getTop5Added();
    }
}
