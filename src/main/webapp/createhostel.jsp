<%-- 
    Document   : createhostel
    Created on : 09-07-2024, 14:45:33
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <input type="text" name="txtAddress" id="txtAddress" class="form-control" placeholder="Address">
              </div>
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
              <div id="roomImagesHostelContainer">
               
              </div>
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
            <div id="roomTypesContainer">
              <!-- Ph?n này s? ch?a các lo?i phòng do ng??i dùng thêm -->
            </div>
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
              <div id="roomImagesContainer">
               
              </div>
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
    document.addEventListener('DOMContentLoaded', function() {
      const roomTypesContainer = document.getElementById('roomTypesContainer');
      const roomImagesContainer = document.getElementById('roomImagesContainer');
      const addRoomTypeBtn = document.getElementById('addRoomTypeBtn');
      const totalRoomsInput = document.getElementById('txtTotalRooms');

      addRoomTypeBtn.addEventListener('click', function() {
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
              <input type="number" name="roomTypeCount${roomTypeIndex}" id="roomTypeCount${roomTypeIndex}" class="form-control room-count" placeholder="Number of Rooms">
            </div>
            <div class="form-group col-md-6">
              <label for="roomTypeAvailable${roomTypeIndex}" class="sr-only">Available Rooms</label>
              <input type="number" name="roomTypeAvailable${roomTypeIndex}" id="roomTypeAvailable${roomTypeIndex}" class="form-control room-available" placeholder="Available Rooms">
            </div>
          </div>
        `;
        roomTypesContainer.appendChild(roomTypeDiv);

       
        const roomImageDiv = document.createElement('div');
        roomImageDiv.classList.add('room-image', 'mb-3');
        roomImageDiv.innerHTML = `
          <h6>Room Type ${roomTypeIndex + 1} Image</h6>
          <div class="row">
            <div class="form-group">
              <input type="file" name="roomImage${roomTypeIndex}" id="roomImage${roomTypeIndex}" class="" accept="image/*">
              <img id="roomImagePreview${roomTypeIndex}" class="img-thumbnail mt-2" style="display: none;">
            </div>
          </div>
        `;
        roomImagesContainer.appendChild(roomImageDiv);

        
        roomTypeDiv.querySelector('.remove-room-type').addEventListener('click', function() {
          roomTypeDiv.remove();
          roomImageDiv.remove();
          updateRoomCounts();
        });

       
        roomTypeDiv.querySelector('.room-count').addEventListener('input', updateRoomCounts);
        roomTypeDiv.querySelector('.room-available').addEventListener('input', validateRoomAvailable);

        
        roomImageDiv.querySelector('.room-image-input').addEventListener('change', function() {
          previewImage(this, roomTypeIndex);
        });
      });

      function updateRoomCounts() {
        const roomCounts = roomTypesContainer.querySelectorAll('.room-count');
        let totalRoomCount = 0;
        roomCounts.forEach(count => {
          totalRoomCount += parseInt(count.value) || 0;
        });

        if (totalRoomCount > parseInt(totalRoomsInput.value)) {
          swal("Total Rooms Exceeded", "Total number of rooms exceeds the allowed total rooms.", "error");
        }
      }

      function validateRoomAvailable() {
        const roomTypeDiv = this.closest('.room-type');
        const roomCountInput = roomTypeDiv.querySelector('.room-count');
        const roomAvailableInput = this;

        if (parseInt(roomAvailableInput.value) > parseInt(roomCountInput.value)) {
          swal("Available Rooms Exceeded", "Number of available rooms exceeds the total number of rooms for this type.", "error");
        }
      }

      function previewImage(input, index) {
        const file = input.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function(e) {
            const preview = document.getElementById(`roomImagePreview${index}`);
            preview.src = e.target.result;
            preview.style.display = 'block';
          }
          reader.readAsDataURL(file);
        }
      }

      totalRoomsInput.addEventListener('input', updateRoomCounts);
    });

    function submitForm() {
      swal("Form Submitted", "Your form has been submitted successfully.", "success");
    }
  </script>
</body>
</html>

