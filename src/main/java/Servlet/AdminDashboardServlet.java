package Servlet;

import Model.TourPackage;
import Model.User;
import Services.TourPackageService;
import Services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminDashboardServlet", value = "/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");

        UserService userService = new UserService();
        ArrayList<User> users = userService.getAllUsers();

        request.setAttribute("users", users);
        dispatcher.forward(request, response);
    }

}