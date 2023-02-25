changeIcon("green");

chrome.tabs.onCreated.addListener(
    handleCreated
  );

  function handleCreated(tab) {
    var themeString = chrome.storage.local.get(["themeString"]).then((result) => {
       changeIcon(themeString);
      });
    console.log(tab.id);
  }

  function changeIcon(themeString) {
    let str = "colored_icons_small/" + themeString + ".png";
    chrome.action.setIcon({ path: str })
    chrome.storage.local.set({ "themeString" : themeString }).then(() => {
        console.log("themeString" + " is set to " +  themeString);
      });
}




// chrome.storage.local.set({ "trevor" : "awesome" }).then(() => {
//     console.log("Value is set to " +  "awesome");
//   });

// chrome.storage.local.get(["trevor"]).then((result) => {
//     console.log("trevor is " + result.trevor);
//   });

// chrome.storage.sync.get(["flutter.nge_user_settings"]).then((result) => {
//    console.log(result.flutter.nge_user_settings);
   
   
//     // if (typeof result === 'object' && result !== null) {
//     //     console.log("Result: " + String(result));
//     // }
//     // console.log("Result: " + String(result));
//     // var userSettings = JSON.parse(result);
//     // var themeColor = userSettings["color_theme"];
//     // console.log("Theme color: " + themeColor);
//   });



