<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("tourist")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Serandib - Online Tour Guide</title>

    <!-- External CSS files for header, body, and footer design -->
    <link rel="stylesheet" type="text/css" href="css/newHeader.css">
    <link rel="stylesheet" type="text/css" href="css/newHome.css">
    <link rel="stylesheet" type="text/css" href="css/newFooter.css">

    <!-- Font Awesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<jsp:include page="includes/homeNav.jsp"/>

<!--  Tour SECTION  -->
<section class="about-section">
    <div class="container">
        <div class="section-header">
            <h2 style="color: #00695C;">All Tour Packages</h2>
            <p>
                Serandib is your gateway to exploring the wonders of Sri Lanka — a paradise island rich in history,
                culture, and natural beauty.
                We connect travelers with trusted tour guides, breathtaking destinations, and unforgettable adventures.
            </p>
        </div>
        <div class="card-grid">

            <c:forEach var="tourPackage" items="${tourPackages}">
                <div class="about-card" style="text-align: center;">
                    <h3 style="color: #00695C;">${tourPackage.packageName}</h3>
                    <p>
                            ${tourPackage.description}
                    </p><br>
                    <p>
                        <strong>Price: </strong> $ ${tourPackage.price}
                    </p>
                    <p>
                        <strong>Duration: </strong> ${tourPackage.duration}
                    </p><br>
                    <p style="color: darkblue;">
                        <strong>Guide Name: </strong> ${tourPackage.guideName}
                    </p>
                    <p style="color: darkblue;">
                        <strong>Guide Email: </strong> ${tourPackage.guideEmail}
                    </p>
                    <p style="color: darkblue;">
                        <strong>Guide Mobile: </strong> ${tourPackage.guideMobile}
                    </p>
                    <p style="color: darkblue;">
                        <strong>Guide Country: </strong> ${tourPackage.guideCountry}
                    </p><br>

                    <a href="createBooking?tourPackageId=${tourPackage.tourPackageId}" class="btn hero-btn"><i class="fa-solid fa-calendar-plus"></i> Book Now</a>
                </div>
            </c:forEach>

        </div>
    </div>
</section>


<!-- Footer Section -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-about">
            <div class="footer-logo">
                <img src="images/footerLogo.png" alt="Serandib Logo">
                <h3 style="color: #F9A825;">Serandib</h3>
            </div>
            <p>Your trusted companion for exploring Sri Lanka. Discover hidden gems, book expert guides, and travel with
                confidence.</p>
        </div>

        <!-- Quick links in footer -->
        <div class="footer-links">
            <h4 style="color: #F9A825;">Quick Links</h4>
            <ul>
                <li><a href="tours">Packages</a></li>
                <li><a href="#">Guides</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="terms&condition.jsp">Terms and conditions</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
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


<!-- Toggle navigation for mobile -->
<script>
    function toggleMenu() {
        const navLinks = document.querySelector('.nav-links');
        navLinks.classList.toggle('active');
    }
</script>

<!-- Slideshow functionality -->
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.getElementsByClassName("slide");

        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }

        slides[slideIndex - 1].style.display = "block";

        setTimeout(showSlides, 5000); // Change image every 5 seconds
    }
</script>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>
