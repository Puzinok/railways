$(document).ready(function(){
  $('#carriage_type').change(function() {
    type_selected = $('#carriage_type option:selected').text();
    
    switch(type_selected) {
      case 'economy':
        $('#sitting').hide();
        $('#side_upper').show();
        $('#side_bottom').show();
        $('#upper').show();
        $('#bottom').show();
        break;

      case 'coupe':
        $('#sitting').hide();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').show();
        $('#bottom').show();
        break;

      case 'slepping':
        $('#sitting').hide();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').hide();
        $('#bottom').show();
        break;

      case 'sitting':
        $('#sitting').show();
        $('#side_upper').hide();
        $('#side_bottom').hide();
        $('#upper').hide();
        $('#bottom').hide();
        break;
    }
  });
});