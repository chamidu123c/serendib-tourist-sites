<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("guide")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Guide Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background-color: #fff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            color: #f59e0b;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: #333;
            text-decoration: none;
            border-left: 4px solid transparent;
            transition: all 0.3s;
        }

        .sidebar a:hover {
            background-color: #fff7ed;
            border-left: 4px solid #f59e0b;
        }

        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* Top Bar */
        .topbar {
            background-color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .topbar .logout-btn {
            background-color: #f59e0b;
            border: none;
            padding: 10px 16px;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }

        .content {
            padding: 30px;
            overflow-y: auto;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card h3 {
            margin-bottom: 20px;
            color: #333;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .info-grid p {
            margin: 5px 0;
        }

        .btn {
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            margin-right: 10px;
        }

        .btn-update {
            background-color: #007bff;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-cancel {
            background-color: #dc3545;
            margin-top: 10px;
        }

        .btn-add {
            background-color: #28a745;
        }

        .booking-entry {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .dataTable {
            width: 100% !important;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">

    <jsp:include page="includes/guideSidebar.jsp"/>

    <!-- Main Content -->
    <div class="main">

        <!-- Top Bar -->
        <div class="topbar">
            <div>Welcome, <strong>${sessionScope.user.name}</strong></div>
            <a href="logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- Content Area -->
        <div class="content">

            <!-- Tour Packages List -->
            <div class="card">
                <h3><i class="fas fa-list"></i> Your Tour Packages</h3>
                <c:if test="${empty tourPackages}">
                    <p style="color: #888;">You have no tour packages yet.</p>
                </c:if>
                <c:if test="${not empty tourPackages}">
                    <table id="packagesTable" class="dataTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Package Name</th>
                            <th>Description</th>
                            <th>Duration</th>
                            <th>Status</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tourPackage" items="${tourPackages}">
                            <tr>
                                <td>${tourPackage.tourPackageId}</td>
                                <td>${tourPackage.packageName}</td>
                                <td>${tourPackage.description}</td>
                                <td>${tourPackage.duration} days</td>
                                <td>$ ${tourPackage.price}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${tourPackage.status == '0'}">
                                            <span class="badge badge-success">Pending</span>
                                        </c:when>
                                        <c:when test="${tourPackage.status == '1'}">
                                            <span class="badge badge-success">Approved</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="updateTourPackage?tourPackageId=${tourPackage.tourPackageId}"
                                       style="display:inline;">
                                        <button class="btn btn-update"><i class="fas fa-edit"></i> Edit</button>
                                    </a>
                                    <form action="deleteTourPackage" method="post" style="display:inline;">
                                        <input type="hidden" name="tourPackageId" value="${tourPackage.tourPackageId}"/>
                                        <button class="btn btn-delete"><i class="fas fa-trash"></i> Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>

            <!-- Add Tour Package Form -->
            <div class="card">
                <h3><i class="fas fa-plus-circle"></i> Add New Tour Package</h3>
                <form action="createTourPackage" method="post">
                    <div class="form-group">
                        <label for="packageName">Package Name</label>
                        <input type="text" id="packageName" name="packageName" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="duration">Duration (days)</label>
                        <input type="text" id="duration" name="duration" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Price (USD)</label>
                        <input type="number" id="price" name="price" step="0.01" min="0" required>
                    </div>
                    <button type="submit" class="btn btn-add"><i class="fas fa-save"></i> Add Package</button>
                </form>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#packagesTable').DataTable({
            "pageLength": 5,
            "lengthMenu": [5, 10, 25, 50],
            "order": [[0, "desc"]]
        });
    });
</script>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>