<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create Room</title>
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
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
            max-width: 600px;
            width: 100%;
            overflow: hidden;
        }
        .container h3 {
            text-align: center;
            margin: 0;
            background-color: #000;
            color: #fff;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            width: 100%;
            box-sizing: border-box;
        }
        .form-content {
            padding: 30px;
            max-height: 60vh; 
            overflow-y: auto;
            background-color: #f9f9f9;
            box-shadow: inset 0 4px 8px rgba(0, 0, 0, 0.05);
            border-radius: 0 0 10px 10px;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-control, .form-select {
            display: block;
            width: 100%;
            padding: 0.5rem 0.75rem;
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
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            padding: 0.5rem 1.75rem;
            font-size: 1.25rem;
            line-height: 1.5;
            border-radius: 0.3rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            border: 1px solid transparent;
            color: #fff;
            background-color: #28a745;
            cursor: pointer;
            width: 80%;
        }
        .btn:hover {
            background-color: #218838;
        }
        .btn-center {
            display: flex;
            justify-content: center;
            width: 100%;
            margin-bottom: 20px;
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
        .room-type {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .room-type h6 {
            margin-bottom: 10px;
            color: #333;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <main class="container">
        <h3>Create Room</h3>
        <div class="form-content">
            <form id="roomTypesForm" action="RoomController" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtRoomTypes" class="sr-only">Number of Room Types</label>
                    <input type="number" name="txtRoomTypes" id="txtRoomTypes" class="form-control" placeholder="Number of Room Types" required>
                </div>
                <div class="btn-center">
                    <button type="button" id="generateRoomTypesBtn" class="btn btn-primary">Generate Room Types</button>
                </div>
                <h5 class="mt-4">Room Types</h5>
                <div id="roomTypesContainer"></div>
                <div class="btn-center">
                    <input type="submit" name="btnCreate" class="btn btn-success" value="Save Room Types">
                </div>
            </form>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
