<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Serandib - Online Tour Guide</title>
    <link rel="stylesheet" type="text/css" href="css/new.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<jsp:include page="includes/homeNav.jsp"/>
<body>
<div class="container">
    <h1>Vehicle-Only Tour Package</h1>
    <div class="package-info">
        <p>This tour package includes <strong>only a vehicle</strong> for your travel needs.</p>
        <p>If you require a tour guide, please <a href="profile.jsp">visit our Guide Page</a> and contact them directly.
        </p>
        <p>If you require a hotel, please <a href="addHotel.jsp">visit our Hotel Page</a> and contact them directly.</p>
    </div>
    <form class="booking-form">
        <label for="first-name">First Name:</label>
        <input type="text" id="first-name" name="first-name" required>

        <label for="last-name">Last Name:</label>
        <input type="text" id="last-name" name="last-name" required>

        <label for="email">Email Address:</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="start-date">When do you start your trip?</label>
        <input type="date" id="start-date" name="start-date" required>

        <label for="vehicle">Select Vehicle Type:</label>
        <select id="vehicle" name="vehicle" required>
            <option value="">-- Select --</option>
            <option value="van">Van</option>
            <option value="car">Car</option>
            <option value="bus">Bus</option>
            <option value="bus">Bike</option>
        </select>

        <button type="submit">Book Now</button>
    </form>
</div>
</body>
<!-- Footer Section -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-about">
            <div class="footer-logo">
                <img src="image/logo.png" alt="Serandib Logo">
                <h3 style="color: #F9A825;">Serandib</h3>
            </div>
            <p>Your trusted companion for exploring Sri Lanka. Discover hidden gems, book expert guides, and travel with
                confidence.</p>
        </div>

        <!-- Quick links in footer -->
        <div class="footer-links">
            <h4 style="color: #F9A825;">Quick Links</h4>
            <ul>
                <li><a href="#">Packages</a></li>
                <li><a href="#">Guides</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <!-- Contact info in footer -->
        <div class="footer-contact">
            <h4 style="color: #F9A825;">Contact Us</h4>
            <p>Email: support@serandib.lk</p>
            <p>Phone: +94 123 456 789</p>
            <p>Address: Colombo, Sri Lanka</p>

            <!-- Social media icons -->
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
            </div>
        </div>
    </div>

    <!-- Copyright -->
    <div class="footer-bottom">
        <p>&copy; 2025 Serandib. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
    