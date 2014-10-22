$(document).ready(function() {

  $('.acceptance-btn').on("click", function(event){
    $(this).hide();
    event.preventDefault();

    var lunchId = document.querySelector('.lunch-id');

    $.ajax ({
      type: "post",
      url: "/meal/" + lunchId.dataset.lunch,
      console.log(lunchId.dataset.lunch)
      data: $(this).serialize,
      dataType: "jquery"
    }).done(function(response){
      console.log(response)
    })
  })

});
