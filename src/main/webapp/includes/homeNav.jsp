<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- HEADER SECTION -->
<header>
    <div class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Serandib Logo"/>
            <span>Serandib</span>
        </div>
        <!-- Navigation menu -->
        <ul class="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="tours">Tour Packages</a></li>
            <li><a href="hotels">Hotels</a></li>
            <li><a href="terms&condition.jsp">Terms & Conditions</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>

        <!-- Login/Signup buttons -->
        <div class="auth-buttons">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="login" class="btn login"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="register" class="btn signup"><i class="fas fa-user-plus"></i> Signup</a>
                </c:when>
                <c:otherwise>
                    <a href="logout" class="btn login">Logout</a>
                    <c:choose>
                        <c:when test="${sessionScope.role == 'admin'}">
                            <a href="adminDashboard" class="btn signup"><i class="fa-solid fa-user"></i> Dashboard</a>
                        </c:when>
                        <c:when test="${sessionScope.role == 'tourist'}">
                            <a href="touristDashboard" class="btn signup"><i class="fa-solid fa-user"></i> Dashboard</a>
                        </c:when>
                        <c:when test="${sessionScope.role == 'guide'}">
                            <a href="guideDashboard" class="btn signup"><i class="fa-solid fa-user"></i> Dashboard</a>
                        </c:when>
                        <c:when test="${sessionScope.role == 'manager'}">
                            <a href="managerDashboard" class="btn signup"><i class="fa-solid fa-user"></i> Dashboard</a>
                        </c:when>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Hamburger menu for mobile view -->
        <div class="hamburger" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</header>