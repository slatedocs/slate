var resourceTemplate = require('./resource');
var helper = require('../helper');

module.exports = group => {
  var md = '';

  group.resources.forEach(resource => {
    md += resourceTemplate(resource);
  });

  return md;
};
