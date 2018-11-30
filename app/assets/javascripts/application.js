// Inclua nas versões quando rails >= 5.1
//= require jquery
//= require jquery_ujs

// Sempre inclua
//= require turbolinks
//= require materialize-sprockets
//= require_tree .


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.collapsible').collapsible();
  });

  $(document).ready(function() {
    M.updateTextFields();
  });
