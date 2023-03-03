function changeIcon(themeString) {
  console.log(window.chrome && chrome.runtime && chrome.runtime.id);
  if (window.chrome && chrome.runtime && chrome.runtime.id) {
    (async () => {
      const response = await chrome.runtime.sendMessage(themeString);
      console.log(response);
    })();
  } else {
    console.log("Hello from the web page");
  }
}
