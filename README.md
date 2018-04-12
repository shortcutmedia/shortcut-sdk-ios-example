This repo provides a demo app for the [Shortcut iOS SDK](https://github.com/shortcutmedia/shortcut-sdk-ios). To get it working please follow these steps:

1. Clone the example code by typing the following command in your terminal: `git clone https://github.com/shortcutmedia/shortcut-sdk-ios-example.git` or download the [zip file](https://github.com/shortcutmedia/shortcut-sdk-ios-example/archive/master.zip) and unzip it.
2. Download the latest SDK from the [releases page](https://github.com/shortcutmedia/shortcut-sdk-ios/releases) (just download the file *ShortcutSDK.zip*, you do not need the source code) and unzip it.
3. Copy *ShortcutSDK.framework* and *ShortcutSDK.bundle* into the *shortcut-sdk-ios-example* folder.
4. Open the project in Xcode.
5. Use the following keys for development: Access key: `40552bf6b886ab0a89a50712b256bb423dd9e180` and secret token `13679446ee03264934bf97e2b29b9dfc74428ab9`. [contact us for production keys](mailto://support@shortcutmedia.com). Place the keys in AppDelegate.m in function `application didFinishLaunchingWithOptions` on lines 22 and 23.
6. Run the project in Xcode.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SCMSDKConfig sharedConfig].accessKey = @"YOUR_ACCESS_KEY";
    [SCMSDKConfig sharedConfig].secretToken = @"YOUR_SECRET_TOKEN";
```

With these keys you are able to scan the [Lenna test image](https://en.wikipedia.org/wiki/Lenna).

To be able to recognize your own items you need to add your own access key and secret token in  the *AppDelegate.m* file. You can get your keys by emailing [support@shortcutmedia.com](mailto://support@shortcutmedia.com).
