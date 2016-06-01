package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="characteristics")
public class Characteristic {

    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique=true,nullable = false,name="id")
    private Long id;

    @Column(unique=true,nullable = false,name="name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "characteristic",cascade = {CascadeType.REMOVE})
    private Set<ProductCharacteristic> productCharacteristicSet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<ProductCharacteristic> getProductCharacteristicSet() {
        return productCharacteristicSet;
    }

    public void setProductCharacteristicSet(Set<ProductCharacteristic> productCharacteristicSet) {
        this.productCharacteristicSet = productCharacteristicSet;
    }
}
