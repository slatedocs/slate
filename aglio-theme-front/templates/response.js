var _ = require('underscore');

module.exports = response => {
  var md = `
> Response **${response.name}**
`;

  if (response.body)
    md += `
\`\`\`${_getLexer(response.headers)}
${response.body}
\`\`\``;

  return md;
}

// Find the correct Rouge lexer depending on the Content-Type headers
function _getLexer(headers) {
  var contentTypeHeader = _(headers).findWhere({name: 'Content-Type'})

  if (!contentTypeHeader)
    return '';

  // List of available lexers: http://rouge.jayferd.us/demo
  switch (contentTypeHeader.value) {
    case 'application/json':
        return 'json';
    case 'text/html':
      return 'html';
    case 'application/xml':
      return 'xml';
    default:
      return '';
  }
}
