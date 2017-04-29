function ReferenceMapObjeect(name, link, others) {
    this.pageName = name;
	this.pageLink = link;
	this.otherPages = others;
}

const ReferenceMap = [new ReferenceMapObjeect("DiscordClient", "DiscordClient", [
	new ReferenceMapObjeect("sendMessage", "DiscordClient/sendMessage", null),
	new ReferenceMapObjeect("editMessage", "DiscordClient/editMessage", null), 
	new ReferenceMapObjeect("deleteMessage", "DiscordClient/deleteMessage", null), 
	new ReferenceMapObjeect("deleteChannel", "DiscordClient/deleteChannel", null), 
	new ReferenceMapObjeect("addReaction", "DiscordClient/addReaction", null), 
	new ReferenceMapObjeect("pinMessage", "DiscordClient/pinMessage", null), 
	new ReferenceMapObjeect("unpinMessage", "DiscordClient/unpinMessage", null), 
	new ReferenceMapObjeect("editNickname", "DiscordClient/editNickname", null),
	//addRole
	//removeRole
	//kickMember
])];

var searchForPath = function(name, map) {
	for (let i = 0; i < map.length; ++i) {
		if (map[i].pageName == name) {
			return map[i];
		} else if (map[i].otherPages) {
			var found = new Array(searchForPath(name, map[i].otherPages));
			if (found) {
				found.push(map[i]);
				return found;
			}
		}
	}
	return null;
}

var pathArray = [];

document.addEventListener("DOMContentLoaded", function(event) {
	var elements = document.querySelectorAll(".navbar");
	for (let i = 0; elements[i]; ++i) {
		//get the name from page
		var nameElements = document.querySelector(".nameele");
		var currentPageName = nameElements.textContent;
		//search for name in data
		pathArray = pathArray.concat(searchForPath(currentPageName, ReferenceMap));
		console.log(pathArray);
		var newContent = "";
		for (let j = pathArray.length - 1; 1 <= j; --j) {
			var link = "";
			for (let o = 2; o <= j; ++o) {
				link += "../"
			}
			link += ".";
			newContent += "<span onclick=\"openDropMenu(this, " + j +",'" + link + "/')\"><a class=\"dropdown\" id=\""+pathArray[j].pageLink+"\"href=\"javascript:;\">" + pathArray[j].pageName + "</a><div class=\"dropdownmenu\"></div></span> > ";
		}
		elements[i].innerHTML = newContent + pathArray[0].pageName;
	}
});

var openedMenu;

function openDropMenu(clicked, j, link) {
	var links = pathArray[j].otherPages;
	var numOfLinks = links.length;
	var newHtml = "";
	for (var i = 0; i < numOfLinks; ++i) {
		newHtml += "<a href=\"" + link + links[i].pageName + "\">" + links[i].pageName + "</a>";
	}
	clicked.lastChild.innerHTML = newHtml;
	clicked.lastChild.classList.add("showmenu");	//needed for the shadow
	openedMenu = j;
}

window.onclick = function(event) {
	if (!openedMenu) return;
	if (event.target == document.getElementById(pathArray[openedMenu].pageLink)) return;
	var elements = document.querySelectorAll(".dropdownmenu");
	for(var i = 0; i < elements.length; ++i) {
		if (elements[i].interHTML !== "") {
			elements[i].innerHTML = "";
			elements[i].classList.remove("showmenu");
		}
	}
	openedMenu = 0;
}