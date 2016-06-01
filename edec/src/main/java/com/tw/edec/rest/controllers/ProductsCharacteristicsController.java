package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.ProductCharacteristic;
import com.tw.edec.rest.services.ProductCharacteristicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/products/{productName:.+}/characteristics")
public class ProductsCharacteristicsController {

    @Autowired
    private ProductCharacteristicService productCharacteristicService;

    @RequestMapping(method = RequestMethod.GET)
    public List<Characteristic> getCharacteristics(@PathVariable String productName){
        return productCharacteristicService.getProductCharacteristics(productName);
    }

    @RequestMapping(value="/{characteristicName}",method = RequestMethod.GET)
    public ProductCharacteristic getCharacteristic(@PathVariable String productName,@PathVariable String characteristicName){
        return productCharacteristicService.getSingleProductCharacteristic(productName,characteristicName);
    }

    @RequestMapping(value="/{characteristicName}",method = RequestMethod.POST)
    public ProductCharacteristic addProductCharacteristic(@PathVariable String productName,@PathVariable String characteristicName){
        return productCharacteristicService.addProductCharacteristic(productName,characteristicName);
    }

    @RequestMapping(value="/{characteristicName}",method = RequestMethod.DELETE)
    public void removeProductCharacteristic(@PathVariable String productName,@PathVariable String characteristicName){
        productCharacteristicService.removeProductCharacteristic(productName,characteristicName);
    }
}
