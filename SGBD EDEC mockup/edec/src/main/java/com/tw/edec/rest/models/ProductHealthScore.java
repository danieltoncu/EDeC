package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="health")
public class ProductHealthScore {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="health_id")
    private Long productHealthScoreId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(unique=true,name="product_id")
    private Product product;

    @Column(nullable = false,name="health_score")
    private Double healthScore;

    @Column(nullable=false,name="health_score_text")
    private String healthScoreText;

    public Long getProductHealthScoreId() {
        return productHealthScoreId;
    }

    public void setProductHealthScoreId(Long productHealthScoreId) {
        this.productHealthScoreId = productHealthScoreId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getHealthScore() {
        return healthScore;
    }

    public void setHealthScore(Double healthScore) {
        this.healthScore = healthScore;
    }

    public String getHealthScoreText() {
        return healthScoreText;
    }

    public void setHealthScoreText(String healthScoreText) {
        this.healthScoreText = healthScoreText;
    }
}
