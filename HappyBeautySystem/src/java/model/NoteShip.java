
package model;


public class NoteShip {
    private int ID; 
    private int OrderID  ; 
    private String Content;

    public NoteShip() {
    }

    public NoteShip(int ID, int OrderID, String Content) {
        this.ID = ID;
        this.OrderID = OrderID;
        this.Content = Content;
    }

    public NoteShip(int OrderID, String Content) {
        this.OrderID = OrderID;
        this.Content = Content;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }
    
}
