$(document).ready(function() {

  $('.acceptance-btn1').on("click", function(event){
    event.preventDefault();
    $(this).hide();
    $('p.lunchpartner1').css('background-color', 'red')
    var url = $(this).attr("action")

    declineData = {lunchpartner1_accept: false}
    url = $(this).attr("action")

    $.post(url,declineData,function(response){
      console.log(response)
    })

  })


  $('.acceptance-btn2').on("click", function(event){
    event.preventDefault();
    $(this).hide();
    $('p.lunchpartner2').css('background-color', 'red')

    declineData = {lunchpartner2_accept: false}
    url = $(this).attr("action")

    $.post(url,declineData,function(response){
      console.log(response)
    })

  });


});
