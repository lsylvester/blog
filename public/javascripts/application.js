// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  $('a[href$=/delete]').live("click", function(event){
    if(confirm("Are you sure?")){
      $('<form method="post" action="' + this.href.replace(/\/delete$/,'') + '" />')
        .append('<input type="hidden" name="_method" value="delete" />')
        .append('<input type="hidden" name="authenticity_token" value="' + AUTH_TOKEN + '" />')
        .appendTo('body')
        .submit();
    }
    return false;
  });
});