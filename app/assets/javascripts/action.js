$(document).ready(function(){
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
  	$('#fade, .close_btn').click(function(){
  		$('.areaSelect').fadeOut();
      //文字列を吐き出す
      if(getAres().length !== 0){
        $('#areaForm').text(getAres());
      }
  	});

    $('#date input').on('click',function(){
      $('#ui-datepicker-div').before('<div class="overLay"></div>');

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
