// Securefox
// Version 152

// TRACKING PROTECTION
user_pref("privacy.antitracking.enableWebcompat", false);
user_pref("privacy.restrict3rdpartystorage.heuristic.navigation", false);
user_pref("privacy.restrict3rdpartystorage.heuristic.opened_window_after_interaction", false);
user_pref("privacy.trackingprotection.lower_network_priority", true);
user_pref("network.cookie.sameSite.laxByDefault", true);
user_pref("network.cookie.sameSite.schemeful", true);
user_pref("beacon.enabled", false);
user_pref("dom.battery.enabled", false);
user_pref("browser.uitour.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);

// OSCP & CERTS / HPKP
user_pref("security.OCSP.enabled", 0);
user_pref("security.OCSP.require", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.csp.reporting.enabled", false);

// SSL / TLS
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.tls.enable_0rtt_data", false);

// RESIST FINGERPRINT
user_pref("browser.startup.blankWindow", false);

// DISK AVOIDANCE
user_pref("browser.cache.disk.enable", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536); // 64 MB; default=8192; AF=65536
user_pref("browser.sessionstore.interval", 60000); // 1 minute; default=15000 (15s); 900000=15 min; 1800000=30 min
user_pref("browser.sessionstore.privacy_level", 2);

// SEARCH / URL BAR
user_pref("browser.search.separatePrivateDefault.ui.enabled", false);
user_pref("network.IDN_show_punycode", true);

// HTTPS-ONLY MODE
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// PASSWORDS
user_pref("signon.autofillForms", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.privateBrowsingCapture.enabled", false);
user_pref("signon.firefoxRelay.feature", "");
user_pref("signon.storeWhenAutocompleteOff", false);

// CONTAINERS
user_pref("privacy.userContext.ui.enabled", false);
user_pref("privacy.userContext.enabled", false);

// PLUGINS
user_pref("media.gmp-provider.enabled", false);
user_pref("browser.eme.ui.enabled", false);

// JIT & WASM
user_pref("javascript.options.wasm", false);

// MOZILLA
user_pref("accessibility.force_disabled", 1);
user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");

// EXPERIMENTS
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
