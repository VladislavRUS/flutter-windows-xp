'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon-16x16.png": "70259a9645a0a200d1dde5343b6cffe3",
"version.json": "cecfc52db3e9497f1138f8e7f2aa67ea",
"favicon.ico": "7846f0b1872f7941d5bca54f731ee324",
"index.html": "876279707265b24bdd2631a7c500b4c7",
"/": "876279707265b24bdd2631a7c500b4c7",
"android-chrome-192x192.png": "ee6cbe6f354a83a3b4b2d2d30f349801",
"apple-touch-icon.png": "4ce8c46c35330eaf11cf10638a972e09",
"main.dart.js": "a61c81ddcf55c5b2ef62d4a0c31b0058",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"android-chrome-512x512.png": "77a009852049d5ceaf2da17910459cae",
"site.webmanifest": "98a1357fc5df78ccdf83f7b141d90e0d",
"assets/AssetManifest.json": "0824d7e8b1cdeebe80b319b7a81443ac",
"assets/NOTICES": "b5d73562e1687a40f52027fe19c641e1",
"assets/FontManifest.json": "166d8dd6310bd11f38ecfe591d1ac48e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.smcbin": "5a4665f4c76e507b9b02192a90aead22",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/images/start_button.png": "d927ebf20333287353cfcbf941073ac4",
"assets/assets/images/user_avatar.png": "eb41803d3fe2b24ad5ed4a370dd8fec5",
"assets/assets/images/paint_tools.png": "f812ade1d5084f3ed1f8c5060435818e",
"assets/assets/images/background.jpeg": "75a6e28e7be2b27d6e14cb34ffd9fd0e",
"assets/assets/icons/sound.png": "1aadf89695314eeca656575c69c940b0",
"assets/assets/icons/close.svg": "773d0910faa3bbf147ac1e6c62065f69",
"assets/assets/icons/protection.png": "3f36348c076f4130db18fe7a673d2db8",
"assets/assets/icons/device.png": "84f2d909ebde10c2361441f523a75b98",
"assets/assets/applications/paint/tool_ellipsis.png": "d6eaa9eee8151b585c530be0404a7e10",
"assets/assets/applications/paint/tool_zoom.png": "6633b6442419557ff786b662f9b9e7a7",
"assets/assets/applications/paint/tool_pencil.png": "b3b1ec10211a46065ed07a7147c7b0a4",
"assets/assets/applications/paint/tool_select.png": "67cb88f64acc54c91a1b2d28af0fb431",
"assets/assets/applications/paint/tool_square_select.png": "347cbb660cdb27a90223f06f4d00f117",
"assets/assets/applications/paint/tool_spray.png": "4afcf1541954d664258e536d55cfa9f0",
"assets/assets/applications/paint/paint.png": "81c99061fb8f2f6e285d6f0ec85e68ef",
"assets/assets/applications/paint/tool_curve.png": "3da1750471103cb3d070d7aa15f0bca9",
"assets/assets/applications/paint/tool_picker.png": "1c4e97a380c9f8b0a956da3d70947a5b",
"assets/assets/applications/paint/checker.png": "b76d2d127013d38143a54f67daf01bce",
"assets/assets/applications/paint/tool_rounded.png": "2ed3d62f55a7444c1efba7154dbeaacd",
"assets/assets/applications/paint/tool_rect.png": "0bf6b7f06188d68b858b48b45c59a9ba",
"assets/assets/applications/paint/tool_eraser.png": "4de2be11b636d377dd957fd536f5b20c",
"assets/assets/applications/paint/tool_brush.png": "c0db8b6ec74f749999e040519d28f310",
"assets/assets/applications/paint/tool_fill.png": "9ac7f9e1e925a9a414f4eb13d4eaabe3",
"assets/assets/applications/paint/tool_poly.png": "869bf733777f16361658dfb46df98304",
"assets/assets/applications/paint/tool_line.png": "a7eb34b69f1e8d5b379580513c47c0c5",
"assets/assets/applications/paint/tool_text.png": "b37876c0e4c91a41c1ec285960ae5565",
"assets/assets/applications/minesweeper/face/won.png": "b46612afb42a99b4b50ca3bd353e883f",
"assets/assets/applications/minesweeper/face/oh.png": "f3b9ec2a241b26702ca3cee01e1f4e9b",
"assets/assets/applications/minesweeper/face/dead.png": "3a49d6c476603ca5fd10886d42948baf",
"assets/assets/applications/minesweeper/face/smile.png": "c2e7a2a058b9afce29b7aec4b0e39abb",
"assets/assets/applications/minesweeper/field/bomb.png": "52f162da41f3b1cea9c67b9612320795",
"assets/assets/applications/minesweeper/field/flag.png": "7f11c2270a76d63bc18fe57d97416724",
"assets/assets/applications/minesweeper/field/question_mark.png": "81907e6799f3a96e76d55fd2dffae458",
"assets/assets/applications/minesweeper/field/no_bomb.png": "a928304816da772b06a35e9bc874d3d6",
"assets/assets/applications/minesweeper/minesweeper.png": "7e728c352cd7d07ef8ee97c95353a7c9",
"assets/assets/applications/minesweeper/digits/three.png": "4cc03891df5702b0bae226091ff6a8ce",
"assets/assets/applications/minesweeper/digits/six.png": "cfdbbbeb2b2074799a92b56a9c2ee25a",
"assets/assets/applications/minesweeper/digits/two.png": "52d8e8af5e9381a981c4650bcafaecad",
"assets/assets/applications/minesweeper/digits/four.png": "3de60b68143f78b9026c0dcd2b9b4b55",
"assets/assets/applications/minesweeper/digits/zero.png": "868440fd971dd8633cd22cfe000415b9",
"assets/assets/applications/minesweeper/digits/eight.png": "56f790f89f44c8c54b05eaa1be97fe40",
"assets/assets/applications/minesweeper/digits/five.png": "ae631166781b771d56a5930dae859582",
"assets/assets/applications/minesweeper/digits/one.png": "8f54cc08dd80efa966e2b2ad2e080aa0",
"assets/assets/applications/minesweeper/digits/seven.png": "246e38d3af2cf68c49950b4200dc22e4",
"assets/assets/applications/minesweeper/digits/nine.png": "6e2de02c76487c3eb6ae39c03ff7fa4f",
"assets/assets/applications/winamp/ui/playlist/playlist-left-corner.png": "c0e4cf7730f6c2409b3e0c9d7342e334",
"assets/assets/applications/winamp/ui/playlist/playlist-tracks-left.png": "67d65360f4ea1ed4f41c9c81cd188602",
"assets/assets/applications/winamp/ui/playlist/playlist-tracks-right.png": "f3133d2586f438079951688a4b4d48d5",
"assets/assets/applications/winamp/ui/playlist/playlist-fill.png": "113cea9f8257df54df9d20f645808e01",
"assets/assets/applications/winamp/ui/playlist/playlist-scrollbar-handle.png": "e7a09a1e01e48e9caa550a9a1f17b4ea",
"assets/assets/applications/winamp/ui/playlist/playlist-right-corner.png": "2451de3d8dcd647ccdb2847150874191",
"assets/assets/applications/winamp/ui/playlist/playlist-title.png": "dcf3a6a98e201b4c2d46310e78c007e0",
"assets/assets/applications/winamp/ui/header_selected.png": "6a0f4ecab5e5bdc0d396c3c3389a15cd",
"assets/assets/applications/winamp/ui/audio/actions/stop.png": "c9dc033072a1268a81646d6781d35a5d",
"assets/assets/applications/winamp/ui/audio/actions/play_pressed.png": "8c34027a2e2f256489cc3b7139e51f33",
"assets/assets/applications/winamp/ui/audio/actions/repeat_pressed.png": "53b5ddd96a44cc241f056b48d6a32fe3",
"assets/assets/applications/winamp/ui/audio/actions/repeat_selected_pressed.png": "3831d462296fd64c1229070505429db4",
"assets/assets/applications/winamp/ui/audio/actions/next_pressed.png": "8c5100ed9dcd76f1759d3846b9ece5d3",
"assets/assets/applications/winamp/ui/audio/actions/eject_pressed.png": "d93cc76d64d1588d4486bb02e81573bb",
"assets/assets/applications/winamp/ui/audio/actions/eject.png": "45073b6a569cf25ba6667ad0827aff0c",
"assets/assets/applications/winamp/ui/audio/actions/repeat.png": "93f58c20a8b3668c88127660fd98dab9",
"assets/assets/applications/winamp/ui/audio/actions/shuffle_selected_pressed.png": "719df452c13c4b579d9f5a129c5aa7bf",
"assets/assets/applications/winamp/ui/audio/actions/pause_pressed.png": "54a160dddd0d0673fc2424f5aa59cc33",
"assets/assets/applications/winamp/ui/audio/actions/stop_pressed.png": "41bbdf8469bb335c39cae0607195b91a",
"assets/assets/applications/winamp/ui/audio/actions/shuffle_pressed.png": "8caead15e0ab4b6993454798759f3b0e",
"assets/assets/applications/winamp/ui/audio/actions/shuffle.png": "25d37f01541b6404b1f37d8d6a6f61f6",
"assets/assets/applications/winamp/ui/audio/actions/pause.png": "013422edc4dd28fd710ccccccb31573a",
"assets/assets/applications/winamp/ui/audio/actions/repeat_selected.png": "84a499effa634e28c44dee8bd2e8f4c0",
"assets/assets/applications/winamp/ui/audio/actions/previous_pressed.png": "bc449beb1ef6837c67fddc05ec8ee232",
"assets/assets/applications/winamp/ui/audio/actions/next.png": "7ec8a62723893623fa9bf90655cc4b18",
"assets/assets/applications/winamp/ui/audio/actions/play.png": "0a623a16f625361f368e0dc58687d779",
"assets/assets/applications/winamp/ui/audio/actions/previous.png": "e5d5e71eb664abd1a43d35cebce39d7b",
"assets/assets/applications/winamp/ui/audio/actions/shuffle_selected.png": "a4f96a75ded25c595c41d7cc686c5893",
"assets/assets/applications/winamp/ui/audio/audio.png": "36fa06fcdc970a3fc1f562f4ddcd8533",
"assets/assets/applications/winamp/ui/header.png": "0185ec0e2c88c102df4dc29ff1c8bb8d",
"assets/assets/applications/winamp/winamp.png": "c49ba22145b577f0c1e7ae98bccd3067",
"assets/assets/applications/winamp/tracks/lama.mp3": "0d1a82f170ce2feaf514b421b89da91a",
"assets/assets/applications/winamp/tracks/my-universe.mp3": "70e62cdd808ce5b830e2728610ec386e",
"assets/assets/applications/winamp/tracks/relaxing.mp3": "ced43a6de423bf4b6737295ba6327c22",
"assets/assets/applications/winamp/tracks/risk.mp3": "2a5660e630379e75c98d3f1675918dc5",
"assets/assets/applications/winamp/tracks/floating-abstract.mp3": "6e41d66edb01c1e3b71f7f23655028fe",
"assets/assets/applications/winamp/tracks/eco-technology.mp3": "7b5c02580a4cc0ab77d4ff7e62d2cd14",
"assets/assets/applications/winamp/tracks/abstract-fashion-pop.mp3": "f2f07592a43136d8c2a37f8352fc1798",
"assets/assets/applications/ie/ie.png": "a752647ace92e5741ac3ab34860dc258",
"assets/assets/applications/notepad/notepad.png": "112f19d5980ccd944941790f2580aa1a",
"assets/assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "bd8fb30c6473177cfb9a5544c9ad8fdb",
"assets/assets/fonts/tahoma/Tahoma-Regular.ttf": "ef272a582d97cd5b59e00526f0694351",
"favicon-32x32.png": "09869c46af18ae8d56e082039dfe9d7d",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
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
