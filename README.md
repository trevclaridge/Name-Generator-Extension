# Name Generator Extension (NGE)

This is a chrome extension that generates a list of random names of various themes and categories; useful for GMs and DMs of TTRPGS.

## Categories of names currently supported:
* Elf names (with Elven clan names)
* Dwarf names
* Human names (gathered from real human names, retrievable as masculine, feminine, or either/gender-neutral)
* Real Town names
* Fantasy Town names
* Pirate names (with nicknames)
* Pirate Ship Names
* Tavern names
* Blipblorp names 

## Categories planned

* Dragon names
* Adventurers Guild names
* Thieves Guild names
* Demon/Devil names

## Our Trello Board
https://trello.com/b/CZVh1GwY/nge-issues-features-future

Command to build web app compatible as Chrome extension: 
```
flutter build web --web-renderer html --csp
```
Command to see chrome.storage:
```
chrome.storage.local.get(function(result){console.log(result)})
```
