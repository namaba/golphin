$(function(){
  // スタート、オプション、除外時間選択
  $('.detail label').on('click',function(){
    if($(this).siblings('input').prop('checked')){
      $(this).removeClass('active');
    }else{
      $(this).addClass('active');
    }
    console.log($(this).siblings('input'));
  });

//プラスマイナスボタン切り替え
  $('.more').on('click',function(){
      $('.detail').slideToggle('slow');
      $(this).toggleClass("more--open");
  });

  $('.subTtl__btn').on('click',function(){
      $(this).parents().next("dd").slideToggle(500);
      $(this).toggleClass("subTtl__btn--open");
  });

//モーダル表示
  	$('#areaForm').on('click',function(){
  		$('.areaSelect').fadeIn();
  	});
  	$('#fade_out, .close_btn').on('click',function(){
  		$('.areaSelect').fadeOut();

// 都道府県選択内の文字列取得
      function getAres(){
        var checkedArray = [];
          $('input[name="condition[area_code][]"]:checked').siblings('label').each(function(i,e){
            checkedArray.push(e.innerText)
          });
            return checkedArray.join();
      }
//都道府県選択内の文字列を吐き出す
      if(getAres().length !== 0){
        $('#areaForm').text(getAres());
      }else{
        $('#areaForm').text('全地域');
      }
  	});

// カレンダー裏にオーバーレイをはる
    $('#date dd').on('click',function(){
      $('#date dd').addClass('on_datapicker');
      $('.set_overLay').addClass('overLay');

    });

    $('.ui-datepicker-calendar tbody, .set_overLay').on('click',function(){
      $('footer').next('.overLay').removeClass('overLay');
});
// 除外プレーの全選択ボタン
 var checkBox = $('#avoid').find('input')

  $('#all').on("click",function(){
    checkBox.addClass('fsdfsd');
    $(this).toggleClass('selected');
    checkBox.prop("checked", $(this).prop("checked"));
    if(checkBox.prop('checked')){
      checkBox.prop("checked", false);
      checkBox.siblings('label').removeClass('active');
    }else{
      checkBox.prop("checked", true);
      checkBox.siblings('label').addClass('active');
    }
  });

});
