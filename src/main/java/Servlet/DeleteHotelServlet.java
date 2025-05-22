package Servlet;

import Model.Hotel;
import Services.HotelService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DeleteHotelServlet", value = "/deleteHotel")
public class DeleteHotelServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        if (request.getParameter("hotelId") == null || request.getParameter("hotelId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Hotel ID is required.");
            response.sendRedirect("managerDashboard");
            return;
        }

        int hotelId = Integer.parseInt(request.getParameter("hotelId"));

        HotelService hotelService = new HotelService();


        boolean isDeleted = hotelService.deleteHotel(hotelId);

        if (isDeleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Hotel deleted successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete hotel.");
        }

        response.sendRedirect("managerDashboard");

    }


}