
package model;

/**
 *
 * @author phuan
 */
public class Staff {
    private int staffId;
    private String name;
    private String email;
    private String phone;
    private String password;
    private String gender;
    private int roleid;

    public Staff() {
    }

    public Staff(int staffId, String name, String email, String phone, String password, String gender, int roleid) {
        this.staffId = staffId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.roleid = roleid;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    @Override
    public String toString() {
        return "Staff{" + "staffId=" + staffId + ", name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password + ", gender=" + gender + ", roleid=" + roleid + '}';
    }
    
    
    
    
}
