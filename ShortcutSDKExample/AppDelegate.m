//
//  AppDelegate.m
//  ShortcutSDKExample
//
//  Created by Herbert Bay on 06/02/15.
//  Copyright (c) 2015 Shortcut Media AG. All rights reserved.
//

#import "AppDelegate.h"

#import <ShortcutSDK/ShortcutSDK.h>

@interface AppDelegate () <SCMScannerViewControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [SCMSDKConfig sharedConfig].accessKey = @"YOUR_ACCESS_KEY";
    [SCMSDKConfig sharedConfig].secretToken = @"YOUR_SECRET_TOKEN";

//    **********
//    Un-comment this section for another example setup
//    **********

//    SCMScannerViewController *scannerViewController = [[SCMScannerViewController alloc] init];
//    scannerViewController.delegate = self;
//
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = scannerViewController;
//    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)scannerViewController:(SCMScannerViewController *)scannerViewController recognizedQuery:(SCMQueryResponse *)response atLocation:(CLLocation *)location fromImage:(NSData *)imageData
{
    // Picks the first result. Handle multiple results accordingly.
    SCMQueryResult *result = [response.results firstObject];
    SCMItemViewController *itemViewController = [[SCMQueryResultViewController alloc] initWithQueryResult:result];

    self.window.rootViewController = itemViewController;
}

@end
