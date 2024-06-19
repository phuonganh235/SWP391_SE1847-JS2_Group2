/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phthh
 */
public class ProductSize {
    private int ProductId;
    private String Size;
    private float Price;
    private int Quantity;

    public ProductSize() {
    }

    public ProductSize(int ProductId, String Size, float Price, int Quantity) {
        this.ProductId = ProductId;
        this.Size = Size;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    

    @Override
    public String toString() {
        return "ProductSize{" + "ProductId=" + ProductId + ", Size=" + Size + ", Price=" + Price + ", Quantity=" + Quantity + '}';
    }
  
    
}
