<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("tourist")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Form</title>
    <link rel="stylesheet" href="css/book.css">
</head>
<body>

<div id="bookingForm" class="booking-form">
    <h2>Booking Form</h2>
    <form action="updateBooking" method="post">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Package</label>
            <select class="form-select" id="tourPackageId" name="tourPackageId" required>
                <option value="" selected disabled>Select Package</option>
                <c:forEach var="tourPackage" items="${tourPackages}">
                    <option ${tourPackage.tourPackageId == booking.tourPackageId ? 'selected' : ''}
                            value="${tourPackage.tourPackageId}">${tourPackage.packageName} -
                        $ ${tourPackage.price}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
            <input value="${booking.bookingId}" type="hidden" name="bookingId"/>
            <input type="text" name="name"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="${booking.customerName}"/>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">No of Adults</label>
            <input type="number" name="noOfAdults"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="${booking.noOfAdults}"/>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
            <input type="date" name="startDate"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="${booking.startDate}"/>
        </div>

        <div class="mt-6">
            <label class="block text-sm font-medium text-gray-700 mb-1">Other Suggestions</label>
            <textarea rows="4" cols="80" name="otherSuggestions"
                      class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500">${booking.otherSuggestions}</textarea>
        </div>

        <div class="flex justify-end">
            <button type="submit" class="submit-btn">Update Booking</button>
        </div>

        <div class="flex justify-end">
            <a href="touristDashboard" style="text-align: center; background-color: gray" class="submit-btn">Back to Dashboard</a>
        </div>

    </form>
</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>
