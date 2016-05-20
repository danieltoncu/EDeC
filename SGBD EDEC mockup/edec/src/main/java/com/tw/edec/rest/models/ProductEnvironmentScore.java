package com.tw.edec.rest.models;

import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import javax.persistence.*;

@Entity
@Table(name="environment")
public class ProductEnvironmentScore {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="environment_id")
    private Long productEnvironmentScoreId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(unique=true,name="product_id")
    private Product product;

    @Column(nullable = false,name="environment_score")
    private Double environmentScore;

    @Column(nullable=false,name="environment_score_text")
    private String environmentScoreText;

    public Long getProductEnvironmentScoreId() {
        return productEnvironmentScoreId;
    }

    public void setProductEnvironmentScoreId(Long productEnvironmentScoreId) {
        this.productEnvironmentScoreId = productEnvironmentScoreId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getEnvironmentScore() {
        return environmentScore;
    }

    public void setEnvironmentScore(Double environmentScore) {
        this.environmentScore = environmentScore;
    }

    public String getEnvironmentScoreText() {
        return environmentScoreText;
    }

    public void setEnvironmentScoreText(String environmentScoreText) {
        this.environmentScoreText = environmentScoreText;
    }


}
