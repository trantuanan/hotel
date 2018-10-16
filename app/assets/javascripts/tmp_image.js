$(document).on("turbolinks:load", function() {
  $(function() {
    $('#user_picture').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        img.height = 300;
        img.width = 300;
        img.src = file.target.result;
        console.log(img);
        $('#target').html(img);
      }
      reader.readAsDataURL(image);
    });
  });
});

