$(document).ready(function(){
  // スタート、オプション、除外時間選択
  $('#time label').on('click',function(){
    $(this).toggleClass("active");
  });
  $('#option label').on('click',function(){
    $(this).toggleClass("active");
  });
  $('#avoid label').on('click',function(){
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

// 都道府県選択内の文字列取得
    function getAres(){
      var checkedArray = [];
        $('input[name="condition[area_code][]"]:checked').siblings().each(function(i,e){checkedArray.push(e.innerText)});
          return checkedArray.join(',');
    }
//Lightbox
  	$('#areaForm').on('click',function(){
  		$('.areaSelect').fadeIn();
  	});
  	$('.overLay, .close_btn').click(function(){
  		$('.areaSelect').fadeOut();
      //文字列を吐き出す
      if(getAres().length !== 0){
        $('#areaForm').text(getAres());
      }
  	});

    $('#date input').on('click',function(){
      $('#ui-datepicker-div').before('<div class="overLay"></div>');

    });

});
