package model;

public class PoitCustomer {

    private int id;
    private int UserID;
    private int Ponit;

    public PoitCustomer() {
    }

    public PoitCustomer(int id, int UserID, int Ponit) {
        this.id = id;
        this.UserID = UserID;
        this.Ponit = Ponit;
    }

    public PoitCustomer(int UserID, int Ponit) {
        this.UserID = UserID;
        this.Ponit = Ponit;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getPonit() {
        return Ponit;
    }

    public void setPonit(int Ponit) {
        this.Ponit = Ponit;
    }
    

}
