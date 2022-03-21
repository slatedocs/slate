const fs = require('fs');
const https = require("https");

const docsFilename = './source/includes/markdown/_12_1-news-and-changelog.html.md';

let result = "";

https.get("https://forum.asana.com/c/api/news/97.json", res => {
  res.setEncoding("utf8");
  let body = "";
  res.on("data", data => {
    body += data;
  });
  res.on("end", () => {
    body = JSON.parse(body);

    let topics = [];
    if (body && body.topic_list && body.topic_list.topics) {
      for (let i = 0; i < body.topic_list.topics.length; i++) {
        topics.push(body.topic_list.topics[i]);
      }
    }

    topics.sort(function(x, y) {
      let xDate = new Date(x.created_at);
      let yDate = new Date(y.created_at);

      if (xDate < yDate) {
        return 1;
      }
      if (xDate > yDate) {
        return -1;
      }
      return 0;
    });


    for (let i = 0; i < 5 && i < topics.length; i++) {
      let date = topics[i].created_at.replace("T", " ").replace("Z", " ");
      if (topics[i].id !== 49391) {
        result += "* [" + topics[i].title + "](" + "https://forum.asana.com/t/" + topics[i].slug + ") " + date + "\n";
      }
    }

    fs.writeFile(docsFilename, result, function (err) {
      if (err) return console.log(err);
      console.log('Updated forum data.');
    });
  });
});
