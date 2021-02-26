window.addEventListener("DOMContentLoaded", () => {
  const goToTop = document.querySelectorAll("a.go-to-top");

  const scrollToParent = (event) => {
    event.currentTarget.parentNode.scrollIntoView({ behavior: "smooth" });
  };

  Array.from(goToTop).forEach((button) => button.addEventListener("click", scrollToParent));
});
