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
    <h1>Adventure Activities Package</h1>

    <div class="right-image">
        <img src="image/ad4.jpeg" alt="Historical Place">
        <img src="image/ad2.jpeg" alt="Historical Place">
        <img src="image/ad3.jpeg" alt="Historical Place">
    </div>

    <div class="section">
        <ul>
            <li>Ella(Hiking, Ziplining)🌄</li>
            <li>Knuckles Mountain Range (Trekking, Nature Hiking⛰️)</li>
            <li>Kitulgala (White Water Rafting)🌊</li>
            <li>Sigiriya (Rock Climbing, Historical Exploration)🪨</li>
            <li>Unawatuna / Galle (Snorkeling, Paragliding)🏖️</li>
            <li>Nilaveli / Pigeon Island (Snorkeling, Scuba Diving)🐠</li>
            <li>Bentota (Water Sports)🚤</li>
            <li>Yala National Park (Wildlife Safari)🐘</li>
        </ul>
        <ol>
            <li>98 Acres Resort & Spa</li>
            <li>Knuckles Forest Lodge</li>
            <li>Rafters Retreat</li>
            <li>Sigiriya Village Hotel</li>
            <li>Thaproban Beach House</li>
            <li>Anilana Nilaveli</li>
            <li>Avani Bentota Resort</li>
            <li>Jetwing Yala</li>
        </ol>
        <ul>
            <li>Car</li>
            <li>Van</li>
            <li>Bus</li>
            <li>Bike</li>
        </ul>
    </div>


    <button class="book-btn" onclick="toggleForm()">
        <a class="book-btn" href="addBooking.jsp">Book Now</a>
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
    