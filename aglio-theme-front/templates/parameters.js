module.exports = params => {
  if (!params || params.length <= 0)
    return '';

 var md = `
Name | Type | Description
-----|------|------------
`;

  params.forEach(param => { md += _renderParam(param); });

  return md;
};

function _renderParam(param) {
  var type = param.type;

  if (/array\[\w+\]/.test(type))
    type = 'array';

  if (!param.required)
    type += ' (optional)';

  var description = param.description;
  if (param.default)
    description += ` (default: \`${param.default}\`)`;

  return `${param.name} | ${type} | ${description}
`;
}
