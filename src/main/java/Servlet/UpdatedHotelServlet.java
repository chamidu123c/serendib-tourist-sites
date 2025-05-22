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

@WebServlet(name = "UpdatedHotelServlet", value = "/updateHotel")
public class UpdatedHotelServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateHotel.jsp");

        HttpSession session = request.getSession();

        if (request.getParameter("hotelId") == null || request.getParameter("hotelId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Hotel ID is required.");
            response.sendRedirect("managerDashboard");
            return;
        }

        HotelService hotelService = new HotelService();
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));

        Hotel hotel = hotelService.getHotelById(hotelId);

        request.setAttribute("hotel", hotel);
        dispatcher.forward(request, response);
    }

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
        String hotelName = request.getParameter("hotelName");
        String location = request.getParameter("location");
        String price = request.getParameter("price");
        String mobile = request.getParameter("mobile");

        if (hotelName == null || hotelName.isEmpty() || location == null || location.isEmpty() || price == null || price.isEmpty() || mobile == null || mobile.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "All fields are required.");
            response.sendRedirect("updateHotel?hotelId=" + hotelId);
            return;
        }

        if (!price.matches("^[0-9]+(\\.[0-9]{1,2})?$")) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Price must be a valid number.");
            response.sendRedirect("updateHotel?hotelId=" + hotelId);
            return;
        }

        if (!mobile.matches("^[0-9]{10}$")) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Mobile number must be 10 digits.");
            response.sendRedirect("updateHotel?hotelId=" + hotelId);
            return;
        }

        if (hotelName.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Hotel name must be less than 45 characters.");
            response.sendRedirect("updateHotel?hotelId=" + hotelId);
            return;
        }

        if (location.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Location must be less than 45 characters.");
            response.sendRedirect("updateHotel?hotelId=" + hotelId);
            return;
        }

        HotelService hotelService = new HotelService();

        Hotel hotel = new Hotel();
        hotel.setHotelId(hotelId);
        hotel.setHotelName(hotelName);
        hotel.setLocation(location);
        hotel.setPrice(Double.parseDouble(price));
        hotel.setMobile(mobile);

        boolean isupdated = hotelService.updateHotel(hotel);

        if (isupdated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Hotel updated successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to update hotel.");
        }

        response.sendRedirect("updateHotel?hotelId=" + hotelId);
        return;
    }


}