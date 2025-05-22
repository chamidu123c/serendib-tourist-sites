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

@WebServlet(name = "AdminProfileEditServlet", value = "/editProfile")
public class AdminProfileEditServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminProfileEdit.jsp");

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

        request.setAttribute("user", user);
        dispatcher.forward(request, response);
    }

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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String country = request.getParameter("country");

        if (country.isEmpty() || country.length() > 45) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Country must be between 1 and 45 characters.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        if (name.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Name must be between 1 and 45 characters.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$") || email.length() > 100) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid email format.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        if (password.isEmpty() || password.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Password must be less than 45 characters.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        if (mobile.isEmpty() || mobile.length() > 10) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Mobile number must be 10 digits.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        UserService userService = new UserService();
        User user = userService.getUserById(userId);

        if (userService.validateEmail(email) && !email.equals(user.getEmail())) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Email already exists.");

            response.sendRedirect("editProfile?userId=" + userId);
            return;
        }

        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setCountry(country);


        boolean isUpdated = userService.updateUser(user);

        if (isUpdated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "User updated successfully.");
            session.setAttribute("user", user);
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to update profile.");
        }

        response.sendRedirect("editProfile?userId=" + userId);
        return;

    }


}