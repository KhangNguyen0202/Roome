$(document).ready(function(){
    $("#wizard").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true,
        onInit: function (event, currentIndex) {
            // Hide the finish button
            $(".actions a[href='#finish']").hide();
        }
    });

    $("#btnNext").on("click", function(){
        submitForm();
    });
});

function submitForm() {
    var form = $('#hostelForm')[0];
    var data = new FormData(form);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "HostelController",
        data: data,
        processData: false, // prevent jQuery from converting the data
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (response) {
            // Move to the next step in the wizard
            $("#wizard").steps("next");
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("An error occurred while submitting the form.");
        }
    });
}
