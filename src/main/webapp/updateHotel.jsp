<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("manager")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Registration</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom Style -->
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url('images/hotel.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .register-container {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(8px); /* Frosted glass effect */
            -webkit-backdrop-filter: blur(8px); /* Safari support */
            max-width: 400px;
            width: 100%;
        }

        .register-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #d4af37;
            color: white;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #f7dc6f;
        }

        .register-container p {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h3>Hotel Update</h3>
    <form action="updateHotel" method="post">
        <div class="mb-3">
            <label for="hotelName" class="form-label">Hotel Name</label>
            <input value="${hotel.hotelId}" name="hotelId" type="hidden"/>
            <input type="text" id="hotelName" name="hotelName" class="form-control" value="${hotel.hotelName}" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Hotel Price Per Night ($)</label>
            <input type="number" id="price" name="price" class="form-control" value="${hotel.price}" required>
        </div>
        <div class="mb-3">
            <label for="location" class="form-label">Hotel Location</label>
            <input type="text" id="location" name="location" class="form-control" value="${hotel.location}" required>
        </div>
        <div class="mb-3">
            <label for="mobile" class="form-label">Contact Number</label>
            <input type="number" id="mobile" name="mobile" class="form-control" value="${hotel.mobile}" required>
        </div>
        <button type="submit" class="btn-custom">Update Hotel</button>
    </form>

    <br>
    <center>
        <a href="managerDashboard" style="background-color: gray" class="btn-custom">Back to Dashboard</a>
    </center>
</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>
