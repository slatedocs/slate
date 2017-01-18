(function() {
    var cx = '003552815484763729059:feruzu5o53s';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
      window.onload = function(){
      document.getElementById('gsc-i-id1').placeholder = 'Search Bonsai Docs';
     // document.getElementById('gsc-i-id2').placeholder = 'Search Bonsai Docs';
	  
	 $("td.gsc-search-button").empty().html('<input type="image" src="/images/search.svg" class="gsc-search-button gsc-search-button-v2 svg" title="search">'); 
	  
    };
	
	$(function(){
	    jQuery('img.svg').each(function(){
	        var $img = jQuery(this);
	        var imgID = $img.attr('id');
	        var imgClass = $img.attr('class');
	        var imgURL = $img.attr('src');
    
	        jQuery.get(imgURL, function(data) {
	            // Get the SVG tag, ignore the rest
	            var $svg = jQuery(data).find('svg');
    
	            // Add replaced image's ID to the new SVG
	            if(typeof imgID !== 'undefined') {
	                $svg = $svg.attr('id', imgID);
	            }
	            // Add replaced image's classes to the new SVG
	            if(typeof imgClass !== 'undefined') {
	                $svg = $svg.attr('class', imgClass+' replaced-svg');
	            }
    
	            // Remove any invalid XML tags as per http://validator.w3.org
	            $svg = $svg.removeAttr('xmlns:a');
            
	            // Check if the viewport is set, else we gonna set it if we can.
	            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
	                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
	            }
    
	            // Replace image with new SVG
	            $img.replaceWith($svg);
    
	        }, 'xml');
    
	    });
	});
	