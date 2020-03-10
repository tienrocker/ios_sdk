//
//  VGPInterface.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#ifndef VGPInterface_h
#define VGPInterface_h

#import <UIKit/UIKit.h>

//#import "AppsFlyerTracker.h"
//#import <FBSDKLoginKit/FBSDKLoginKit.h>

@class VGPInterface;

@interface VGPInterface : NSObject

+ (VGPInterface *_Nonnull)sharedInstance;

#pragma mark Data
- (NSInteger)getUserID;
- (NSString *_Nullable)getUsername;

#pragma mark Handler User Interface
- (void)loginGame;
- (void)loginGame:(void (^ __nullable)(void))completion;
- (void)logoutGame;
- (void)logoutGame:(void (^ __nullable)(void))completion;
- (void)showFlyButton;
- (void)hideFlyButton;

#pragma mark Events
- (void)completeMobileTutorial;
- (void)logLevelUp:(int) level;
- (void)logCreatedCharacter;
- (void)logUnlockAchievement:(int) vipLevel;
- (void)logUserHadPurchase;
- (void)logPurchase:(int) money;
- (void)shareFacebookImage:(NSString *_Nonnull) url;
- (void)shareFacebookImageLocal:(UIImage *_Nonnull) image;

#pragma mark Init Application
- (void)applicationDidFinishLaunching:(UIApplication *_Nonnull)application;
- (BOOL)application:(UIApplication *_Nonnull)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions;
- (BOOL)application:(UIApplication *_Nonnull)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions;
- (void)applicationDidBecomeActive:(UIApplication *_Nonnull)application;
- (void)applicationWillResignActive:(UIApplication *_Nonnull)application;
- (BOOL)application:(UIApplication *_Nonnull)application handleOpenURL:(NSURL *_Nullable)url;
- (BOOL)application:(UIApplication *_Nonnull)application openURL:(NSURL *_Nullable)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id _Nullable )annotation;

#pragma mark Register Push notification
- (void)application:(UIApplication*_Nonnull)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*_Nonnull)deviceToken;
- (void)application:(UIApplication*_Nonnull)application didFailToRegisterForRemoteNotificationsWithError:(NSError*_Nonnull)error;

@end

#endif /* VGPInterface_h */
