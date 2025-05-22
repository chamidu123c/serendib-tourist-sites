package Servlet;

import Model.Booking;
import Model.TourPackage;
import Model.User;
import Services.BookingService;
import Services.TourPackageService;
import Services.UserService;

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

@WebServlet(name = "CreateBookingServlet", value = "/createBooking")
public class CreateBookingServlet extends HttpServlet {

	//load the booking form with the selected tour packages
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addBooking.jsp");

        if (request.getParameter("tourPackageId") == null || request.getParameter("tourPackageId").isEmpty()) {

            HttpSession session = request.getSession();
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour Package ID is required.");

            response.sendRedirect("tours");
            return;
        }

        HttpSession session = request.getSession();

        TourPackageService tourPackageService = new TourPackageService();
        TourPackage selectedTourPackage = tourPackageService.getTourPackageById(Integer.parseInt(request.getParameter("tourPackageId")));

        ArrayList<TourPackage> tourPackages = tourPackageService.getAllTourPackages();

        request.setAttribute("selectedTourPackage", selectedTourPackage);
        request.setAttribute("tourPackages", tourPackages);
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        //if user not logged redirected to login
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        //if logged directed to tours
        if (request.getParameter("tourPackageId") == null || request.getParameter("tourPackageId").isEmpty()) {
            session.setAttribute("status", "failed");
            
            
            
            
            
            
            
            
            
            session.setAttribute("validation", "Tour Package ID is required.");

            response.sendRedirect("tours");
            return;
        }

        //tourist create a booking by using booking service class
        int tourPackageId = Integer.parseInt(request.getParameter("tourPackageId"));

        String name = request.getParameter("name");
        int noOfAdults = Integer.parseInt(request.getParameter("noOfAdults"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        String otherSuggestions = request.getParameter("otherSuggestions");

        User user = (User) session.getAttribute("user");

        //check name is empty
        if (name == null || name.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Name is required.");

            response.sendRedirect("createBooking?tourPackageId=" + tourPackageId);
            return;
        }
        //check no of adults <= 0
        if (noOfAdults <= 0) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Number of adults should be greater than 0.");

            response.sendRedirect("createBooking?tourPackageId=" + tourPackageId);
            return;
        }
        //check start date
        if (startDate == null) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Start date is required.");

            response.sendRedirect("createBooking?tourPackageId=" + tourPackageId);
            return;
        }
        //check other suggestions  null or empty
        if (otherSuggestions == null || otherSuggestions.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Other suggestions are required.");

            response.sendRedirect("createBooking?tourPackageId=" + tourPackageId);
            return;
        }

        //cheack start date 
        if (startDate.getTime() < System.currentTimeMillis()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Start date cannot be in the past.");

            response.sendRedirect("createBooking?tourPackageId=" + tourPackageId);
            return;
        }

        BookingService bookingService = new BookingService();

        Booking booking = new Booking();
        booking.setTourPackageId(tourPackageId);
        booking.setUserId(user.getUserId());
        booking.setBookingDate(new Date(System.currentTimeMillis()).toString());
        booking.setNoOfAdults(noOfAdults);
        booking.setStartDate(startDate);
        booking.setOtherSuggestions(otherSuggestions);
        booking.setStatus("Pending");
        booking.setCustomerName(name);

        boolean isAdded = bookingService.createBooking(booking);

        if (isAdded) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Booking created successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to create booking.");
        }

        response.sendRedirect("touristDashboard");

    }


}