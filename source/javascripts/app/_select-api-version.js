function currentVersion() {
  var path = location.pathname.split('/').reverse();
  return path[0] || path[1];
}
function createSelectbox(versions) {
  var curVersion = currentVersion();
  var selectbox = $("<select name='select-api-version' style='background: white; width: 100%; padding: 8px; border: 0;'>");
  for (var idx=0, len=versions.length; idx<len; idx++) {
    var version = versions[idx];
    $("<option />", {
      value: version,
      text: version,
      selected: version == curVersion
    }).appendTo(selectbox);
  }
  return selectbox;
}
$(function() {
  $.ajax('/yalty-doc/versions.json')
    .then(createSelectbox)
    .then(function(selectbox) {
      selectbox.prependTo(".select-api-version");
      selectbox.change(function(evt) {
        location.href = '../' + evt.target.value + '/';
      });
    });
});
