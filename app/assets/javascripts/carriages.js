$(document).on('turbolinks:load', function(){
  var type = $('#carriage_type option:selected').text();
  showInputs(type.toLowerCase());

  $('#carriage_type').change(function(){
    $("#carriage_inputs input").val(null);
    var type = $('#carriage_type option:selected').text();
    showInputs(type.toLowerCase());
  });

  function showInputs(type){
      $("div[class*='_carriage']").hide();
      $('.'+ type + '_carriage').show();
    }
});