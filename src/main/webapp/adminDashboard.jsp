<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if (!session.getAttribute("role").equals("admin")) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard</title>
    <link rel="icon" href="/images/logo.png" type="image/x-icon">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body class="bg-gray-100">
<div class="body">
    <div class="flex h-screen">

        <jsp:include page="includes/sidebar.jsp"/>

        <!-- Main content -->
        <div class="flex flex-col flex-1 overflow-hidden">

            <jsp:include page="includes/topNavbar.jsp"/>

            <!-- Content Area -->
            <main class="flex-1 p-6 overflow-auto">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-xl font-semibold text-gray-700">All Users</h2>
                    <a href="createUser">
                        <button class="px-4 py-2 text-white bg-yellow-600 rounded hover:bg-yellow-700">
                            <i class="fas fa-plus mr-2"></i>Add a User
                        </button>
                    </a>
                </div>

                <!-- Table -->
                <div class="overflow-x-auto bg-white rounded shadow">
                    <table class="min-w-full text-left text-sm text-gray-700">
                        <thead class="bg-gray-100">
                        <tr>
                            <th class="px-6 py-3 font-medium">User Id</th>
                            <th class="px-6 py-3 font-medium">Name</th>
                            <th class="px-6 py-3 font-medium">Email</th>
                            <th class="px-6 py-3 font-medium">Mobile</th>
                            <th class="px-6 py-3 font-medium text-center">Role</th>
                            <th class="px-6 py-3 font-medium text-center">Country</th>
                            <th class="px-6 py-3 font-medium text-left">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr class="border-b hover:bg-gray-50">
                                <td class="px-6 py-4">${user.userId}</td>
                                <td class="px-6 py-4">${user.name}</td>
                                <td class="px-6 py-4">${user.email}</td>
                                <td class="px-6 py-4">${user.mobile}</td>
                                <td class="px-6 py-4">
                                    <c:choose>
                                        <c:when test="${user.role == '1'}">
                                            <span class="badge badge-success">Tourist</span>
                                        </c:when>
                                        <c:when test="${user.role == '2'}">
                                            <span class="badge badge-success">Guide</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="px-6 py-4">${user.country}</td>
                                <td class="px-6 py-4 text-center">
                                    <c:choose>
                                        <c:when test="${user.role != '0'}">
                                            <a href="editProfile?userId=${user.userId}">
                                                <button class="px-10 py-3.5 text-white bg-yellow-600 rounded hover:bg-yellow-600"
                                                        title="Edit">
                                                    <i class="fas fa-edit"></i>Edit
                                                </button>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</div>

<jsp:include page="includes/alert.jsp"/>
</body>
</html>
