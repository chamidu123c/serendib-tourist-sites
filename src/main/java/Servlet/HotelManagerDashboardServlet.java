package Servlet;

import Model.Hotel;
import Model.TourPackage;
import Model.User;
import Services.HotelService;
import Services.TourPackageService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HotelManagerDashboardServlet", value = "/managerDashboard")
public class HotelManagerDashboardServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("managerDashboard.jsp");

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();

        HotelService hotelService = new HotelService();
        ArrayList<Hotel> hotels = hotelService.getAllHotels();

        request.setAttribute("hotels", hotels);
        dispatcher.forward(request, response);
    }

}