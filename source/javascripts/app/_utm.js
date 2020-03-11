window.addEventListener("DOMContentLoaded", function(event) {
  try{
    var searchParams = new URLSearchParams(window.location.search);
    var expiryDate = generateExpiryDate();
    processParams(searchParams, expiryDate);
  }
  catch(error){
    console.error("URLSearchParams not supported in IE");
  }
});

function processParams(searchParams, expiryDate) {
  var cookieValue = "";

  searchParams.forEach(function(value, key) {
    switch(key) {
      case 'utm_source':
        cookieValue = cookieValue += 'utm_source:' + value + '&';
        break;
      case 'utm_medium':
        cookieValue = cookieValue += 'utm_medium:' + value + '&';
        break;
      case 'utm_campaign':
        cookieValue = cookieValue += 'utm_campaign:' + value + '&';
        break;
      case 'utm_term':
        cookieValue = cookieValue += 'utm_term:' + value + '&';
        break;
      case 'utm_content':
        cookieValue = cookieValue += 'utm_content:' + value + '&';
        break;
    }
  });

  if (cookieValue != "") {
    // Remove the trailing & character
    cookieValue = cookieValue.substring(0, cookieValue.length-1)
    // Save the aggregated value into a cookie
    saveUTMCookie(cookieValue, expiryDate);
  }
}

function generateExpiryDate() {
  var expiryDate = new Date();
  expiryDate.setMonth(expiryDate.getMonth() + 12);
  return expiryDate;
}

function saveUTMCookie(value, expiryDate) {
  document.cookie='docs=' + value + ';' + 'domain=.scoutapm.com;expires=' + expiryDate.toGMTString() + ';';
}
