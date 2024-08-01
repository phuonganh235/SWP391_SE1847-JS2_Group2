package model;

public class PointConfig {

   private int id;
    private boolean isEnabled;
    private int pointsPerAmount;
    private int pointsEarned;
    private int pointsRedeemed;
    private int redeemValue;

    public PointConfig() {
    }

    public PointConfig(int id, boolean isEnabled, int pointsPerAmount, int pointsEarned, int pointsRedeemed, int redeemValue) {
        this.id = id;
        this.isEnabled = isEnabled;
        this.pointsPerAmount = pointsPerAmount;
        this.pointsEarned = pointsEarned;
        this.pointsRedeemed = pointsRedeemed;
        this.redeemValue = redeemValue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public int getPointsPerAmount() {
        return pointsPerAmount;
    }

    public void setPointsPerAmount(int pointsPerAmount) {
        this.pointsPerAmount = pointsPerAmount;
    }

    public int getPointsEarned() {
        return pointsEarned;
    }

    public void setPointsEarned(int pointsEarned) {
        this.pointsEarned = pointsEarned;
    }

    public int getPointsRedeemed() {
        return pointsRedeemed;
    }

    public void setPointsRedeemed(int pointsRedeemed) {
        this.pointsRedeemed = pointsRedeemed;
    }

    public int getRedeemValue() {
        return redeemValue;
    }

    public void setRedeemValue(int redeemValue) {
        this.redeemValue = redeemValue;
    }



  
}
