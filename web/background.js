chrome.runtime.onInstalled.addListener(function(details) 
  {
    if(details.reason == "install") {
      chrome.storage.local.set({ "themeString" : "orange" }).then(() => {
        console.log("themeString initialized to orange");
      }) 
   } else if(details.reason == "update") {
    // do nothing yet
   }
  }
);

chrome.runtime.onMessage.addListener((themeString) => {
    var str = "colored_icons_small/" + themeString + ".png";
    chrome.action.setIcon({ path: str })
    chrome.storage.local.set({ "themeString" : themeString }).then(() => {
      console.log("themeString" + " is set to " +  themeString);
    });
});

chrome.tabs.onCreated.addListener(
    handleCreated
);

function handleCreated(tab) {
    chrome.storage.local.get(["themeString"]).then((result) => {
      var str = "colored_icons_small/" + result.themeString + ".png";
      chrome.action.setIcon({ path: str });
      console.log(tab.id + " " + result.themeString);
      });
}

