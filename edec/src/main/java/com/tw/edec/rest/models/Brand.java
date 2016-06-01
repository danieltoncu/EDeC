package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="brands")
public class Brand {

    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique=true,nullable = false,name="id")
    private Long id;

    @Column(nullable = false,unique = true,name="name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "brand")
    private Set<ProductBrand> productBrandSet;

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

    public Set<ProductBrand> getProductBrandSet() {
        return productBrandSet;
    }

    public void setProductBrandSet(Set<ProductBrand> productBrandSet) {
        this.productBrandSet = productBrandSet;
    }
}
