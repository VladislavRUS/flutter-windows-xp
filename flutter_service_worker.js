'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "cecfc52db3e9497f1138f8e7f2aa67ea",
"index.html": "e5d6255454c71951805c685b555eed7a",
"/": "e5d6255454c71951805c685b555eed7a",
"main.dart.js": "bac9da5bf65a39da4110503ac0db54ff",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7512c5935cb8934ea89bb81a20363ab2",
"assets/AssetManifest.json": "dc8989424b2fbaf4ea5fbacbb8dcd2bf",
"assets/NOTICES": "9dfa4dd43f6ed591f9cb96355655835b",
"assets/FontManifest.json": "4ca7d5a993a7725e79aaf186239218aa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/start_button.png": "d927ebf20333287353cfcbf941073ac4",
"assets/assets/images/user_avatar.png": "eb41803d3fe2b24ad5ed4a370dd8fec5",
"assets/assets/images/paint_tools.png": "f812ade1d5084f3ed1f8c5060435818e",
"assets/assets/images/background.jpeg": "75a6e28e7be2b27d6e14cb34ffd9fd0e",
"assets/assets/icons/sound.png": "1aadf89695314eeca656575c69c940b0",
"assets/assets/icons/close.svg": "773d0910faa3bbf147ac1e6c62065f69",
"assets/assets/icons/protection.png": "3f36348c076f4130db18fe7a673d2db8",
"assets/assets/icons/device.png": "84f2d909ebde10c2361441f523a75b98",
"assets/assets/fonts/Montserrat-Medium.ttf": "b3ba703c591edd4aad57f8f4561a287b",
"assets/assets/fonts/Montserrat-Bold.ttf": "1f023b349af1d79a72740f4cc881a310",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "fb428a00b04d4e93deb4d7180814848b",
"assets/assets/fonts/Montserrat-ExtraBold.ttf": "bd8fb30c6473177cfb9a5544c9ad8fdb",
"assets/assets/fonts/Montserrat-Black.ttf": "9c1278c56276b018109f295c1a751a69",
"assets/assets/fonts/Montserrat-Regular.ttf": "3fe868a1a9930b59d94d2c1d79461e3c",
"assets/assets/apps/paint/tool_ellipsis.png": "d6eaa9eee8151b585c530be0404a7e10",
"assets/assets/apps/paint/tool_zoom.png": "6633b6442419557ff786b662f9b9e7a7",
"assets/assets/apps/paint/tool_pencil.png": "b3b1ec10211a46065ed07a7147c7b0a4",
"assets/assets/apps/paint/tool_select.png": "67cb88f64acc54c91a1b2d28af0fb431",
"assets/assets/apps/paint/tool_square_select.png": "347cbb660cdb27a90223f06f4d00f117",
"assets/assets/apps/paint/tool_spray.png": "4afcf1541954d664258e536d55cfa9f0",
"assets/assets/apps/paint/paint.png": "81c99061fb8f2f6e285d6f0ec85e68ef",
"assets/assets/apps/paint/tool_curve.png": "3da1750471103cb3d070d7aa15f0bca9",
"assets/assets/apps/paint/tool_picker.png": "1c4e97a380c9f8b0a956da3d70947a5b",
"assets/assets/apps/paint/checker.png": "b76d2d127013d38143a54f67daf01bce",
"assets/assets/apps/paint/tool_rounded.png": "2ed3d62f55a7444c1efba7154dbeaacd",
"assets/assets/apps/paint/tool_rect.png": "0bf6b7f06188d68b858b48b45c59a9ba",
"assets/assets/apps/paint/tool_eraser.png": "4de2be11b636d377dd957fd536f5b20c",
"assets/assets/apps/paint/tool_brush.png": "c0db8b6ec74f749999e040519d28f310",
"assets/assets/apps/paint/tool_fill.png": "9ac7f9e1e925a9a414f4eb13d4eaabe3",
"assets/assets/apps/paint/tool_poly.png": "869bf733777f16361658dfb46df98304",
"assets/assets/apps/paint/tool_line.png": "a7eb34b69f1e8d5b379580513c47c0c5",
"assets/assets/apps/paint/tool_text.png": "b37876c0e4c91a41c1ec285960ae5565",
"assets/assets/apps/minesweeper/face/won.png": "b46612afb42a99b4b50ca3bd353e883f",
"assets/assets/apps/minesweeper/face/oh.png": "f3b9ec2a241b26702ca3cee01e1f4e9b",
"assets/assets/apps/minesweeper/face/dead.png": "3a49d6c476603ca5fd10886d42948baf",
"assets/assets/apps/minesweeper/face/smile.png": "c2e7a2a058b9afce29b7aec4b0e39abb",
"assets/assets/apps/minesweeper/field/bomb.png": "52f162da41f3b1cea9c67b9612320795",
"assets/assets/apps/minesweeper/field/flag.png": "7f11c2270a76d63bc18fe57d97416724",
"assets/assets/apps/minesweeper/field/question_mark.png": "81907e6799f3a96e76d55fd2dffae458",
"assets/assets/apps/minesweeper/field/no_bomb.png": "a928304816da772b06a35e9bc874d3d6",
"assets/assets/apps/minesweeper/minesweeper.png": "7e728c352cd7d07ef8ee97c95353a7c9",
"assets/assets/apps/minesweeper/digits/three.png": "4cc03891df5702b0bae226091ff6a8ce",
"assets/assets/apps/minesweeper/digits/six.png": "cfdbbbeb2b2074799a92b56a9c2ee25a",
"assets/assets/apps/minesweeper/digits/two.png": "52d8e8af5e9381a981c4650bcafaecad",
"assets/assets/apps/minesweeper/digits/four.png": "3de60b68143f78b9026c0dcd2b9b4b55",
"assets/assets/apps/minesweeper/digits/zero.png": "868440fd971dd8633cd22cfe000415b9",
"assets/assets/apps/minesweeper/digits/eight.png": "56f790f89f44c8c54b05eaa1be97fe40",
"assets/assets/apps/minesweeper/digits/five.png": "ae631166781b771d56a5930dae859582",
"assets/assets/apps/minesweeper/digits/one.png": "8f54cc08dd80efa966e2b2ad2e080aa0",
"assets/assets/apps/minesweeper/digits/seven.png": "246e38d3af2cf68c49950b4200dc22e4",
"assets/assets/apps/minesweeper/digits/nine.png": "6e2de02c76487c3eb6ae39c03ff7fa4f",
"assets/assets/apps/notepad/notepad.png": "112f19d5980ccd944941790f2580aa1a",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
