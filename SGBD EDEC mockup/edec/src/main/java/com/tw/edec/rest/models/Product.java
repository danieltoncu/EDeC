package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="product")
public class Product {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)
    @Column(unique=true,nullable = false,name="product_id")
    private Long productId;

    @Column(unique=true,nullable = false,name="product_name")
    private String productName;

    @Column(nullable = false,name="product_brand")
    private String productBrand;

    @Column(nullable = false,name="product_description")
    private String productDescription;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy="product",cascade={CascadeType.REMOVE})
    private Set<ProductCaracteristic> productCaracteristics;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "product", cascade={CascadeType.REMOVE})
    private ProductHealthScore productHealthScore;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "product", cascade={CascadeType.REMOVE})
    private ProductEnvironmentScore productEnvironmentScore;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "product", cascade={CascadeType.REMOVE})
    private ProductSocietyScore productSocietyScore;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "product", cascade={CascadeType.REMOVE})
    private ProductOverallScore productOverallScore;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade={CascadeType.REMOVE})
    private Set<UserLike> userLikes;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade={CascadeType.REMOVE})
    private Set<UserLike> userDislikes;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductBrand() {
        return productBrand;
    }

    public void setProductBrand(String productBrand) {
        this.productBrand = productBrand;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }


    public Set<ProductCaracteristic> getProductCaracteristics() {
        return productCaracteristics;
    }

    public void setProductCaracteristics(Set<ProductCaracteristic> productCaracteristics) {
        this.productCaracteristics = productCaracteristics;
    }

    public ProductHealthScore getProductHealthScore() {
        return productHealthScore;
    }

    public void setProductHealthScore(ProductHealthScore productHealthScore) {
        this.productHealthScore = productHealthScore;
    }

    public ProductEnvironmentScore getProductEnvironmentScore() {
        return productEnvironmentScore;
    }

    public void setProductEnvironmentScore(ProductEnvironmentScore productEnvironmentScore) {
        this.productEnvironmentScore = productEnvironmentScore;
    }

    public ProductSocietyScore getProductSocietyScore() {
        return productSocietyScore;
    }

    public void setProductSocietyScore(ProductSocietyScore productSocietyScore) {
        this.productSocietyScore = productSocietyScore;
    }

    public ProductOverallScore getProductOverallScore() {
        return productOverallScore;
    }

    public void setProductOverallScore(ProductOverallScore productOverallScore) {
        this.productOverallScore = productOverallScore;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<UserLike> getUserLikes() {
        return userLikes;
    }

    public void setUserLikes(Set<UserLike> userLikes) {
        this.userLikes = userLikes;
    }

    public Set<UserLike> getUserDislikes() {
        return userDislikes;
    }

    public void setUserDislikes(Set<UserLike> userDislikes) {
        this.userDislikes = userDislikes;
    }


}
