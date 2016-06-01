package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.ProductCharacteristic;

import java.util.List;

public interface ProductCharacteristicDao {

    public void addProductCharacteristic(ProductCharacteristic productCharacteristic);

    public void removeProductCharacteristic(ProductCharacteristic productCharacteristic);

    public List<Characteristic> getAllProductCharacteristics(String productName);

    public ProductCharacteristic getProductCharacteristic(String productName,String characteristicName);
}
