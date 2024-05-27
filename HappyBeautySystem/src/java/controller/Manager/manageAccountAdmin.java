package controller.Manager;

import dal.shipperDao;
import dal.staffDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Shipper;
import model.Staff;

// Author     : phuan
@WebServlet(name = "manageAccountAdmin", urlPatterns = {"/manageAccountAdmin"})
public class manageAccountAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            staffDao DaoStaff = new staffDao();
            shipperDao DaoShiper = new shipperDao();

            if (service == null) {
                response.sendRedirect("ViewAdmin/Widget.jsp");
                return;
            }
            //Manage Account Staff begin

            // view Account Staff
            if (service.equals("ListAllStaff")) {
                Vector<Staff> vector = DaoStaff.getAll("select* from Staff");
                // set data for view (jsp)
                request.setAttribute("dataStaff", vector);
                // select view (jsp)
                request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
            }
            //chuyen san trang insert
            if (service.equals("ActionCreate")) {
                request.getRequestDispatcher("ViewAdmin/createAccountStaff.jsp").forward(request, response);
            }
            //thuc hien insert
            if (service.equals("insertStaff")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                int roleid = Integer.parseInt(request.getParameter("roleid"));
                Staff staffNew = new Staff(0, name, email, phone, password, gender, roleid);
                DaoStaff.insertStaff(staffNew);
                response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
            }
            // chuyen sang trang update
            if (service.equals("update")) {

                int id = Integer.parseInt(request.getParameter("id"));
                Staff staff = DaoStaff.getStaffById(id);
                request.setAttribute("StaffData", staff);
                request.getRequestDispatcher("ViewAdmin/editAccountStaff.jsp").forward(request, response);
            }
            //update staff
            if (service.equals("edit")) {
                int staffId = Integer.parseInt(request.getParameter("staffId"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                Staff newStaff = new Staff(staffId, name, email, phone, password, gender, 1);
                DaoStaff.updateStaff(newStaff);
                response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
            }
            // xoa staff ra khoi he thong
            if (service.equals("delete")) {
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    DaoStaff.deleteStaff(id);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }

            // tim account staff theo ten
            if (service.equals("search")) {
                String search = request.getParameter("search");
                Vector<Staff> list = DaoStaff.serachStaffByName(search);
                request.setAttribute("dataStaff", list);
                request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
            }

            // Manage Account Shipper Begin
            // in ra so tai khoản shipper
            if (service.equals("ListAllShipper")) {
                Vector<Shipper> vector = DaoShiper.getAll("select* from Shipper");
                // set data for view (jsp)
                request.setAttribute("dataShipper", vector);
                // select view (jsp)
                request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
            }
            // chuyen sang trang insert tai khoan shipper
            if (service.equals("ActionCreateShipper")) {
                request.getRequestDispatcher("ViewAdmin/createAccountShipper.jsp").forward(request, response);
            }
            // thuc hien insert account shipper moi
            if (service.equals("insertShipper")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                Shipper newShipper = new Shipper(0, name, email, phone, 1, gender, password);
                DaoShiper.insertShipper(newShipper);
                response.sendRedirect("manageAccountAdmin?service=ListAllShipper");
            }

            // chuyen sang tran update account shipper
            if (service.equals("updateShipper")) {

                int id = Integer.parseInt(request.getParameter("id"));
                Shipper shipper = DaoShiper.getShipperById(id);
                request.setAttribute("dataShipper", shipper);
                request.getRequestDispatcher("ViewAdmin/editAccountShipper.jsp").forward(request, response);
            }
            // thuc hien update account shipper
            if (service.equals("eiditShipper")) {
                int shipperId = Integer.parseInt(request.getParameter("shipperId"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                Shipper newShipper = new Shipper(shipperId, name, email, phone, 1, gender, password);
                DaoShiper.updateShipper(newShipper);
                response.sendRedirect("manageAccountAdmin?service=ListAllShipper");
            }
            // xoa Account shipper
            if (service.equals("deleteShipper")) {
                String id_raw = request.getParameter("idShipper");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    DaoShiper.deleteShipper(id);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
// search account shipper theo ten
            if (service.equals("searchShipper")) {
                String search = request.getParameter("search");
                Vector<Shipper> list = DaoShiper.serachStaffByName(search);
                request.setAttribute("dataShipper", list);
                request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
            }

            //Manage Account Shipper End
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
