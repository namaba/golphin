$(function() {

  var tab =$('.tab li');

  tab.on('click',function(){
    var id = $(this).attr('id');
    console.log(id);
    tab.removeClass('active');
    $(this).addClass('active');
  });

$(function(){
  $('#dateList').load('reviews.html.slim');
});

});
