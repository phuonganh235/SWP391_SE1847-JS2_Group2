package common;

import dal.ConsultationDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Consultations;
import Utils.EmailUtility;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phuan
 */
public class Consultation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            ConsultationDao consulDao = new ConsultationDao();
            if (service == null) {
                return;
            }
            if (service.equals("insert")) {
                String customerName = request.getParameter("customerName");
                String customeraddress = request.getParameter("customerAddress");
                String customerPhone = request.getParameter("customerPhone");
                String Date = request.getParameter("consultationDate");
                String timeslot = request.getParameter("timeSlot");
                String note = request.getParameter("note");
                String Email = request.getParameter("customerEmail");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate dateBook = LocalDate.parse(Date, formatter);
                String[] times = timeslot.split("-");
                String startHour = times[0];
                String endHour = times[1];
                String formattedDate = dateBook.format(formatter);
                Consultations newConsultation = new Consultations(0, customerName, customeraddress, customerPhone, formattedDate, note, startHour, endHour, 1, Email);
                consulDao.insertConsultation(newConsultation);
                response.sendRedirect(request.getContextPath() + "/consultationSuccess");
                return;
            }
            //Danh sách chờ xác nhận 
            if (service.equals("listAll1")) {
                ArrayList<Consultations> list = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 1");
                request.setAttribute("listAll1", list);
                request.getRequestDispatcher("ViewAdmin/confirmBooking.jsp").forward(request, response);
            }
            //Danh sách chờ tư vấn
            if (service.equals("listAll2")) {
                ArrayList<Consultations> list = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 2");
                request.setAttribute("listAll2", list);
                request.getRequestDispatcher("ViewAdmin/confirmConsultaion.jsp").forward(request, response);
            }
            //Danh sách chờ tư vấn
            if (service.equals("listAll3")) {
                ArrayList<Consultations> list = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 3");
                request.setAttribute("listAll3", list);
                request.getRequestDispatcher("ViewAdmin/consultationSuccess.jsp").forward(request, response);
            }
            //xác nhận đặt lịch
            if (service.equals("confirm")) {
                int consultationId = Integer.parseInt(request.getParameter("idConfirm"));
                consulDao.updateConsultationStatus(consultationId, 2);
                Consultations consultation = consulDao.getConsultationById(consultationId);

                //Send email
                String recipinentEmail = consultation.getEmail();
                String subject = "Xác nhận lịch tư vấn";
                String message = "Xin chào " + consultation.getCustomerName() + ",\n\nLịch tư vấn của bạn đã được xác nhận .\n\nNgày tư vấn: " + consultation.getConsultationDate() + "\nThời gian: " + consultation.getStartHour() + " - " + consultation.getEndHour() + "\nMã phòng room : 123" + "\n\nCảm ơn bạn đã sử dụng dịch vụ của chúng tôi.";
                EmailUtility.sendEmail(recipinentEmail, subject, message);
                ArrayList<Consultations> listConfirm = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 1");
                request.setAttribute("listAll1", listConfirm);
                request.getRequestDispatcher("ViewAdmin/confirmBooking.jsp").forward(request, response);
            }
            //xác nhận đã tư vấn
            if (service.equals("confirm2")) {
                int consultationId = Integer.parseInt(request.getParameter("idConfirm2"));
                consulDao.updateConsultationStatus(consultationId, 3);
                ArrayList<Consultations> listConfirm = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 2");
                request.setAttribute("listAll2", listConfirm);
                request.getRequestDispatcher("ViewAdmin/confirmConsultaion.jsp").forward(request, response);
            }

            if (service.equals("deleteconfirm")) {
                int idDelete = Integer.parseInt(request.getParameter("idConfirmdelete"));
                int status = Integer.parseInt(request.getParameter("status"));
                consulDao.deleteConsultion(idDelete);
                if (status == 1) {
                    ArrayList<Consultations> listConfirm = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 1");
                    request.setAttribute("listAll1", listConfirm);
                    request.getRequestDispatcher("ViewAdmin/confirmBooking.jsp").forward(request, response);
                } else if (status == 2) {
                    ArrayList<Consultations> listConfirm = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 2");
                    request.setAttribute("listAll2", listConfirm);
                    request.getRequestDispatcher("ViewAdmin/confirmConsultaion.jsp").forward(request, response);
                } else if (status == 3) {
                    ArrayList<Consultations> listConfirm = consulDao.getConsultationWithStatus1("select * from [dbo].[Consultations] where Status = 3");
                    request.setAttribute("listAll3", listConfirm);
                    request.getRequestDispatcher("ViewAdmin/consultationSuccess.jsp").forward(request, response);
                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Consultation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Consultation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
