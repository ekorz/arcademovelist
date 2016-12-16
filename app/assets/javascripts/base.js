$(document).on("ready", function(){

  $.extend($.expr[":"], { "startWith": function(elem, i, match, array) { return (elem.textContent || elem.innerText || "").toLowerCase ().indexOf((match[3] || "").toLowerCase()) === 0; } });
  $.extend($.expr[":"], { "contains_IS": function(elem, i, match, array) { return (elem.textContent || elem.innerText || "").toLowerCase ().indexOf((match[3] || "").toLowerCase()) >= 0; } });
  
$(document).on("keyup", "#search_field", function(e){
  
  if(this.value.length > 0) {
  	$("[data-name]").hide();
  	$(".aux").hide();

  	$("[data-name*='" + this.value.toLowerCase() + "']").show();
    $("[data-year*='" + this.value.toLowerCase() + "']").show();
    $("[data-aux*='" + this.value.toLowerCase() + "']").show();
    $("[data-mfg*='" + this.value.toLowerCase() + "']").show();
  } else {
  	$("[data-name]").show()
  	$(".aux").hide();
  }
});

})

