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

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");

        HttpSession session = request.getSession();

        session.invalidate();

        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email.isEmpty() || password.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Email and Password cannot be empty.");
            dispatcher.forward(request, response);
            return;
        }

        if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$") || email.length() > 100) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid email format.");
            dispatcher.forward(request, response);
            return;
        }

        if (password.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Password must be less than 45 characters.");

            dispatcher.forward(request, response);
            return;
        }

        UserService userService = new UserService();

        User user = new User();

        user.setEmail(email);
        user.setPassword(password);

        boolean isValidUser = userService.loginUser(user);

        if (isValidUser) {
            user = userService.getUserByEmail(email);
            session.setAttribute("user", user);

            if (user.getRole() == 0) {
                session.setAttribute("role", "admin");
                response.sendRedirect("adminDashboard");
                return;
            } else if (user.getRole() == 1) {
                session.setAttribute("role", "tourist");

                response.sendRedirect("home");
                return;
            } else if (user.getRole() == 2) {
                session.setAttribute("role", "guide");
                response.sendRedirect("guideDashboard");
                return;
            } else if (user.getRole() == 3) {
                session.setAttribute("role", "manager");
                response.sendRedirect("managerDashboard");
                return;
            }

            response.sendRedirect("home");
            return;

        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Invalid email or password.");
            dispatcher.forward(request, response);
        }


    }


}