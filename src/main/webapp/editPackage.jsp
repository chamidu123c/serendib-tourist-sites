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
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Tour Package</title>
  <link rel="icon" href="/images/logo.png" type="image/x-icon">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

  <div class="flex h-screen">

    <jsp:include page="includes/sidebar.jsp"/>

    <!-- Main content -->
    <div class="flex flex-col flex-1 overflow-hidden">

      <jsp:include page="includes/topNavbar.jsp"/>

      <!-- Content Area -->
      <main class="flex-1 p-6 overflow-auto bg-gray-50">
        <form class="max-w-3xl mx-auto bg-white p-8 rounded shadow">
          <h2 class="text-2xl font-semibold mb-6 text-gray-700">Update Tour Package</h2>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Package Name</label>
              <input type="text" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="Beach Paradise" />
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Price ($)</label>
              <input type="number" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="499" />
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Duration</label>
              <input type="text" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="5 Days" />
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Location</label>
              <input type="text" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" value="Maldives" />
            </div>
          </div>

          <div class="mt-6">
            <label class="block text-sm font-medium text-gray-700 mb-1">Package Description</label>
            <textarea rows="4" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500">Enjoy 5 nights on the beautiful beaches of Maldives with full resort access and guided tours.</textarea>
          </div>

          <div class="mt-6">
            <label class="block text-sm font-medium text-gray-700 mb-1">Change Image</label>
            <input type="file" class="w-full border px-3 py-2 rounded bg-white" />
          </div>

          <div class="mt-8 flex justify-between">
            <button type="button" class="px-6 py-2 text-white bg-gray-500 rounded hover:bg-gray-600 shadow">
              <i class="fas fa-arrow-left mr-2"></i> Cancel
            </button>
            <button type="submit" class="px-6 py-2 text-white bg-yellow-600 rounded hover:bg-yellow-700 shadow">
              <i class="fas fa-save mr-2"></i> Save Changes
            </button>
          </div>
        </form>
      </main>
    </div>
  </div>

</body>
</html>
