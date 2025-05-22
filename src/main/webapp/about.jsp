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
<script>
    function toggleMenu() {
        const navLinks = document.querySelector('.nav-links');
        navLinks.classList.toggle('active');
    }
</script>
<div class="container">
    <h1>About Us</h1>
    <p>Welcome to <strong>Serendib</strong>, your ultimate travel companion for exploring breathtaking destinations with
        ease and convenience. Our platform is designed to provide seamless and personalized travel experiences, ensuring
        that every journey is memorable and stress-free.</p>

    <h2>Who We Are</h2>
    <ul>
        <li>We are a passionate team of travel enthusiasts.</li>
        <li>We connect tourists with top-quality tour packages and services.</li>
        <li>We provide reliable tour guides, accommodations, and transport.</li>
        <li>We are committed to excellence in travel experiences.</li>
    </ul>

    <div class="flex-container">
        <div class="flex-box">
            <img src="images/vision.jpeg">
            <h2>Our Vision</h2>
            <p>To be the leading online tour guide platform that transforms travel experiences by providing innovative,
                reliable, and customer-focused solutions that connect travelers to the best destinations with ease and
                efficiency.</p>
        </div>
        <div class="flex-box">
            <img src="images/mis.jpeg">
            <h2>Our Mission</h2>
            <p>At <strong>Serendip</strong>, our mission is to make travel planning simple and enjoyable. We aim to
                bridge the gap between tourists and high-quality travel services, ensuring that every trip is a
                delightful and enriching experience.</p>
        </div>
    </div>

    <h2>What We Offer</h2>
    <ul>
        <li><strong>Diverse Tour Packages:</strong> Choose from four exclusive packages tailored to suit different
            travel preferences. Three packages include a professional guide, accommodations, and a vehicle, while one
            package provides a vehicle-only option for independent travelers.
        </li>
        <li><strong>Easy Booking Process:</strong> Our user-friendly system allows you to log in, browse available
            packages, and book your preferred tour hassle-free.
        </li>
        <li><strong>Efficient Management:</strong> Our travel agency efficiently manages tour guides, hotels, and
            vehicles to ensure a smooth and enjoyable experience.
        </li>
        <li><strong>Dedicated Support:</strong> Our team is always available to assist you with inquiries, bookings, and
            any travel-related concerns.
        </li>
    </ul>

    <h2>Get in Touch</h2>
    <p>We’d love to hear from you! If you have any questions or need assistance, feel free to reach out to us through
        our contact page. Start your adventure with us today!</p>

    <p><em>Experience the world effortlessly with Serendip!</em></p>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
