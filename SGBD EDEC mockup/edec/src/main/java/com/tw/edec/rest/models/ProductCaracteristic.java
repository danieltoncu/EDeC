package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="product_caracteristic")
public class ProductCaracteristic {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)
    @Column(unique=true,nullable = false,name="product_caracteristic_id")
    private Long productCaracteristicId;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "caracteristic_id")
    private Caracteristic caracteristic;

    public Long getProductCaracteristicId() {
        return productCaracteristicId;
    }

    public void setProductCaracteristicId(Long productCaracteristicId) {
        this.productCaracteristicId = productCaracteristicId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Caracteristic getCaracteristic() {
        return caracteristic;
    }

    public void setCaracteristic(Caracteristic caracteristic) {
        this.caracteristic = caracteristic;
    }


}
