package Servlet;

import Model.Hotel;
import Services.HotelService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HotelsServlet", value = "/hotels")
public class HotelsServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("hotels.jsp");

        HotelService hotelService = new HotelService();
        ArrayList<Hotel> hotels = hotelService.getAllHotels();

        request.setAttribute("hotels", hotels);
        dispatcher.forward(request, response);
    }

}