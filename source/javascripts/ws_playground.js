function createWsButton(appziDiv) {
  console.log("jquery", $);
  console.log("appzi", appziDiv);
  const button = document.createElement("button");

  console.log(appziDiv.getBoundingClientRect());
  const appziHeight = appziDiv.clientHeight;

  button.appendChild(document.createTextNode("WebSocket playground"));

  button.style.position = "fixed";
  button.style.height = appziHeight / 1.5 + "px";
  button.style.width = "10em";
  button.style.zIndex = 1000;
  button.style.right = 25 + appziHeight + "px";
  button.style.bottom = 20 + appziHeight * 0.15 + "px"; // appziHeight * 1.5 + "px";
  button.style.color = "white";
  button.style.backgroundColor = "#f05940";
  button.style.border = "1px solid #f05940";
  button.style.borderRadius = "15px";
  button.style.fontWeight = "bold";

  button.type = "button";
  button.class = "btn btn-primary";

  button.onclick = function() {
    return window.open("/ws-playground");
  };

  appziDiv.parentElement.appendChild(button);
}

function awaitAppziDiv(resolve) {
  console.log("checking appzi div");
  const divs = Array.from(document.getElementsByTagName("div"));
  const appziDiv = divs.find(function(elem) {
    return elem.id.startsWith("appzi-launch-button");
  });
  if (appziDiv && appziDiv.clientHeight !== 0) {
    const clientHeight = appziDiv.clientHeight;
    const clientWidth = appziDiv.clientWidth;
    console.log("found appzi div!");
    console.log("height", clientHeight);
    console.log("width", clientWidth);
    resolve(appziDiv);
  } else {
    console.log("did not find, recursing");
    setTimeout(function() {
      return awaitAppziDiv(resolve);
    }, 300);
  }
}

function onPageLoad() {
  return new Promise(function(resolve) {
    return awaitAppziDiv(resolve);
  }).then(createWsButton);
}

window.onload = onPageLoad;
