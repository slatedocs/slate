var secret = "80737565677285"; //pikachu
var input = "";
var timer;
var mode = false;

$(document).keyup(function(e) {
    //alert(e.which);
    input += e.which;    
    
    clearTimeout(timer);
    timer = setTimeout(function() { input = ""; }, 400);
    
    check_input();
});

function check_input() {
    if(input == secret) {
        //the secret code
       
        pikachu.style.display = 'block';
        
    }
    
     
}



