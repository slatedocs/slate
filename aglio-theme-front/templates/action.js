var _ = require('underscore');
var helper = require('../helper');
var dataStructureTemplate = require('./data-structure');
var parametersTemplate = require('./parameters');
var requestTemplate = require('./request');
var responseTemplate = require('./response');

module.exports = action => {
  var actionRequest;
  var actionResponse;
  var params = _getParams(action.uriTemplate, action.parameters);
  var url = helper.uriTemplateToUrl(action.uriTemplate);

  if (action.examples[0]) {
    actionRequest = action.examples[0].requests[0];
    actionResponse = action.examples[0].responses[0];
  }

  var md = `
## ${action.name}`;

  if (actionRequest)
    md += requestTemplate(action.method, url, actionRequest, action.parameters);

  if (actionResponse)
    md += responseTemplate(actionResponse);

  md += `
${action.description}

### HTTP Request

\`${action.method} ${url}\``;

  if (params.length > 0)
    md += `
### Parameters

${parametersTemplate(params)}`;

  if (actionRequest)
    md += `${_renderRequestBody(actionRequest.content)}`;

  return md;
};

function _getParams(uriTemplate, parameters) {
  var urlParamRe = /\{\??([,\w]+)\}/g;
  var usedParamNames = [];

  while ((matches = urlParamRe.exec(uriTemplate)) !== null) {
    matches.shift(); // Remove full string of string matched
    matches.forEach(match => {
      usedParamNames = usedParamNames.concat(match.split(','));
    });
  }

  var params = _.select(parameters, param => _(usedParamNames).contains(param.name));

  return params;
}

function _renderRequestBody(requestContent) {
  var body = requestContent[0];

  if (!body || body.element !== 'dataStructure')
    return '';

  return `
### Body

${dataStructureTemplate(helper.dataStructures[body.content[0].element])}`;
}
