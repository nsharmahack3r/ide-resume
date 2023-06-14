'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "db367d8e1e321b0acaee1f0e978fe9c4",
"index.html": "5714d304df282b6174c86aebaf8d4722",
"/": "5714d304df282b6174c86aebaf8d4722",
"main.dart.js": "903065a5eed2c737cc33a7969da48f4f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "886c63706852da9ef240b01a97b652d1",
"icons/Icon-192.png": "5814c3edf529d8db58f9b27e9dfab341",
"icons/Icon-maskable-192.png": "5814c3edf529d8db58f9b27e9dfab341",
"icons/Icon-maskable-512.png": "14d4654dc79663972234f77e5ec9968a",
"icons/Icon-512.png": "14d4654dc79663972234f77e5ec9968a",
"manifest.json": "2201235274e09499c7835935dbcf72ed",
"assets/AssetManifest.json": "cd7678af2c1e21223cb419e2ff21b2a0",
"assets/NOTICES": "fd5c9f79031f192adc0baaab06ea1b60",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.smcbin": "b76e5fe0d33a8c36506c385714525b04",
"assets/fonts/MaterialIcons-Regular.otf": "08f8d94bfc316422aa29514f8b42eb00",
"assets/assets/images/speaker_showcase.jpeg": "70131a365d4d7617643c118de579985c",
"assets/assets/images/unitron_1.jpeg": "4fb0d77058e5a7e1a75009e633ae7060",
"assets/assets/images/profile_image.jpg": "240e25279edaf57fa4c29d6ee588d2a1",
"assets/assets/images/app_icon.png": "638610dcbd530733fa84ac51551bbb48",
"assets/assets/images/unitron_6.jpeg": "71d3c332939df69f4b855c1dfa15acf1",
"assets/assets/images/hive_8_logo.png": "4ee6e670c47d0f64f8e664513d6c2598",
"assets/assets/images/dart_bucket_showcase_2.png": "ad8c9f00b18e74ba4e590a6eeef17115",
"assets/assets/images/dart_bucket_showcase_1.png": "918b0fb04074a76bdebbcfb3924d896c",
"assets/assets/images/devfest_app_showcase_1.jpeg": "2e7d41c478af8859b188ae70ce295a69",
"assets/assets/images/devfest_app_showcase_2.jpeg": "44972d3496fc858ac118c23226aea981",
"assets/assets/images/unitron_4.jpeg": "6567c130ec408469ce71ba4c0f22f9d2",
"assets/assets/images/devfest_logo.png": "09432f1bd0c09ad94444f812532c4bd9",
"assets/assets/images/plane_icon.png": "b409ea206fb5279eaac3a64d3fcad2c3",
"assets/assets/images/unitron_5.jpeg": "b1d8aecd5e1d29eef358db2395a4acfe",
"assets/assets/images/unitron_logo.png": "d38a3220d4f7b96c3aafedafd415a8e2",
"assets/assets/images/tutorang_logo.png": "2d2e357b0edc8e449e8f326e73ad4b2a",
"assets/assets/images/dart_bucket_icon.png": "07847da976995c8cd9cfedfd4d8f191d",
"assets/assets/images/unitron_2.jpeg": "0717be51deb379bc77e6287fd5004582",
"assets/assets/images/unitron_3.jpeg": "622c5fcf4bd0e4d442e48aad34ab4691",
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
