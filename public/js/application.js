$(document).ready(function() {

  $('.acceptance-btn1').on("click", function(event){
    event.preventDefault();
    $(this).hide();
    $('p.lunchpartner1').css('background-color', 'red')
    var url = $(this).attr("action")

    console.log(url)

    $.ajax ({
      type: "post",
      url: "/meal/:id",// + lunchId.dataset.lunch,
      data: $(this).serialize(),
      dataType: "json"
    }).done(function(response){
      console.log(response)
      $(".acceptance-btn2").append(response)
    })
  })


  $('.acceptance-btn2').on("click", function(event){
    event.preventDefault();
    $(this).hide();
    $('p.lunchpartner2').css('background-color', 'red')

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
