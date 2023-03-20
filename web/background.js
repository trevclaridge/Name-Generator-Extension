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
    var str = "gears/png/" + themeString + "/" + themeString + "_gear_19.png";
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
      var str = "gears/png/" + result.themeString + "/" + result.themeString + "_gear_19.png";
      chrome.action.setIcon({ path: str });
      console.log(result.themeString);
      });
}

