

function BamboraGitHub(){
	'use strict';
	
	// Returns an object with a browser download link to the latest
	// version of the repo and info about the release
	this.getLatestReleaseInfo = function(gitHubApiUrl) {
	
		var defer = $.Deferred();
	
		$.getJSON(gitHubApiUrl).done(function (release) {          
						
			var asset = release.assets[0];
            var downloadCount = 0;
            for (var i = 0; i < release.assets.length; i++) {
                downloadCount += release.assets[i].download_count;
            }
            var oneHour = 60 * 60 * 1000;
            var oneDay = 24 * oneHour;
            var dateDiff = new Date() - new Date(asset.updated_at);
            var timeAgo;
			
            if (dateDiff < oneDay){
                timeAgo = (dateDiff / oneHour).toFixed(1) + " hours ago";
            }
            else{
                timeAgo = (dateDiff / oneDay).toFixed(1) + " days ago";
            }
			
            var releaseInfo = release.name + " was updated " + timeAgo + " and downloaded " + downloadCount.toLocaleString() + " times.";
            
			var latestRelease = {
				downloadLink: asset.browser_download_url,
				info: releaseInfo
			}
			
			defer.resolve(latestRelease);
        });
		
		return defer.promise();
    }

}
var bamboraGitHub = new BamboraGitHub();
console.log("bamboraGitHub loaded");