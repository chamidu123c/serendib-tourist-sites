package Servlet;

import Model.Booking;
import Model.User;
import Services.BookingService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TouristDashboardServlet", value = "/touristDashboard")
public class TouristDashboardServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("touristDashboard.jsp");

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();

        BookingService bookingService = new BookingService();

        ArrayList<Booking> bookings = bookingService.getBookingsByUserId(userId);

        request.setAttribute("bookings", bookings);
        dispatcher.forward(request, response);
    }

}