/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phuan
 */
public class Shipper {
    private int shipperId;
    private String name;
    private String email;
    private String phone;
    private int RoleId;
    private String gender;
    private String password;

    public Shipper() {
    }

    public Shipper(int shipperId, String name, String email, String phone, int RoleId, String gender, String password) {
        this.shipperId = shipperId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.RoleId = RoleId;
        this.gender = gender;
        this.password = password;
    }

    public int getShipperId() {
        return shipperId;
    }

    public void setShipperId(int shipperId) {
        this.shipperId = shipperId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Shipper{" + "shipperId=" + shipperId + ", name=" + name + ", email=" + email + ", phone=" + phone + ", RoleId=" + RoleId + ", gender=" + gender + ", password=" + password + '}';
    }
    
    
}
