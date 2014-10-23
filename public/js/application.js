$(document).ready(function() {

  $('.acceptance-btn1').on("click", function(event){
    $(this).hide();
    $('p').css('background-color', 'green')

    var lunchId = document.querySelector('.lunch-id');

    $.ajax ({
      type: "post",
      url: "/meal/:id",// + lunchId.dataset.lunch,
      data: $(this).serialize(),
      dataType: "json"
    }).done(function(response){
      console.log(response)
    })
  })


  $('.acceptance-btn2').on("click", function(event){
    $(this).hide();
    $('h5').css('background-color', 'green')

    var lunchId = document.querySelector('.lunch-id');

    $.ajax ({
      type: "post",
      url: "/meal/:id", //+ lunchId.dataset.lunch,
      data: $(this).serialize,
      dataType: "jquery"
    }).done(function(response){
      console.log(response)
    })

  });


  if //(doc.getElementsByTagName("h4")[0].style.backgroundColor === "green") {
    //alert("Success! You've both accepted!")
    ($('h4').css('background-color') == "green")
    {
      alert("Success! You've both accepted.")
  }

});
