<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProvinceDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create Hostel</title>
    <link href="https://fonts.googleapis.com/css2?family=Karla:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Karla', sans-serif;
            background: #003580;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            overflow: hidden;
        }
        .container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            padding: 0;
            max-width: 600px;
            width: 100%;
            overflow: hidden;
        }
        .container h3 {
            text-align: center;
            margin: 0;
            background-color: #212529;
            color: white;
            padding: 20px;
            border-radius: 15px 15px 0 0;
            width: 100%;
            box-sizing: border-box;
        }
        .form-content {
            padding: 30px;
            max-height: calc(100vh - 60px); /* Adjust for header height */
            overflow-y: auto;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-control, .form-select {
            border-radius: 0.25rem;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: none;
            border-color: #003580;
        }
        .btn {
            display: block;
            width: 100%;
            background-color: #003580;
            border-color: #003580;
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            transition: background-color 0.2s ease;
        }
        .btn:hover {
            background-color: #002c6d;
            border-color: #002c6d;
        }
    </style>
</head>
<body>
    <main class="container">
        <h3>Create Hostel</h3>
        <div class="form-content">
            <form id="hostelForm" action="HostelController" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtHostelName" class="form-label">Hostel Name</label>
                    <input type="text" name="txtHostelName" id="txtHostelName" class="form-control" placeholder="Hostel Name" required>
                </div>
                <div class="form-group">
                    <label for="txtProvince" class="form-label">Province</label>
                    <select class="form-select" name="txtProvince" id="txtProvince" required>
                        <option value="" disabled selected>Select Province</option>
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
                    <label for="txtAddressDetail" class="form-label">Address Detail</label>
                    <input type="text" name="txtAddressDetail" id="txtAddressDetail" class="form-control" placeholder="Address Detail" required>
                </div>
                <div class="form-group">
                    <label for="txtPhoneNumber" class="form-label">Phone Number</label>
                    <input type="text" name="txtPhoneNumber" id="txtPhoneNumber" class="form-control" placeholder="Phone Number" required>
                </div>
                <div class="form-group">
                    <label for="txtDescription" class="form-label">Description</label>
                    <textarea name="txtDescription" id="txtDescription" class="form-control" placeholder="Description" required></textarea>
                </div>
                <div class="form-group">
                    <label for="txtTotalRooms" class="form-label">Total Rooms</label>
                    <input type="number" name="txtTotalRooms" id="txtTotalRooms" class="form-control" placeholder="Total Rooms" required>
                </div>
                <div class="form-group">
                    <label for="txtPic" class="form-label">Product Picture</label>
                    <input type="file" class="form-control" id="txtPic" name="txtPic" required>
                </div>
                <button type="submit" name="btnNext" id="btnNext" class="btn">Create Hostel</button>
            </form>
        </div>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
