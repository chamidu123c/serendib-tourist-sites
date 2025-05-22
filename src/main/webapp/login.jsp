<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Serandib Tours</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            background: #rgba(255, 255, 255, 0.70);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(15px); /* Frosted glass effect */
            -webkit-backdrop-filter: blur(15px); /* Safari support */
        }

        .btn-custom {
            background-color: #f39c12;
            transition: 0.3s ease;
            color: white;
        }

        .btn-custom:hover {
            background-color: #f7dc6f;
        }

        a.adminLogin {
            color: green !important;
            font-weight: bold;
            text-decoration: none;
        }

        a.adminLogin:hover {
            color: darkgreen !important;
            text-decoration: underline;
        }

        .login-container a {
            color: #f7dc6f;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s ease;
        }

        .login-container a:hover {
            color: #f7dc6f;
            text-decoration: underline;
        }

        .login-container p a[href="SignUp.jsp"] {
            color: green;
            font-weight: bold;
        }

        .home-button {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }

        .home-button a {
            background-color: #f39c12;
            color: #ffffff;
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

    </style>
</head>
<body>

<!-- Home Button with Font Awesome Icon -->
<div class="home-button">
    <a href="home">
        <i class="fas fa-home"></i> Home
    </a>
</div>

<div class="login-container">
    <h3 class="text-center mb-4" style="font-weight: bold;">Login</h3>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-custom w-100">Login</button>
    </form>

    <p class="text-center mt-3">
        Don't have an account? <a href="register">Sign Up</a>
    </p>

</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>


