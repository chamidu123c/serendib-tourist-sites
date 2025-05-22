<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Tourist Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e8f5e9;
            padding: 50px;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
        	color: red;
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Delete Account</h2>
    <form action="delete" method="post">
        <input type="text" name="id" value="${param.id}" readonly>
        
        <label>First Name:</label>
       	<input type="text" name="firstName" value="${param.firstName}"readonly>
	    
	    <label>Last Name:</label>
		<input type="text" name="lastName" value=" ${param.lastName}"readonly>

        <label>Email:</label>
        <input type="text" name="email" value="${param.email}" readonly>

        <label>Contact No:</label>
        <input type="text" name="contact" value="${param.contact}" readonly>

        <label>Country:</label>
        <input type="text" name="country" value="${param.country}" readonly>

        <label>UserName:</label>
        <input type="text" name="username" value="${param.username}" readonly>
       
        <button type="submit" name = "submit">Delete My Account</button>
    </form>
</div>
</body>
</html>