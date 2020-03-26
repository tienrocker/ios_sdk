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
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKShareKit/FBSDKShareDialog.h>
#import <FBSDKShareKit/FBSDKShareLinkContent.h>
#import <FBSDKShareKit/FBSDKSharePhoto.h>
#import <FBSDKShareKit/FBSDKSharePhotoContent.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseAnalytics/FIRAnalytics.h>
#import <FirebaseAnalytics/FIREventNames.h>
#import <FirebaseAnalytics/FIRParameterNames.h>
#import <FirebaseMessaging/FirebaseMessaging.h>
#import <AppsFlyerLib/AppsFlyerTracker.h>

@class VGPInterface;

@interface VGPInterface : NSObject <AppsFlyerTrackerDelegate, UNUserNotificationCenterDelegate, FIRMessagingDelegate>{
}

+ (VGPInterface *_Nonnull)sharedInstance;

#pragma mark Data
- (NSInteger)getUserID;
- (NSString *_Nullable)getUsername;

#pragma mark Handler User Interface
- (void)loginGame;
- (void)loginGame:(void (^ __nullable)(void))completion;
- (void)logoutGame;
- (void)logoutGame:(void (^ __nullable)(void))completion;
- (void)showProfile;
- (void)showProfile:(void (^ __nullable)(void))completion;
- (void)showFlyButton;
- (void)hideFlyButton;

#pragma mark Marketing Events

- (void)setGameVersion:(NSString*_Nonnull)code;
- (void)setGameCode:(NSString*_Nonnull)code;

- (void)startMobileTutorial;
- (void)completeMobileTutorial;
- (void)logLevelUp:(int) level;
- (void)logCreatedCharacter;
- (void)logUnlockAchievement:(int) vipLevel;
- (void)purchaseViewDisplay;
- (void)logUserHadPurchase;
- (void)logPurchase:(int) money;

- (void)resourceStartDownload;
- (void)resourceProcessDownload:(int)percent;
- (void)resourceDownloadSuccess;
- (void)resourceDownloadError;

- (void)resourceStartUnpack;
- (void)resourceUnpackSuccess;
- (void)resourceUnpackError;

- (void)shareFacebookImage:(NSString *_Nonnull)url;
- (void)shareFacebookImageLocal:(UIImage *_Nonnull)image;

#pragma mark Init Application
- (BOOL)application:(UIApplication *_Nonnull)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions API_AVAILABLE(ios(3.0));
- (void)applicationDidBecomeActive:(UIApplication *_Nonnull)application;
- (void)applicationWillResignActive:(UIApplication *_Nonnull)application;
- (BOOL)application:(UIApplication *_Nonnull)application handleOpenURL:(NSURL *_Nullable)url;
- (BOOL)application:(UIApplication *_Nonnull)application openURL:(NSURL *_Nullable)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;
- (BOOL)application:(UIApplication *_Nonnull)application openURL:(NSURL *_Nullable)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id _Nullable )annotation;
- (BOOL)application:(UIApplication *_Nonnull)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void (^_Nullable)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler;
- (void)application:(UIApplication *_Nonnull)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation;
- (void)scene:(UIScene *_Nonnull)scene openURLContexts:(NSSet<UIOpenURLContext *> *_Nonnull)URLContexts  API_AVAILABLE(ios(13.0));
- (void)scene:(UIScene *_Nonnull)scene continueUserActivity:(NSUserActivity *_Nonnull)userActivity  API_AVAILABLE(ios(13.0));

#pragma mark Register Push notification
- (void)application:(UIApplication*_Nonnull)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*_Nonnull)deviceToken;
- (void)application:(UIApplication*_Nonnull)application didFailToRegisterForRemoteNotificationsWithError:(NSError*_Nonnull)error;

@end

#endif /* VGPInterface_h */
