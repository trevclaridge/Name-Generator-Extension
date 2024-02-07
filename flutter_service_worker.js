'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"main.dart.js": "9218fd4a0800ae9260ed3ad6334dd63e",
"favicon.ico": "0d0f26823d60894f8ef3345d78294aea",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"index.html": "f2f8fd208b9dde742467057617c2ba59",
"/": "f2f8fd208b9dde742467057617c2ba59",
"version.json": "1a81d91e584196872575290ddc314e0f",
"background.js": "f6ab22ef5ed24bac4fd83e361bea2383",
"functions.js": "d6ca94ab18c8883a8ff08dd44f20cf18",
"assets/AssetManifest.bin.json": "4f55966f7a5e208cc1d4e087890908cf",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5ac99533bd9dc46227434b4853c3e532",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "093d2cde7075fcffb24ab215668d0da2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "1e17b1ec3152f29bf783bd42db8b6023",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.bin": "4d27f2d4c84e3c0bca0d053092741e47",
"assets/AssetManifest.json": "2cd369d3f5f18c4af16283af259d6bd7",
"assets/FontManifest.json": "19f54984696ce3e85020f8d8cdb527c7",
"assets/NOTICES": "68a8ed418309c01c446a9ebdd9d91236",
"assets/assets/fonts/Lobster/Lobster-Regular.ttf": "c3191f3b933ae0bd46335e178744326e",
"assets/assets/fonts/Inter/Inter-Regular.ttf": "079af0e2936ccb99b391ddc0bbb73dcb",
"assets/assets/icons/svg/mushroom.svg": "24e042ce4d4bc84fc33259f26bdda2a2",
"assets/assets/icons/svg/mess.svg": "0d5b83083d3c4930752ee3e21521055e",
"assets/assets/icons/svg/masculine.svg": "7ce922ad8c62a7fc687076298f81878b",
"assets/assets/icons/svg/dice.svg": "3f57bcd25d0f97d28cdad4e56ff5a1b3",
"assets/assets/icons/svg/hyphen.svg": "3a3717be694510f8c8426a8ba0c494f3",
"assets/assets/icons/svg/saloon.svg": "872af9173972517f76fe30e7a26ad0ba",
"assets/assets/icons/svg/d6.svg": "a1082b150f15f4d5de14307b329938c8",
"assets/assets/icons/svg/starfish_pirate.svg": "6bd889b697f349ade204e523c0d49832",
"assets/assets/icons/svg/warrior.svg": "c2ecc8b5bec64eb42a506176b333db94",
"assets/assets/icons/svg/error.svg": "af77b943eeb28bd78980ed44f3b9b8e7",
"assets/assets/icons/svg/d4.svg": "b2605e7b67fdbc2f7dcda64680112fdc",
"assets/assets/icons/svg/d10.svg": "b27333c72890ef1918bfd5f351123b3f",
"assets/assets/icons/svg/dwarf.svg": "84de7b1c638d92d55ac8f29cdd1a7506",
"assets/assets/icons/svg/d12.svg": "c3430752a2f70d6a5987c1f1a255bf75",
"assets/assets/icons/svg/d20.svg": "0dd7e1aa9c2b5e5e4aa1e3de4d1ffbc1",
"assets/assets/icons/svg/wizard.svg": "2ad3b304bfc4cdadccd31c2903c6f363",
"assets/assets/icons/svg/modron.svg": "fd7f547ec209763f271d7d103c8b9aa4",
"assets/assets/icons/svg/delete.svg": "b6d667ed1d7dcdf8a566f08bcbd6da14",
"assets/assets/icons/svg/skull_crossbones.svg": "8cb4fd50bea3a370c47bda8b667d6a4a",
"assets/assets/icons/svg/windmill.svg": "29c0b8a709fb9f83643d47bcce280a73",
"assets/assets/icons/svg/skyscraper.svg": "2a71351b2fbd4c3a83ba121d44a3e847",
"assets/assets/icons/svg/mars.svg": "77d1ad8fa2ab50597758e8006e052627",
"assets/assets/icons/svg/book.svg": "a52b85c3ad1b6af3a901466f92851f23",
"assets/assets/icons/svg/rings.svg": "2e2ccef84c6c37019a8b3d594e04869d",
"assets/assets/icons/svg/pirate_ship.svg": "9256f2aedf795dd8c9b8e711153aaaa4",
"assets/assets/icons/svg/elf.svg": "0156d55b3e227ba933f65274926af746",
"assets/assets/icons/svg/d8.svg": "0a65c55cd4cf10e77fa770c8777252a0",
"assets/assets/icons/svg/beer.svg": "b39d0615c3e67bd386fe8b6b5da3d9e1",
"assets/assets/icons/svg/venus.svg": "fd64d098d137d715e84bbd26da1ef918",
"assets/assets/icons/svg/feminine.svg": "03b70e401e8f83ef7ce787156ec81f21",
"assets/assets/icons/svg/village.svg": "6bfb55cdbc53d058e995fff5f600c81b",
"assets/assets/icons/png/elf.png": "fb92cc6ea448fb2c79735cac543ae811",
"assets/assets/icons/png/modron.png": "10b44ae012f82ad85b05adb9c7908a46",
"assets/assets/icons/png/beer.png": "f6c1d2bb904c03e9a5da98cf6bc3d557",
"assets/assets/icons/png/mess.png": "16e1ea45b0e538643a1b50fb54ba22dc",
"assets/assets/icons/png/skyscraper.png": "2b28be3335bfa603acd3537e01c2b5ef",
"assets/assets/icons/png/wizard.png": "5fa246f5b947174d5655a02f74e757b0",
"assets/assets/icons/png/feminine.png": "95655148a86ad8f7e1118e41269e2a87",
"assets/assets/icons/png/windmill.png": "6671d911938ec242b4072d005f431b9a",
"assets/assets/icons/png/pirate_ship.png": "985696b0fcfc79a926f750e9c507f276",
"assets/assets/icons/png/dice.png": "ba03dd0c557315f074898811731f44bb",
"assets/assets/icons/png/saloon.png": "d7fcbdfb36f5a0244fe3f195f09a6faf",
"assets/assets/icons/png/dwarf.png": "e3fd58887c15e10b09ff050769febce1",
"assets/assets/icons/png/starfish_pirate.png": "55a5a3a58018d3db047e4f84e1a4b1cb",
"assets/assets/icons/png/skull_crossbones.png": "6d267756b376cb4cb371cee7ae2a2420",
"assets/assets/icons/png/rings.png": "082d3f52fdfee8a61c7181c8c26f9b0d",
"assets/assets/icons/png/village.png": "a26c7a5c5bc7e4e7c976b4579bdd3a12",
"assets/assets/icons/png/warrior.png": "702418feb9caae694fc4e92b3f63cef5",
"assets/assets/icons/png/hyphen.png": "e26911330752abb174f4c02de82accb4",
"assets/assets/icons/png/masculine.png": "47b814f2c60a49c7ff41482867f6b9b5",
"assets/assets/icons/png/error.png": "775bc248fcb45179692bc5209e13faeb",
"assets/assets/icons/png/mushroom.png": "80f0c4a53a5d5b011ea6f0075c61aa47",
"assets/assets/logos/gears/svg/black_gear.svg": "de6de3d043aaa1a2adffcbce25d76263",
"assets/assets/logos/gears/svg/grey_gear.svg": "efdc5c971b0899c4d6bca65667434d8f",
"assets/assets/logos/gears/svg/blue_gear.svg": "b6482fadc2800106cf1b80090437836a",
"assets/assets/logos/gears/svg/purple_gear.svg": "d4d76683ed80b9bd48da4f47f6ce72ab",
"assets/assets/logos/gears/svg/green_gear.svg": "891c682a92f75f35099063fbb25bd946",
"assets/assets/logos/gears/svg/orange_gear.svg": "ae3a4646a824580d727dd9be68b631cf",
"assets/assets/logos/gears/png/blue/blue_gear_16.png": "56d67534893844b8262939bb45848cbe",
"assets/assets/logos/gears/png/blue/blue_gear_38.png": "f9a2aeb42bd65be6142ae825e030ef33",
"assets/assets/logos/gears/png/blue/blue_gear_24.png": "5ae739ad8b2ec5cd48b488424ba423f8",
"assets/assets/logos/gears/png/blue/blue_gear_32.png": "ed2dd03b1f76cf8ed71d70954ca03686",
"assets/assets/logos/gears/png/blue/blue_gear_128.png": "ab3f39243af18f293bed63b9cf2d2569",
"assets/assets/logos/gears/png/blue/blue_gear_1024.png": "681aa1d9a144cb386ce000c127beed3f",
"assets/assets/logos/gears/png/blue/blue_gear_48.png": "82a1b582c18a4dc8f6dc09e888e2a30f",
"assets/assets/logos/gears/png/blue/blue_gear_19.png": "a2a6fa8f1d35b078da4c987c8d0c245c",
"assets/assets/logos/gears/png/grey/grey_gear_38.png": "1217fab75dc3748b718be6575be0316e",
"assets/assets/logos/gears/png/grey/grey_gear_1024.png": "7e62445b455f840e793f2a00ed503e0d",
"assets/assets/logos/gears/png/grey/grey_gear_48.png": "1217fab75dc3748b718be6575be0316e",
"assets/assets/logos/gears/png/grey/grey_gear_16.png": "f28049c3b22c3c5e8de5776507ba19aa",
"assets/assets/logos/gears/png/grey/grey_gear_32.png": "f26c1a4efdb45e54be8a49711f566152",
"assets/assets/logos/gears/png/grey/grey_gear_19.png": "d4158628a8384d01741a62ad0d960a0b",
"assets/assets/logos/gears/png/grey/grey_gear_24.png": "7cf8ecee4417327ed89944215152217e",
"assets/assets/logos/gears/png/grey/grey_gear_128.png": "0e43b564cf1be476e980261af8d83bee",
"assets/assets/logos/gears/png/black/black_gear_128.png": "b7665929f536e41475ae36131d170e85",
"assets/assets/logos/gears/png/black/black_gear_38.png": "cef3d29c38f355f66a58489d54e87ba1",
"assets/assets/logos/gears/png/black/black_gear_24.png": "9d8f892e11eef173d4c73ca654bb8cbc",
"assets/assets/logos/gears/png/black/black_gear_16.png": "3728e78d41dec5e70306c2d4cb0eccb0",
"assets/assets/logos/gears/png/black/black_gear_48.png": "553babaee9ad1e6c84c2a8ce0a74e3c1",
"assets/assets/logos/gears/png/black/black_gear_32.png": "68617add9c5d850eda4079dbc9233ae2",
"assets/assets/logos/gears/png/black/black_gear_1024.png": "09aa86af92d923e6f4c3ead9eb0ecd6a",
"assets/assets/logos/gears/png/black/black_gear_19.png": "2e2e3eb570fe9f6db48fa934b9ae3b94",
"assets/assets/logos/gears/png/orange/orange_gear_16.png": "03601a0cd101f019300d8fa07800b20b",
"assets/assets/logos/gears/png/orange/orange_gear_19.png": "b6f26e32ca5f0d676c4793e08e495388",
"assets/assets/logos/gears/png/orange/orange_gear_38.png": "f38f6cabf53147efde064eefbf49defd",
"assets/assets/logos/gears/png/orange/orange_gear_1024.png": "b9be27d181a31cd89b97ddc87782a82e",
"assets/assets/logos/gears/png/orange/orange_gear_128.png": "8fe06cc8940049df1ea6304dc7900333",
"assets/assets/logos/gears/png/orange/orange_gear_48.png": "5ea1ab081199f7d147ed3343dd7548b5",
"assets/assets/logos/gears/png/orange/orange_gear_32.png": "ae56c4bc048708a1aad9ec7f63a01c83",
"assets/assets/logos/gears/png/orange/orange_gear_24.png": "d3007d5203e016679909ec62515eaa25",
"assets/assets/logos/gears/png/purple/purple_gear_16.png": "0e040595baa6c56d05a3de0660cde336",
"assets/assets/logos/gears/png/purple/purple_gear_128.png": "f444bab8ef497c79804df21d7bc7b383",
"assets/assets/logos/gears/png/purple/purple_gear_19.png": "4a17923a9a9496fb228d1a48d6c466ba",
"assets/assets/logos/gears/png/purple/purple_gear_48.png": "9534a1de7377126764e7f3a71d7aaee2",
"assets/assets/logos/gears/png/purple/purple_gear_38.png": "2df73edf09ee26fadf0642a34d37aba2",
"assets/assets/logos/gears/png/purple/purple_gear_1024.png": "e448d2ed0b38425690491d87f122f8d8",
"assets/assets/logos/gears/png/purple/purple_gear_32.png": "52c0495a825ea253420a0a306f32d7dc",
"assets/assets/logos/gears/png/purple/purple_gear_24.png": "d5aad7cca79fa650c0e4c2d601b9db2c",
"assets/assets/logos/gears/png/green/green_gear_38.png": "515e0e81803deb66af58474506264dd6",
"assets/assets/logos/gears/png/green/green_gear_1024.png": "1027859e7bae3f397f0594c37a19dd77",
"assets/assets/logos/gears/png/green/green_gear_48.png": "515e0e81803deb66af58474506264dd6",
"assets/assets/logos/gears/png/green/green_gear_128.png": "5158b47c7864ca6f6f7da383fcb0e7ee",
"assets/assets/logos/gears/png/green/green_gear_24.png": "2abbddabafce71e4c6044fe9d6190e9f",
"assets/assets/logos/gears/png/green/green_gear_19.png": "489749ffb855909ee03f00c219ef2f2b",
"assets/assets/logos/gears/png/green/green_gear_16.png": "f0be70658bfccf6a990b771bb47a2dc8",
"assets/assets/logos/gears/png/green/green_gear_32.png": "e5e1a1fd5af2d3676a7f4b82aba1aa76",
"icons/svg/black_gear.svg": "d1ef4bc5ef9f56143818ecd7ba35dc32",
"icons/svg/grey_gear.svg": "074480d8ef6e4934d8fb705926a722c7",
"icons/svg/blue_gear.svg": "93add7d17c48cd9e6d6e2a0a25d55417",
"icons/svg/purple_gear.svg": "d8d781929ea6828b3f89362b20caf00f",
"icons/svg/green_gear.svg": "6b6ce88eed529e3bc7e855ebb00844fd",
"icons/svg/orange_gear.svg": "eb6ed693125e60131b8bd0464b11d7bb",
"icons/png/blue/blue_gear_16.png": "56d67534893844b8262939bb45848cbe",
"icons/png/blue/blue_gear_38.png": "f9a2aeb42bd65be6142ae825e030ef33",
"icons/png/blue/blue_gear_24.png": "5ae739ad8b2ec5cd48b488424ba423f8",
"icons/png/blue/blue_gear_32.png": "ed2dd03b1f76cf8ed71d70954ca03686",
"icons/png/blue/blue_gear_128.png": "ab3f39243af18f293bed63b9cf2d2569",
"icons/png/blue/blue_gear_1024.png": "681aa1d9a144cb386ce000c127beed3f",
"icons/png/blue/blue_gear_48.png": "82a1b582c18a4dc8f6dc09e888e2a30f",
"icons/png/blue/blue_gear_19.png": "a2a6fa8f1d35b078da4c987c8d0c245c",
"icons/png/grey/grey_gear_38.png": "1217fab75dc3748b718be6575be0316e",
"icons/png/grey/grey_gear_1024.png": "7e62445b455f840e793f2a00ed503e0d",
"icons/png/grey/grey_gear_48.png": "1217fab75dc3748b718be6575be0316e",
"icons/png/grey/grey_gear_16.png": "f28049c3b22c3c5e8de5776507ba19aa",
"icons/png/grey/grey_gear_32.png": "f26c1a4efdb45e54be8a49711f566152",
"icons/png/grey/grey_gear_19.png": "d4158628a8384d01741a62ad0d960a0b",
"icons/png/grey/grey_gear_24.png": "7cf8ecee4417327ed89944215152217e",
"icons/png/grey/grey_gear_128.png": "0e43b564cf1be476e980261af8d83bee",
"icons/png/black/black_gear_128.png": "b7665929f536e41475ae36131d170e85",
"icons/png/black/black_gear_38.png": "cef3d29c38f355f66a58489d54e87ba1",
"icons/png/black/black_gear_24.png": "9d8f892e11eef173d4c73ca654bb8cbc",
"icons/png/black/black_gear_16.png": "3728e78d41dec5e70306c2d4cb0eccb0",
"icons/png/black/black_gear_48.png": "553babaee9ad1e6c84c2a8ce0a74e3c1",
"icons/png/black/black_gear_32.png": "68617add9c5d850eda4079dbc9233ae2",
"icons/png/black/black_gear_1024.png": "09aa86af92d923e6f4c3ead9eb0ecd6a",
"icons/png/black/black_gear_19.png": "2e2e3eb570fe9f6db48fa934b9ae3b94",
"icons/png/orange/orange_gear_16.png": "03601a0cd101f019300d8fa07800b20b",
"icons/png/orange/orange_gear_19.png": "b6f26e32ca5f0d676c4793e08e495388",
"icons/png/orange/orange_gear_38.png": "f38f6cabf53147efde064eefbf49defd",
"icons/png/orange/orange_gear_1024.png": "b9be27d181a31cd89b97ddc87782a82e",
"icons/png/orange/orange_gear_128.png": "8fe06cc8940049df1ea6304dc7900333",
"icons/png/orange/orange_gear_48.png": "5ea1ab081199f7d147ed3343dd7548b5",
"icons/png/orange/orange_gear_32.png": "ae56c4bc048708a1aad9ec7f63a01c83",
"icons/png/orange/orange_gear_24.png": "d3007d5203e016679909ec62515eaa25",
"icons/png/purple/purple_gear_16.png": "0e040595baa6c56d05a3de0660cde336",
"icons/png/purple/purple_gear_128.png": "f444bab8ef497c79804df21d7bc7b383",
"icons/png/purple/purple_gear_19.png": "4a17923a9a9496fb228d1a48d6c466ba",
"icons/png/purple/purple_gear_48.png": "9534a1de7377126764e7f3a71d7aaee2",
"icons/png/purple/purple_gear_38.png": "2df73edf09ee26fadf0642a34d37aba2",
"icons/png/purple/purple_gear_1024.png": "e448d2ed0b38425690491d87f122f8d8",
"icons/png/purple/purple_gear_32.png": "52c0495a825ea253420a0a306f32d7dc",
"icons/png/purple/purple_gear_24.png": "d5aad7cca79fa650c0e4c2d601b9db2c",
"icons/png/green/green_gear_38.png": "515e0e81803deb66af58474506264dd6",
"icons/png/green/green_gear_1024.png": "1027859e7bae3f397f0594c37a19dd77",
"icons/png/green/green_gear_48.png": "515e0e81803deb66af58474506264dd6",
"icons/png/green/green_gear_128.png": "5158b47c7864ca6f6f7da383fcb0e7ee",
"icons/png/green/green_gear_24.png": "2abbddabafce71e4c6044fe9d6190e9f",
"icons/png/green/green_gear_19.png": "489749ffb855909ee03f00c219ef2f2b",
"icons/png/green/green_gear_16.png": "f0be70658bfccf6a990b771bb47a2dc8",
"icons/png/green/green_gear_32.png": "e5e1a1fd5af2d3676a7f4b82aba1aa76",
"manifest.json": "45bf1075df445899bc10db7c2b976a45"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
