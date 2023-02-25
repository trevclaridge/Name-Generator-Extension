function changeIcon(themeString) {
  (async () => {
    const response = await chrome.runtime.sendMessage(themeString);
    console.log(response);
  })();
}
