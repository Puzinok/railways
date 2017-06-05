$(document).ready(function(){
  $('#carriage_types').change(function() {
    var type_selected;
    var form;

    type_selected = $('#carriage_types option:selected').val();
    form = $('#new_' + type_selected + '_carriage')

    $('form').hide();
    form.show();
  });
});