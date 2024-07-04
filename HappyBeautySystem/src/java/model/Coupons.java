/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.Date;

/**
 *
 * @author phuan
 */
public class Coupons {

    private int couponsId;
    private String code;
    private String description;
    private double discountAmount;
    private String startDate;
    private String endDate;
    private int quantity;
    private int isActive;

    public Coupons() {
    }

    public Coupons(int couponsId, String code, String description, double discountAmount, String startDate, String endDate, int quantity, int isActive) {
        this.couponsId = couponsId;
        this.code = code;
        this.description = description;
        this.discountAmount = discountAmount;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
        this.isActive = isActive;
    }

    public int getCouponsId() {
        return couponsId;
    }

    public void setCouponsId(int couponsId) {
        this.couponsId = couponsId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Coupons{" + "couponsId=" + couponsId + ", code=" + code + ", description=" + description + ", discountAmount=" + discountAmount + ", startDate=" + startDate + ", endDate=" + endDate + ", quantity=" + quantity + ", isActive=" + isActive + '}';
    }



}
