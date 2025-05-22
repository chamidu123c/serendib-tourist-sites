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
<div class="left-image">
    <img src="image/historicle.jpeg" alt="Historical Place">
    <img src="image/his3.jpeg" alt="Historical Place">
    <img src="image/his4.jpeg" alt="Historical Place">
</div>


<div class="container">
    <h1>Historical Places Package</h1>

    <div class="section">
        <ul>
            <li>Anuradhapura</li>
            <li>Polonnaruwa</li>
            <li>Sigiriya</li>
            <li>Dambulla</li>
            <li>Kandy</li>
            <li>Galle Fort</li>
            <li>Yapahuwa</li>
            <li>Ritigala</li>
        </ul>
        <ol>
            <li>Heritage Hotel Anuradhapura</li>
            <li>Deer Park Hotel Polonnaruwa</li>
            <li>Sigiriya Village Hotel</li>
            <li>Pelwehera Village Resort</li>
            <li>Hotel Topaz Kandy</li>
            <li>Galle Fort Hotel</li>
            <li>Yapahuwa Paradise Hotel</li>
            <li>Ritigala Rest Lodge</li>
        </ol>
        <ul>
            <li>Car</li>
            <li>Van</li>
            <li>Bus</li>
        </ul>
    </div>


    <button class="book-btn" onclick="toggleForm()"><a class="nav-link active" href="addBooking.jsp">Book Now</a>
    </button>


    <script>
        function toggleForm() {
            const form = document.getElementById("bookingForm");
            form.style.display = form.style.display === "block" ? "none" : "block";
        }

        function submitBooking(event) {
            event.preventDefault();
            alert("Booking submitted successfully!");
            document.getElementById("bookingForm").style.display = "none";
        }
    </script>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-about">
                <div class="footer-logo">
                    <img src="image/logo.png" alt="Serandib Logo">
                    <h3 style="color: #F9A825;">Serandib</h3>
                </div>
                <p>Your trusted companion for exploring Sri Lanka. Discover hidden gems, book expert guides, and travel
                    with confidence.</p>
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

    