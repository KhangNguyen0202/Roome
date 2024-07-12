<!-- index.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Room Creation</title>
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
    </style>
</head>
<body>
    <%
        if (session.getAttribute("hostel_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <main class="my-5">
        <div class="container">
            <div id="wizard">
                <h3>
                    <div class="media">
                        <div class="bd-wizard-step-icon"><i class="mdi mdi-sofa"></i></div>
                        <div class="media-body">
                            <div class="bd-wizard-step-title">Rooms Details</div>
                            <div class="bd-wizard-step-subtitle">Step 2</div>
                        </div>
                    </div>
                </h3>
                <section>
                    <div class="content-wrapper">
                        <h4 class="section-heading">Enter your Rooms details</h4>
                        <form id="roomTypesForm" action="RoomController" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="txtRoomTypes" class="sr-only">Number of Room Types</label>
                                    <input type="number" name="txtRoomTypes" id="txtRoomTypes" class="form-control" placeholder="Number of Room Types">
                                </div>
                            </div>
                            <button type="button" id="generateRoomTypesBtn" class="btn btn-primary mt-3">Generate Room Types</button>
                            <h5 class="mt-4">Room Types</h5>
                            <div id="roomTypesContainer"></div>
                            <input type="submit" name="btnCreate" class="btn btn-success mt-3" value="Save Room Types">
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
    <script>
        $(document).ready(function() {
            $('#generateRoomTypesBtn').click(function() {
                var numberOfRoomTypes = $('#txtRoomTypes').val();
                var container = $('#roomTypesContainer');
                container.empty();

                for (var i = 0; i < numberOfRoomTypes; i++) {
                    container.append(
                        '<div class="room-type">' +
                        '<h6>Room Type ' + (i + 1) + '</h6>' +
                        '<div class="form-group">' +
                        '<label for="roomName' + i + '">Room Name</label>' +
                        '<input type="text" name="roomName' + i + '" id="roomName' + i + '" class="form-control" required>' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="roomSize' + i + '">Room Size</label>' +
                        '<input type="text" name="roomSize' + i + '" id="roomSize' + i + '" class="form-control" required>' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="roomPrice' + i + '">Room Price</label>' +
                        '<input type="number" name="roomPrice' + i + '" id="roomPrice' + i + '" class="form-control" required>' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="roomAvailability' + i + '">Rooms Available</label>' +
                        '<input type="number" name="roomAvailability' + i + '" id="roomAvailability' + i + '" class="form-control" required>' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="roomImage' + i + '">Room Image</label>' +
                        '<input type="file" name="roomImage' + i + '" id="roomImage' + i + '" class="form-control" required>' +
                        '</div>' +
                        '</div>'
                    );
                }
            });

            $('#roomTypesForm').submit(function(e) {
                console.log("Form is being submitted");
                var numberOfRoomTypes = $('#txtRoomTypes').val();
                console.log("Number of Room Types: " + numberOfRoomTypes);

                $('#roomTypesContainer .room-type').each(function(index) {
                    console.log("Room Name " + index + ": " + $(this).find('input[name="roomName' + index + '"]').val());
                    console.log("Room Size " + index + ": " + $(this).find('input[name="roomSize' + index + '"]').val());
                    console.log("Room Price " + index + ": " + $(this).find('input[name="roomPrice' + index + '"]').val());
                    console.log("Rooms Available " + index + ": " + $(this).find('input[name="roomAvailability' + index + '"]').val());
                });
            });
        });
    </script>
</body>
</html>
