<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Serandib - Online Tour Guide</title>
    <link rel="stylesheet" type="text/css" href="css/pack12.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<jsp:include page="includes/homeNav.jsp"/>
<script>
    function toggleMenu() {
        const navLinks = document.querySelector('.nav-links');
        navLinks.classList.toggle('active');
    }
</script>

<!-- Tour Packages Section -->
<main>
    <h1 style="text-align:center; margin-top: 30px;">Explore Our Tour Packages</h1>
    <div class="package-container">
        <div class="package-card">
            <img src="image/beach.jpeg" alt="Beach Tour"/>
            <h3>Beach Paradise</h3>
            <p>Relax on serene beaches with our all-inclusive tropical package.</p>
            <a href="beach.jsp" class="explore-btn">Explore</a>
        </div>

        <div class="package-card">
            <img src="image/adv.jpg" alt="Mountain Tour"/>
            <h3> Adventure Activities</h3>
            <p>Experience breathtaking hikes and cozy cabins in the hills.</p>
            <a href="adventure.jsp" class="explore-btn">Explore</a>
        </div>

        <div class="package-card">
            <img src="image/his.jpg" alt="Culture Tour"/>
            <h3>Cultural Places</h3>
            <p>Discover heritage sites, local cuisine, and traditional festivals.</p>
            <a href="history.jsp" class="explore-btn">Explore</a>
        </div>

        <div class="package-card">
            <img src="image/nuw.jpg" alt="Safari Tour"/>
            <h3>Own Tour Package</h3>
            <p>Join guided safaris to see elephants, leopards, and more.</p>
            <a href="own.jsp" class="explore-btn">Explore</a>
        </div>
    </div>
</main>

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

    