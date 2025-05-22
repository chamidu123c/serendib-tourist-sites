package Servlet;

import Model.TourPackage;
import Model.User;
import Services.TourPackageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CreateTourPackageServlet", value = "/createTourPackage")
public class CreateTourPackageServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String packageName = request.getParameter("packageName");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");

        User user = (User) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "User not logged in.");

            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();

        if (userId<=0) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid user ID.");

            response.sendRedirect("login");
            return;
        }

        if (packageName.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Package name must be less than 45 characters.");

            response.sendRedirect("guideDashboard");
            return;
        }

        if (description.length() > 300) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Description must be less than 200 characters.");

            response.sendRedirect("guideDashboard");
            return;
        }

        if (duration.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Duration must be less than 45 characters.");

            response.sendRedirect("guideDashboard");
            return;
        }

        if (price.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Price cannot be empty.");

            response.sendRedirect("guideDashboard");
            return;
        }

        if (!price.matches("\\d+(\\.\\d{1,2})?")) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid price format.");

            response.sendRedirect("guideDashboard");
            return;
        }

        TourPackageService tourPackageService = new TourPackageService();

        TourPackage tourPackage = new TourPackage();
        tourPackage.setGuideId(userId);
        tourPackage.setPackageName(packageName);
        tourPackage.setDescription(description);
        tourPackage.setDuration(duration);
        tourPackage.setPrice(Double.parseDouble(price));
        tourPackage.setStatus(0); // Assuming 1 means active

        System.out.println("Guide ID: " + tourPackage.getGuideId());
        System.out.println("Package Name: " + tourPackage.getPackageName());
        System.out.println("Description: " + tourPackage.getDescription());
        System.out.println("Price: " + tourPackage.getPrice());
        System.out.println("Duration: " + tourPackage.getDuration());
        System.out.println("Status: " + tourPackage.getStatus());

        boolean isCreated = tourPackageService.createTourPackage(tourPackage);

        if (isCreated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Tour package created successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to create tour package.");
        }

        response.sendRedirect("guideDashboard");
        return;
    }


}