// Peskyfox
// Version 152

// MOZILLA UI
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.urlbar.scotchBonnet.enableOverride", false);

// THEME ADJUSTMENTS
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.compactmode.show", true);
user_pref("browser.theme.dark-private-windows", false);

// FONT APPEARANCE
user_pref("gfx.webrender.quality.force-subpixel-aa-where-possible", true);

// AUTOPLAY
user_pref("media.autoplay.default", 5); // default=1
user_pref("media.autoplay.blocking_policy", 2);

// NEW TAB PAGE
user_pref("browser.newtabpage.activity-stream.showWeather", false); // Weather [FF130+]
user_pref("browser.newtabpage.activity-stream.system.showWeather", false); // hides Weather as an UI option
user_pref("browser.newtabpage.activity-stream.widgets.enabled", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// DOWNLOADS
user_pref("browser.download.alwaysOpenPanel", false);
user_pref("browser.download.manager.addToRecentDocs", false);

// DOM
user_pref("dom.disable_window_move_resize", true);
user_pref("dom.disable_beforeunload", true);

// TAB BEHAVIOR
user_pref("browser.tabs.loadInBackground", false);

// KEYBOARD AND SHORTCUTS
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);

// ACCESSIBILITY AND USABILITY
user_pref("reader.parse-on-load.enabled", false);

// IMAGE AND MEDIA HANDLING
user_pref("image.jxl.enabled", false);
