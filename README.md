This repo provides a demo app for the [Shortcut iOS SDK](https://github.com/shortcutmedia/shortcut-sdk-ios). To get it working please follow these steps:

1. Clone the example code by typing the following command in your terminal: `git clone https://github.com/shortcutmedia/shortcut-sdk-ios-example.git` or download the [zip file](https://github.com/shortcutmedia/shortcut-sdk-ios-example/archive/master.zip) and unzip it.
2. Download the latest SDK from the [releases page](https://github.com/shortcutmedia/shortcut-sdk-ios/releases) (just download the file *ShortcutSDK.zip*, you do not need the source code) and unzip it.
3. Copy *ShortcutSDK.framework* and *ShortcutSDK.bundle* into the *shortcut-sdk-ios-example* folder.
4. Open the project in Xcode and run it.
5. [Request the demo keys](http://shortcutmedia.com/request_demo_keys.html). We will immediately send you an email with the keys. Place the keys in AppDelegate.m in function `application didFinishLaunchingWithOptions` on lines 22 and 23.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SCMSDKConfig sharedConfig].accessKey = @"YOUR_ACCESS_KEY";
    [SCMSDKConfig sharedConfig].secretToken = @"YOUR_SECRET_TOKEN";
```

With these keys you are able to scan the [Lenna test image](https://en.wikipedia.org/wiki/Lenna).

To be able to recognize your own items you need to add your own access key and secret token in  the *AppDelegate.m* file. You can get your keys by emailing support@shortcutmedia.com.
