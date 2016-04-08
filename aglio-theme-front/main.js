var helper = require('./helper');
var resourceGroupTemplate = require('./templates/resource-group');

exports.getConfig = () => {
  return {
    formats: ['1A'],
    options: []
  };
};

exports.render = (input, options, done) => {
  var md = '';

  helper.init({api: input});

  input.resourceGroups.forEach(group => {
    md += resourceGroupTemplate(group);
  });

  done(null, md);
  // done(null, '');
};
