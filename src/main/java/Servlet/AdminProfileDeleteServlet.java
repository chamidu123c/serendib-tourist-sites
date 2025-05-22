package Servlet;

import Model.User;
import Services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminProfileDeleteServlet", value = "/deleteUserProfile")
public class AdminProfileDeleteServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        if (request.getParameter("userId") == null || request.getParameter("userId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "User ID is required.");

            response.sendRedirect("adminDashboard");
            return;
        }

        int userId = Integer.parseInt(request.getParameter("userId"));

        UserService userService = new UserService();
        User user = userService.getUserById(userId);

        boolean isDeleted = userService.deleteUser(user);

        if (isDeleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "User deleted successfully.");

            response.sendRedirect("adminDashboard");
            return;
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete profile.");
        }

        response.sendRedirect("adminDashboard");
        return;

    }

}