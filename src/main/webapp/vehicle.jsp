<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Registration</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  

    <!-- Custom Style -->
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
       background: url('images/vehicle.jpg') no-repeat center center/cover;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}


        .register-container {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            backdrop-filter: blur(8px); /* Frosted glass effect */
    		-webkit-backdrop-filter: blur(8px);
        }

        .register-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #d4af37;
            color: white;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #f7dc6f;
        }

        .register-container p {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h3>Vehicle Registration</h3>
        <form action="VehicleRegisterServlet" method="post" >
            <div class="mb-3">
                <label class="form-label">Vehicle Name</label>
                <input type="text" id="vehicle_name" name="vehicle_name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Vehicle Type</label>
                <input type="text" id="vehicle_type" name="vehicle_type" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">License Number</label>
                <input type="text" id="license_number" name="license_number" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Contact Number</label>
                <input type="text" id="contact_number" name="contact_number" class="form-control" required>
            </div>
            <button type="submit" class="btn-custom">Register Vehicle</button>
        </form>
    </div>

</body>
</html>
