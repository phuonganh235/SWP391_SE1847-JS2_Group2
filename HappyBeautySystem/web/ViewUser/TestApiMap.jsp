<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://esgoo.net/scripts/jquery.js"></script>
        <style type="text/css">
            .css_select_div {
                text-align: center;
            }
            .css_select {
                display: inline-table;
                width: 25%;
                padding: 5px;
                margin: 5px 2%;
                border: solid 1px #686868;
                border-radius: 5px;
            }
        </style>
        <script>
            $(document).ready(function () {
                const hanoiId = "01"; // ID của Hà Nội

                // Lấy dữ liệu quận huyện của Hà Nội khi tải trang
                function loadHanoiDistricts() {
                    $.getJSON('https://esgoo.net/api-tinhthanh/2/' + hanoiId + '.htm', function (data_quan) {
                        if (data_quan.error == 0) {
                            $("#quan").html('<option value="0">Quận Huyện</option>');
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_quan.data, function (key_quan, val_quan) {
                                $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                            });
                        }
                    });
                }

                // Thêm Hà Nội vào danh sách tỉnh và vô hiệu hóa nó
                $("#tinh").append('<option value="' + hanoiId + '" selected>Thành phố Hà Nội</option>').attr("disabled", true);

                // Gọi hàm để tải quận huyện của Hà Nội khi trang được tải
                loadHanoiDistricts();

                // Khi thay đổi quận huyện
                $("#quan").change(function (e) {
                    var idquan = $(this).val();
                    var selectedQuan = $("#quan option:selected").text();
                    $("#selectedQuan").val(selectedQuan); // Cập nhật giá trị trường ẩn

                    $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                        if (data_phuong.error == 0) {
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                            });
                        }
                    });
                });

                // Khi thay đổi phường xã
                $("#phuong").change(function (e) {
                    var selectedPhuong = $("#phuong option:selected").text();
                    $("#selectedPhuong").val(selectedPhuong); // Cập nhật giá trị trường ẩn
                });

                // Đảm bảo rằng các trường ẩn có giá trị trước khi gửi biểu mẫu
                $("form").submit(function () {
                    var selectedQuan = $("#quan option:selected").text();
                    var selectedPhuong = $("#phuong option:selected").text();
                    $("#selectedQuan").val(selectedQuan);
                    $("#selectedPhuong").val(selectedPhuong);
                });
            });
        </script>
    </head>
    <body>
        <form action="/HappyBeautySystem/TestApiMap?service=test" method="post">
            <div class="css_select_div">
                <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành" disabled>
                    <!-- Hà Nội sẽ được thêm vào từ JavaScript và bị vô hiệu hóa -->
                </select>
                <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện">
                    <option value="0">Quận Huyện</option>
                </select>
                <select class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã">
                    <option value="0">Phường Xã</option>
                </select>
                <div class="row">
                    <div class="form-group">
                        <label for="toTime">To To</label>
                        <input type="time" class="form-control" id="toTime" name="toTime" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="toTime">To To</label>
                        <input type="time" class="form-control" id="toTime" name="toTime" required>
                    </div>
                </div>
            </div>
            <!-- Trường ẩn để lưu trữ giá trị tên quận huyện và phường xã -->
            <input type="hidden" id="selectedQuan" name="selectedQuan">
            <input type="hidden" id="selectedPhuong" name="selectedPhuong">
            <button type="submit">Submit</button>
        </form>
    </body>
</html>

