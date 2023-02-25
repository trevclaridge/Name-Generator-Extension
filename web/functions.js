function changeIcon(themeString) {
    let str = "colored_icons_small/" + themeString + ".png";
    chrome.action.setIcon({ path: str })
    chrome.storage.local.set({ "themeString" : themeString }).then(() => {
        console.log("" + " is set to " +  themeString);
      });
}

// function setSyncValue(key, value) {
//     console.log("Setting Key: " + key + " and Value: " + value);
//     chrome.storage.sync.set({ key : value }).then(() => {
//         console.log(key + " is set to " +  value);
//       });
// }

// function getSyncPair(key) {
//     console.log("Get Key: " + key);
//     chrome.storage.sync.get([key]).then((result) => {
//         console.log("trevor is " + result.key);
//       });
//     return result.key;
// }



