$(document).on('turbolinks:load',function() {
  $('.question__answer__ans').on('click', function() {
    $(this).parent().find('.question__answer__bg').show();
    if($(this).attr('data')){
      $(this).parent().find('.question__answer__icon').addClass('question__answer__true');
    }else{
      $(this).parent().find('.question__answer__icon').addClass('question__answer__false');
    }

    setTimeout(function(){
      $('.question__answer__ans').parent().find('.question__answer__icon').removeClass('question__answer__true question__answer__false');
      $('.question__answer__ans').parent().find('.question__answer__bg').hide();
    }, 1500);
  });
});
