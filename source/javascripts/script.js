 "use strict";
$( document ).ready(function() {

	var domain = $(location).attr('hostname');
	var param = $(location).attr('search');

	//we will replace the words slyce with emvio
	if( (domain.search("emvio") >= 0) || (param.search("emvio") >= 0) ){
		var newtitle = document.title.replace(/Slyce API Documentation/g, "emvio api documentation");
		document.title = newtitle;

		walkText(document.body);
	}  

	function walkText(node) {

	  if (node.nodeType == 3) {
	  	node.data = node.data.replace(/Slyce API/g, "emvio api");
	  	node.data = node.data.replace(/api.slycepay/g, "rest-api.emvio");
		node.data = node.data.replace(/slycepay/g, "emvio");
		node.data = node.data.replace(/slyce/g, "emvio");
		node.data = node.data.replace(/Slyce/g, "emvio");
		node.data = node.data.replace(/SLYCE/g, "emvio");
		
	  }else{
	  	if(node.tagName == "IMG"){
	  		node.src = node.src.replace(/slyce.png/g, "emvio.png");
	  	}
	  }

	  if (node.nodeType == 1 && node.nodeName != "SCRIPT") {
	    for (var i = 0; i < node.childNodes.length; i++) {
	      walkText(node.childNodes[i]);
	    }
	  }

	}

});