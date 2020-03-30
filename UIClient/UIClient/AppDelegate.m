//
//  AppDelegate.m
//  UIClient
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // listen event from VGP SDK
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoginSuccess:) name:VGP_EVENT_LOGIN_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LogoutSuccess:) name:VGP_EVENT_LOGOUT_SUCCESS object:nil];
    
    // push version code config
    [[VGPInterface sharedInstance] setGameVersion:@"0.0.0"];
    return [[VGPInterface sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    return [[VGPInterface sharedInstance] applicationDidBecomeActive:application];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    [[VGPInterface sharedInstance] applicationWillResignActive:application];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[VGPInterface sharedInstance] application:application handleOpenURL:url];
}

// Open URI-scheme for iOS 9 and above
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [[VGPInterface sharedInstance] application:application openURL:url options:options];
}
// Open URI-scheme for iOS 8 and below
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString*)sourceApplication annotation:(id)annotation {
    return [[VGPInterface sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}
// Open Universal Links
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
    return [[VGPInterface sharedInstance] application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
}

- (void)application:(UIApplication *_Nonnull)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation{
    return [[VGPInterface sharedInstance] application:application didChangeStatusBarOrientation:oldStatusBarOrientation];
}

#pragma mark Register Push notification

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    return [[VGPInterface sharedInstance] application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    return [[VGPInterface sharedInstance] application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error];
}

#pragma mark - Callback event

- (void)LoginSuccess:(NSNotification *) notification {
    NSString* VgpID = [notification.userInfo objectForKey:@"id"];
    NSString* VgpToken = [notification.userInfo objectForKey:@"token"];
    NSLog(@"LoginSuccess ID: %@, token:%@", VgpID, VgpToken);
}
- (void)LogoutSuccess:(NSNotification *) notification {
    NSLog(@"LogoutSuccess");
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
