var _ = require('underscore');
var actionTemplate = require('./action');
var dataStructureTemplate = require('./data-structure');
var helper = require('../helper');

module.exports = resource => {
  var md = `
# ${resource.name}
`;

  resource.content.forEach(item => {
    if (item.element !== 'dataStructure')
      return;

    var renderedDataStructure = dataStructureTemplate(helper.dataStructures[item.content[0].element]);

    // Prepend rendered data strucutre with '> ' to push it to the right panel
    md += `> ${renderedDataStructure.replace(/^./g, '> $&')}`;
  });

  md += `
${resource.description}
`;

  resource.actions.forEach(action => {
    var decoratedAction = _decorateAction(action, resource);

    md += actionTemplate(decoratedAction);
  });

  return md;
};

function _decorateAction(action, resource) {
  // Use parent resource URI template if not defined on the action itself.
  action.uriTemplate = action.attributes.uriTemplate || resource.uriTemplate;

  // Merge parent resource parameters if not already defined at the action level
  resource.parameters.forEach(param => {
    if (_(action.parameters).findWhere({ name: param.name }))
      return;

    action.parameters.push(param);
  });

  return action;
}
