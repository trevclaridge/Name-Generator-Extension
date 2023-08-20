<div align="center">
    <img  alt="Name Generator Extension logo" src="./assets/logos/gears_nge/png/orange_gear_nge.png">
</div>

# Name Generator Extension (NGE)
Name Generator Extension is an offline Google Chrome extension that generates a list of random names of various themes and categories; useful for GMs and players of TTRPGS.
<div align="center">
    <img  alt="Name Generator Extension logo" src="./assets/readme/generate.gif">
</div>

* [Who am I For?](#who-am-i-for)
* [Installing](#installing)
    * [Running in Debug Mode](#running-in-debug-mode)
    * [Adding the extension to the Chrome browser](#adding-the-extension-to-the-chrome-browser)
* [Categories of names currently supported](#categories-of-names-currently-supported)
* [Categories planned](#categories-planned)
* [License](#license)
* [Quick Links & Commands](#quick-linkscommands)

## Who am I for?
Has this ever happened to you or a GM you know?

>"The guard ushers you past the door into the—"
>
>"I ask the guard what his mother's name is."

Chances are this piece of world-shattering lore didn't make it into the planning session. But now we can *pretend* it did with a quick click of a button. Name Generate Extension is for these moments. 

The design philosophy behind NGE incorporates two major points:
1. **Ease-of-use.** Getting a random name should only take one or two clicks, depending on the category you need. None of us want to disrupt the flow of our game; NGE can hopefully eliminate some lag time implicit in ruffling of notes or clicking around by being readily available and always having a name ready to go. 
2. **Extensibility.** We've tried to make it as easy as possible to edit, add, and otherwise contribute new generation patterns. Adding a new category or subcategory of names is as simple as editing a couple of files. There's always more to do to make it even easier (see our [issues page](https://github.com/trevclaridge/Name-Generator-Extension/issues) or [Trello board](https://trello.com/b/CZVh1GwY/nge-issues-features-future)), but the foundation is there and ready to be built on.

## Installing 
NGE is built with the Flutter framework and actively uses its CLI tools; before attempting to work on NGE from your local machine, you'll want to make sure you have the latest version of the Flutter `stable` branch installed. Flutter installation instructions can be found on [Flutter.dev](https://docs.flutter.dev/get-started/install) 

### Running in Debug Mode
I highly recommend using VSCode's Flutter tooling while developing this app; it's what I used the whole way through and makes running the app a matter of pressing a button. [Flutter docs on using VSCode.](https://docs.flutter.dev/tools/vs-code)
From the command line, the steps would amount to:
```
flutter pub get
flutter run
```

### Adding the extension to the Chrome browser
The first thing you'll need to do is build a web version of the app.
```
flutter build web --web-renderer html --csp --no-tree-shake-icons
```


Running that command should add a `build` directory to the root with a `web` subdirectory.
The next steps will be driven from the Chrome browser:
1. Click the three dots in the upper right hand corner of the browser window.
2. Select **More tools** from the context menu.
3. Click **Extensions**. Chrome will direct to page for managing extensions.
4. Switch on **Developer Mode** using the switch in top right corner. A few new buttons should become available under the page header.
5. Click the **Load unpacked** button.
6. Navigate in the file explorer popup to the `build` directory in the Name Generator Extension project directory.
6. Inside the `build` directory, select the `web` directory. Confirm that directory in the popup.

Barring any errors, Name Generator Extension should now be loaded into the browser! It will be running from your hardrive, so there will be a small orange hardrive badge on the logo.

<img  alt="NGE pinned to extensions" src="./assets/readme/extension_card.png">

From here it will act like any other Chrome extension, meaning you can manage it, pin it, and move it around using the extensions menu in Chrome (the puzzle piece icon to the right of the search bar). 

<img  alt="NGE pinned to extensions" src="./assets/readme/searchbar_with_nge_logo.png">

## Categories of names currently supported:
|Category|Subcategories|
|-----------|-----------|
|Fantasy| Elf<br>Dwarf<br>Human|
|Pirate|Sailor<br>Ship|
|Tavern| Fantasy Tavern|
|Town|Real Town<br>Fantasy Town|
|Chaos|BlipBlorp|

## Categories planned

* Dragon names
* Adventurers Guild names
* Thieves Guild names
* Demon/Devil names

## License
Name Generator Extension uses the [MIT License](https://github.com/trevclaridge/Name-Generator-Extension/blob/main/LICENSE.txt).

## Quick Links/Commands
[Our Trello Board](https://trello.com/b/CZVh1GwY/nge-issues-features-future)

[GitHub Pages Deployment](https://trevclaridge.github.io/Name-Generator-Extension)

Command to build web app compatible as Chrome extension: 
```
flutter build web --web-renderer html --csp --no-tree-shake-icons
```
Command to see contents of chrome.storage:
```
chrome.storage.local.get(function(result){console.log(result)})
```
