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
    </head>
    <body>
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
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtHostelName" class="sr-only">Hostel Name</label>
                                    <input type="text" name="txtHostelName" id="txtHostelName" class="form-control" placeholder="Hostel Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtAddress" class="sr-only">Address</label>
                                    <select class="form-control" name="txtProvince" required>
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
                                <script>
                                    document.getElementById('txtProvince').addEventListener('change', function () {
                                        document.getElementById('txtHostelName').value = this.options[this.selectedIndex].text;
                                    });
                                </script> 
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="phoneNumber" class="sr-only">Phone Number</label>
                                    <input type="text" name="phoneNumber" id="txtPhoneNumber" class="form-control" placeholder="Phone Number">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtDescription" class="sr-only">Description</label>
                                    <input type="text" name="txtDescription" id="txtDescription" class="form-control" placeholder="Description">
                                </div>
                            </div>
                            <form action="HostelController" method="post" enctype="multipart/form-data">
                                <div id="roomImagesHostelContainer"></div>
                                <div class="form-group">
                                    <label for="txtPic">Product Picture</label>
                                    <input type="file" class="form-control" id="txtPic" name="txtPic" required>
                                </div>
                                <button type="submit" class="btn btn-success mt-3">Upload Images</button>
                            </form>
                        </div>
                    </section>
                    <h3>
                        <div class="media">
                            <div class="bd-wizard-step-icon"><i class="mdi mdi-bank"></i></div>
                            <div class="media-body">
                                <div class="bd-wizard-step-title">Rooms Details</div>
                                <div class="bd-wizard-step-subtitle">Step 2</div>
                            </div>
                        </div>
                    </h3>
                    <section>
                        <div class="content-wrapper">
                            <h4 class="section-heading">Enter your Rooms details</h4>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtTotalRooms" class="sr-only">Total Rooms</label>
                                    <input type="number" name="txtTotalRooms" id="txtTotalRooms" class="form-control" placeholder="Total Rooms">
                                </div>
                            </div>
                            <h5 class="mt-4">Room Types</h5>
                            <div id="roomTypesContainer"></div>
                            <button type="button" id="addRoomTypeBtn" class="btn btn-primary mt-3">Add Room Type</button>
                        </div>
                    </section>
                    <h3>
                        <div class="media">
                            <div class="bd-wizard-step-icon"><i class="mdi mdi-camera"></i></div>
                            <div class="media-body">
                                <div class="bd-wizard-step-title">Upload Room Images</div>
                                <div class="bd-wizard-step-subtitle">Step 3</div>
                            </div>
                        </div>
                    </h3>
                    <section>
                        <div class="content-wrapper">
                            <h4 class="section-heading">Upload images for each room type</h4>
                            <form id="uploadForm" action="RoomController" method="post" enctype="multipart/form-data">
                                <div id="roomImagesContainer"></div>
                                <button type="submit" class="btn btn-success mt-3">Upload Images</button>
                            </form>
                        </div>
                    </section>
                    <h3>
                        <div class="media">
                            <div class="bd-wizard-step-icon"><i class="mdi mdi-account-check-outline"></i></div>
                            <div class="media-body">
                                <div class="bd-wizard-step-title">Review</div>
                                <div class="bd-wizard-step-subtitle">Step 4</div>
                            </div>
                        </div>
                    </h3>
                    <section>
                        <div class="content-wrapper">
                            <h4 class="section-heading mb-5">Review your Details</h4>
                            <h6 class="font-weight-bold">Hostel Details</h6>
                            <p class="mb-4">
                                Hostel Name: <span id="entered"></span><br>
                                Address: <span id="enteredAddress"></span><br>
                                Phone: <span id="enteredPhoneNumber"></span><br>
                                Description: <span id="enteredDescription"></span>
                            </p>
                            <h6 class="font-weight-bold">Rooms Details</h6>
                            <p class="mb-0">
                                Total Rooms: <span id="enteredTotalRooms"></span><br>
                                <span id="roomTypesReview"></span>
                            </p>
                            <h6 class="font-weight-bold">Room Images</h6>
                            <div id="roomImagesReview"></div>
                            <button type="button" name="btnFinishCreate" class="btn btn-success" onclick="submitForm()">Finish</button>
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
        <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    const roomTypesContainer = document.getElementById('roomTypesContainer');
                                    const roomImagesContainer = document.getElementById('roomImagesContainer');
                                    const addRoomTypeBtn = document.getElementById('addRoomTypeBtn');
                                    const totalRoomsInput = document.getElementById('txtTotalRooms');

                                    addRoomTypeBtn.addEventListener('click', function () {
                                        const roomTypeIndex = roomTypesContainer.children.length;

                                        const roomTypeDiv = document.createElement('div');
                                        roomTypeDiv.classList.add('room-type', 'mb-3');
                                        roomTypeDiv.innerHTML = `
                        <h6>Room Type ${roomTypeIndex + 1}</h6>
                        <button type="button" class="btn btn-danger btn-sm remove-room-type">Remove</button>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="roomTypeName${roomTypeIndex}" class="sr-only">Room Type Name</label>
                                <input type="text" name="roomTypeName${roomTypeIndex}" id="roomTypeName${roomTypeIndex}" class="form-control" placeholder="Room Type Name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="roomTypeCount${roomTypeIndex}" class="sr-only">Number of Rooms</label>
                                <input type="number" name="roomTypeCount${roomTypeIndex}" id="roomTypeCount${roomTypeIndex}" class="form-control" placeholder="Number of Rooms">
                            </div>
                        </div>
                    `;

                                        roomTypesContainer.appendChild(roomTypeDiv);

                                        const removeRoomTypeBtn = roomTypeDiv.querySelector('.remove-room-type');
                                        removeRoomTypeBtn.addEventListener('click', function () {
                                            roomTypesContainer.removeChild(roomTypeDiv);
                                            updateRoomTypeIndexes();
                                        });
                                    });

                                    function updateRoomTypeIndexes() {
                                        Array.from(roomTypesContainer.children).forEach((roomTypeDiv, index) => {
                                            roomTypeDiv.querySelector('h6').textContent = `Room Type ${index + 1}`;
                                            roomTypeDiv.querySelector('input[name^="roomTypeName"]').setAttribute('name', `roomTypeName${index}`);
                                            roomTypeDiv.querySelector('input[name^="roomTypeCount"]').setAttribute('name', `roomTypeCount${index}`);
                                        });
                                    }

                                    const hostelDetailsForm = document.querySelector('#wizard section:nth-of-type(1)');
                                    hostelDetailsForm.addEventListener('submit', function (event) {
                                        event.preventDefault();
                                        const enteredHostelName = document.getElementById('txtHostelName').value;
                                        const enteredAddress = document.getElementById('cboCat').selectedOptions[0].textContent;
                                        const enteredPhoneNumber = document.getElementById('txtPhoneNumber').value;
                                        const enteredDescription = document.getElementById('txtDescription').value;

                                        document.getElementById('entered').textContent = enteredHostelName;
                                        document.getElementById('enteredAddress').textContent = enteredAddress;
                                        document.getElementById('enteredPhoneNumber').textContent = enteredPhoneNumber;
                                        document.getElementById('enteredDescription').textContent = enteredDescription;
                                    });

                                    totalRoomsInput.addEventListener('change', function () {
                                        document.getElementById('enteredTotalRooms').textContent = totalRoomsInput.value;
                                    });
                                });

                                function submitForm() {
                                    swal({
                                        title: "Form Submitted",
                                        text: "Your form has been submitted successfully!",
                                        icon: "success",
                                        button: "OK",
                                    });
                                }
        </script>
    </body>
</html>
