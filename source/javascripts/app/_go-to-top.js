window.addEventListener("DOMContentLoaded", function () {
  const goToTop = document.querySelectorAll("a.go-to-top");

  function scrollToParent(event) {
    event.currentTarget.parentNode.scrollIntoView({ behavior: "smooth" });
  }

  Array.from(goToTop).forEach(function (button) {
    button.addEventListener("click", scrollToParent);
  });
});
