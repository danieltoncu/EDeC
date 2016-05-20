package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="caracteristics")
public class Caracteristic {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)
    @Column(unique=true,nullable = false,name="caracteristic_id")
    private Long caracteristicId;

    @Column(unique=true,nullable = false,name="caracteristic_name")
    private String caracteristicName;

    @Column(nullable = false,name="caracteristic_concern_level")
    private Long caracteristicConcernLevel;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy="caracteristic")
    private Set<ProductCaracteristic> productCaracteristics;

    public Long getCaracteristicId() {
        return caracteristicId;
    }

    public void setCaracteristicId(Long caracteristicId) {
        this.caracteristicId = caracteristicId;
    }

    public String getCaracteristicName() {
        return caracteristicName;
    }

    public void setCaracteristicName(String caracteristicName) {
        this.caracteristicName = caracteristicName;
    }

    public Long getCaracteristicConcernLevel() {
        return caracteristicConcernLevel;
    }

    public void setCaracteristicConcernLevel(Long caracteristicConcernLevel) {
        this.caracteristicConcernLevel = caracteristicConcernLevel;
    }

    public Set<ProductCaracteristic> getProductCaracteristics() {
        return productCaracteristics;
    }

    public void setProductCaracteristics(Set<ProductCaracteristic> productCaracteristics) {
        this.productCaracteristics = productCaracteristics;
    }
}
