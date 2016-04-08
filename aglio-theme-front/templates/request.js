var helper = require('../helper');

module.exports = (method, url, request, params) => {
  var md = '';

  helper.languages.forEach(lang => {
    var codeSample = require(`./code_samples/${lang}`)
    md += `
${codeSample.header}
${codeSample.code(method, url, request, params)}
${codeSample.footer}
`;
  });

  return md;
};
