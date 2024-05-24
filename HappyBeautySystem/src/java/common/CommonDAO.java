package common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CommonDAO {

    public String getDateTimeNow() {
        // Lấy thời gian hiện tại
        LocalDateTime now = LocalDateTime.now();

        // Định dạng thời gian thành chuỗi
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        return formattedDateTime;
    }
}
