$(function() {

  var tab =$('.tab li');

  tab.on('click',function(){
    var id = $(this).attr('id');
    tab.removeClass('active');
    $(this).addClass('active');
  });

// function showUp(tab_name,content){
//   if($('#review_tab').hasClass('active')){
//     $('#comment').fadeIn();
//   } else {
//     $('#comment').fadeOut();
//   }
// }
function tab_switch() {
  $('.tab').find('li').on('click',function(){
    var className = $(this).attr("id");
    if (className=="plan_tab"){
      $('#contentsBottom').fadeIn().addClass('show');
      $('.panel').not('#contentsBottom').fadeOut();
      console.log('click');
    } else if (className=="clubInfo_tab") {
      $('#courseInfo').fadeIn().addClass('show');
      $('.panel').not('#courseInfo').fadeOut();
    } else if (className=="access_tab") {
      $('#access').fadeIn().addClass('show');
      $('.panel').not('#access').fadeOut();
    } else if (className=="review_tab") {
      $('#comment').fadeIn().addClass('show');
      $('.panel').not('#comment').fadeOut();
    }
  });
}
tab_switch();
});
// $('.area').hover(function(){
// 		$(this).find('.is-show_item a').css('colr','red');
// 		$(this).next('.area-list').slideDown();
// 		$('.area').not(this).next('.area-list').slideUp();
// 	});
