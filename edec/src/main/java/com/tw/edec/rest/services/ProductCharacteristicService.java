package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.ProductCharacteristic;

import java.util.List;

public interface ProductCharacteristicService {

    public ProductCharacteristic addProductCharacteristic(String productName,String characteristicName);

    public void removeProductCharacteristic(String productName,String characteristicName);

    public List<Characteristic> getProductCharacteristics(String productName);

    public ProductCharacteristic getSingleProductCharacteristic(String productName,String characteristicName);
}
