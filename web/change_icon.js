function changeIcon(themeString) {
    let str = "colored_icons_small/" + themeString + ".png";
    chrome.action.setIcon({ path: str })
}

