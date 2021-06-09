function onParamToggle(event) {
  const target = event.target;
  const param = target.parentElement.parentElement;

  target.classList.toggle("active");
  toggleVisibility(param.nextElementSibling);
}

function toggleVisibility(el) {
  const isParentLevel = el.classList.contains("param__child1");


  if (isParentLevel) {
    // next parent. they're always visible
    return;
  }

  el.classList.toggle("param__child__active");
  toggleVisibility(el.nextElementSibling);
}

window.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll("button.param__toggle");

  Array.from(toggles).forEach(function (toggle) {
    toggle.addEventListener("click", onParamToggle);
  });
});
