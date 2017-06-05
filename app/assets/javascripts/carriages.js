$(document).ready(function(){
  $('#carriage_type').change(function() {
    var type_selected;
    var form;

    type_selected = $('#carriage_type option:selected').text();
    form = $('#' + type_selected + '_carriage' )
    $("div[id*='carriage']").hide();
    form.toggle();
  });
});