/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phthh
 */
public class Role {
    private int RoleId;
    private String Name;
    private String Description;

    public Role() {
    }

    public Role(int RoleId, String Name, String Description) {
        this.RoleId = RoleId;
        this.Name = Name;
        this.Description = Description;
    }
    
    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "Role{" + "RoleId=" + RoleId + ", Name=" + Name + ", Description=" + Description + '}';
    }
    
}
