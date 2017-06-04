$(document).ready(function(){
  $('a.edit_route').click(function(e){
    e.preventDefault();
    var route_id;
    var form;
    var name_div;
    route_id = $(this).data("routeId");
    form = $('#edit_route_' + route_id)
    name_div = $('#route_id_'+route_id)

    if (!$(this).hasClass('cancel')){
      $(this).html('Отмена');  
      $(this).addClass('cancel');
    } else {
      $(this).html('Изменить');
      $(this).removeClass('cancel');
    }

    name_div.toggle();
    form.toggle();
  });
});