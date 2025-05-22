<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Top Hotels</title>
    <link rel="stylesheet" href="css/hotels.css"/>
    <link rel="stylesheet" type="text/css" href="css/newHeader.css">
</head>
<body>
<jsp:include page="includes/homeNav.jsp"/>

<section class="hotels-section">
    <h1>Hotels</h1>
    <div class="hotels-container">

        <c:forEach var="hotel" items="${hotels}">
            <div class="hotel-card">
                <img src="images/mandara.png" alt="Hotel 5"/>
                <div class="hotel-info">
                    <h2>${hotel.hotelName}</h2>
                    <p class="location">${hotel.location}</p>
                    <p class="price">From $${hotel.price}/night</p>
                    <h6>contact via - ${hotel.mobile}</h6>
                </div>
            </div>
        </c:forEach>


    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
