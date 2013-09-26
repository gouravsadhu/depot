$( function(){
 
  $(document).on("click", "body" , function(e){
    if(e.target.id == "select")
      $('.nav').toggle("slow");
    else
      $('.nav').hide(); 
  });
});