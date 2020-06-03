const fs = require('fs');
const path = require("path");
const YAML = require("yaml");

const docsFilename = './source/includes/api-reference/_index.html.md';

const docs = [
  {
    "lang": "ruby",
    "docs": '../client_libraries/ruby-asana/samples'
  },
  {
    "lang": "javascript--nodejs",
    "docs": '../client_libraries/node-asana/samples'
  },
  {
    "lang": "javascript",
    "docs": '../client_libraries/node-asana/samples'
  },
  {
    "lang": "php",
    "docs": '../client_libraries/php-asana/samples'
  },
  {
    "lang": "java",
    "docs": '../client_libraries/java-asana/samples'
  },
  {
    "lang": "python",
    "docs": '../client_libraries/python-asana/samples'
  }
];

fs.readFile(docsFilename, 'utf8', function (err, docsData) {
  if (err) {
    return console.log(err);
  }

  let promises = [];

  for (let i = 0; i < docs.length; i++) {
    promises.push(new Promise((resolve, reject) => {
      fs.readdir(path.resolve(__dirname, docs[i].docs), function (err, files) {
        if (err) {
          return console.log('Unable to scan directory: ' + err);
        }

        replaceWithSamples(path.resolve(__dirname, docs[i].docs), files, docs[i].lang, resolve);
      });
    }));
  }

  Promise.all(promises).then((values) => {
    fs.writeFile(docsFilename, docsData, function (err) {
      if (err) return console.log(err);
      console.log('Updated Code Samples from local versions of Client Libraries.');
    });
  });

  function replaceWithSamples(path, files, lang, callback) {
    let promises = [];

    let sampleHolder = {};
    files.forEach(function (filename) {
      promises.push(new Promise((resolve, reject) => {
        fs.readFile(path + '/' + filename, 'utf8', function (err, data) {
          sampleHolder = Object.assign(sampleHolder, YAML.parse(data));
          resolve();
        });
      }));
    });

    Promise.all(promises).then((values) => {
      for (let tag in sampleHolder) {
        if (sampleHolder.hasOwnProperty(tag)) {
          for (let operationId in sampleHolder[tag]) {
            if (sampleHolder[tag].hasOwnProperty(operationId)) {
              const regex = new RegExp("```" + lang + "\\s*" + toCamel(operationId) + "\\s*```", "g");
              docsData = docsData.replace(regex, "```" + lang + "\n" + sampleHolder[tag][operationId] + "\n```");
            }
          }
        }
      }
      console.log("Completed replacements");
      callback();
    });
  };

  function toCamel(s) {
    return s.replace(/([-_][a-z])/ig, ($1) => {
      return $1.toUpperCase()
        .replace('-', '')
        .replace('_', '');
    });
  };
});
