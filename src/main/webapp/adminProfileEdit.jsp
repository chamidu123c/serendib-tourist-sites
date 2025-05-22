<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("admin")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tour Guide Registration</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .background-blur {
            background: url('images/hiking.jpg') no-repeat center center/cover;
            filter: blur(8px);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .registration-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(8px); /* Frosted glass effect */
            -webkit-backdrop-filter: blur(8px); /* Safari support */
            max-width: 800px;
            width: 100%;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #d4af37;
            color: white;
            border: none;
        }

        .btn-custom:hover {
            background-color: #f7dc6f;
        }

        .registration-container a {
            color: #d4af37;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s ease;
        }

        .registration-container a:hover {
            color: #d4af37;
            text-decoration: underline;
        }


        .home-button {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }

        .home-button a {
            background-color: #f39c12;
            color: white;
            padding: 10px 15px;
            border-radius: 50px;
            font-size: 16px;
            text-decoration: none;
            transition: 0.3s ease;
        }

        .home-button a:hover {
            background-color: #f7dc6f;
        }

        .home-button i {
            margin-right: 5px; /* Spacing between icon and text */
        }
    </style>
</head>
<body>

<!-- Home Button with Font Awesome Icon -->
<div class="home-button">
    <a href="adminDashboard" class="btn signup"><i class="fa-solid fa-user"></i> Dashboard</a>
</div>

<div class="background-blur"></div>
<div class="registration-container">
    <h4 class="text-center mb-4">Profile</h4>
    <form action="editProfile" method="post">
        <div class="row g-3">
            <div class="col-md-6 form-group">
                <label>Full Name:</label>
                <input value="${user.userId}" type="hidden" name="userId">
                <input type="text" name="name" class="form-control" pattern="[A-Za-z ]+" title="Only letters allowed"
                       value="${user.name}" required>
            </div>
            <div class="col-md-6 form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" value="${user.email}" required/>
            </div>
            <div class="col-md-6 form-group">
                <label>Contact No:</label>
                <input type="text" name="mobile" class="form-control" pattern="[0-9]{10,15}"
                       title="Enter a valid phone number (10-15 digits)" value="${user.mobile}" required>
            </div>
            <div class="col-md-6 form-group">
                <label>Country:</label>
                <select name="country" class="form-control" required>
                    <option value="">-- Select Country --</option>
                    <option ${user.country == 'Sri Lanka'? 'selected' :''} value="Sri Lanka">Sri Lanka</option>
                    <option ${user.country == 'India'? 'selected' :''} value="India">India</option>
                    <option ${user.country == 'United States'? 'selected' :''} value="United States">United States
                    </option>
                    <option ${user.country == 'United Kingdom'? 'selected' :''} value="United Kingdom">United Kingdom
                    </option>
                    <option ${user.country == 'Australia'? 'selected':''} value="Australia">Australia</option>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <label>Password:</label>
                <input type="password" name="password" class="form-control"
                       title="Password must be at least 6 characters, include uppercase, lowercase, and a number"
                       value="${user.password}" required>
            </div>
        </div>
        <button type="submit" class="btn btn-custom w-100 mt-4">Update</button>
    </form>

    <c:choose>
        <c:when test="${user.role != '3'}">
            <form action="deleteUserProfile" method="post">
                <input value="${user.userId}" type="hidden" name="userId">
                <button type="submit" style="background-color: red;" class="btn btn-custom w-100 mt-4">Delete Profile
                </button>
            </form>
        </c:when>
    </c:choose>

</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>
