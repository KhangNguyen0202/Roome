<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProvinceDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create Hostel</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Karla', sans-serif;
            background: #003580;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 0;
            max-width: 600px;
            width: 100%;
            overflow: hidden;
        }
        .container h3 {
            text-align: center;
            margin: 0;
            background-color: black;
            color: white;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            width: 100%;
            box-sizing: border-box;
        }
        .form-content {
            padding: 30px;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-control, .form-select {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .form-select:focus, .form-control:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            border: 1px solid transparent;
            color: #fff;
            background-color: #28a745;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
        .custom-control {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .custom-control-input {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }
        .custom-control-label {
            margin-left: 1.25rem;
            cursor: pointer;
        }
        .custom-control-input:checked ~ .custom-control-label::before {
            background-color: #28a745;
            border-color: #28a745;
        }
        .custom-control-label::before {
            position: absolute;
            top: 0.25rem;
            left: 0;
            display: block;
            width: 1rem;
            height: 1rem;
            content: "";
            background-color: #fff;
            border: 1px solid #adb5bd;
            border-radius: 50%;
            transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
        }
    </style>
</head>
<body>
    <main class="container">
        <h3>Create Hostel</h3>
        <div class="form-content">
            <form id="hostelForm" action="HostelController" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtHostelName" class="sr-only">Hostel Name</label>
                    <input type="text" name="txtHostelName" id="txtHostelName" class="form-control" placeholder="Hostel Name" required>
                </div>
                <div class="form-group">
                    <label for="txtProvince" class="sr-only">Province</label>
                    <select class="form-select" name="txtProvince" id="txtProvince" required>
                        <option value="" disabled selected>Province</option>
                        <%
                            ProvinceDAO dao = new ProvinceDAO();
                            ResultSet rs = dao.getAllProvince();
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("Province_ID")%>"><%= rs.getString("Province_Name")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtAddressDetail" class="sr-only">Address Detail</label>
                    <input type="text" name="txtAddressDetail" id="txtAddressDetail" class="form-control" placeholder="Address Detail" required>
                </div>
                <div class="form-group">
                    <label for="txtPhoneNumber" class="sr-only">Phone Number</label>
                    <input type="text" name="txtPhoneNumber" id="txtPhoneNumber" class="form-control" placeholder="Phone Number" required>
                </div>
                <div class="form-group">
                    <label for="txtDescription" class="sr-only">Description</label>
                    <input type="text" name="txtDescription" id="txtDescription" class="form-control" placeholder="Description" required>
                </div>
                <div class="form-group">
                    <label for="txtTotalRooms" class="sr-only">Total Rooms</label>
                    <input type="number" name="txtTotalRooms" id="txtTotalRooms" class="form-control" placeholder="Total Rooms" required>
                </div>
                <div class="form-group">
                    <label for="txtPic">Product Picture</label>
                    <input type="file" class="form-control" id="txtPic" name="txtPic" required>
                </div>
                <button type="submit" name="btnNext" id="btnNext" class="btn btn-block">Create Hostel</button>
            </form>
        </div>
    </main>
</body>
</html>
