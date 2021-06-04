const fs = require('fs');
const path = require("path");

const commandLineArgs = process.argv.slice(2);

const langSettings = {
  ruby: {
    path: '../client_libraries/ruby-asana',
    replacements: [
      {
        file: "lib/asana/version.rb",
        regex: "{{version}}"
      }
    ]
  },
  node: {
    path: '../client_libraries/node-asana',
    replacements: [
      {
        file: "package.json",
        regex: "\"asana\",\n  \"version\": \"{{version}}\""
      },
      {
        file: "package-lock.json",
        regex: "\"asana\",\n  \"version\": \"{{version}}\""
      }
    ]
  },
  php: {
    path: '../client_libraries/php-asana',
    replacements: [
      {
        file: "README.md",
        regex: "\"asana\/asana\": \"\^{{version}}\""
      }
    ]
  },
  java: {
    path: '../client_libraries/java-asana',
    replacements: [
      {
        file: "pom.xml",
        regex: "<version>{{version}}<\/version><\!--lib_version-->"
      },
      {
        file: "README.md",
        regex: "<version>{{version}}</version>"
      }
    ]
  },
  python: {
    path: '../client_libraries/python-asana',
    replacements: [
      {
        file: "setup.py",
        regex: "{{version}}"
      },
      {
        file: "asana/__init__.py",
        regex: "{{version}}"
      },
      {
        file: "asana/version.py",
        regex: "{{version}}"
      }
    ]
  }
};

let promises = [];

for (let i = 0; i < commandLineArgs.length; i++) {
  promises.push(new Promise((resolve, reject) => {
    fs.readFile(path.resolve(__dirname, langSettings[commandLineArgs[i]].path + '/VERSION'), 'utf8', function (err, data) {
      if (err) {
        return console.log('Unable to read: ' + err);
      }
      data = data.trim();

      let prevVersion = data;
      let versionParts = data.split(".");
      versionParts[versionParts.length - 1] = parseInt(versionParts[versionParts.length - 1]) + 1;
      let nextVersion = versionParts.join('.');


      fs.writeFile(path.resolve(__dirname, langSettings[commandLineArgs[i]].path + '/VERSION'), nextVersion, function (err) {
        if (err) {
          return console.log('Unable to write: ' + err);
        }

        incrementVersion(commandLineArgs[i], prevVersion, nextVersion, resolve);
      });
    });
  }));
}

Promise.all(promises).then(() => {
  console.log("All Done!");
});

function incrementVersion(lang, prevVersion, nextVersion, callback) {
  let promises = [];

  let replacements = langSettings[lang].replacements;

  for (let i = 0; i < replacements.length; i++) {
    promises.push(new Promise((resolve, reject) => {
      let filepath = langSettings[lang].path + '/' + replacements[i].file;
      fs.readFile(path.resolve(__dirname, filepath), 'utf8', function (err, data) {
        if (err) {
          console.log("Failed to read: " + err);
        }

        console.log(data);
        let newData = data.replace(
          replacements[i].regex.replace("{{version}}", prevVersion),
          replacements[i].regex.replace("{{version}}", nextVersion)
        );
        console.log(newData);

        fs.writeFile(path.resolve(__dirname, filepath), newData, function (err) {
          if (err) {
            console.log("Failed to write: " + err);
          }

          resolve();
        });
      });
    }));
  }

  Promise.all(promises).then((values) => {
    console.log("Completed incrementing: " + lang);
    callback();
  });
}
