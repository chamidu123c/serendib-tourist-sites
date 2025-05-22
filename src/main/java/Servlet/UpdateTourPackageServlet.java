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

@WebServlet(name = "UpdateTourPackageServlet", value = "/updateTourPackage")
public class UpdateTourPackageServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateTourPackage.jsp");
        HttpSession session = request.getSession();

        if (request.getParameter("tourPackageId") == null || request.getParameter("tourPackageId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour package ID is required.");
            response.sendRedirect("guideDashboard");
            return;
        }

        int tourPackageId = Integer.parseInt(request.getParameter("tourPackageId"));
        TourPackageService tourPackageService = new TourPackageService();
        TourPackage tourPackage = tourPackageService.getTourPackageById(tourPackageId);

        if (tourPackage != null) {
            request.setAttribute("tourPackage", tourPackage);
            dispatcher.forward(request, response);
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour package not found.");
            response.sendRedirect("guideDashboard");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String tourPackageIdStr = request.getParameter("tourPackageId");
        String packageName = request.getParameter("packageName");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");

        if (tourPackageIdStr == null || tourPackageIdStr.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Tour package ID is required.");
            response.sendRedirect("guideDashboard");
            return;
        }

        int tourPackageId = Integer.parseInt(tourPackageIdStr);

        if (packageName.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Package name must be less than 45 characters.");

            response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
            return;
        }

        if (description.length() > 300) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Description must be less than 200 characters.");

            response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
            return;
        }

        if (duration.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Duration must be less than 45 characters.");

            response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
            return;
        }

        if (price.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Price cannot be empty.");

            response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
            return;
        }

        if (!price.matches("\\d+(\\.\\d{1,2})?")) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid price format.");

            response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
            return;
        }

        TourPackageService tourPackageService = new TourPackageService();

        TourPackage tourPackage = new TourPackage();
        tourPackage.setTourPackageId(tourPackageId);
        tourPackage.setPackageName(packageName);
        tourPackage.setDescription(description);
        tourPackage.setDuration(duration);
        tourPackage.setPrice(Double.parseDouble(price));
        tourPackage.setStatus(0); // Assuming 1 means active

        boolean isUpdated = tourPackageService.updateTourPackage(tourPackage);

        if (isUpdated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Tour package updated successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to update tour package.");
        }

        response.sendRedirect("updateTourPackage?tourPackageId=" + tourPackageId);
        return;
    }


}