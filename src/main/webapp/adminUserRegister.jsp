<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("admin")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - User Register</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-box {
            background: rgba(255, 255, 255, 0.15); /* semi-transparent white */
            backdrop-filter: blur(15px); /* frosted glass effect */
            -webkit-backdrop-filter: blur(15px); /* Safari support */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            max-width: 800px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.3); /* optional border for glassy look */
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-custom {
            width: 100%;
            padding: 12px;
            background-color: #f39c12;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #f7dc6f;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
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
            margin-right: 5px;
        }

        .login-link a {
            color: green;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            color: green;
            text-decoration: underline;
        }

    </style>
</head>
<body>

<!-- Home Button with Font Awesome Icon -->
<div class="home-button">
    <a href="adminDashboard">
        <i class="fas fa-home"></i> Dashboard
    </a>
</div>


<div class="signup-box">
    <h2 style="font-weight: bold;">Add a New User</h2>
    <form action="createUser" method="post">
        <div class="row">
            <div class="col-md-6 form-group">
                <label>Full Name:</label>
                <input type="text" name="name" class="form-control" pattern="[A-Za-z ]+" title="Only letters allowed"
                       required>
            </div>
            <div class="col-md-6 form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" required/>
            </div>
            <div class="col-md-6 form-group">
                <label>Contact No:</label>
                <input type="text" name="mobile" class="form-control" pattern="[0-9]{10,15}"
                       title="Enter a valid phone number (10-15 digits)" required>
            </div>
            <div class="col-md-6 form-group">
                <label>Country:</label>
                <select name="country" class="form-control" required>
                    <option value="">-- Select Country --</option>
                    <option value="Sri Lanka">Sri Lanka</option>
                    <option value="India">India</option>
                    <option value="United States">United States</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="Australia">Australia</option>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <label>User Type:</label>
                <select name="role" class="form-control" required>
                    <option value="">-- Select User Type --</option>
                    <option value="1">Tourist</option>
                    <option value="2">Guide</option>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <label>Password:</label>
                <input type="password" name="password" class="form-control"
                       title="Password must be at least 6 characters, include uppercase, lowercase, and a number"
                       required>
            </div>
            <div class="col-md-6 form-group">
                <label>Confirm Password:</label>
                <input type="password" name="confirmPassword" class="form-control"
                       title="Password must be at least 6 characters, include uppercase, lowercase, and a number"
                       required>
            </div>
            <div class="col-12">
                <input type="submit" value="Create" class="btn btn-custom">
            </div>
        </div>
    </form>
</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>

