package Servlet;

import Model.TourPackage;
import Model.User;
import Services.TourPackageService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TourPackagesServlet", value = "/tours")
public class TourPackagesServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("tourPackages.jsp");

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        TourPackageService tourPackageService = new TourPackageService();
        ArrayList<TourPackage> tourPackages = tourPackageService.getAllTourPackages();

        request.setAttribute("tourPackages", tourPackages);
        dispatcher.forward(request, response);
    }

}