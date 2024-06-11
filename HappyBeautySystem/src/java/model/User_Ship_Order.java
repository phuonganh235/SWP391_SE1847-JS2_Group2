
package model;

public class User_Ship_Order {
    private int orderid ;
    private int userid ;
    private String date;
    private int staffid;

    public User_Ship_Order() {
    }

    public User_Ship_Order(int orderid, int userid, String date, int staffid) {
        this.orderid = orderid;
        this.userid = userid;
        this.date = date;
        this.staffid = staffid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStaffid() {
        return staffid;
    }

    public void setStaffid(int staffid) {
        this.staffid = staffid;
    }
    
}
