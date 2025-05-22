<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Serandib - Online Tour Guide</title>
  <link rel="stylesheet" type="text/css" href="css/newHeader.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
  <header>
    <div class="navbar">
      <div class="logo">
        <img src="images/logo.png" alt="Serandib Logo" />
        <span>Serandib</span>
      </div>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <li><a href="tours">Packages</a></li>
        <li><a href="terms&condition.jsp">Terms & Conditions</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
      </ul>
      <div class="auth-buttons">
        <a href="login.jsp" class="btn login"><i class="fas fa-sign-in-alt"></i> Login</a>
        <a href="register.jsp" class="btn signup"><i class="fas fa-user-plus"></i> Signup</a>
      </div>
      <div class="hamburger" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
      </div>
    </div>
  </header>
  <script>
    function toggleMenu() {
      const navLinks = document.querySelector('.nav-links');
      navLinks.classList.toggle('active');
    }
  </script>
</body>
</html>