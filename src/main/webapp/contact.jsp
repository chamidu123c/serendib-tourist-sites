<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us</title>
  <jsp:include page="header.jsp" />
  <link rel="stylesheet" href="css/contact.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  
  <style>body {
  font-family: 'Poppins', sans-serif;
  background-color: #f4f4f4;
  color: #333;
  margin: 0;
}

.contact-section {
  padding: 60px 20px;
  max-width: 800px;
  margin: auto;
  text-align: center;
}

.contact-header h1 {
  color: #0077b6;
  font-size: 2.5rem;
  margin-bottom: 10px;
}

.contact-header p {
  font-size: 1.1rem;
  margin-bottom: 30px;
  color: #555;
}

.contact-info-box {
  background-color: #fff;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  text-align: left;
}

.contact-info-box h2,
.contact-info-box h3 {
  color: #0077b6;
  margin-top: 20px;
  margin-bottom: 10px;
}

.contact-info-box a {
  color: #0077b6;
  text-decoration: none;
}

.map-container {
  margin-top: 25px;
}

.map-container iframe {
  width: 100%;
  height: 250px;
  border: none;
  border-radius: 10px;
}

/* Responsive */
@media (max-width: 600px) {
  .contact-header h1 {
    font-size: 2rem;
  }

  .contact-info-box {
    padding: 20px;
  }
}
  </style>
</head>
<body>

  <section class="contact-section">
    <div class="contact-header">
      <h1>📞 Contact Us</h1>
      <p>We’d love to hear from you. Reach out using the details below.</p>
    </div>

    <div class="contact-info-box">
      <h2>📍 Our Office</h2>
      <p><strong>Serendib Travels</strong></p>
      <p>123 Beachside Road,<br> Colombo, Sri Lanka</p>

      <h3>📧 Email</h3>
      <p><a href="mailto:info@serendibtravels.com">support@serandib.lk</a></p>

      <h3>📱 Phone</h3>
      <p>+94 123 456 789</p>

      <div class="map-container">
        <iframe src="https://maps.google.com/maps?q=Colombo,%20Sri%20Lanka&t=&z=13&ie=UTF8&iwloc=&output=embed"
          frameborder="0" allowfullscreen></iframe>
      </div>
    </div>
  </section>

  <jsp:include page="footer.jsp" />
</body>
</html>
