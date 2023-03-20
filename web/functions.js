function changeIcon(themeString) {
  if (window.chrome && chrome.runtime && chrome.runtime.id) {
    (async () => {
      await chrome.runtime.sendMessage(themeString);
    })();
  } else {
    var link = document.querySelector("link[rel~='icon']");
    if (!link) {
      link = document.createElement('link');
      link.rel = 'icon';
      document.head.appendChild(link);
    }
    link.href = "gears/png/" + themeString + "/" + themeString + "_gear_1024.png";;
  }
}
