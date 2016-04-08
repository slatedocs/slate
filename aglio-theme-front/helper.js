var _ = require('underscore');

var host = '';
var defaultLanguages = ['curl', 'node'];

exports.init = options => {
  exports.languages = options.languages || defaultLanguages;

  host = _(options.api.metadata).findWhere({name: 'HOST'}).value;

  // Make sure the host does not have a trailing slash
  host = host.replace(/\/$/, '');

  // Build data structures directory
  options.api.content.forEach(category => {
    category.content.forEach(item => {
      if (item.element !== 'dataStructure')
        return;

      dataStructure = item.content[0];
      exports.dataStructures[dataStructure.meta.id] = {
        type  : dataStructure.element,
        fields: dataStructure.content
      };
    });
  });
};

exports.dataStructures = {};

exports.languages = [];

exports.uriTemplateToUrl = uriTemplate => {
  var queryParams = _getQueryParams(uriTemplate);

  if (queryParams.length <= 0)
    return host + uriTemplate;

  var path = uriTemplate.replace(/\{\?.+\}$/, '');

  path += '?';
  path += queryParams.map(param => `${param}={${param}}`).join('&');

  return host + path
};

function _getQueryParams(uriTemplate) {
  var queryParamRe = /\{\?([,\w]+)\}/g;
  var params = [];

  while ((matches = queryParamRe.exec(uriTemplate)) !== null) {
    matches.shift(); // Remove full string of string matched
    matches.forEach(match => {
      params = params.concat(match.split(','));
    });
  }

  return params;
}
