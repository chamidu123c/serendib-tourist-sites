package Servlet;

import Model.TourPackage;
import Services.TourPackageService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DeleteTourPackageServlet", value = "/deleteTourPackage")
public class DeleteTourPackageServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String tourPackageIdStr = request.getParameter("tourPackageId");

        if (tourPackageIdStr == null || tourPackageIdStr.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour package ID is required.");
            response.sendRedirect("guideDashboard");
            return;
        }

        int tourPackageId = Integer.parseInt(tourPackageIdStr);

        TourPackageService tourPackageService = new TourPackageService();

        boolean isDeleted = tourPackageService.deleteTourPackage(tourPackageId);

        if (isDeleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Tour package deleted successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete tour package.");
        }

        response.sendRedirect("guideDashboard");
    }


}