package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.ProductCharacteristic;
import com.tw.edec.rest.services.ProductCharacteristicService;
import com.tw.edec.rest.storage.CharacteristicDao;
import com.tw.edec.rest.storage.ProductCharacteristicDao;
import com.tw.edec.rest.storage.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import java.util.List;

@Service
public class ProductCharacteristicServiceImpl implements ProductCharacteristicService {

    @Autowired
    private ProductCharacteristicDao productCharacteristicDao;

    @Autowired
    private CharacteristicDao characteristicDao;

    @Autowired
    private ProductDao productDao;

    @Override
    public ProductCharacteristic addProductCharacteristic(String productName, String characteristicName) {
        Characteristic characteristic=new Characteristic();
        try{
            characteristic=characteristicDao.getByName(characteristicName);
        }catch(NoResultException f) {   //caracteristica respectiva nu exista in baza de date si va fi adaugata
            characteristic.setName(characteristicName);
            characteristicDao.addCharacteristic(characteristic);

            characteristic=characteristicDao.getByName(characteristicName);
        }finally {
            ProductCharacteristic productCharacteristic=new ProductCharacteristic();
            productCharacteristic.setCharacteristic(characteristic);
            productCharacteristic.setProduct(productDao.getByName(productName));

            productCharacteristicDao.addProductCharacteristic(productCharacteristic);
            return productCharacteristic;
        }
    }

    @Override
    public void removeProductCharacteristic(String productName, String characteristicName) {
        productCharacteristicDao.removeProductCharacteristic(
                productCharacteristicDao.getProductCharacteristic(productName.replace('_',' '),characteristicName.replace('_',' '))
                );
    }

    @Override
    public List<Characteristic> getProductCharacteristics(String productName) {
        return productCharacteristicDao.getAllProductCharacteristics(productName);
    }

    @Override
    public ProductCharacteristic getSingleProductCharacteristic(String productName,String characteristicName){
        return productCharacteristicDao.getProductCharacteristic(productName,characteristicName);
    }
}
