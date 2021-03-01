window.addEventListener("DOMContentLoaded", function () {
  const goToTop = document.querySelectorAll("a.go-to-top");

  function getContainer(target) {
    return target.parentElement;
  }

  function scrollToTop(container) {
    const title = $(container).prev()[0];
    title.scrollIntoView();
  }

  Array.from(goToTop).forEach(function (button) {
    button.addEventListener("click", function (event) {
      const container = getContainer(event.currentTarget);

      scrollToTop(container);
      container.querySelector("summary").click();
    });
  });
});
