/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author phthh
 */

public class Promotions {
    private int promoId;
    private String promoCode;
    private String promoName;
    private String startDate;
    private String endDate;
    private int status;
    private String description;
    private double discountAmount;
    private double condition;

    public Promotions() {}

    public Promotions(int promoId, String promoCode, String promoName, String startDate, String endDate, int status, String description, double discountAmount, double condition) {
        this.promoId = promoId;
        this.promoCode = promoCode;
        this.promoName = promoName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.description = description;
        this.discountAmount = discountAmount;
        this.condition = condition;
    }
    
    public int getPromoId() {
        return promoId;
    }

    // Getters and Setters
    public void setPromoId(int promoId) {    
        this.promoId = promoId;
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }

    public String getPromoName() {
        return promoName;
    }

    public void setPromoName(String promoName) {
        this.promoName = promoName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }
    
    public double getCondition() {
        return condition;
    }

    public void setCondition(double condition) {
        this.condition = condition;
    }

    @Override
    public String toString() {
        return "Promotions{" + "promoId=" + promoId + ", promoCode=" + promoCode + ", promoName=" + promoName + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + ", description=" + description + ", discountAmount=" + discountAmount + ", condition=" + condition + '}';
    }
    
}
