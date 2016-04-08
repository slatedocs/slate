var _ = require('underscore');
var helper = require('../../helper');

exports.header = '```shell';
exports.footer = '```';

exports.code = (method, url, request, parameters) => {
  var code = `
curl --include \\`;

  if (method !== 'GET')
    code += `
     --request ${method} \\`;

  request.headers.forEach(header => {
    code += `
     --header "${header.name}: ${header.value}" \\`;
  });

  if (request.body)
    code += `
     --data-binary "${request.body.replace(/"/g, '\\"')}" \\`;

  code += `
'${url.replace(/\{[^\}]+\}/g, match => '$' + match.toUpperCase())}'`;

  return code;
};
