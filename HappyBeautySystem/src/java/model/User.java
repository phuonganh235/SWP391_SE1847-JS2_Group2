package model;

import java.util.Date;

public class User {
    private int userId;
    private String name;
    private String username;
    private String mobile;
    private String email;
    private String address;
    private String postCode;
    private String image;
    private int roleId;
    private String createDate;
    private String password;
    private int Statuss;
    private String dateofbirth;
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User() {
    }

    public User(int userId, String name, String username, String mobile, String email, String address, String postCode, String image, int roleId, String createDate, String password, int Statuss, String dateofbirth) {
        this.userId = userId;
        this.name = name;
        this.username = username;
        this.mobile = mobile;
        this.email = email;
        this.address = address;
        this.postCode = postCode;
        this.image = image;
        this.roleId = roleId;
        this.createDate = createDate;
        this.password = password;
        this.Statuss = Statuss;
        this.dateofbirth = dateofbirth;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatuss() {
        return Statuss;
    }

    public void setStatuss(int Statuss) {
        this.Statuss = Statuss;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", name=" + name + ", username=" + username + ", mobile=" + mobile + ", email=" + email + ", address=" + address + ", postCode=" + postCode + ", image=" + image + ", roleId=" + roleId + ", createDate=" + createDate + ", password=" + password + ", Statuss=" + Statuss + ", dateofbirth=" + dateofbirth + '}';
}
}
