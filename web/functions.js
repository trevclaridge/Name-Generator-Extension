function changeIcon(themeString) {
  if (typeof chrome !== "undefined") {
    (async () => {
      const response = await chrome.runtime.sendMessage(themeString);
      console.log(response);
    })();
  } else {
    console.log("Hello from the web page");
  }
}
