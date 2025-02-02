<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProvinceDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BootstrapDash Wizard</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bd-wizard.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .form-select-custom {
            height: calc(2.25rem + 17px);
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            width: 100%;
        }
        .form-select-custom:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn-next-custom {
            position: relative;
            float: right;
            margin-top: 20px; /* Adjust the top margin as needed */
        }
        .bd-wizard-step-num {
            display: none; /* Hides the step number */
        }
    </style>
</head>
<body>
    <%
        session.setAttribute("landlord_id", 1);
    %>
    <main class="my-5">
        <div class="container">
            <div id="wizard">
                <h3>
                    <div class="media">
                        <div class="bd-wizard-step-icon"><i class="mdi mdi-home-account"></i></div>
                        <div class="media-body">
                            <div class="bd-wizard-step-title">Hostel Details</div>
                            <div class="bd-wizard-step-subtitle">Step 1</div>
                        </div>
                    </div>
                </h3>
                <section>
                    <div class="content-wrapper">
                        <h4 class="section-heading">Enter your Hostel details</h4>
                        <form id="hostelForm" action="HostelController" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtHostelName" class="sr-only">Hostel Name</label>
                                    <input type="text" name="txtHostelName" id="txtHostelName" class="form-control" placeholder="Hostel Name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtProvince" class="sr-only">Province</label>
                                    <select class="form-select form-select-custom" name="txtProvince" id="txtProvince" required>
                                        <option value="" disabled selected>Address</option>
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
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtAddressDetail" class="sr-only">Address Detail</label>
                                    <input type="text" name="txtAddressDetail" id="txtAddressDetail" class="form-control" placeholder="Address Detail" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtPhoneNumber" class="sr-only">Phone Number</label>
                                    <input type="text" name="txtPhoneNumber" id="txtPhoneNumber" class="form-control" placeholder="Phone Number" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtDescription" class="sr-only">Description</label>
                                    <input type="text" name="txtDescription" id="txtDescription" class="form-control" placeholder="Description" required></textarea>
                                </div>
                            
                                <div class="form-group col-md-6">
                                    <label for="txtTotalRooms" class="sr-only">Total Rooms</label>
                                    <input type="number" name="txtTotalRooms" id="txtTotalRooms" class="form-control" placeholder="Total Rooms" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtPic">Product Picture</label>
                                <input type="file" class="form-control" id="txtPic" name="txtPic" required>
                            </div>
                            <button type="submit" name="btnNext" id="btnNext" class="btn btn-success btn-next-custom mt-3 mb-3">Next</button>
                        </form>
                    </div>
                </section>                
            </div>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.steps.min.js"></script>
    <script src="assets/js/bd-wizard.js"></script>
</body>
</html>
