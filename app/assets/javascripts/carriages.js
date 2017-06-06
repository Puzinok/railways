$(document).on('turbolinks:load', function(){
  var type = $('#carriage_type option:selected').text();
  showInputs(type);

  $('#carriage_type').change(function(){
    $("#carriage_inputs input").val(null);
    var type = $('#carriage_type option:selected').text();
    showInputs(type);
  });

  function showInputs(type){
    var carriage = new Object();
    carriage[type] = function(type) {
      $("div[class*='_carriage']").hide();
      $('.'+ type + '_carriage').show();
    }
    carriage[type](type.toLowerCase());
  }
});