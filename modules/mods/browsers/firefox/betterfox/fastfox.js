// Fastfox
// Version 152

// GENERAL
user_pref("gfx.content.skia-font-cache-size", 20); // 20 MB; default=5; Chrome=20
user_pref("content.notify.interval", 100000); // (.10s); default=120000 (.12s)
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand", true);

// GFX RENDERING TWEAKS
user_pref("gfx.webrender.all", true); // enables WR + additional features
user_pref("gfx.webrender.precache-shaders", true); // longer initial startup time
user_pref("gfx.webrender.compositor", true); // DEFAULT WINDOWS macOS
user_pref("gfx.webrender.layer-compositor", true);
user_pref("media.wmf.zero-copy-nv12-textures-force-enabled", true);
user_pref("gfx.canvas.accelerated.cache-size", 512); // default=256; Chrome=512; max=2048

// JAVASCRIPT
user_pref("javascript.options.baselinejit.threshold", 50); // default=100
user_pref("javascript.options.concurrent_multiprocess_gcs.cpu_divisor", 2); // default=4

// DISK CACHE
user_pref("browser.cache.disk.preload_chunk_count", 8); // default=4
user_pref("browser.cache.jsbc_compression_level", 3);

// MEMORY CACHE
user_pref("browser.cache.memory.capacity", 65536); // default=32768 (32 MB)
user_pref("browser.cache.memory.max_entry_size", 10240); // default=5120 (5 MB)

// MEDIA CACHE
user_pref("media.memory_caches_combined_limit_kb", 1048576); // 1GB; default=524288
user_pref("media.cache_readahead_limit", 3600); // 10 min; default=60; stop reading ahead when our buffered data is this many seconds ahead of the current playback
user_pref("media.cache_resume_threshold", 1800); // 5 min; default=30; when a network connection is suspended, don't resume it until the amount of buffered data falls below this threshold

// IMAGE CACHE
user_pref("image.mem.decode_bytes_at_a_time", 32768); // default=16384; chunk size for calls to the image decoders

// NETWORK
user_pref("network.buffer.cache.size", 65535); // default=32768 (32 kb); 262144 too large
user_pref("network.buffer.cache.count", 48); // default=24; 128 too large
user_pref("network.http.max-connections", 1800); // default=900
user_pref("network.http.max-persistent-connections-per-server", 10); // default=6; download connections; anything above 10 is excessive
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5); // default=3
user_pref("network.http.request.max-start-delay", 5); // default=10
user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheEntries", 1600); // default=800
user_pref("network.dnsCacheExpiration", 3600); // keep entries for 1 hour; default=60
user_pref("network.dnsCacheExpirationGracePeriod", 120); // default=60; cache DNS entries for 2 minutes after they expire

// TAB UNLOAD
user_pref("browser.low_commit_space_threshold_mb", 13107); // default=200; WINDOWS LINUX
user_pref("browser.tabs.min_inactive_duration_before_unload", 300000); // 5min; default=600000

// PROCESS COUNT
user_pref("dom.ipc.processPrelaunch.fission.number", 1); // default=3; Process Preallocation Cache
user_pref("dom.ipc.processCount.webIsolated", 1); // one process per site origin
