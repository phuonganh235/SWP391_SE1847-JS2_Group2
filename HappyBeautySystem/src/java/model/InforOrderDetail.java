
package model;

public class InforOrderDetail {
    private int ID;
    private int OrderID;
    private String City;
    private String District;
    private String Ward;
    private String AddressDetail;
    private String Note;
    private String From;
    private String To;

    public InforOrderDetail() {
    }

    public InforOrderDetail(int ID, int OrderID, String City, String District, String Ward, String AddressDetail, String Note, String From, String To) {
        this.ID = ID;
        this.OrderID = OrderID;
        this.City = City;
        this.District = District;
        this.Ward = Ward;
        this.AddressDetail = AddressDetail;
        this.Note = Note;
        this.From = From;
        this.To = To;
    }

    public InforOrderDetail(int OrderID, String City, String District, String Ward, String AddressDetail, String Note, String From, String To) {
        this.OrderID = OrderID;
        this.City = City;
        this.District = District;
        this.Ward = Ward;
        this.AddressDetail = AddressDetail;
        this.Note = Note;
        this.From = From;
        this.To = To;
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

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getWard() {
        return Ward;
    }

    public void setWard(String Ward) {
        this.Ward = Ward;
    }

    public String getAddressDetail() {
        return AddressDetail;
    }

    public void setAddressDetail(String AddressDetail) {
        this.AddressDetail = AddressDetail;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public String getFrom() {
        return From;
    }

    public void setFrom(String From) {
        this.From = From;
    }

    public String getTo() {
        return To;
    }

    public void setTo(String To) {
        this.To = To;
    }

  
}

