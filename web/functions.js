function changeIcon(themeString) {
  console.log(typeof chrome);
  if (typeof chrome !== "undefined") {
    (async () => {
      const response = await chrome.runtime.sendMessage(themeString);
      console.log(response);
    })();
  } else {
    console.log("Hello from the web page");
  }
}
