chrome.runtime.onInstalled.addListener(function(details) 
  {
    if(details.reason == "install") {
      chrome.storage.local.set({ "themeString" : "orange" }).then(() => {
        console.log("themeString initialized to orange");
        handleCreated();
      }) 
   } else if(details.reason == "update") {
    // do nothing yet
   }
  }
);

chrome.runtime.onMessage.addListener((themeString) => {
    var str = "gears/png/" + themeString + "/" + themeString + "_gear_";
    chrome.action.setIcon({ path: {
      "16" : str + "16.png",  
      "19" :  str + "19.png",
      "32" : str + "32.png", 
      "38" :  str + "38.png"}
    })
    chrome.storage.local.set({ "themeString" : themeString }).then(() => {
      console.log("themeString" + " is set to " +  themeString);
    });
});

chrome.tabs.onCreated.addListener(
    handleCreated
);

function handleCreated() {
    chrome.storage.local.get(["themeString"]).then((result) => {
      var str = "gears/png/" + result.themeString + "/" + result.themeString + "_gear_";
      chrome.action.setIcon({ path: {
        "16" : str + "16.png",  
        "19" :  str + "19.png",
        "32" : str + "32.png", 
        "38" :  str + "38.png"}
      })
      console.log(result.themeString);
      });
}

