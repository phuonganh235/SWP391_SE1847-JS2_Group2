package dal;

import java.beans.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.Product;
import java.sql.ResultSet;
import model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.NoteShip;

public class NoteShipDAO extends DBContext {

    public int insertNoteShipGetID(NoteShip noteShip) {
        int noteShipId = 0;
        String sql = "INSERT INTO NoteShip (OrderID, Content) VALUES (?, ?)";

        try (PreparedStatement pre = connection.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
            pre.setInt(1, noteShip.getOrderID());
            pre.setString(2, noteShip.getContent());

            int n = pre.executeUpdate();
            if (n > 0) {
                try (ResultSet resultSet = pre.getGeneratedKeys()) {
                    if (resultSet.next()) {
                        noteShipId = resultSet.getInt(1);
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(NoteShipDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return noteShipId;
    }

    // 
    public NoteShip getNoteShipByOrderID(int orderID) {
        NoteShip noteShip = null;
        String sql = "SELECT * FROM NoteShip WHERE OrderID = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, orderID);

            try (ResultSet resultSet = pre.executeQuery()) {
                if (resultSet.next()) {
                    int noteShipId = resultSet.getInt("ID");
                    String content = resultSet.getString("Content");
                    noteShip = new NoteShip(noteShipId, orderID, content);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(NoteShipDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return noteShip;
    }
    public static void main(String[] args) {
        NoteShipDAO dap = new NoteShipDAO();
        System.out.println(dap.getNoteShipByOrderID(2019).getContent());
    }

}
