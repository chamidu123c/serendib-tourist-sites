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

@WebServlet(name = "UpdateBookingServlet", value = "/updateBooking")
public class UpdateBookingServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateBooking.jsp");

        if (request.getParameter("bookingId") == null || request.getParameter("bookingId").isEmpty()) {

            HttpSession session = request.getSession();
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Booking ID is required.");

            response.sendRedirect("touristDashboard");
            return;
        }

        HttpSession session = request.getSession();

        BookingService bookingService = new BookingService();
        Booking booking = bookingService.getBookingById(Integer.parseInt(request.getParameter("bookingId")));

        TourPackageService tourPackageService = new TourPackageService();
        ArrayList<TourPackage> tourPackages = tourPackageService.getAllTourPackages();

        request.setAttribute("booking", booking);
        request.setAttribute("tourPackages", tourPackages);
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        if (request.getParameter("tourPackageId") == null || request.getParameter("tourPackageId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour Package ID is required.");

            response.sendRedirect("tours");
            return;
        }

        if (request.getParameter("bookingId") == null || request.getParameter("bookingId").isEmpty()) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Booking ID is required.");

            response.sendRedirect("touristDashboard");
            return;
        }

        int tourPackageId = Integer.parseInt(request.getParameter("tourPackageId"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        String name = request.getParameter("name");
        int noOfAdults = Integer.parseInt(request.getParameter("noOfAdults"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        String otherSuggestions = request.getParameter("otherSuggestions");

        User user = (User) session.getAttribute("user");

        if (name == null || name.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Name is required.");

            response.sendRedirect("updateBooking?bookingId=" + bookingId);
            return;
        }

        if (noOfAdults <= 0) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Number of adults should be greater than 0.");

            response.sendRedirect("updateBooking?bookingId=" + bookingId);
            return;
        }

        if (startDate == null) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Start date is required.");

            response.sendRedirect("updateBooking?bookingId=" + bookingId);
            return;
        }

        if (otherSuggestions == null || otherSuggestions.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Other suggestions are required.");

            response.sendRedirect("updateBooking?bookingId=" + bookingId);
            return;
        }

        if (startDate.getTime() < System.currentTimeMillis()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Start date cannot be in the past.");

            response.sendRedirect("updateBooking?bookingId=" + bookingId);
            return;
        }

        BookingService bookingService = new BookingService();

        Booking booking = new Booking();
        booking.setBookingId(bookingId);
        booking.setTourPackageId(tourPackageId);
        booking.setBookingDate(new Date(System.currentTimeMillis()).toString());
        booking.setNoOfAdults(noOfAdults);
        booking.setStartDate(startDate);
        booking.setOtherSuggestions(otherSuggestions);
        booking.setStatus("Pending");
        booking.setCustomerName(name);

        boolean isUpdated = bookingService.updateBooking(booking);

        if (isUpdated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Booking updated successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to update booking.");
        }

        response.sendRedirect("updateBooking?bookingId=" + bookingId);
        return;

    }


}