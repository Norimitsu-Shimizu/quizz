$(document).on('turbolinks:load',function() {
  $('.contents-create__field__input__check__c').on('click', function() {
    if ($(this).prop('checked')){
        $('.contents-create__field__input__check__c').prop('checked', false);
        $(this).prop('checked', true);
    }
  });
});