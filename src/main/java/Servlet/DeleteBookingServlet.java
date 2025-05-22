package Servlet;

import Model.Booking;
import Model.TourPackage;
import Model.User;
import Services.BookingService;
import Services.TourPackageService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "DeleteBookingServlet", value = "/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        if (request.getParameter("bookingId") == null || request.getParameter("bookingId").isEmpty()) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Booking ID is required.");

            response.sendRedirect("touristDashboard");
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));


        BookingService bookingService = new BookingService();


        boolean isDeleted = bookingService.deleteBooking(bookingId);

        if (isDeleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Booking deleted successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete booking.");
        }

        response.sendRedirect("touristDashboard");
        return;

    }


}