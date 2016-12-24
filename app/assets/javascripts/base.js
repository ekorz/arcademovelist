$(document).on("ready", function(){

  $.extend($.expr[":"], { "startWith": function(elem, i, match, array) { return (elem.textContent || elem.innerText || "").toLowerCase ().indexOf((match[3] || "").toLowerCase()) === 0; } });
  $.extend($.expr[":"], { "contains_IS": function(elem, i, match, array) { return (elem.textContent || elem.innerText || "").toLowerCase ().indexOf((match[3] || "").toLowerCase()) >= 0; } });
  
$(document).on("keyup", "#search_field", function(e){

  if(this.value.length > 0) {
  	$("[data-name]").hide();
  	$(".aux").hide();

  	$("[data-name*='" + this.value.toLowerCase() + "']").show();
    $("[data-year*='" + this.value.toLowerCase() + "']").show();
    $("[data-genre*='" + this.value.toLowerCase() + "']").show();
    $("[data-platform*='" + this.value.toLowerCase() + "']").show();
    $("[data-description*='" + this.value.toLowerCase() + "']").show();
    $("[data-aux*='" + this.value.toLowerCase() + "']").show();
    $("[data-developer*='" + this.value.toLowerCase() + "']").show();
  } else {
  	$("[data-name]").show()
  	$(".aux").hide();
  }
});

})

$(document).on('click', '.add_child', function() {
        var association = $(this).attr('data-association');
        var target = $(this).attr('target');
        var regexp = new RegExp('new_' + association, 'g');
        var new_id = new Date().getTime(); 
        
        var Dest = (target == '') ? $(this).parent() : $(target);
        
        Dest.append(window['children_fields'].replace(regexp, new_id));
        return false;
      });

      $(document).delegate('.remove_child','click', function() {
        $(this).parent()
        $(this).parent().children('.removable')[0].value = 1;
        $(this).parent().hide();
        return false;
      });