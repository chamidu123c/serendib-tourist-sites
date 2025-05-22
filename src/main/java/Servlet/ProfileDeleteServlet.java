package Servlet;

import Model.User;
import Services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ProfileDeleteServlet", value = "/deleteProfile")
public class ProfileDeleteServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Please log in to access your profile.");

            response.sendRedirect("login");
            return;
        }

        UserService userService = new UserService();
        boolean isDeleted = userService.deleteUser(user);

        if (isDeleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Profile deleted successfully.");

            session.invalidate();
            response.sendRedirect("login");
            return;
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete profile.");
        }

        response.sendRedirect("profile");
        return;

    }

}