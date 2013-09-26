 var a= 3;
  $(function(){
    $('.slide_p').slice(0,3).addClass("selecting");
    $('#link_hide_p').addClass("deselecting");
  });


S = {
  
  slider_method_n: function(tot,n){
   if( a <= tot && n == 1)
   {  /* if(a <= 0)
       {  $('.slide_p').slice(a,(a+3)).removeClass("deselecting");
         $('.slide_p').slice(a,(a+3)).addClass("selecting");
          
       }
    */   if(a >=3)
       {  $('.slide_p').slice(a,(a+3)).removeClass("deselecting");
         $('.slide_p').slice(a,(a+3)).addClass("selecting");
          $('.slide_p').slice(0,a).removeClass("selecting");
         $('.slide_p').slice(0,a).addClass("deselecting");
        
       }
       a= a+3; 
    }    
    
    if ( a >= 3 && n == 2)
    {   a= a-3;
  /*    if( a >= (tot-3) )
      { $('.slide_p').slice((a-3),a).removeClass("deselecting");
        $('.slide_p').slice((a-3),a).addClass("selecting");
      }
  */    if(a <= (tot-3))
        { $('.slide_p').slice((a-3),a).removeClass("deselecting");
         $('.slide_p').slice((a-3),a).addClass("selecting");
         $('.slide_p').slice(a,tot).removeClass("selecting");
         $('.slide_p').slice(a,tot).addClass("deselecting");
        
         
       }
  }
    
    if( a >= tot && n == 1)
       { $('#link_hide_n').addClass("deselecting");}
    if( a <= tot && n == 2)
       { $('#link_hide_n').removeClass("deselecting");}
    if( a <= 3 && n == 2)
       { $('#link_hide_p').addClass("deselecting");}
    if( a > 3  && n == 1)
       { $('#link_hide_p').removeClass("deselecting");}
  }


 } 