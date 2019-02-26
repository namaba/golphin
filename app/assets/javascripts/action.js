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


//プラスマイナスボタン切り替え
  $('.more').on('click',function(){
      $('.detail').slideToggle('slow');
      $(this).toggleClass("active_mark");
      if ($(this).hasClass("active_mark")){
        $(this).css('background-image', 'url(/assets/minus.png)');
      } else {
        $(this).css('background-image', 'url(/assets/plus.png)');
      }
  });

  $('.subTtl__btn').on('click',function(){
      $(this).parents().next("dd").slideToggle(500);
      $(this).toggleClass("subTtl__btn--open");
  });


//Lightbox
  	$('#areaForm').click(function(){
  		$('.areaSelect').fadeIn();
  	});
  	$('.overLay, .close_btn').click(function(){
  		$('.areaSelect').fadeOut();
  	});


});
