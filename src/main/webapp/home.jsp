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

<!-- HERO/SLIDER SECTION -->
<section class="hero">
    <div class="slider">
        <!-- Slide 1 -->
        <div class="slide fade">
            <img src="images/beach.jpg" alt="Adventure Awaits"/>
            <div class="text-content">
                <h1>Discover Sri Lanka</h1>
                <p>Uncover the beauty of Serandib with expert guides.</p>
                <a href="#" class="btn hero-btn">Explore Now</a>
            </div>
        </div>
        <!-- Slide 2 -->
        <div class="slide fade">
            <img src="images/sigiriya.jpeg" alt="Nature at Its Best"/>
            <div class="text-content">
                <h1>Plan Your Dream Trip</h1>
                <p>Explore tropical beaches and rich heritage sites.</p>
                <a href="#" class="btn hero-btn">Book a Tour</a>
            </div>
        </div>
        <!-- Slide 3 -->
        <div class="slide fade">
            <img src="images/adventure.jpg" alt="Serandib Experience"/>
            <div class="text-content">
                <h1>Adventure Awaits</h1>
                <p>Find your perfect tour guide and start your journey.</p>
                <a href="#" class="btn hero-btn">Learn More</a>
            </div>
        </div>
    </div>
</section>

<!--  ABOUT SECTION  -->
<section class="about-section">
    <div class="container">
        <div class="section-header">
            <h2 style="color: #00695C;">About Serandib</h2>
            <p>
                Serandib is your gateway to exploring the wonders of Sri Lanka — a paradise island rich in history,
                culture, and natural beauty.
                We connect travelers with trusted tour guides, breathtaking destinations, and unforgettable adventures.
            </p>
        </div>
        <div class="card-grid">
            <!-- Card 1 -->
            <div class="about-card">
                <img src="images/masks.jpeg" alt="Culture">
                <h3 style="color: #00695C;">Rich Heritage</h3>
                <p>
                    From ancient kingdoms to sacred temples, Sri Lanka’s history lives in every corner. Discover stories
                    carved in stone.
                </p>
            </div>

            <!-- Card 2 -->
            <div class="about-card">
                <img src="images/landscape.jpg" alt="Nature">
                <h3 style="color: #00695C;">Breathtaking Landscapes</h3>
                <p>
                    Serandib showcases tropical beaches, misty mountains, and lush rainforests – a haven for every
                    nature lover.
                </p>
            </div>

            <!-- Card 3 -->
            <div class="about-card">
                <img src="images/guide.jpg" alt="Guides">
                <h3 style="color: #00695C;">Trusted Guides</h3>
                <p>
                    Plan your trip with experienced local guides who ensure a safe, enriching, and personalized journey
                    across the island.
                </p>
            </div>
        </div>
    </div>
</section>

<!--  WHY CHOOSE US SECTION  -->
<section class="why-section">
    <div class="container">
        <div class="section-header">
            <h2 style="color: #00695C;">Why Choose Serandib?</h2>
            <p>
                We make your travel dreams come true with trusted experiences, seamless service, and expert support.
            </p>
        </div>

        <div class="feature-grid">
            <!-- Feature 1 -->
            <div class="feature-card">
                <div class="icon"><i class="fas fa-user-check" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">Verified Guides</h3>
                <p>All our guides are experienced, licensed, and reviewed by fellow travelers.</p>
            </div>

            <!-- Feature 2 -->
            <div class="feature-card">
                <div class="icon"><i class="fas fa-calendar-check" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">Easy Booking</h3>
                <p>Plan your trip in just a few clicks with real-time availability and instant confirmation.</p>
            </div>

            <!-- Feature 3 -->
            <div class="feature-card">
                <div class="icon"><i class="fas fa-lock" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">Secure Payments</h3>
                <p>Enjoy peace of mind with reliable and encrypted payment gateways.</p>
            </div>

            <!-- Feature 4 -->
            <div class="feature-card">
                <div class="icon"><i class="fas fa-headset" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">24/7 Support</h3>
                <p>Our team is here anytime you need help – before, during, or after your trip.</p>
            </div>
        </div>
    </div>
</section>

<!--  HOW IT WORKS SECTION  -->
<section class="how-it-works-section">
    <div class="container">
        <div class="section-header">
            <h2 style="color: #00695C;">How It Works</h2>
            <p>
                Planning your journey with Serandib is easy and stress-free. Just follow these simple steps!
            </p>
        </div>

        <div class="steps-grid">
            <!-- Step 1 -->
            <div class="step-card">
                <div class="icon"><i class="fas fa-user-plus" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">1. Sign Up</h3>
                <p>Create your free account to get started with personalized experiences.</p>
            </div>

            <!-- Step 2 -->
            <div class="step-card">
                <div class="icon"><i class="fas fa-map-marker-alt" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">2. Choose Destination</h3>
                <p>Browse our list of stunning locations across Sri Lanka.</p>
            </div>

            <!-- Step 3 -->
            <div class="step-card">
                <div class="icon"><i class="fas fa-user-tie" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">3. Book a Guide</h3>
                <p>Pick from experienced guides to match your travel style and needs.</p>
            </div>

            <!-- Step 4 -->
            <div class="step-card">
                <div class="icon"><i class="fas fa-suitcase-rolling" style="color: #F9A825;"></i></div>
                <h3 style="color: #00695C;">4. Enjoy Your Trip</h3>
                <p>Experience unforgettable moments with expert guidance and local insight.</p>
            </div>
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

<!-- JAVASCRIPT  -->

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
</body>
</html>
