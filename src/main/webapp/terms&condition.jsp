<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Terms & Conditions</title>
    <link rel="stylesheet" href="css/t&c.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
    
			 .page-title {
			    text-align: center;
			    background-color: #f0f8ff;
			    padding: 1rem 0;
			    margin-bottom: 1rem;
			}

			    		
			.main-container {
			    max-width: 800px;
			    margin: 2rem auto;
			    padding: 1rem;
			    font-family: Arial, sans-serif;
			    background-color: #f9f9f9;
			}
			
			/* Card styling */
			.card {
			    background-color: #fff;
			    border: 1px solid #ddd;
			    border-radius: 12px;
			    padding: 1.5rem;
			    margin-bottom: 1.5rem;
			    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
			}
			
			/* Headings */
			.card h2 {
			    font-size: 1.25rem;
			    margin-bottom: 0.75rem;
			    color: #333;
			}
			
			/* Paragraphs and lists */
			.card p,
			.card ul {
			    font-size: 1rem;
			    color: #555;
			    line-height: 1.6;
			}
			
			/* List items */
			.card ul {
			    padding-left: 1.2rem;
			    list-style-type: disc;
			}
			
			.card ul li {
			    margin-bottom: 0.5rem;
			}
			
			/* Special styling for contact card (optional) */
			.contact-card {
			    background-color: #e9f5ff;
			    border-color: #b3dfff;
			}
    </style>
</head>
<body>

<div class="page-title">
    <h1>Our Terms & Conditions</h1>
</div>


<main class="main-container">
    <section class="card">
        <h2>1. 🧭 Use of the Website</h2>
        <ul>
            <li>Users must be 18+ to access our services.</li>
            <li>Only lawful use is permitted.</li>
            <li>No tampering with site functionality.</li>
        </ul>
    </section>

    <section class="card">
        <h2>2. 💳 Booking and Payment</h2>
        <ul>
            <li>Subject to availability.</li>
            <li>Full payment due upon booking.</li>
            <li>We reserve cancellation rights in exceptional cases.</li>
        </ul>
    </section>

    <section class="card">
        <h2>3. 💸 Cancellations and Refunds</h2>
        <ul>
            <li>Full refund for cancellations 7+ days in advance.</li>
            <li>No refund for last-minute or no-shows.</li>
            <li>Read tour-specific cancellation policies.</li>
        </ul>
    </section>

    <section class="card">
        <h2>4. 🙋 User Responsibilities</h2>
        <ul>
            <li>Provide accurate information.</li>
            <li>Comply with local laws.</li>
            <li>Follow guide safety instructions.</li>
        </ul>
    </section>

    <section class="card">
        <h2>5. ⚠️ Limitation of Liability</h2>
        <ul>
            <li>We are not liable for injuries or damages during tours.</li>
            <li>Participation is at your own risk.</li>
        </ul>
    </section>

    <section class="card">
        <h2>6. 🌐 Third-Party Services</h2>
        <p>We may collaborate with third-party tour providers. We are not responsible for their performance.</p>
    </section>

    <section class="card">
        <h2>7. 🖋️ Intellectual Property</h2>
        <p>All website content is owned/licensed by us. Unauthorized use is prohibited.</p>
    </section>

    <section class="card">
        <h2>8. 🔄 Changes to Terms</h2>
        <p>We may revise these terms at any time. Continued use implies acceptance.</p>
    </section>

    <section class="card contact-card">
        <h2>9. 📬 Contact Us</h2>
        <p>If you have questions, contact us at:</p>
        <ul>
            <li>Email: support@serandib.lk</li>
            <li>Phone: +94 123 456 789</li>
        </ul>
    </section>
</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
    