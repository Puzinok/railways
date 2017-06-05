
$(document).on('turbolinks:load', function(){
  var type_selected;
  type_selected = $('#carriage_type option:selected').text();
  
  showInputsForType(type_selected);

  $('#carriage_type').change(function() {
    type_selected = $('#carriage_type option:selected').text();
    $('input').val(null);
    showInputsForType(type_selected);
  });

  function showInputsForType(type_select){
    switch(type_selected) {
      case 'Economy':
        $('#sitting').hide();
        $('#side_upper').show();
        $('#side_bottom').show();
        $('#upper').show();
        $('#bottom').show();
        break;

      case 'Coupe':
        $('#sitting').hide();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').show();
        $('#bottom').show();
        break;

      case 'Slepping':
        $('#sitting').hide();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').hide();
        $('#bottom').show();
        break;

      case 'Sitting':
        $('#sitting').show();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').hide();
        $('#bottom').hide();
        break;
    }
  }
});