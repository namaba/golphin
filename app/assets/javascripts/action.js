$(document).ready(function(){
  // スタート、オプション、除外時間選択
  $('#time li').on('click',function(){
    $(this).toggleClass("active");
  });
  $('#option li').on('click',function(){
    $(this).toggleClass("active");
  });
  $('#avoid li').on('click',function(){
    $(this).toggleClass("active");
  });
});

//プラスマイナスボタン切り替え
$(function(){
  $('.more').on('click',function(){
      $('.detail').slideToggle('slow');
      $(this).toggleClass("active_mark");
      if ($(this).hasClass("active_mark")){
        $(this).css('background-image', 'url(/assets/minus.png)');
      } else {
        $(this).css('background-image', 'url(/assets/plus.png)');
      }
  });
  $('.subTtl').on('click',function(){
      $(this).next("dd").slideToggle('slow');
      $(this).toggleClass("active_mark");
      if ($(this).hasClass("active_mark")){
        $(this).css('background-image', 'url(/assets/minus.png)');
      } else {
        $(this).css('background-image', 'url(/assets/plus.png)');
      }
  });
});

//Lightbox
$(function() {
  $(function(){
  	$('#areaForm').click(function(){
  		$('.areaSelect').fadeIn();
  	});
  });
  $(function(){
  	$('.overLay').click(function(){
  		$('.areaSelect').fadeOut();
  	});
  });
  $(function(){
  	$('.close_btn').click(function(){
  		$('.areaSelect').fadeOut();
  	});
  });
});
